; ModuleID = 'marshal_methods.arm64-v8a.ll'
source_filename = "marshal_methods.arm64-v8a.ll"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [345 x ptr] zeroinitializer, align 8

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [690 x i64] [
	i64 24362543149721218, ; 0: Xamarin.AndroidX.DynamicAnimation => 0x568d9a9a43a682 => 252
	i64 98382396393917666, ; 1: Microsoft.Extensions.Primitives.dll => 0x15d8644ad360ce2 => 188
	i64 120698629574877762, ; 2: Mono.Android => 0x1accec39cafe242 => 167
	i64 131669012237370309, ; 3: Microsoft.Maui.Essentials.dll => 0x1d3c844de55c3c5 => 201
	i64 196720943101637631, ; 4: System.Linq.Expressions.dll => 0x2bae4a7cd73f3ff => 56
	i64 210515253464952879, ; 5: Xamarin.AndroidX.Collection.dll => 0x2ebe681f694702f => 239
	i64 229794953483747371, ; 6: System.ValueTuple.dll => 0x330654aed93802b => 147
	i64 232391251801502327, ; 7: Xamarin.AndroidX.SavedState.dll => 0x3399e9cbc897277 => 280
	i64 295915112840604065, ; 8: Xamarin.AndroidX.SlidingPaneLayout => 0x41b4d3a3088a9a1 => 283
	i64 316157742385208084, ; 9: Xamarin.AndroidX.Core.Core.Ktx.dll => 0x46337caa7dc1b14 => 246
	i64 350667413455104241, ; 10: System.ServiceProcess.dll => 0x4ddd227954be8f1 => 130
	i64 396868157601372792, ; 11: Microsoft.VisualStudio.DesignTools.TapContract => 0x581f57c947e5a78 => 343
	i64 422779754995088667, ; 12: System.IO.UnmanagedMemoryStream => 0x5de03f27ab57d1b => 54
	i64 435118502366263740, ; 13: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x609d9f8f8bdb9bc => 282
	i64 545109961164950392, ; 14: fi/Microsoft.Maui.Controls.resources.dll => 0x7909e9f1ec38b78 => 314
	i64 560278790331054453, ; 15: System.Reflection.Primitives => 0x7c6829760de3975 => 93
	i64 634308326490598313, ; 16: Xamarin.AndroidX.Lifecycle.Runtime.dll => 0x8cd840fee8b6ba9 => 265
	i64 649145001856603771, ; 17: System.Security.SecureString => 0x90239f09b62167b => 127
	i64 670564002081277297, ; 18: Microsoft.Identity.Client.dll => 0x94e526837380571 => 189
	i64 702024105029695270, ; 19: System.Drawing.Common => 0x9be17343c0e7726 => 213
	i64 750875890346172408, ; 20: System.Threading.Thread => 0xa6ba5a4da7d1ff8 => 141
	i64 798450721097591769, ; 21: Xamarin.AndroidX.Collection.Ktx.dll => 0xb14aab351ad2bd9 => 240
	i64 799765834175365804, ; 22: System.ComponentModel.dll => 0xb1956c9f18442ac => 18
	i64 849051935479314978, ; 23: hi/Microsoft.Maui.Controls.resources.dll => 0xbc8703ca21a3a22 => 317
	i64 870603111519317375, ; 24: SQLitePCLRaw.lib.e_sqlite3.android => 0xc1500ead2756d7f => 208
	i64 872800313462103108, ; 25: Xamarin.AndroidX.DrawerLayout => 0xc1ccf42c3c21c44 => 251
	i64 895210737996778430, ; 26: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll => 0xc6c6d6c5569cbbe => 266
	i64 937459790420187032, ; 27: Microsoft.SqlServer.Server.dll => 0xd0286b667351798 => 203
	i64 940822596282819491, ; 28: System.Transactions => 0xd0e792aa81923a3 => 146
	i64 960778385402502048, ; 29: System.Runtime.Handles.dll => 0xd555ed9e1ca1ba0 => 102
	i64 1010599046655515943, ; 30: System.Reflection.Primitives.dll => 0xe065e7a82401d27 => 93
	i64 1060858978308751610, ; 31: Azure.Core.dll => 0xeb8ed9ebee080fa => 169
	i64 1120440138749646132, ; 32: Xamarin.Google.Android.Material.dll => 0xf8c9a5eae431534 => 295
	i64 1121665720830085036, ; 33: nb/Microsoft.Maui.Controls.resources.dll => 0xf90f507becf47ac => 325
	i64 1268860745194512059, ; 34: System.Drawing.dll => 0x119be62002c19ebb => 35
	i64 1278906455852160409, ; 35: Microsoft.EntityFrameworkCore.SqlServer.dll => 0x11bf96a54a059599 => 177
	i64 1301485588176585670, ; 36: SQLitePCLRaw.core => 0x120fce3f338e43c6 => 207
	i64 1301626418029409250, ; 37: System.Diagnostics.FileVersionInfo => 0x12104e54b4e833e2 => 27
	i64 1315114680217950157, ; 38: Xamarin.AndroidX.Arch.Core.Common.dll => 0x124039d5794ad7cd => 235
	i64 1369545283391376210, ; 39: Xamarin.AndroidX.Navigation.Fragment.dll => 0x13019a2dd85acb52 => 273
	i64 1381587613808385135, ; 40: Pass Guardia => 0x132c629d6320dc6f => 0
	i64 1404195534211153682, ; 41: System.IO.FileSystem.Watcher.dll => 0x137cb4660bd87f12 => 48
	i64 1425944114962822056, ; 42: System.Runtime.Serialization.dll => 0x13c9f89e19eaf3a8 => 113
	i64 1476839205573959279, ; 43: System.Net.Primitives.dll => 0x147ec96ece9b1e6f => 68
	i64 1486715745332614827, ; 44: Microsoft.Maui.Controls.dll => 0x14a1e017ea87d6ab => 198
	i64 1492954217099365037, ; 45: System.Net.HttpListener => 0x14b809f350210aad => 63
	i64 1513467482682125403, ; 46: Mono.Android.Runtime => 0x1500eaa8245f6c5b => 166
	i64 1518315023656898250, ; 47: SQLitePCLRaw.provider.e_sqlite3 => 0x151223783a354eca => 209
	i64 1537168428375924959, ; 48: System.Threading.Thread.dll => 0x15551e8a954ae0df => 141
	i64 1556147632182429976, ; 49: ko/Microsoft.Maui.Controls.resources.dll => 0x15988c06d24c8918 => 323
	i64 1576750169145655260, ; 50: Xamarin.AndroidX.Window.Extensions.Core.Core => 0x15e1bdecc376bfdc => 294
	i64 1624659445732251991, ; 51: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0x168bf32877da9957 => 234
	i64 1628611045998245443, ; 52: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0x1699fd1e1a00b643 => 269
	i64 1636321030536304333, ; 53: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 0x16b5614ec39e16cd => 259
	i64 1651782184287836205, ; 54: System.Globalization.Calendars => 0x16ec4f2524cb982d => 38
	i64 1659332977923810219, ; 55: System.Reflection.DispatchProxy => 0x1707228d493d63ab => 87
	i64 1682513316613008342, ; 56: System.Net.dll => 0x17597cf276952bd6 => 79
	i64 1735388228521408345, ; 57: System.Net.Mail.dll => 0x181556663c69b759 => 64
	i64 1743969030606105336, ; 58: System.Memory.dll => 0x1833d297e88f2af8 => 60
	i64 1767386781656293639, ; 59: System.Private.Uri.dll => 0x188704e9f5582107 => 84
	i64 1772733279957806650, ; 60: Pass Guardia.dll => 0x189a03869965ee3a => 0
	i64 1795316252682057001, ; 61: Xamarin.AndroidX.AppCompat.dll => 0x18ea3e9eac997529 => 233
	i64 1825687700144851180, ; 62: System.Runtime.InteropServices.RuntimeInformation.dll => 0x1956254a55ef08ec => 104
	i64 1835311033149317475, ; 63: es\Microsoft.Maui.Controls.resources => 0x197855a927386163 => 313
	i64 1836611346387731153, ; 64: Xamarin.AndroidX.SavedState => 0x197cf449ebe482d1 => 280
	i64 1854145951182283680, ; 65: System.Runtime.CompilerServices.VisualC => 0x19bb3feb3df2e3a0 => 100
	i64 1865037103900624886, ; 66: Microsoft.Bcl.AsyncInterfaces => 0x19e1f15d56eb87f6 => 172
	i64 1875417405349196092, ; 67: System.Drawing.Primitives => 0x1a06d2319b6c713c => 34
	i64 1875917498431009007, ; 68: Xamarin.AndroidX.Annotation.dll => 0x1a08990699eb70ef => 230
	i64 1881198190668717030, ; 69: tr\Microsoft.Maui.Controls.resources => 0x1a1b5bc992ea9be6 => 335
	i64 1897575647115118287, ; 70: Xamarin.AndroidX.Security.SecurityCrypto => 0x1a558aff4cba86cf => 282
	i64 1920760634179481754, ; 71: Microsoft.Maui.Controls.Xaml => 0x1aa7e99ec2d2709a => 199
	i64 1959996714666907089, ; 72: tr/Microsoft.Maui.Controls.resources.dll => 0x1b334ea0a2a755d1 => 335
	i64 1972385128188460614, ; 73: System.Security.Cryptography.Algorithms => 0x1b5f51d2edefbe46 => 117
	i64 1981742497975770890, ; 74: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x1b80904d5c241f0a => 267
	i64 1983698669889758782, ; 75: cs/Microsoft.Maui.Controls.resources.dll => 0x1b87836e2031a63e => 309
	i64 2019660174692588140, ; 76: pl/Microsoft.Maui.Controls.resources.dll => 0x1c07463a6f8e1a6c => 327
	i64 2040001226662520565, ; 77: System.Threading.Tasks.Extensions.dll => 0x1c4f8a4ea894a6f5 => 138
	i64 2062890601515140263, ; 78: System.Threading.Tasks.Dataflow => 0x1ca0dc1289cd44a7 => 137
	i64 2064708342624596306, ; 79: Xamarin.Kotlin.StdLib.Jdk7.dll => 0x1ca7514c5eecb152 => 303
	i64 2080945842184875448, ; 80: System.IO.MemoryMappedFiles => 0x1ce10137d8416db8 => 51
	i64 2102659300918482391, ; 81: System.Drawing.Primitives.dll => 0x1d2e257e6aead5d7 => 34
	i64 2106033277907880740, ; 82: System.Threading.Tasks.Dataflow.dll => 0x1d3a221ba6d9cb24 => 137
	i64 2165310824878145998, ; 83: Xamarin.Android.Glide.GifDecoder => 0x1e0cbab9112b81ce => 227
	i64 2165725771938924357, ; 84: Xamarin.AndroidX.Browser => 0x1e0e341d75540745 => 237
	i64 2192948757939169934, ; 85: Microsoft.EntityFrameworkCore.Abstractions.dll => 0x1e6eeb46cf992a8e => 175
	i64 2200176636225660136, ; 86: Microsoft.Extensions.Logging.Debug.dll => 0x1e8898fe5d5824e8 => 186
	i64 2262844636196693701, ; 87: Xamarin.AndroidX.DrawerLayout.dll => 0x1f673d352266e6c5 => 251
	i64 2287834202362508563, ; 88: System.Collections.Concurrent => 0x1fc00515e8ce7513 => 8
	i64 2287887973817120656, ; 89: System.ComponentModel.DataAnnotations.dll => 0x1fc035fd8d41f790 => 14
	i64 2302323944321350744, ; 90: ru/Microsoft.Maui.Controls.resources.dll => 0x1ff37f6ddb267c58 => 331
	i64 2304837677853103545, ; 91: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 0x1ffc6da80d5ed5b9 => 279
	i64 2315304989185124968, ; 92: System.IO.FileSystem.dll => 0x20219d9ee311aa68 => 49
	i64 2316229908869312383, ; 93: Microsoft.IdentityModel.Protocols.OpenIdConnect => 0x2024e6d4884a6f7f => 195
	i64 2329709569556905518, ; 94: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x2054ca829b447e2e => 262
	i64 2335503487726329082, ; 95: System.Text.Encodings.Web => 0x2069600c4d9d1cfa => 221
	i64 2337758774805907496, ; 96: System.Runtime.CompilerServices.Unsafe => 0x207163383edbc828 => 99
	i64 2470498323731680442, ; 97: Xamarin.AndroidX.CoordinatorLayout => 0x2248f922dc398cba => 244
	i64 2479423007379663237, ; 98: Xamarin.AndroidX.VectorDrawable.Animated.dll => 0x2268ae16b2cba985 => 289
	i64 2497223385847772520, ; 99: System.Runtime => 0x22a7eb7046413568 => 114
	i64 2547086958574651984, ; 100: Xamarin.AndroidX.Activity.dll => 0x2359121801df4a50 => 228
	i64 2554797818648757682, ; 101: System.Runtime.Caching.dll => 0x23747714858085b2 => 218
	i64 2592350477072141967, ; 102: System.Xml.dll => 0x23f9e10627330e8f => 159
	i64 2602673633151553063, ; 103: th\Microsoft.Maui.Controls.resources => 0x241e8de13a460e27 => 334
	i64 2612152650457191105, ; 104: Microsoft.IdentityModel.Tokens.dll => 0x24403afeed9892c1 => 196
	i64 2624866290265602282, ; 105: mscorlib.dll => 0x246d65fbde2db8ea => 162
	i64 2632269733008246987, ; 106: System.Net.NameResolution => 0x2487b36034f808cb => 65
	i64 2656907746661064104, ; 107: Microsoft.Extensions.DependencyInjection => 0x24df3b84c8b75da8 => 182
	i64 2662981627730767622, ; 108: cs\Microsoft.Maui.Controls.resources => 0x24f4cfae6c48af06 => 309
	i64 2706075432581334785, ; 109: System.Net.WebSockets => 0x258de944be6c0701 => 78
	i64 2783046991838674048, ; 110: System.Runtime.CompilerServices.Unsafe.dll => 0x269f5e7e6dc37c80 => 99
	i64 2787234703088983483, ; 111: Xamarin.AndroidX.Startup.StartupRuntime => 0x26ae3f31ef429dbb => 284
	i64 2789714023057451704, ; 112: Microsoft.IdentityModel.JsonWebTokens.dll => 0x26b70e1f9943eab8 => 192
	i64 2815524396660695947, ; 113: System.Security.AccessControl => 0x2712c0857f68238b => 115
	i64 2851879596360956261, ; 114: System.Configuration.ConfigurationManager => 0x2793e9620b477965 => 211
	i64 2895129759130297543, ; 115: fi\Microsoft.Maui.Controls.resources => 0x282d912d479fa4c7 => 314
	i64 2923871038697555247, ; 116: Jsr305Binding => 0x2893ad37e69ec52f => 296
	i64 3017136373564924869, ; 117: System.Net.WebProxy => 0x29df058bd93f63c5 => 76
	i64 3017704767998173186, ; 118: Xamarin.Google.Android.Material => 0x29e10a7f7d88a002 => 295
	i64 3062772059105072826, ; 119: Microsoft.VisualStudio.DesignTools.MobileTapContracts => 0x2a8126f5e2f316ba => 342
	i64 3063847325783385934, ; 120: System.ClientModel.dll => 0x2a84f8e8eb59674e => 210
	i64 3106852385031680087, ; 121: System.Runtime.Serialization.Xml => 0x2b1dc1c88b637057 => 112
	i64 3110390492489056344, ; 122: System.Security.Cryptography.Csp.dll => 0x2b2a53ac61900058 => 119
	i64 3135773902340015556, ; 123: System.IO.FileSystem.DriveInfo.dll => 0x2b8481c008eac5c4 => 46
	i64 3238539556702659506, ; 124: Microsoft.Win32.SystemEvents.dll => 0x2cf19a917c5023b2 => 204
	i64 3281594302220646930, ; 125: System.Security.Principal => 0x2d8a90a198ceba12 => 126
	i64 3289520064315143713, ; 126: Xamarin.AndroidX.Lifecycle.Common => 0x2da6b911e3063621 => 260
	i64 3303437397778967116, ; 127: Xamarin.AndroidX.Annotation.Experimental => 0x2dd82acf985b2a4c => 231
	i64 3311221304742556517, ; 128: System.Numerics.Vectors.dll => 0x2df3d23ba9e2b365 => 80
	i64 3325875462027654285, ; 129: System.Runtime.Numerics => 0x2e27e21c8958b48d => 108
	i64 3328853167529574890, ; 130: System.Net.Sockets.dll => 0x2e327651a008c1ea => 73
	i64 3344514922410554693, ; 131: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x2e6a1a9a18463545 => 306
	i64 3402534845034375023, ; 132: System.IdentityModel.Tokens.Jwt.dll => 0x2f383b6a0629a76f => 215
	i64 3429672777697402584, ; 133: Microsoft.Maui.Essentials => 0x2f98a5385a7b1ed8 => 201
	i64 3437845325506641314, ; 134: System.IO.MemoryMappedFiles.dll => 0x2fb5ae1beb8f7da2 => 51
	i64 3493805808809882663, ; 135: Xamarin.AndroidX.Tracing.Tracing.dll => 0x307c7ddf444f3427 => 286
	i64 3494946837667399002, ; 136: Microsoft.Extensions.Configuration => 0x30808ba1c00a455a => 180
	i64 3508450208084372758, ; 137: System.Net.Ping => 0x30b084e02d03ad16 => 67
	i64 3522470458906976663, ; 138: Xamarin.AndroidX.SwipeRefreshLayout => 0x30e2543832f52197 => 285
	i64 3523004241079211829, ; 139: Microsoft.Extensions.Caching.Memory.dll => 0x30e439b10bb89735 => 179
	i64 3531994851595924923, ; 140: System.Numerics => 0x31042a9aade235bb => 81
	i64 3551103847008531295, ; 141: System.Private.CoreLib.dll => 0x31480e226177735f => 168
	i64 3567343442040498961, ; 142: pt\Microsoft.Maui.Controls.resources => 0x3181bff5bea4ab11 => 329
	i64 3571415421602489686, ; 143: System.Runtime.dll => 0x319037675df7e556 => 114
	i64 3638003163729360188, ; 144: Microsoft.Extensions.Configuration.Abstractions => 0x327cc89a39d5f53c => 181
	i64 3647754201059316852, ; 145: System.Xml.ReaderWriter => 0x329f6d1e86145474 => 152
	i64 3655542548057982301, ; 146: Microsoft.Extensions.Configuration.dll => 0x32bb18945e52855d => 180
	i64 3659371656528649588, ; 147: Xamarin.Android.Glide.Annotations => 0x32c8b3222885dd74 => 225
	i64 3716579019761409177, ; 148: netstandard.dll => 0x3393f0ed5c8c5c99 => 163
	i64 3727469159507183293, ; 149: Xamarin.AndroidX.RecyclerView => 0x33baa1739ba646bd => 278
	i64 3772598417116884899, ; 150: Xamarin.AndroidX.DynamicAnimation.dll => 0x345af645b473efa3 => 252
	i64 3869221888984012293, ; 151: Microsoft.Extensions.Logging.dll => 0x35b23cceda0ed605 => 184
	i64 3869649043256705283, ; 152: System.Diagnostics.Tools => 0x35b3c14d74bf0103 => 31
	i64 3890352374528606784, ; 153: Microsoft.Maui.Controls.Xaml.dll => 0x35fd4edf66e00240 => 199
	i64 3919223565570527920, ; 154: System.Security.Cryptography.Encoding => 0x3663e111652bd2b0 => 120
	i64 3933965368022646939, ; 155: System.Net.Requests => 0x369840a8bfadc09b => 70
	i64 3966267475168208030, ; 156: System.Memory => 0x370b03412596249e => 60
	i64 4006972109285359177, ; 157: System.Xml.XmlDocument => 0x379b9fe74ed9fe49 => 157
	i64 4009997192427317104, ; 158: System.Runtime.Serialization.Primitives => 0x37a65f335cf1a770 => 111
	i64 4073500526318903918, ; 159: System.Private.Xml.dll => 0x3887fb25779ae26e => 86
	i64 4073631083018132676, ; 160: Microsoft.Maui.Controls.Compatibility.dll => 0x388871e311491cc4 => 197
	i64 4120493066591692148, ; 161: zh-Hant\Microsoft.Maui.Controls.resources => 0x392eee9cdda86574 => 340
	i64 4148881117810174540, ; 162: System.Runtime.InteropServices.JavaScript.dll => 0x3993c9651a66aa4c => 103
	i64 4154383907710350974, ; 163: System.ComponentModel => 0x39a7562737acb67e => 18
	i64 4167269041631776580, ; 164: System.Threading.ThreadPool => 0x39d51d1d3df1cf44 => 142
	i64 4168469861834746866, ; 165: System.Security.Claims.dll => 0x39d96140fb94ebf2 => 116
	i64 4187479170553454871, ; 166: System.Linq.Expressions => 0x3a1cea1e912fa117 => 56
	i64 4201423742386704971, ; 167: Xamarin.AndroidX.Core.Core.Ktx => 0x3a4e74a233da124b => 246
	i64 4205801962323029395, ; 168: System.ComponentModel.TypeConverter => 0x3a5e0299f7e7ad93 => 17
	i64 4235503420553921860, ; 169: System.IO.IsolatedStorage.dll => 0x3ac787eb9b118544 => 50
	i64 4282138915307457788, ; 170: System.Reflection.Emit => 0x3b6d36a7ddc70cfc => 90
	i64 4321177614414309855, ; 171: Microsoft.VisualStudio.DesignTools.MobileTapContracts.dll => 0x3bf7e8254e88e9df => 342
	i64 4337444564132831293, ; 172: SQLitePCLRaw.batteries_v2.dll => 0x3c31b2d9ae16203d => 206
	i64 4356591372459378815, ; 173: vi/Microsoft.Maui.Controls.resources.dll => 0x3c75b8c562f9087f => 337
	i64 4373617458794931033, ; 174: System.IO.Pipes.dll => 0x3cb235e806eb2359 => 53
	i64 4388777479429739993, ; 175: Microsoft.Maui.Controls.HotReload.Forms.dll => 0x3ce811dd63a4d5d9 => 341
	i64 4397634830160618470, ; 176: System.Security.SecureString.dll => 0x3d0789940f9be3e6 => 127
	i64 4477672992252076438, ; 177: System.Web.HttpUtility.dll => 0x3e23e3dcdb8ba196 => 148
	i64 4484706122338676047, ; 178: System.Globalization.Extensions.dll => 0x3e3ce07510042d4f => 39
	i64 4513320955448359355, ; 179: Microsoft.EntityFrameworkCore.Relational => 0x3ea2897f12d379bb => 176
	i64 4533124835995628778, ; 180: System.Reflection.Emit.dll => 0x3ee8e505540534ea => 90
	i64 4612482779465751747, ; 181: Microsoft.EntityFrameworkCore.Abstractions => 0x4002d4a662a99cc3 => 175
	i64 4636684751163556186, ; 182: Xamarin.AndroidX.VersionedParcelable.dll => 0x4058d0370893015a => 290
	i64 4672453897036726049, ; 183: System.IO.FileSystem.Watcher => 0x40d7e4104a437f21 => 48
	i64 4679594760078841447, ; 184: ar/Microsoft.Maui.Controls.resources.dll => 0x40f142a407475667 => 307
	i64 4716677666592453464, ; 185: System.Xml.XmlSerializer => 0x417501590542f358 => 158
	i64 4743821336939966868, ; 186: System.ComponentModel.Annotations => 0x41d5705f4239b194 => 13
	i64 4759461199762736555, ; 187: Xamarin.AndroidX.Lifecycle.Process.dll => 0x420d00be961cc5ab => 264
	i64 4794310189461587505, ; 188: Xamarin.AndroidX.Activity => 0x4288cfb749e4c631 => 228
	i64 4795410492532947900, ; 189: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0x428cb86f8f9b7bbc => 285
	i64 4809057822547766521, ; 190: System.Drawing => 0x42bd349c3145ecf9 => 35
	i64 4814660307502931973, ; 191: System.Net.NameResolution.dll => 0x42d11c0a5ee2a005 => 65
	i64 4853321196694829351, ; 192: System.Runtime.Loader.dll => 0x435a75ea15de7927 => 107
	i64 5055365687667823624, ; 193: Xamarin.AndroidX.Activity.Ktx.dll => 0x4628444ef7239408 => 229
	i64 5081566143765835342, ; 194: System.Resources.ResourceManager.dll => 0x4685597c05d06e4e => 97
	i64 5099468265966638712, ; 195: System.Resources.ResourceManager => 0x46c4f35ea8519678 => 97
	i64 5103417709280584325, ; 196: System.Collections.Specialized => 0x46d2fb5e161b6285 => 11
	i64 5182934613077526976, ; 197: System.Collections.Specialized.dll => 0x47ed7b91fa9009c0 => 11
	i64 5205316157927637098, ; 198: Xamarin.AndroidX.LocalBroadcastManager => 0x483cff7778e0c06a => 271
	i64 5244375036463807528, ; 199: System.Diagnostics.Contracts.dll => 0x48c7c34f4d59fc28 => 25
	i64 5262971552273843408, ; 200: System.Security.Principal.dll => 0x4909d4be0c44c4d0 => 126
	i64 5278787618751394462, ; 201: System.Net.WebClient.dll => 0x4942055efc68329e => 74
	i64 5280980186044710147, ; 202: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll => 0x4949cf7fd7123d03 => 263
	i64 5290786973231294105, ; 203: System.Runtime.Loader => 0x496ca6b869b72699 => 107
	i64 5376510917114486089, ; 204: Xamarin.AndroidX.VectorDrawable.Animated => 0x4a9d3431719e5d49 => 289
	i64 5408338804355907810, ; 205: Xamarin.AndroidX.Transition => 0x4b0e477cea9840e2 => 287
	i64 5423376490970181369, ; 206: System.Runtime.InteropServices.RuntimeInformation => 0x4b43b42f2b7b6ef9 => 104
	i64 5440320908473006344, ; 207: Microsoft.VisualBasic.Core => 0x4b7fe70acda9f908 => 2
	i64 5446034149219586269, ; 208: System.Diagnostics.Debug => 0x4b94333452e150dd => 26
	i64 5451019430259338467, ; 209: Xamarin.AndroidX.ConstraintLayout.dll => 0x4ba5e94a845c2ce3 => 242
	i64 5457765010617926378, ; 210: System.Xml.Serialization => 0x4bbde05c557002ea => 153
	i64 5471532531798518949, ; 211: sv\Microsoft.Maui.Controls.resources => 0x4beec9d926d82ca5 => 333
	i64 5488847537322884930, ; 212: System.Windows.Extensions => 0x4c2c4dc108687f42 => 223
	i64 5507995362134886206, ; 213: System.Core.dll => 0x4c705499688c873e => 21
	i64 5522859530602327440, ; 214: uk\Microsoft.Maui.Controls.resources => 0x4ca5237b51eead90 => 336
	i64 5527431512186326818, ; 215: System.IO.FileSystem.Primitives.dll => 0x4cb561acbc2a8f22 => 47
	i64 5570799893513421663, ; 216: System.IO.Compression.Brotli => 0x4d4f74fcdfa6c35f => 41
	i64 5573260873512690141, ; 217: System.Security.Cryptography.dll => 0x4d58333c6e4ea1dd => 124
	i64 5574231584441077149, ; 218: Xamarin.AndroidX.Annotation.Jvm => 0x4d5ba617ae5f8d9d => 232
	i64 5591791169662171124, ; 219: System.Linq.Parallel => 0x4d9a087135e137f4 => 57
	i64 5650097808083101034, ; 220: System.Security.Cryptography.Algorithms.dll => 0x4e692e055d01a56a => 117
	i64 5692067934154308417, ; 221: Xamarin.AndroidX.ViewPager2.dll => 0x4efe49a0d4a8bb41 => 292
	i64 5724799082821825042, ; 222: Xamarin.AndroidX.ExifInterface => 0x4f72926f3e13b212 => 255
	i64 5757522595884336624, ; 223: Xamarin.AndroidX.Concurrent.Futures.dll => 0x4fe6d44bd9f885f0 => 241
	i64 5783556987928984683, ; 224: Microsoft.VisualBasic => 0x504352701bbc3c6b => 3
	i64 5896680224035167651, ; 225: Xamarin.AndroidX.Lifecycle.LiveData.dll => 0x51d5376bfbafdda3 => 261
	i64 5959344983920014087, ; 226: Xamarin.AndroidX.SavedState.SavedState.Ktx.dll => 0x52b3d8b05c8ef307 => 281
	i64 5979151488806146654, ; 227: System.Formats.Asn1 => 0x52fa3699a489d25e => 214
	i64 5984759512290286505, ; 228: System.Security.Cryptography.Primitives => 0x530e23115c33dba9 => 122
	i64 6068057819846744445, ; 229: ro/Microsoft.Maui.Controls.resources.dll => 0x5436126fec7f197d => 330
	i64 6102788177522843259, ; 230: Xamarin.AndroidX.SavedState.SavedState.Ktx => 0x54b1758374b3de7b => 281
	i64 6183170893902868313, ; 231: SQLitePCLRaw.batteries_v2 => 0x55cf092b0c9d6f59 => 206
	i64 6200764641006662125, ; 232: ro\Microsoft.Maui.Controls.resources => 0x560d8a96830131ed => 330
	i64 6222399776351216807, ; 233: System.Text.Json.dll => 0x565a67a0ffe264a7 => 222
	i64 6251069312384999852, ; 234: System.Transactions.Local => 0x56c0426b870da1ac => 145
	i64 6278736998281604212, ; 235: System.Private.DataContractSerialization => 0x57228e08a4ad6c74 => 83
	i64 6284145129771520194, ; 236: System.Reflection.Emit.ILGeneration => 0x5735c4b3610850c2 => 88
	i64 6319713645133255417, ; 237: Xamarin.AndroidX.Lifecycle.Runtime => 0x57b42213b45b52f9 => 265
	i64 6357457916754632952, ; 238: _Microsoft.Android.Resource.Designer => 0x583a3a4ac2a7a0f8 => 344
	i64 6401687960814735282, ; 239: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0x58d75d486341cfb2 => 262
	i64 6478287442656530074, ; 240: hr\Microsoft.Maui.Controls.resources => 0x59e7801b0c6a8e9a => 318
	i64 6504860066809920875, ; 241: Xamarin.AndroidX.Browser.dll => 0x5a45e7c43bd43d6b => 237
	i64 6548213210057960872, ; 242: Xamarin.AndroidX.CustomView.dll => 0x5adfed387b066da8 => 248
	i64 6557084851308642443, ; 243: Xamarin.AndroidX.Window.dll => 0x5aff71ee6c58c08b => 293
	i64 6560151584539558821, ; 244: Microsoft.Extensions.Options => 0x5b0a571be53243a5 => 187
	i64 6589202984700901502, ; 245: Xamarin.Google.ErrorProne.Annotations.dll => 0x5b718d34180a787e => 298
	i64 6591971792923354531, ; 246: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx => 0x5b7b636b7e9765a3 => 263
	i64 6617685658146568858, ; 247: System.Text.Encoding.CodePages => 0x5bd6be0b4905fa9a => 131
	i64 6713440830605852118, ; 248: System.Reflection.TypeExtensions.dll => 0x5d2aeeddb8dd7dd6 => 94
	i64 6739853162153639747, ; 249: Microsoft.VisualBasic.dll => 0x5d88c4bde075ff43 => 3
	i64 6743165466166707109, ; 250: nl\Microsoft.Maui.Controls.resources => 0x5d948943c08c43a5 => 326
	i64 6772837112740759457, ; 251: System.Runtime.InteropServices.JavaScript => 0x5dfdf378527ec7a1 => 103
	i64 6777482997383978746, ; 252: pt/Microsoft.Maui.Controls.resources.dll => 0x5e0e74e0a2525efa => 329
	i64 6786606130239981554, ; 253: System.Diagnostics.TraceSource => 0x5e2ede51877147f2 => 32
	i64 6798329586179154312, ; 254: System.Windows => 0x5e5884bd523ca188 => 150
	i64 6814185388980153342, ; 255: System.Xml.XDocument.dll => 0x5e90d98217d1abfe => 154
	i64 6876862101832370452, ; 256: System.Xml.Linq => 0x5f6f85a57d108914 => 151
	i64 6894844156784520562, ; 257: System.Numerics.Vectors => 0x5faf683aead1ad72 => 80
	i64 7011053663211085209, ; 258: Xamarin.AndroidX.Fragment.Ktx => 0x614c442918e5dd99 => 257
	i64 7060896174307865760, ; 259: System.Threading.Tasks.Parallel.dll => 0x61fd57a90988f4a0 => 139
	i64 7083547580668757502, ; 260: System.Private.Xml.Linq.dll => 0x624dd0fe8f56c5fe => 85
	i64 7101497697220435230, ; 261: System.Configuration => 0x628d9687c0141d1e => 19
	i64 7103753931438454322, ; 262: Xamarin.AndroidX.Interpolator.dll => 0x62959a90372c7632 => 258
	i64 7112547816752919026, ; 263: System.IO.FileSystem => 0x62b4d88e3189b1f2 => 49
	i64 7192745174564810625, ; 264: Xamarin.Android.Glide.GifDecoder.dll => 0x63d1c3a0a1d72f81 => 227
	i64 7220009545223068405, ; 265: sv/Microsoft.Maui.Controls.resources.dll => 0x6432a06d99f35af5 => 333
	i64 7270811800166795866, ; 266: System.Linq => 0x64e71ccf51a90a5a => 59
	i64 7299370801165188114, ; 267: System.IO.Pipes.AccessControl.dll => 0x654c9311e74f3c12 => 52
	i64 7316205155833392065, ; 268: Microsoft.Win32.Primitives => 0x658861d38954abc1 => 4
	i64 7338192458477945005, ; 269: System.Reflection => 0x65d67f295d0740ad => 95
	i64 7348123982286201829, ; 270: System.Memory.Data.dll => 0x65f9c7d471b2a3e5 => 217
	i64 7349431895026339542, ; 271: Xamarin.Android.Glide.DiskLruCache => 0x65fe6d5e9bf88ed6 => 226
	i64 7377312882064240630, ; 272: System.ComponentModel.TypeConverter.dll => 0x66617afac45a2ff6 => 17
	i64 7488575175965059935, ; 273: System.Xml.Linq.dll => 0x67ecc3724534ab5f => 151
	i64 7489048572193775167, ; 274: System.ObjectModel => 0x67ee71ff6b419e3f => 82
	i64 7496222613193209122, ; 275: System.IdentityModel.Tokens.Jwt => 0x6807eec000a1b522 => 215
	i64 7592577537120840276, ; 276: System.Diagnostics.Process => 0x695e410af5b2aa54 => 28
	i64 7637303409920963731, ; 277: System.IO.Compression.ZipFile.dll => 0x69fd26fcb637f493 => 43
	i64 7654504624184590948, ; 278: System.Net.Http => 0x6a3a4366801b8264 => 62
	i64 7694700312542370399, ; 279: System.Net.Mail => 0x6ac9112a7e2cda5f => 64
	i64 7708790323521193081, ; 280: ms/Microsoft.Maui.Controls.resources.dll => 0x6afb1ff4d1730479 => 324
	i64 7714652370974252055, ; 281: System.Private.CoreLib => 0x6b0ff375198b9c17 => 168
	i64 7725404731275645577, ; 282: Xamarin.AndroidX.Lifecycle.Runtime.Ktx => 0x6b3626ac11ce9289 => 266
	i64 7735176074855944702, ; 283: Microsoft.CSharp => 0x6b58dda848e391fe => 1
	i64 7735352534559001595, ; 284: Xamarin.Kotlin.StdLib.dll => 0x6b597e2582ce8bfb => 301
	i64 7791074099216502080, ; 285: System.IO.FileSystem.AccessControl.dll => 0x6c1f749d468bcd40 => 45
	i64 7820441508502274321, ; 286: System.Data => 0x6c87ca1e14ff8111 => 24
	i64 7836164640616011524, ; 287: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x6cbfa6390d64d704 => 234
	i64 7972383140441761405, ; 288: Microsoft.Extensions.Caching.Abstractions.dll => 0x6ea3983a0b58267d => 178
	i64 8025517457475554965, ; 289: WindowsBase => 0x6f605d9b4786ce95 => 161
	i64 8031450141206250471, ; 290: System.Runtime.Intrinsics.dll => 0x6f757159d9dc03e7 => 106
	i64 8064050204834738623, ; 291: System.Collections.dll => 0x6fe942efa61731bf => 12
	i64 8083354569033831015, ; 292: Xamarin.AndroidX.Lifecycle.Common.dll => 0x702dd82730cad267 => 260
	i64 8085230611270010360, ; 293: System.Net.Http.Json.dll => 0x703482674fdd05f8 => 61
	i64 8087206902342787202, ; 294: System.Diagnostics.DiagnosticSource => 0x703b87d46f3aa082 => 212
	i64 8103644804370223335, ; 295: System.Data.DataSetExtensions.dll => 0x7075ee03be6d50e7 => 23
	i64 8113615946733131500, ; 296: System.Reflection.Extensions => 0x70995ab73cf916ec => 91
	i64 8167236081217502503, ; 297: Java.Interop.dll => 0x7157d9f1a9b8fd27 => 164
	i64 8185542183669246576, ; 298: System.Collections => 0x7198e33f4794aa70 => 12
	i64 8187640529827139739, ; 299: Xamarin.KotlinX.Coroutines.Android => 0x71a057ae90f0109b => 305
	i64 8234598844743906698, ; 300: Microsoft.Identity.Client.Extensions.Msal.dll => 0x72472c0540cd758a => 190
	i64 8246048515196606205, ; 301: Microsoft.Maui.Graphics.dll => 0x726fd96f64ee56fd => 202
	i64 8264926008854159966, ; 302: System.Diagnostics.Process.dll => 0x72b2ea6a64a3a25e => 28
	i64 8290740647658429042, ; 303: System.Runtime.Extensions => 0x730ea0b15c929a72 => 101
	i64 8318905602908530212, ; 304: System.ComponentModel.DataAnnotations => 0x7372b092055ea624 => 14
	i64 8368701292315763008, ; 305: System.Security.Cryptography => 0x7423997c6fd56140 => 124
	i64 8398329775253868912, ; 306: Xamarin.AndroidX.ConstraintLayout.Core.dll => 0x748cdc6f3097d170 => 243
	i64 8400357532724379117, ; 307: Xamarin.AndroidX.Navigation.UI.dll => 0x749410ab44503ded => 275
	i64 8410671156615598628, ; 308: System.Reflection.Emit.Lightweight.dll => 0x74b8b4daf4b25224 => 89
	i64 8426919725312979251, ; 309: Xamarin.AndroidX.Lifecycle.Process => 0x74f26ed7aa033133 => 264
	i64 8476857680833348370, ; 310: System.Security.Permissions.dll => 0x75a3d925fd9d0312 => 220
	i64 8513291706828295435, ; 311: Microsoft.SqlServer.Server => 0x762549b3b6c78d0b => 203
	i64 8518412311883997971, ; 312: System.Collections.Immutable => 0x76377add7c28e313 => 9
	i64 8563666267364444763, ; 313: System.Private.Uri => 0x76d841191140ca5b => 84
	i64 8598790081731763592, ; 314: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 0x77550a055fc61d88 => 254
	i64 8601935802264776013, ; 315: Xamarin.AndroidX.Transition.dll => 0x7760370982b4ed4d => 287
	i64 8614108721271900878, ; 316: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x778b763e14018ace => 328
	i64 8623059219396073920, ; 317: System.Net.Quic.dll => 0x77ab42ac514299c0 => 69
	i64 8626175481042262068, ; 318: Java.Interop => 0x77b654e585b55834 => 164
	i64 8638972117149407195, ; 319: Microsoft.CSharp.dll => 0x77e3cb5e8b31d7db => 1
	i64 8639588376636138208, ; 320: Xamarin.AndroidX.Navigation.Runtime => 0x77e5fbdaa2fda2e0 => 274
	i64 8648495978913578441, ; 321: Microsoft.Win32.Registry.dll => 0x7805a1456889bdc9 => 5
	i64 8677882282824630478, ; 322: pt-BR\Microsoft.Maui.Controls.resources => 0x786e07f5766b00ce => 328
	i64 8684531736582871431, ; 323: System.IO.Compression.FileSystem => 0x7885a79a0fa0d987 => 42
	i64 8725526185868997716, ; 324: System.Diagnostics.DiagnosticSource.dll => 0x79174bd613173454 => 212
	i64 8853378295825400934, ; 325: Xamarin.Kotlin.StdLib.Common.dll => 0x7add84a720d38466 => 302
	i64 8941376889969657626, ; 326: System.Xml.XDocument => 0x7c1626e87187471a => 154
	i64 8951477988056063522, ; 327: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 0x7c3a09cd9ccf5e22 => 277
	i64 8954753533646919997, ; 328: System.Runtime.Serialization.Json => 0x7c45ace50032d93d => 110
	i64 8955323522379913726, ; 329: Microsoft.Identity.Client => 0x7c47b34bd82799fe => 189
	i64 9045785047181495996, ; 330: zh-HK\Microsoft.Maui.Controls.resources => 0x7d891592e3cb0ebc => 338
	i64 9052662452269567435, ; 331: Microsoft.IdentityModel.Protocols => 0x7da184898b0b4dcb => 194
	i64 9111603110219107042, ; 332: Microsoft.Extensions.Caching.Memory => 0x7e72eac0def44ae2 => 179
	i64 9138683372487561558, ; 333: System.Security.Cryptography.Csp => 0x7ed3201bc3e3d156 => 119
	i64 9250544137016314866, ; 334: Microsoft.EntityFrameworkCore => 0x806088e191ee0bf2 => 174
	i64 9312692141327339315, ; 335: Xamarin.AndroidX.ViewPager2 => 0x813d54296a634f33 => 292
	i64 9324707631942237306, ; 336: Xamarin.AndroidX.AppCompat => 0x8168042fd44a7c7a => 233
	i64 9427266486299436557, ; 337: Microsoft.IdentityModel.Logging.dll => 0x82d460ebe6d2a60d => 193
	i64 9468215723722196442, ; 338: System.Xml.XPath.XDocument.dll => 0x8365dc09353ac5da => 155
	i64 9500688326720985260, ; 339: Microsoft.EntityFrameworkCore.SqlServer => 0x83d939b243e798ac => 177
	i64 9554839972845591462, ; 340: System.ServiceModel.Web => 0x84999c54e32a1ba6 => 129
	i64 9575902398040817096, ; 341: Xamarin.Google.Crypto.Tink.Android.dll => 0x84e4707ee708bdc8 => 297
	i64 9584643793929893533, ; 342: System.IO.dll => 0x85037ebfbbd7f69d => 55
	i64 9659729154652888475, ; 343: System.Text.RegularExpressions => 0x860e407c9991dd9b => 134
	i64 9662334977499516867, ; 344: System.Numerics.dll => 0x8617827802b0cfc3 => 81
	i64 9667360217193089419, ; 345: System.Diagnostics.StackTrace => 0x86295ce5cd89898b => 29
	i64 9678050649315576968, ; 346: Xamarin.AndroidX.CoordinatorLayout.dll => 0x864f57c9feb18c88 => 244
	i64 9702891218465930390, ; 347: System.Collections.NonGeneric.dll => 0x86a79827b2eb3c96 => 10
	i64 9780093022148426479, ; 348: Xamarin.AndroidX.Window.Extensions.Core.Core.dll => 0x87b9dec9576efaef => 294
	i64 9808709177481450983, ; 349: Mono.Android.dll => 0x881f890734e555e7 => 167
	i64 9819168441846169364, ; 350: Microsoft.IdentityModel.Protocols.dll => 0x8844b1ac75f77f14 => 194
	i64 9825649861376906464, ; 351: Xamarin.AndroidX.Concurrent.Futures => 0x885bb87d8abc94e0 => 241
	i64 9834056768316610435, ; 352: System.Transactions.dll => 0x8879968718899783 => 146
	i64 9836529246295212050, ; 353: System.Reflection.Metadata => 0x88825f3bbc2ac012 => 92
	i64 9907349773706910547, ; 354: Xamarin.AndroidX.Emoji2.ViewsHelper => 0x897dfa20b758db53 => 254
	i64 9933555792566666578, ; 355: System.Linq.Queryable.dll => 0x89db145cf475c552 => 58
	i64 9956195530459977388, ; 356: Microsoft.Maui => 0x8a2b8315b36616ac => 200
	i64 9974604633896246661, ; 357: System.Xml.Serialization.dll => 0x8a6cea111a59dd85 => 153
	i64 9991543690424095600, ; 358: es/Microsoft.Maui.Controls.resources.dll => 0x8aa9180c89861370 => 313
	i64 10017511394021241210, ; 359: Microsoft.Extensions.Logging.Debug => 0x8b055989ae10717a => 186
	i64 10038780035334861115, ; 360: System.Net.Http.dll => 0x8b50e941206af13b => 62
	i64 10051358222726253779, ; 361: System.Private.Xml => 0x8b7d990c97ccccd3 => 86
	i64 10078727084704864206, ; 362: System.Net.WebSockets.Client => 0x8bded4e257f117ce => 77
	i64 10089571585547156312, ; 363: System.IO.FileSystem.AccessControl => 0x8c055be67469bb58 => 45
	i64 10092835686693276772, ; 364: Microsoft.Maui.Controls => 0x8c10f49539bd0c64 => 198
	i64 10105485790837105934, ; 365: System.Threading.Tasks.Parallel => 0x8c3de5c91d9a650e => 139
	i64 10143853363526200146, ; 366: da\Microsoft.Maui.Controls.resources => 0x8cc634e3c2a16b52 => 310
	i64 10226222362177979215, ; 367: Xamarin.Kotlin.StdLib.Jdk7 => 0x8dead70ebbc6434f => 303
	i64 10229024438826829339, ; 368: Xamarin.AndroidX.CustomView => 0x8df4cb880b10061b => 248
	i64 10236703004850800690, ; 369: System.Net.ServicePoint.dll => 0x8e101325834e4832 => 72
	i64 10245369515835430794, ; 370: System.Reflection.Emit.Lightweight => 0x8e2edd4ad7fc978a => 89
	i64 10252714262739571204, ; 371: Microsoft.Maui.Controls.HotReload.Forms => 0x8e48f54cfe2c5204 => 341
	i64 10321854143672141184, ; 372: Xamarin.Jetbrains.Annotations.dll => 0x8f3e97a7f8f8c580 => 300
	i64 10360651442923773544, ; 373: System.Text.Encoding => 0x8fc86d98211c1e68 => 133
	i64 10364469296367737616, ; 374: System.Reflection.Emit.ILGeneration.dll => 0x8fd5fde967711b10 => 88
	i64 10376576884623852283, ; 375: Xamarin.AndroidX.Tracing.Tracing => 0x900101b2f888c2fb => 286
	i64 10406448008575299332, ; 376: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x906b2153fcb3af04 => 306
	i64 10430153318873392755, ; 377: Xamarin.AndroidX.Core => 0x90bf592ea44f6673 => 245
	i64 10447083246144586668, ; 378: Microsoft.Bcl.AsyncInterfaces.dll => 0x90fb7edc816203ac => 172
	i64 10506226065143327199, ; 379: ca\Microsoft.Maui.Controls.resources => 0x91cd9cf11ed169df => 308
	i64 10546663366131771576, ; 380: System.Runtime.Serialization.Json.dll => 0x925d4673efe8e8b8 => 110
	i64 10566960649245365243, ; 381: System.Globalization.dll => 0x92a562b96dcd13fb => 40
	i64 10595762989148858956, ; 382: System.Xml.XPath.XDocument => 0x930bb64cc472ea4c => 155
	i64 10670374202010151210, ; 383: Microsoft.Win32.Primitives.dll => 0x9414c8cd7b4ea92a => 4
	i64 10714184849103829812, ; 384: System.Runtime.Extensions.dll => 0x94b06e5aa4b4bb34 => 101
	i64 10785150219063592792, ; 385: System.Net.Primitives => 0x95ac8cfb68830758 => 68
	i64 10811915265162633087, ; 386: Microsoft.EntityFrameworkCore.Relational.dll => 0x960ba3a651a45f7f => 176
	i64 10822644899632537592, ; 387: System.Linq.Queryable => 0x9631c23204ca5ff8 => 58
	i64 10830817578243619689, ; 388: System.Formats.Tar => 0x964ecb340a447b69 => 37
	i64 10847732767863316357, ; 389: Xamarin.AndroidX.Arch.Core.Common => 0x968ae37a86db9f85 => 235
	i64 10889380495983713167, ; 390: Microsoft.Data.SqlClient.dll => 0x971ed9dddf2d1b8f => 173
	i64 10899834349646441345, ; 391: System.Web => 0x9743fd975946eb81 => 149
	i64 10943875058216066601, ; 392: System.IO.UnmanagedMemoryStream.dll => 0x97e07461df39de29 => 54
	i64 10964653383833615866, ; 393: System.Diagnostics.Tracing => 0x982a4628ccaffdfa => 33
	i64 11002576679268595294, ; 394: Microsoft.Extensions.Logging.Abstractions => 0x98b1013215cd365e => 185
	i64 11009005086950030778, ; 395: Microsoft.Maui.dll => 0x98c7d7cc621ffdba => 200
	i64 11019817191295005410, ; 396: Xamarin.AndroidX.Annotation.Jvm.dll => 0x98ee415998e1b2e2 => 232
	i64 11023048688141570732, ; 397: System.Core => 0x98f9bc61168392ac => 21
	i64 11037814507248023548, ; 398: System.Xml => 0x992e31d0412bf7fc => 159
	i64 11047101296015504039, ; 399: Microsoft.Win32.SystemEvents => 0x994f301942c2f2a7 => 204
	i64 11071824625609515081, ; 400: Xamarin.Google.ErrorProne.Annotations => 0x99a705d600e0a049 => 298
	i64 11103970607964515343, ; 401: hu\Microsoft.Maui.Controls.resources => 0x9a193a6fc41a6c0f => 319
	i64 11136029745144976707, ; 402: Jsr305Binding.dll => 0x9a8b200d4f8cd543 => 296
	i64 11162124722117608902, ; 403: Xamarin.AndroidX.ViewPager => 0x9ae7d54b986d05c6 => 291
	i64 11188319605227840848, ; 404: System.Threading.Overlapped => 0x9b44e5671724e550 => 136
	i64 11220793807500858938, ; 405: ja\Microsoft.Maui.Controls.resources => 0x9bb8448481fdd63a => 322
	i64 11226290749488709958, ; 406: Microsoft.Extensions.Options.dll => 0x9bcbcbf50c874146 => 187
	i64 11235648312900863002, ; 407: System.Reflection.DispatchProxy.dll => 0x9bed0a9c8fac441a => 87
	i64 11329751333533450475, ; 408: System.Threading.Timer.dll => 0x9d3b5ccf6cc500eb => 143
	i64 11340910727871153756, ; 409: Xamarin.AndroidX.CursorAdapter => 0x9d630238642d465c => 247
	i64 11341245327015630248, ; 410: System.Configuration.ConfigurationManager.dll => 0x9d643289535355a8 => 211
	i64 11347436699239206956, ; 411: System.Xml.XmlSerializer.dll => 0x9d7a318e8162502c => 158
	i64 11392833485892708388, ; 412: Xamarin.AndroidX.Print.dll => 0x9e1b79b18fcf6824 => 276
	i64 11432101114902388181, ; 413: System.AppContext => 0x9ea6fb64e61a9dd5 => 6
	i64 11446671985764974897, ; 414: Mono.Android.Export => 0x9edabf8623efc131 => 165
	i64 11448276831755070604, ; 415: System.Diagnostics.TextWriterTraceListener => 0x9ee0731f77186c8c => 30
	i64 11485890710487134646, ; 416: System.Runtime.InteropServices => 0x9f6614bf0f8b71b6 => 105
	i64 11508496261504176197, ; 417: Xamarin.AndroidX.Fragment.Ktx.dll => 0x9fb664600dde1045 => 257
	i64 11513602507638267977, ; 418: System.IO.Pipelines.dll => 0x9fc8887aa0d36049 => 216
	i64 11517440453979132662, ; 419: Microsoft.IdentityModel.Abstractions.dll => 0x9fd62b122523d2f6 => 191
	i64 11518296021396496455, ; 420: id\Microsoft.Maui.Controls.resources => 0x9fd9353475222047 => 320
	i64 11529969570048099689, ; 421: Xamarin.AndroidX.ViewPager.dll => 0xa002ae3c4dc7c569 => 291
	i64 11530571088791430846, ; 422: Microsoft.Extensions.Logging => 0xa004d1504ccd66be => 184
	i64 11580057168383206117, ; 423: Xamarin.AndroidX.Annotation => 0xa0b4a0a4103262e5 => 230
	i64 11591352189662810718, ; 424: Xamarin.AndroidX.Startup.StartupRuntime.dll => 0xa0dcc167234c525e => 284
	i64 11597940890313164233, ; 425: netstandard => 0xa0f429ca8d1805c9 => 163
	i64 11672361001936329215, ; 426: Xamarin.AndroidX.Interpolator => 0xa1fc8e7d0a8999ff => 258
	i64 11692977985522001935, ; 427: System.Threading.Overlapped.dll => 0xa245cd869980680f => 136
	i64 11705530742807338875, ; 428: he/Microsoft.Maui.Controls.resources.dll => 0xa272663128721f7b => 316
	i64 11707554492040141440, ; 429: System.Linq.Parallel.dll => 0xa27996c7fe94da80 => 57
	i64 11739066727115742305, ; 430: SQLite-net.dll => 0xa2e98afdf8575c61 => 205
	i64 11743665907891708234, ; 431: System.Threading.Tasks => 0xa2f9e1ec30c0214a => 140
	i64 11806260347154423189, ; 432: SQLite-net => 0xa3d8433bc5eb5d95 => 205
	i64 11991047634523762324, ; 433: System.Net => 0xa668c24ad493ae94 => 79
	i64 12011556116648931059, ; 434: System.Security.Cryptography.ProtectedData => 0xa6b19ea5ec87aef3 => 219
	i64 12040886584167504988, ; 435: System.Net.ServicePoint => 0xa719d28d8e121c5c => 72
	i64 12063623837170009990, ; 436: System.Security => 0xa76a99f6ce740786 => 128
	i64 12096697103934194533, ; 437: System.Diagnostics.Contracts => 0xa7e019eccb7e8365 => 25
	i64 12102847907131387746, ; 438: System.Buffers => 0xa7f5f40c43256f62 => 7
	i64 12123043025855404482, ; 439: System.Reflection.Extensions.dll => 0xa83db366c0e359c2 => 91
	i64 12137774235383566651, ; 440: Xamarin.AndroidX.VectorDrawable => 0xa872095bbfed113b => 288
	i64 12145679461940342714, ; 441: System.Text.Json => 0xa88e1f1ebcb62fba => 222
	i64 12191646537372739477, ; 442: Xamarin.Android.Glide.dll => 0xa9316dee7f392795 => 224
	i64 12198439281774268251, ; 443: Microsoft.IdentityModel.Protocols.OpenIdConnect.dll => 0xa9498fe58c538f5b => 195
	i64 12201331334810686224, ; 444: System.Runtime.Serialization.Primitives.dll => 0xa953d6341e3bd310 => 111
	i64 12269460666702402136, ; 445: System.Collections.Immutable.dll => 0xaa45e178506c9258 => 9
	i64 12279246230491828964, ; 446: SQLitePCLRaw.provider.e_sqlite3.dll => 0xaa68a5636e0512e4 => 209
	i64 12313367145828839434, ; 447: System.IO.Pipelines => 0xaae1de2e1c17f00a => 216
	i64 12332222936682028543, ; 448: System.Runtime.Handles => 0xab24db6c07db5dff => 102
	i64 12375446203996702057, ; 449: System.Configuration.dll => 0xabbe6ac12e2e0569 => 19
	i64 12439275739440478309, ; 450: Microsoft.IdentityModel.JsonWebTokens => 0xaca12f61007bf865 => 192
	i64 12451044538927396471, ; 451: Xamarin.AndroidX.Fragment.dll => 0xaccaff0a2955b677 => 256
	i64 12466513435562512481, ; 452: Xamarin.AndroidX.Loader.dll => 0xad01f3eb52569061 => 270
	i64 12475113361194491050, ; 453: _Microsoft.Android.Resource.Designer.dll => 0xad2081818aba1caa => 344
	i64 12487638416075308985, ; 454: Xamarin.AndroidX.DocumentFile.dll => 0xad4d00fa21b0bfb9 => 250
	i64 12493213219680520345, ; 455: Microsoft.Data.SqlClient => 0xad60cf3b3e458899 => 173
	i64 12517810545449516888, ; 456: System.Diagnostics.TraceSource.dll => 0xadb8325e6f283f58 => 32
	i64 12538491095302438457, ; 457: Xamarin.AndroidX.CardView.dll => 0xae01ab382ae67e39 => 238
	i64 12550732019250633519, ; 458: System.IO.Compression => 0xae2d28465e8e1b2f => 44
	i64 12681088699309157496, ; 459: it/Microsoft.Maui.Controls.resources.dll => 0xaffc46fc178aec78 => 321
	i64 12699999919562409296, ; 460: System.Diagnostics.StackTrace.dll => 0xb03f76a3ad01c550 => 29
	i64 12700543734426720211, ; 461: Xamarin.AndroidX.Collection => 0xb041653c70d157d3 => 239
	i64 12708238894395270091, ; 462: System.IO => 0xb05cbbf17d3ba3cb => 55
	i64 12708922737231849740, ; 463: System.Text.Encoding.Extensions => 0xb05f29e50e96e90c => 132
	i64 12717050818822477433, ; 464: System.Runtime.Serialization.Xml.dll => 0xb07c0a5786811679 => 112
	i64 12753841065332862057, ; 465: Xamarin.AndroidX.Window => 0xb0febee04cf46c69 => 293
	i64 12823819093633476069, ; 466: th/Microsoft.Maui.Controls.resources.dll => 0xb1f75b85abe525e5 => 334
	i64 12828192437253469131, ; 467: Xamarin.Kotlin.StdLib.Jdk8.dll => 0xb206e50e14d873cb => 304
	i64 12835242264250840079, ; 468: System.IO.Pipes => 0xb21ff0d5d6c0740f => 53
	i64 12843321153144804894, ; 469: Microsoft.Extensions.Primitives => 0xb23ca48abd74d61e => 188
	i64 12843770487262409629, ; 470: System.AppContext.dll => 0xb23e3d357debf39d => 6
	i64 12859557719246324186, ; 471: System.Net.WebHeaderCollection.dll => 0xb276539ce04f41da => 75
	i64 12963446364377008305, ; 472: System.Drawing.Common.dll => 0xb3e769c8fd8548b1 => 213
	i64 12982280885948128408, ; 473: Xamarin.AndroidX.CustomView.PoolingContainer => 0xb42a53aec5481c98 => 249
	i64 13068258254871114833, ; 474: System.Runtime.Serialization.Formatters.dll => 0xb55bc7a4eaa8b451 => 109
	i64 13129914918964716986, ; 475: Xamarin.AndroidX.Emoji2.dll => 0xb636d40db3fe65ba => 253
	i64 13162471042547327635, ; 476: System.Security.Permissions => 0xb6aa7dace9662293 => 220
	i64 13173818576982874404, ; 477: System.Runtime.CompilerServices.VisualC.dll => 0xb6d2ce32a8819924 => 100
	i64 13221551921002590604, ; 478: ca/Microsoft.Maui.Controls.resources.dll => 0xb77c636bdebe318c => 308
	i64 13222659110913276082, ; 479: ja/Microsoft.Maui.Controls.resources.dll => 0xb78052679c1178b2 => 322
	i64 13343850469010654401, ; 480: Mono.Android.Runtime.dll => 0xb92ee14d854f44c1 => 166
	i64 13370592475155966277, ; 481: System.Runtime.Serialization => 0xb98de304062ea945 => 113
	i64 13381594904270902445, ; 482: he\Microsoft.Maui.Controls.resources => 0xb9b4f9aaad3e94ad => 316
	i64 13401370062847626945, ; 483: Xamarin.AndroidX.VectorDrawable.dll => 0xb9fb3b1193964ec1 => 288
	i64 13404347523447273790, ; 484: Xamarin.AndroidX.ConstraintLayout.Core => 0xba05cf0da4f6393e => 243
	i64 13431476299110033919, ; 485: System.Net.WebClient => 0xba663087f18829ff => 74
	i64 13454009404024712428, ; 486: Xamarin.Google.Guava.ListenableFuture => 0xbab63e4543a86cec => 299
	i64 13463706743370286408, ; 487: System.Private.DataContractSerialization.dll => 0xbad8b1f3069e0548 => 83
	i64 13465488254036897740, ; 488: Xamarin.Kotlin.StdLib => 0xbadf06394d106fcc => 301
	i64 13467053111158216594, ; 489: uk/Microsoft.Maui.Controls.resources.dll => 0xbae49573fde79792 => 336
	i64 13491513212026656886, ; 490: Xamarin.AndroidX.Arch.Core.Runtime.dll => 0xbb3b7bc905569876 => 236
	i64 13540124433173649601, ; 491: vi\Microsoft.Maui.Controls.resources => 0xbbe82f6eede718c1 => 337
	i64 13545416393490209236, ; 492: id/Microsoft.Maui.Controls.resources.dll => 0xbbfafc7174bc99d4 => 320
	i64 13572454107664307259, ; 493: Xamarin.AndroidX.RecyclerView.dll => 0xbc5b0b19d99f543b => 278
	i64 13578472628727169633, ; 494: System.Xml.XPath => 0xbc706ce9fba5c261 => 156
	i64 13580399111273692417, ; 495: Microsoft.VisualBasic.Core.dll => 0xbc77450a277fbd01 => 2
	i64 13621154251410165619, ; 496: Xamarin.AndroidX.CustomView.PoolingContainer.dll => 0xbd080f9faa1acf73 => 249
	i64 13647894001087880694, ; 497: System.Data.dll => 0xbd670f48cb071df6 => 24
	i64 13675589307506966157, ; 498: Xamarin.AndroidX.Activity.Ktx => 0xbdc97404d0153e8d => 229
	i64 13702626353344114072, ; 499: System.Diagnostics.Tools.dll => 0xbe29821198fb6d98 => 31
	i64 13710614125866346983, ; 500: System.Security.AccessControl.dll => 0xbe45e2e7d0b769e7 => 115
	i64 13713329104121190199, ; 501: System.Dynamic.Runtime => 0xbe4f8829f32b5737 => 36
	i64 13717397318615465333, ; 502: System.ComponentModel.Primitives.dll => 0xbe5dfc2ef2f87d75 => 16
	i64 13742054908850494594, ; 503: Azure.Identity => 0xbeb596218df25c82 => 170
	i64 13755568601956062840, ; 504: fr/Microsoft.Maui.Controls.resources.dll => 0xbee598c36b1b9678 => 315
	i64 13768883594457632599, ; 505: System.IO.IsolatedStorage => 0xbf14e6adb159cf57 => 50
	i64 13814445057219246765, ; 506: hr/Microsoft.Maui.Controls.resources.dll => 0xbfb6c49664b43aad => 318
	i64 13828521679616088467, ; 507: Xamarin.Kotlin.StdLib.Common => 0xbfe8c733724e1993 => 302
	i64 13881769479078963060, ; 508: System.Console.dll => 0xc0a5f3cade5c6774 => 20
	i64 13882652712560114096, ; 509: System.Windows.Extensions.dll => 0xc0a91716b04239b0 => 223
	i64 13911222732217019342, ; 510: System.Security.Cryptography.OpenSsl.dll => 0xc10e975ec1226bce => 121
	i64 13928444506500929300, ; 511: System.Windows.dll => 0xc14bc67b8bba9714 => 150
	i64 13959074834287824816, ; 512: Xamarin.AndroidX.Fragment => 0xc1b8989a7ad20fb0 => 256
	i64 14075334701871371868, ; 513: System.ServiceModel.Web.dll => 0xc355a25647c5965c => 129
	i64 14100563506285742564, ; 514: da/Microsoft.Maui.Controls.resources.dll => 0xc3af43cd0cff89e4 => 310
	i64 14124974489674258913, ; 515: Xamarin.AndroidX.CardView => 0xc405fd76067d19e1 => 238
	i64 14125464355221830302, ; 516: System.Threading.dll => 0xc407bafdbc707a9e => 144
	i64 14133832980772275001, ; 517: Microsoft.EntityFrameworkCore.dll => 0xc425763635a1c339 => 174
	i64 14178052285788134900, ; 518: Xamarin.Android.Glide.Annotations.dll => 0xc4c28f6f75511df4 => 225
	i64 14212104595480609394, ; 519: System.Security.Cryptography.Cng.dll => 0xc53b89d4a4518272 => 118
	i64 14220608275227875801, ; 520: System.Diagnostics.FileVersionInfo.dll => 0xc559bfe1def019d9 => 27
	i64 14226382999226559092, ; 521: System.ServiceProcess => 0xc56e43f6938e2a74 => 130
	i64 14232023429000439693, ; 522: System.Resources.Writer.dll => 0xc5824de7789ba78d => 98
	i64 14254574811015963973, ; 523: System.Text.Encoding.Extensions.dll => 0xc5d26c4442d66545 => 132
	i64 14261073672896646636, ; 524: Xamarin.AndroidX.Print => 0xc5e982f274ae0dec => 276
	i64 14298246716367104064, ; 525: System.Web.dll => 0xc66d93a217f4e840 => 149
	i64 14327695147300244862, ; 526: System.Reflection.dll => 0xc6d632d338eb4d7e => 95
	i64 14327709162229390963, ; 527: System.Security.Cryptography.X509Certificates => 0xc6d63f9253cade73 => 123
	i64 14331727281556788554, ; 528: Xamarin.Android.Glide.DiskLruCache.dll => 0xc6e48607a2f7954a => 226
	i64 14346402571976470310, ; 529: System.Net.Ping.dll => 0xc718a920f3686f26 => 67
	i64 14461014870687870182, ; 530: System.Net.Requests.dll => 0xc8afd8683afdece6 => 70
	i64 14464374589798375073, ; 531: ru\Microsoft.Maui.Controls.resources => 0xc8bbc80dcb1e5ea1 => 331
	i64 14486659737292545672, ; 532: Xamarin.AndroidX.Lifecycle.LiveData => 0xc90af44707469e88 => 261
	i64 14495724990987328804, ; 533: Xamarin.AndroidX.ResourceInspection.Annotation => 0xc92b2913e18d5d24 => 279
	i64 14522721392235705434, ; 534: el/Microsoft.Maui.Controls.resources.dll => 0xc98b12295c2cf45a => 312
	i64 14551742072151931844, ; 535: System.Text.Encodings.Web.dll => 0xc9f22c50f1b8fbc4 => 221
	i64 14561513370130550166, ; 536: System.Security.Cryptography.Primitives.dll => 0xca14e3428abb8d96 => 122
	i64 14574160591280636898, ; 537: System.Net.Quic => 0xca41d1d72ec783e2 => 69
	i64 14622043554576106986, ; 538: System.Runtime.Serialization.Formatters => 0xcaebef2458cc85ea => 109
	i64 14644440854989303794, ; 539: Xamarin.AndroidX.LocalBroadcastManager.dll => 0xcb3b815e37daeff2 => 271
	i64 14648804764802849406, ; 540: Azure.Identity.dll => 0xcb4b0252261f9a7e => 170
	i64 14669215534098758659, ; 541: Microsoft.Extensions.DependencyInjection.dll => 0xcb9385ceb3993c03 => 182
	i64 14690985099581930927, ; 542: System.Web.HttpUtility => 0xcbe0dd1ca5233daf => 148
	i64 14705122255218365489, ; 543: ko\Microsoft.Maui.Controls.resources => 0xcc1316c7b0fb5431 => 323
	i64 14744092281598614090, ; 544: zh-Hans\Microsoft.Maui.Controls.resources => 0xcc9d89d004439a4a => 339
	i64 14792063746108907174, ; 545: Xamarin.Google.Guava.ListenableFuture.dll => 0xcd47f79af9c15ea6 => 299
	i64 14832630590065248058, ; 546: System.Security.Claims => 0xcdd816ef5d6e873a => 116
	i64 14852515768018889994, ; 547: Xamarin.AndroidX.CursorAdapter.dll => 0xce1ebc6625a76d0a => 247
	i64 14889905118082851278, ; 548: GoogleGson.dll => 0xcea391d0969961ce => 171
	i64 14892012299694389861, ; 549: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xceab0e490a083a65 => 340
	i64 14904040806490515477, ; 550: ar\Microsoft.Maui.Controls.resources => 0xced5ca2604cb2815 => 307
	i64 14912225920358050525, ; 551: System.Security.Principal.Windows => 0xcef2de7759506add => 125
	i64 14935719434541007538, ; 552: System.Text.Encoding.CodePages.dll => 0xcf4655b160b702b2 => 131
	i64 14954917835170835695, ; 553: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xcf8a8a895a82ecef => 183
	i64 14984936317414011727, ; 554: System.Net.WebHeaderCollection => 0xcff5302fe54ff34f => 75
	i64 14987728460634540364, ; 555: System.IO.Compression.dll => 0xcfff1ba06622494c => 44
	i64 14988210264188246988, ; 556: Xamarin.AndroidX.DocumentFile => 0xd000d1d307cddbcc => 250
	i64 15015154896917945444, ; 557: System.Net.Security.dll => 0xd0608bd33642dc64 => 71
	i64 15024878362326791334, ; 558: System.Net.Http.Json => 0xd0831743ebf0f4a6 => 61
	i64 15071021337266399595, ; 559: System.Resources.Reader.dll => 0xd127060e7a18a96b => 96
	i64 15076659072870671916, ; 560: System.ObjectModel.dll => 0xd13b0d8c1620662c => 82
	i64 15111608613780139878, ; 561: ms\Microsoft.Maui.Controls.resources => 0xd1b737f831192f66 => 324
	i64 15115185479366240210, ; 562: System.IO.Compression.Brotli.dll => 0xd1c3ed1c1bc467d2 => 41
	i64 15133485256822086103, ; 563: System.Linq.dll => 0xd204f0a9127dd9d7 => 59
	i64 15138356091203993725, ; 564: Microsoft.IdentityModel.Abstractions => 0xd2163ea89395c07d => 191
	i64 15150743910298169673, ; 565: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 0xd2424150783c3149 => 277
	i64 15227001540531775957, ; 566: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd3512d3999b8e9d5 => 181
	i64 15234786388537674379, ; 567: System.Dynamic.Runtime.dll => 0xd36cd580c5be8a8b => 36
	i64 15250465174479574862, ; 568: System.Globalization.Calendars.dll => 0xd3a489469852174e => 38
	i64 15272359115529052076, ; 569: Xamarin.AndroidX.Collection.Ktx => 0xd3f251b2fb4edfac => 240
	i64 15279429628684179188, ; 570: Xamarin.KotlinX.Coroutines.Android.dll => 0xd40b704b1c4c96f4 => 305
	i64 15299439993936780255, ; 571: System.Xml.XPath.dll => 0xd452879d55019bdf => 156
	i64 15338463749992804988, ; 572: System.Resources.Reader => 0xd4dd2b839286f27c => 96
	i64 15370334346939861994, ; 573: Xamarin.AndroidX.Core.dll => 0xd54e65a72c560bea => 245
	i64 15383240894167415497, ; 574: System.Memory.Data => 0xd57c4016df1c7ac9 => 217
	i64 15391712275433856905, ; 575: Microsoft.Extensions.DependencyInjection.Abstractions => 0xd59a58c406411f89 => 183
	i64 15526743539506359484, ; 576: System.Text.Encoding.dll => 0xd77a12fc26de2cbc => 133
	i64 15527772828719725935, ; 577: System.Console => 0xd77dbb1e38cd3d6f => 20
	i64 15530465045505749832, ; 578: System.Net.HttpListener.dll => 0xd7874bacc9fdb348 => 63
	i64 15536481058354060254, ; 579: de\Microsoft.Maui.Controls.resources => 0xd79cab34eec75bde => 311
	i64 15541854775306130054, ; 580: System.Security.Cryptography.X509Certificates.dll => 0xd7afc292e8d49286 => 123
	i64 15557562860424774966, ; 581: System.Net.Sockets => 0xd7e790fe7a6dc536 => 73
	i64 15582737692548360875, ; 582: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xd841015ed86f6aab => 269
	i64 15609085926864131306, ; 583: System.dll => 0xd89e9cf3334914ea => 160
	i64 15661133872274321916, ; 584: System.Xml.ReaderWriter.dll => 0xd9578647d4bfb1fc => 152
	i64 15664356999916475676, ; 585: de/Microsoft.Maui.Controls.resources.dll => 0xd962f9b2b6ecd51c => 311
	i64 15710114879900314733, ; 586: Microsoft.Win32.Registry => 0xda058a3f5d096c6d => 5
	i64 15743187114543869802, ; 587: hu/Microsoft.Maui.Controls.resources.dll => 0xda7b09450ae4ef6a => 319
	i64 15755368083429170162, ; 588: System.IO.FileSystem.Primitives => 0xdaa64fcbde529bf2 => 47
	i64 15777549416145007739, ; 589: Xamarin.AndroidX.SlidingPaneLayout.dll => 0xdaf51d99d77eb47b => 283
	i64 15783653065526199428, ; 590: el\Microsoft.Maui.Controls.resources => 0xdb0accd674b1c484 => 312
	i64 15817206913877585035, ; 591: System.Threading.Tasks.dll => 0xdb8201e29086ac8b => 140
	i64 15847085070278954535, ; 592: System.Threading.Channels.dll => 0xdbec27e8f35f8e27 => 135
	i64 15885744048853936810, ; 593: System.Resources.Writer => 0xdc75800bd0b6eaaa => 98
	i64 15928521404965645318, ; 594: Microsoft.Maui.Controls.Compatibility => 0xdd0d79d32c2eec06 => 197
	i64 15934062614519587357, ; 595: System.Security.Cryptography.OpenSsl => 0xdd2129868f45a21d => 121
	i64 15937190497610202713, ; 596: System.Security.Cryptography.Cng => 0xdd2c465197c97e59 => 118
	i64 15963349826457351533, ; 597: System.Threading.Tasks.Extensions => 0xdd893616f748b56d => 138
	i64 15971679995444160383, ; 598: System.Formats.Tar.dll => 0xdda6ce5592a9677f => 37
	i64 16018552496348375205, ; 599: System.Net.NetworkInformation.dll => 0xde4d54a020caa8a5 => 66
	i64 16054465462676478687, ; 600: System.Globalization.Extensions => 0xdecceb47319bdadf => 39
	i64 16154507427712707110, ; 601: System => 0xe03056ea4e39aa26 => 160
	i64 16219561732052121626, ; 602: System.Net.Security => 0xe1177575db7c781a => 71
	i64 16288847719894691167, ; 603: nb\Microsoft.Maui.Controls.resources => 0xe20d9cb300c12d5f => 325
	i64 16315482530584035869, ; 604: WindowsBase.dll => 0xe26c3ceb1e8d821d => 161
	i64 16321164108206115771, ; 605: Microsoft.Extensions.Logging.Abstractions.dll => 0xe2806c487e7b0bbb => 185
	i64 16337011941688632206, ; 606: System.Security.Principal.Windows.dll => 0xe2b8b9cdc3aa638e => 125
	i64 16361933716545543812, ; 607: Xamarin.AndroidX.ExifInterface.dll => 0xe3114406a52f1e84 => 255
	i64 16423015068819898779, ; 608: Xamarin.Kotlin.StdLib.Jdk8 => 0xe3ea453135e5c19b => 304
	i64 16454459195343277943, ; 609: System.Net.NetworkInformation => 0xe459fb756d988f77 => 66
	i64 16496768397145114574, ; 610: Mono.Android.Export.dll => 0xe4f04b741db987ce => 165
	i64 16589693266713801121, ; 611: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll => 0xe63a6e214f2a71a1 => 268
	i64 16621146507174665210, ; 612: Xamarin.AndroidX.ConstraintLayout => 0xe6aa2caf87dedbfa => 242
	i64 16649148416072044166, ; 613: Microsoft.Maui.Graphics => 0xe70da84600bb4e86 => 202
	i64 16677317093839702854, ; 614: Xamarin.AndroidX.Navigation.UI => 0xe771bb8960dd8b46 => 275
	i64 16702652415771857902, ; 615: System.ValueTuple => 0xe7cbbde0b0e6d3ee => 147
	i64 16709499819875633724, ; 616: System.IO.Compression.ZipFile => 0xe7e4118e32240a3c => 43
	i64 16737807731308835127, ; 617: System.Runtime.Intrinsics => 0xe848a3736f733137 => 106
	i64 16755018182064898362, ; 618: SQLitePCLRaw.core.dll => 0xe885c843c330813a => 207
	i64 16758309481308491337, ; 619: System.IO.FileSystem.DriveInfo => 0xe89179af15740e49 => 46
	i64 16762783179241323229, ; 620: System.Reflection.TypeExtensions => 0xe8a15e7d0d927add => 94
	i64 16765015072123548030, ; 621: System.Diagnostics.TextWriterTraceListener.dll => 0xe8a94c621bfe717e => 30
	i64 16822611501064131242, ; 622: System.Data.DataSetExtensions => 0xe975ec07bb5412aa => 23
	i64 16833383113903931215, ; 623: mscorlib => 0xe99c30c1484d7f4f => 162
	i64 16856067890322379635, ; 624: System.Data.Common.dll => 0xe9ecc87060889373 => 22
	i64 16890310621557459193, ; 625: System.Text.RegularExpressions.dll => 0xea66700587f088f9 => 134
	i64 16933958494752847024, ; 626: System.Net.WebProxy.dll => 0xeb018187f0f3b4b0 => 76
	i64 16942731696432749159, ; 627: sk\Microsoft.Maui.Controls.resources => 0xeb20acb622a01a67 => 332
	i64 16945858842201062480, ; 628: Azure.Core => 0xeb2bc8d57f4e7c50 => 169
	i64 16977952268158210142, ; 629: System.IO.Pipes.AccessControl => 0xeb9dcda2851b905e => 52
	i64 16989020923549080504, ; 630: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx => 0xebc52084add25bb8 => 268
	i64 16998075588627545693, ; 631: Xamarin.AndroidX.Navigation.Fragment => 0xebe54bb02d623e5d => 273
	i64 17006954551347072385, ; 632: System.ClientModel => 0xec04d70ec8414d81 => 210
	i64 17008137082415910100, ; 633: System.Collections.NonGeneric => 0xec090a90408c8cd4 => 10
	i64 17024911836938395553, ; 634: Xamarin.AndroidX.Annotation.Experimental.dll => 0xec44a31d250e5fa1 => 231
	i64 17026344819618783825, ; 635: Microsoft.VisualStudio.DesignTools.TapContract.dll => 0xec49ba676cb0a251 => 343
	i64 17031351772568316411, ; 636: Xamarin.AndroidX.Navigation.Common.dll => 0xec5b843380a769fb => 272
	i64 17037200463775726619, ; 637: Xamarin.AndroidX.Legacy.Support.Core.Utils => 0xec704b8e0a78fc1b => 259
	i64 17062143951396181894, ; 638: System.ComponentModel.Primitives => 0xecc8e986518c9786 => 16
	i64 17089008752050867324, ; 639: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xed285aeb25888c7c => 339
	i64 17118171214553292978, ; 640: System.Threading.Channels => 0xed8ff6060fc420b2 => 135
	i64 17137864900836977098, ; 641: Microsoft.IdentityModel.Tokens => 0xedd5ed53b705e9ca => 196
	i64 17187273293601214786, ; 642: System.ComponentModel.Annotations.dll => 0xee8575ff9aa89142 => 13
	i64 17197986060146327831, ; 643: Microsoft.Identity.Client.Extensions.Msal => 0xeeab8533ef244117 => 190
	i64 17201328579425343169, ; 644: System.ComponentModel.EventBasedAsync => 0xeeb76534d96c16c1 => 15
	i64 17202182880784296190, ; 645: System.Security.Cryptography.Encoding.dll => 0xeeba6e30627428fe => 120
	i64 17230721278011714856, ; 646: System.Private.Xml.Linq => 0xef1fd1b5c7a72d28 => 85
	i64 17234219099804750107, ; 647: System.Transactions.Local.dll => 0xef2c3ef5e11d511b => 145
	i64 17260702271250283638, ; 648: System.Data.Common => 0xef8a5543bba6bc76 => 22
	i64 17333249706306540043, ; 649: System.Diagnostics.Tracing.dll => 0xf08c12c5bb8b920b => 33
	i64 17338386382517543202, ; 650: System.Net.WebSockets.Client.dll => 0xf09e528d5c6da122 => 77
	i64 17342750010158924305, ; 651: hi\Microsoft.Maui.Controls.resources => 0xf0add33f97ecc211 => 317
	i64 17360349973592121190, ; 652: Xamarin.Google.Crypto.Tink.Android => 0xf0ec5a52686b9f66 => 297
	i64 17371436720558481852, ; 653: System.Runtime.Caching => 0xf113bda8d710a1bc => 218
	i64 17438153253682247751, ; 654: sk/Microsoft.Maui.Controls.resources.dll => 0xf200c3fe308d7847 => 332
	i64 17470386307322966175, ; 655: System.Threading.Timer => 0xf27347c8d0d5709f => 143
	i64 17509662556995089465, ; 656: System.Net.WebSockets.dll => 0xf2fed1534ea67439 => 78
	i64 17514990004910432069, ; 657: fr\Microsoft.Maui.Controls.resources => 0xf311be9c6f341f45 => 315
	i64 17522591619082469157, ; 658: GoogleGson => 0xf32cc03d27a5bf25 => 171
	i64 17523946658117960076, ; 659: System.Security.Cryptography.ProtectedData.dll => 0xf33190a3c403c18c => 219
	i64 17590473451926037903, ; 660: Xamarin.Android.Glide => 0xf41dea67fcfda58f => 224
	i64 17623389608345532001, ; 661: pl\Microsoft.Maui.Controls.resources => 0xf492db79dfbef661 => 327
	i64 17627500474728259406, ; 662: System.Globalization => 0xf4a176498a351f4e => 40
	i64 17685921127322830888, ; 663: System.Diagnostics.Debug.dll => 0xf571038fafa74828 => 26
	i64 17702523067201099846, ; 664: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xf5abfef008ae1846 => 338
	i64 17704177640604968747, ; 665: Xamarin.AndroidX.Loader => 0xf5b1dfc36cac272b => 270
	i64 17710060891934109755, ; 666: Xamarin.AndroidX.Lifecycle.ViewModel => 0xf5c6c68c9e45303b => 267
	i64 17712670374920797664, ; 667: System.Runtime.InteropServices.dll => 0xf5d00bdc38bd3de0 => 105
	i64 17777860260071588075, ; 668: System.Runtime.Numerics.dll => 0xf6b7a5b72419c0eb => 108
	i64 17790600151040787804, ; 669: Microsoft.IdentityModel.Logging => 0xf6e4e89427cc055c => 193
	i64 17838668724098252521, ; 670: System.Buffers.dll => 0xf78faeb0f5bf3ee9 => 7
	i64 17891337867145587222, ; 671: Xamarin.Jetbrains.Annotations => 0xf84accff6fb52a16 => 300
	i64 17928294245072900555, ; 672: System.IO.Compression.FileSystem.dll => 0xf8ce18a0b24011cb => 42
	i64 17992315986609351877, ; 673: System.Xml.XmlDocument.dll => 0xf9b18c0ffc6eacc5 => 157
	i64 18017743553296241350, ; 674: Microsoft.Extensions.Caching.Abstractions => 0xfa0be24cb44e92c6 => 178
	i64 18025913125965088385, ; 675: System.Threading => 0xfa28e87b91334681 => 144
	i64 18099568558057551825, ; 676: nl/Microsoft.Maui.Controls.resources.dll => 0xfb2e95b53ad977d1 => 326
	i64 18116111925905154859, ; 677: Xamarin.AndroidX.Arch.Core.Runtime => 0xfb695bd036cb632b => 236
	i64 18121036031235206392, ; 678: Xamarin.AndroidX.Navigation.Common => 0xfb7ada42d3d42cf8 => 272
	i64 18146411883821974900, ; 679: System.Formats.Asn1.dll => 0xfbd50176eb22c574 => 214
	i64 18146811631844267958, ; 680: System.ComponentModel.EventBasedAsync.dll => 0xfbd66d08820117b6 => 15
	i64 18225059387460068507, ; 681: System.Threading.ThreadPool.dll => 0xfcec6af3cff4a49b => 142
	i64 18245806341561545090, ; 682: System.Collections.Concurrent.dll => 0xfd3620327d587182 => 8
	i64 18260797123374478311, ; 683: Xamarin.AndroidX.Emoji2 => 0xfd6b623bde35f3e7 => 253
	i64 18305135509493619199, ; 684: Xamarin.AndroidX.Navigation.Runtime.dll => 0xfe08e7c2d8c199ff => 274
	i64 18318849532986632368, ; 685: System.Security.dll => 0xfe39a097c37fa8b0 => 128
	i64 18324163916253801303, ; 686: it\Microsoft.Maui.Controls.resources => 0xfe4c81ff0a56ab57 => 321
	i64 18370042311372477656, ; 687: SQLitePCLRaw.lib.e_sqlite3.android.dll => 0xfeef80274e4094d8 => 208
	i64 18380184030268848184, ; 688: Xamarin.AndroidX.VersionedParcelable => 0xff1387fe3e7b7838 => 290
	i64 18439108438687598470 ; 689: System.Reflection.Metadata.dll => 0xffe4df6e2ee1c786 => 92
], align 8

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [690 x i32] [
	i32 252, ; 0
	i32 188, ; 1
	i32 167, ; 2
	i32 201, ; 3
	i32 56, ; 4
	i32 239, ; 5
	i32 147, ; 6
	i32 280, ; 7
	i32 283, ; 8
	i32 246, ; 9
	i32 130, ; 10
	i32 343, ; 11
	i32 54, ; 12
	i32 282, ; 13
	i32 314, ; 14
	i32 93, ; 15
	i32 265, ; 16
	i32 127, ; 17
	i32 189, ; 18
	i32 213, ; 19
	i32 141, ; 20
	i32 240, ; 21
	i32 18, ; 22
	i32 317, ; 23
	i32 208, ; 24
	i32 251, ; 25
	i32 266, ; 26
	i32 203, ; 27
	i32 146, ; 28
	i32 102, ; 29
	i32 93, ; 30
	i32 169, ; 31
	i32 295, ; 32
	i32 325, ; 33
	i32 35, ; 34
	i32 177, ; 35
	i32 207, ; 36
	i32 27, ; 37
	i32 235, ; 38
	i32 273, ; 39
	i32 0, ; 40
	i32 48, ; 41
	i32 113, ; 42
	i32 68, ; 43
	i32 198, ; 44
	i32 63, ; 45
	i32 166, ; 46
	i32 209, ; 47
	i32 141, ; 48
	i32 323, ; 49
	i32 294, ; 50
	i32 234, ; 51
	i32 269, ; 52
	i32 259, ; 53
	i32 38, ; 54
	i32 87, ; 55
	i32 79, ; 56
	i32 64, ; 57
	i32 60, ; 58
	i32 84, ; 59
	i32 0, ; 60
	i32 233, ; 61
	i32 104, ; 62
	i32 313, ; 63
	i32 280, ; 64
	i32 100, ; 65
	i32 172, ; 66
	i32 34, ; 67
	i32 230, ; 68
	i32 335, ; 69
	i32 282, ; 70
	i32 199, ; 71
	i32 335, ; 72
	i32 117, ; 73
	i32 267, ; 74
	i32 309, ; 75
	i32 327, ; 76
	i32 138, ; 77
	i32 137, ; 78
	i32 303, ; 79
	i32 51, ; 80
	i32 34, ; 81
	i32 137, ; 82
	i32 227, ; 83
	i32 237, ; 84
	i32 175, ; 85
	i32 186, ; 86
	i32 251, ; 87
	i32 8, ; 88
	i32 14, ; 89
	i32 331, ; 90
	i32 279, ; 91
	i32 49, ; 92
	i32 195, ; 93
	i32 262, ; 94
	i32 221, ; 95
	i32 99, ; 96
	i32 244, ; 97
	i32 289, ; 98
	i32 114, ; 99
	i32 228, ; 100
	i32 218, ; 101
	i32 159, ; 102
	i32 334, ; 103
	i32 196, ; 104
	i32 162, ; 105
	i32 65, ; 106
	i32 182, ; 107
	i32 309, ; 108
	i32 78, ; 109
	i32 99, ; 110
	i32 284, ; 111
	i32 192, ; 112
	i32 115, ; 113
	i32 211, ; 114
	i32 314, ; 115
	i32 296, ; 116
	i32 76, ; 117
	i32 295, ; 118
	i32 342, ; 119
	i32 210, ; 120
	i32 112, ; 121
	i32 119, ; 122
	i32 46, ; 123
	i32 204, ; 124
	i32 126, ; 125
	i32 260, ; 126
	i32 231, ; 127
	i32 80, ; 128
	i32 108, ; 129
	i32 73, ; 130
	i32 306, ; 131
	i32 215, ; 132
	i32 201, ; 133
	i32 51, ; 134
	i32 286, ; 135
	i32 180, ; 136
	i32 67, ; 137
	i32 285, ; 138
	i32 179, ; 139
	i32 81, ; 140
	i32 168, ; 141
	i32 329, ; 142
	i32 114, ; 143
	i32 181, ; 144
	i32 152, ; 145
	i32 180, ; 146
	i32 225, ; 147
	i32 163, ; 148
	i32 278, ; 149
	i32 252, ; 150
	i32 184, ; 151
	i32 31, ; 152
	i32 199, ; 153
	i32 120, ; 154
	i32 70, ; 155
	i32 60, ; 156
	i32 157, ; 157
	i32 111, ; 158
	i32 86, ; 159
	i32 197, ; 160
	i32 340, ; 161
	i32 103, ; 162
	i32 18, ; 163
	i32 142, ; 164
	i32 116, ; 165
	i32 56, ; 166
	i32 246, ; 167
	i32 17, ; 168
	i32 50, ; 169
	i32 90, ; 170
	i32 342, ; 171
	i32 206, ; 172
	i32 337, ; 173
	i32 53, ; 174
	i32 341, ; 175
	i32 127, ; 176
	i32 148, ; 177
	i32 39, ; 178
	i32 176, ; 179
	i32 90, ; 180
	i32 175, ; 181
	i32 290, ; 182
	i32 48, ; 183
	i32 307, ; 184
	i32 158, ; 185
	i32 13, ; 186
	i32 264, ; 187
	i32 228, ; 188
	i32 285, ; 189
	i32 35, ; 190
	i32 65, ; 191
	i32 107, ; 192
	i32 229, ; 193
	i32 97, ; 194
	i32 97, ; 195
	i32 11, ; 196
	i32 11, ; 197
	i32 271, ; 198
	i32 25, ; 199
	i32 126, ; 200
	i32 74, ; 201
	i32 263, ; 202
	i32 107, ; 203
	i32 289, ; 204
	i32 287, ; 205
	i32 104, ; 206
	i32 2, ; 207
	i32 26, ; 208
	i32 242, ; 209
	i32 153, ; 210
	i32 333, ; 211
	i32 223, ; 212
	i32 21, ; 213
	i32 336, ; 214
	i32 47, ; 215
	i32 41, ; 216
	i32 124, ; 217
	i32 232, ; 218
	i32 57, ; 219
	i32 117, ; 220
	i32 292, ; 221
	i32 255, ; 222
	i32 241, ; 223
	i32 3, ; 224
	i32 261, ; 225
	i32 281, ; 226
	i32 214, ; 227
	i32 122, ; 228
	i32 330, ; 229
	i32 281, ; 230
	i32 206, ; 231
	i32 330, ; 232
	i32 222, ; 233
	i32 145, ; 234
	i32 83, ; 235
	i32 88, ; 236
	i32 265, ; 237
	i32 344, ; 238
	i32 262, ; 239
	i32 318, ; 240
	i32 237, ; 241
	i32 248, ; 242
	i32 293, ; 243
	i32 187, ; 244
	i32 298, ; 245
	i32 263, ; 246
	i32 131, ; 247
	i32 94, ; 248
	i32 3, ; 249
	i32 326, ; 250
	i32 103, ; 251
	i32 329, ; 252
	i32 32, ; 253
	i32 150, ; 254
	i32 154, ; 255
	i32 151, ; 256
	i32 80, ; 257
	i32 257, ; 258
	i32 139, ; 259
	i32 85, ; 260
	i32 19, ; 261
	i32 258, ; 262
	i32 49, ; 263
	i32 227, ; 264
	i32 333, ; 265
	i32 59, ; 266
	i32 52, ; 267
	i32 4, ; 268
	i32 95, ; 269
	i32 217, ; 270
	i32 226, ; 271
	i32 17, ; 272
	i32 151, ; 273
	i32 82, ; 274
	i32 215, ; 275
	i32 28, ; 276
	i32 43, ; 277
	i32 62, ; 278
	i32 64, ; 279
	i32 324, ; 280
	i32 168, ; 281
	i32 266, ; 282
	i32 1, ; 283
	i32 301, ; 284
	i32 45, ; 285
	i32 24, ; 286
	i32 234, ; 287
	i32 178, ; 288
	i32 161, ; 289
	i32 106, ; 290
	i32 12, ; 291
	i32 260, ; 292
	i32 61, ; 293
	i32 212, ; 294
	i32 23, ; 295
	i32 91, ; 296
	i32 164, ; 297
	i32 12, ; 298
	i32 305, ; 299
	i32 190, ; 300
	i32 202, ; 301
	i32 28, ; 302
	i32 101, ; 303
	i32 14, ; 304
	i32 124, ; 305
	i32 243, ; 306
	i32 275, ; 307
	i32 89, ; 308
	i32 264, ; 309
	i32 220, ; 310
	i32 203, ; 311
	i32 9, ; 312
	i32 84, ; 313
	i32 254, ; 314
	i32 287, ; 315
	i32 328, ; 316
	i32 69, ; 317
	i32 164, ; 318
	i32 1, ; 319
	i32 274, ; 320
	i32 5, ; 321
	i32 328, ; 322
	i32 42, ; 323
	i32 212, ; 324
	i32 302, ; 325
	i32 154, ; 326
	i32 277, ; 327
	i32 110, ; 328
	i32 189, ; 329
	i32 338, ; 330
	i32 194, ; 331
	i32 179, ; 332
	i32 119, ; 333
	i32 174, ; 334
	i32 292, ; 335
	i32 233, ; 336
	i32 193, ; 337
	i32 155, ; 338
	i32 177, ; 339
	i32 129, ; 340
	i32 297, ; 341
	i32 55, ; 342
	i32 134, ; 343
	i32 81, ; 344
	i32 29, ; 345
	i32 244, ; 346
	i32 10, ; 347
	i32 294, ; 348
	i32 167, ; 349
	i32 194, ; 350
	i32 241, ; 351
	i32 146, ; 352
	i32 92, ; 353
	i32 254, ; 354
	i32 58, ; 355
	i32 200, ; 356
	i32 153, ; 357
	i32 313, ; 358
	i32 186, ; 359
	i32 62, ; 360
	i32 86, ; 361
	i32 77, ; 362
	i32 45, ; 363
	i32 198, ; 364
	i32 139, ; 365
	i32 310, ; 366
	i32 303, ; 367
	i32 248, ; 368
	i32 72, ; 369
	i32 89, ; 370
	i32 341, ; 371
	i32 300, ; 372
	i32 133, ; 373
	i32 88, ; 374
	i32 286, ; 375
	i32 306, ; 376
	i32 245, ; 377
	i32 172, ; 378
	i32 308, ; 379
	i32 110, ; 380
	i32 40, ; 381
	i32 155, ; 382
	i32 4, ; 383
	i32 101, ; 384
	i32 68, ; 385
	i32 176, ; 386
	i32 58, ; 387
	i32 37, ; 388
	i32 235, ; 389
	i32 173, ; 390
	i32 149, ; 391
	i32 54, ; 392
	i32 33, ; 393
	i32 185, ; 394
	i32 200, ; 395
	i32 232, ; 396
	i32 21, ; 397
	i32 159, ; 398
	i32 204, ; 399
	i32 298, ; 400
	i32 319, ; 401
	i32 296, ; 402
	i32 291, ; 403
	i32 136, ; 404
	i32 322, ; 405
	i32 187, ; 406
	i32 87, ; 407
	i32 143, ; 408
	i32 247, ; 409
	i32 211, ; 410
	i32 158, ; 411
	i32 276, ; 412
	i32 6, ; 413
	i32 165, ; 414
	i32 30, ; 415
	i32 105, ; 416
	i32 257, ; 417
	i32 216, ; 418
	i32 191, ; 419
	i32 320, ; 420
	i32 291, ; 421
	i32 184, ; 422
	i32 230, ; 423
	i32 284, ; 424
	i32 163, ; 425
	i32 258, ; 426
	i32 136, ; 427
	i32 316, ; 428
	i32 57, ; 429
	i32 205, ; 430
	i32 140, ; 431
	i32 205, ; 432
	i32 79, ; 433
	i32 219, ; 434
	i32 72, ; 435
	i32 128, ; 436
	i32 25, ; 437
	i32 7, ; 438
	i32 91, ; 439
	i32 288, ; 440
	i32 222, ; 441
	i32 224, ; 442
	i32 195, ; 443
	i32 111, ; 444
	i32 9, ; 445
	i32 209, ; 446
	i32 216, ; 447
	i32 102, ; 448
	i32 19, ; 449
	i32 192, ; 450
	i32 256, ; 451
	i32 270, ; 452
	i32 344, ; 453
	i32 250, ; 454
	i32 173, ; 455
	i32 32, ; 456
	i32 238, ; 457
	i32 44, ; 458
	i32 321, ; 459
	i32 29, ; 460
	i32 239, ; 461
	i32 55, ; 462
	i32 132, ; 463
	i32 112, ; 464
	i32 293, ; 465
	i32 334, ; 466
	i32 304, ; 467
	i32 53, ; 468
	i32 188, ; 469
	i32 6, ; 470
	i32 75, ; 471
	i32 213, ; 472
	i32 249, ; 473
	i32 109, ; 474
	i32 253, ; 475
	i32 220, ; 476
	i32 100, ; 477
	i32 308, ; 478
	i32 322, ; 479
	i32 166, ; 480
	i32 113, ; 481
	i32 316, ; 482
	i32 288, ; 483
	i32 243, ; 484
	i32 74, ; 485
	i32 299, ; 486
	i32 83, ; 487
	i32 301, ; 488
	i32 336, ; 489
	i32 236, ; 490
	i32 337, ; 491
	i32 320, ; 492
	i32 278, ; 493
	i32 156, ; 494
	i32 2, ; 495
	i32 249, ; 496
	i32 24, ; 497
	i32 229, ; 498
	i32 31, ; 499
	i32 115, ; 500
	i32 36, ; 501
	i32 16, ; 502
	i32 170, ; 503
	i32 315, ; 504
	i32 50, ; 505
	i32 318, ; 506
	i32 302, ; 507
	i32 20, ; 508
	i32 223, ; 509
	i32 121, ; 510
	i32 150, ; 511
	i32 256, ; 512
	i32 129, ; 513
	i32 310, ; 514
	i32 238, ; 515
	i32 144, ; 516
	i32 174, ; 517
	i32 225, ; 518
	i32 118, ; 519
	i32 27, ; 520
	i32 130, ; 521
	i32 98, ; 522
	i32 132, ; 523
	i32 276, ; 524
	i32 149, ; 525
	i32 95, ; 526
	i32 123, ; 527
	i32 226, ; 528
	i32 67, ; 529
	i32 70, ; 530
	i32 331, ; 531
	i32 261, ; 532
	i32 279, ; 533
	i32 312, ; 534
	i32 221, ; 535
	i32 122, ; 536
	i32 69, ; 537
	i32 109, ; 538
	i32 271, ; 539
	i32 170, ; 540
	i32 182, ; 541
	i32 148, ; 542
	i32 323, ; 543
	i32 339, ; 544
	i32 299, ; 545
	i32 116, ; 546
	i32 247, ; 547
	i32 171, ; 548
	i32 340, ; 549
	i32 307, ; 550
	i32 125, ; 551
	i32 131, ; 552
	i32 183, ; 553
	i32 75, ; 554
	i32 44, ; 555
	i32 250, ; 556
	i32 71, ; 557
	i32 61, ; 558
	i32 96, ; 559
	i32 82, ; 560
	i32 324, ; 561
	i32 41, ; 562
	i32 59, ; 563
	i32 191, ; 564
	i32 277, ; 565
	i32 181, ; 566
	i32 36, ; 567
	i32 38, ; 568
	i32 240, ; 569
	i32 305, ; 570
	i32 156, ; 571
	i32 96, ; 572
	i32 245, ; 573
	i32 217, ; 574
	i32 183, ; 575
	i32 133, ; 576
	i32 20, ; 577
	i32 63, ; 578
	i32 311, ; 579
	i32 123, ; 580
	i32 73, ; 581
	i32 269, ; 582
	i32 160, ; 583
	i32 152, ; 584
	i32 311, ; 585
	i32 5, ; 586
	i32 319, ; 587
	i32 47, ; 588
	i32 283, ; 589
	i32 312, ; 590
	i32 140, ; 591
	i32 135, ; 592
	i32 98, ; 593
	i32 197, ; 594
	i32 121, ; 595
	i32 118, ; 596
	i32 138, ; 597
	i32 37, ; 598
	i32 66, ; 599
	i32 39, ; 600
	i32 160, ; 601
	i32 71, ; 602
	i32 325, ; 603
	i32 161, ; 604
	i32 185, ; 605
	i32 125, ; 606
	i32 255, ; 607
	i32 304, ; 608
	i32 66, ; 609
	i32 165, ; 610
	i32 268, ; 611
	i32 242, ; 612
	i32 202, ; 613
	i32 275, ; 614
	i32 147, ; 615
	i32 43, ; 616
	i32 106, ; 617
	i32 207, ; 618
	i32 46, ; 619
	i32 94, ; 620
	i32 30, ; 621
	i32 23, ; 622
	i32 162, ; 623
	i32 22, ; 624
	i32 134, ; 625
	i32 76, ; 626
	i32 332, ; 627
	i32 169, ; 628
	i32 52, ; 629
	i32 268, ; 630
	i32 273, ; 631
	i32 210, ; 632
	i32 10, ; 633
	i32 231, ; 634
	i32 343, ; 635
	i32 272, ; 636
	i32 259, ; 637
	i32 16, ; 638
	i32 339, ; 639
	i32 135, ; 640
	i32 196, ; 641
	i32 13, ; 642
	i32 190, ; 643
	i32 15, ; 644
	i32 120, ; 645
	i32 85, ; 646
	i32 145, ; 647
	i32 22, ; 648
	i32 33, ; 649
	i32 77, ; 650
	i32 317, ; 651
	i32 297, ; 652
	i32 218, ; 653
	i32 332, ; 654
	i32 143, ; 655
	i32 78, ; 656
	i32 315, ; 657
	i32 171, ; 658
	i32 219, ; 659
	i32 224, ; 660
	i32 327, ; 661
	i32 40, ; 662
	i32 26, ; 663
	i32 338, ; 664
	i32 270, ; 665
	i32 267, ; 666
	i32 105, ; 667
	i32 108, ; 668
	i32 193, ; 669
	i32 7, ; 670
	i32 300, ; 671
	i32 42, ; 672
	i32 157, ; 673
	i32 178, ; 674
	i32 144, ; 675
	i32 326, ; 676
	i32 236, ; 677
	i32 272, ; 678
	i32 214, ; 679
	i32 15, ; 680
	i32 142, ; 681
	i32 8, ; 682
	i32 253, ; 683
	i32 274, ; 684
	i32 128, ; 685
	i32 321, ; 686
	i32 208, ; 687
	i32 290, ; 688
	i32 92 ; 689
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 8

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 8

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 8

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 8, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fix-cortex-a53-835769,+neon,+outline-atomics,+v8a" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fix-cortex-a53-835769,+neon,+outline-atomics,+v8a" }

; Metadata
!llvm.module.flags = !{!0, !1, !7, !8, !9, !10}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.4xx @ df9aaf29a52042a4fbf800daf2f3a38964b9e958"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"branch-target-enforcement", i32 0}
!8 = !{i32 1, !"sign-return-address", i32 0}
!9 = !{i32 1, !"sign-return-address-all", i32 0}
!10 = !{i32 1, !"sign-return-address-with-bkey", i32 0}

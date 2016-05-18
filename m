From: Sasha Levin <sasha.levin-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: drivers/of: crash on boot
Date: Wed, 18 May 2016 11:34:04 -0400
Message-ID: <573C8B6C.6030900@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Rhyland,

I'm seeing a crash on boot that seems to have been caused by
"drivers/of: Fix depth when unflattening devicetree":

[   61.145229] ==================================================================

[   61.147588] BUG: KASAN: stack-out-of-bounds in unflatten_dt_nodes+0x11d2/0x1290 at addr ffff88005b30777c

[   61.150490] Read of size 4 by task swapper/0/1

[   61.151892] page:ffffea00016cc1c0 count:0 mapcount:0 mapping:          (null) index:0x0

[   61.154313] flags: 0x1fffff80000000()

[   61.155460] page dumped because: kasan: bad access detected

[   61.157174] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.6.0-next-20160518-sasha-00032-gab479e0-dirty #3090

[   61.160149]  1ffff1000b660e83 000000008a2fe4e6 ffff88005b3074a0 ffffffffa3049c42

[   61.162473]  ffffffff00000000 fffffbfff5c6e404 0000000041b58ab3 ffffffffadceb660

[   61.164827]  ffffffffa3049ad0 ffff88005b307480 ffffffffa16ecb83 ffff88003f501ebc

[   61.167133] Call Trace:

[   61.167904] dump_stack (lib/dump_stack.c:53)
[   61.169541] ? arch_local_irq_restore (./arch/x86/include/asm/paravirt.h:134)
[   61.171470] ? __dump_page (mm/debug.c:62)
[   61.173221] kasan_report_error (include/linux/kasan.h:28 mm/kasan/report.c:211 mm/kasan/report.c:277)
[   61.175067] ? fdt_next_node (lib/../scripts/dtc/libfdt/fdt.c:163)
[   61.176905] ? unflatten_dt_nodes (drivers/of/fdt.c:417)
[   61.178852] __asan_report_load4_noabort (mm/kasan/report.c:318)
[   61.180850] ? unflatten_dt_nodes (drivers/of/fdt.c:417)
[   61.182766] unflatten_dt_nodes (drivers/of/fdt.c:417)
[   61.184697] ? reverse_nodes (drivers/of/fdt.c:396)
[   61.186439] ? set_pageblock_migratetype (mm/page_alloc.c:589)
[   61.188473] ? kernel_poison_pages (mm/page_poison.c:163)
[   61.190344] ? lookup_page_ext (mm/page_ext.c:200)
[   61.192168] ? get_page_from_freelist (mm/page_alloc.c:1747 mm/page_alloc.c:3003)
[   61.194178] ? get_from_free_list (lib/idr.c:79)
[   61.196069] ? ida_get_new_above (lib/idr.c:1002)
[   61.197884] ? idr_get_empty_slot (lib/idr.c:933)
[   61.199802] ? split_free_page (mm/page_alloc.c:2901)
[   61.201598] ? ___might_sleep (kernel/sched/core.c:7520 (discriminator 1))
[   61.203346] ? __alloc_pages_nodemask (mm/page_alloc.c:3804)
[   61.205328] ? __alloc_pages_slowpath (mm/page_alloc.c:3749)
[   61.207386] ? alloc_pages_current (mm/mempolicy.c:2078)
[   61.209281] ? kasan_unpoison_shadow (mm/kasan/kasan.c:59)
[   61.211155] ? kasan_kmalloc_large (mm/kasan/kasan.c:612)
[   61.213015] ? of_fdt_unflatten_tree (drivers/of/fdt.c:513)
[   61.214929] __unflatten_device_tree (drivers/of/fdt.c:488)
[   61.216901] of_fdt_unflatten_tree (drivers/of/fdt.c:541)
[   61.218841] of_unittest (drivers/of/unittest.c:924 drivers/of/unittest.c:1936)
[   61.220556] ? initcall_blacklisted (init/main.c:725)
[   61.222494] ? try_to_run_init_process (init/main.c:708)
[   61.224682] ? of_unittest_overlay (drivers/of/unittest.c:1931)
[   61.227059] ? kobject_add (lib/kobject.c:396)
[   61.229113] ? kobject_add_internal (lib/kobject.c:396)
[   61.231455] ? of_unittest_overlay (drivers/of/unittest.c:1931)
[   61.233865] do_one_initcall (init/main.c:770)
[   61.236005] ? initcall_blacklisted (init/main.c:759)
[   61.238354] ? ___might_sleep (kernel/sched/core.c:7522)
[   61.240504] kernel_init_freeable (init/main.c:834 init/main.c:843 init/main.c:861 init/main.c:1008)
[   61.242798] ? start_kernel (init/main.c:978)
[   61.244919] ? compat_start_thread (arch/x86/kernel/process_64.c:259)
[   61.247174] kernel_init (init/main.c:936)
[   61.249162] ret_from_fork (arch/x86/entry/entry_64.S:390)
[   61.251170] ? rest_init (init/main.c:931)
[   61.253104] Memory state around the buggy address:

[   61.254888]  ffff88005b307600: 00 00 00 00 00 00 00 00 00 00 00 00 f1 f1 f1 f1

[   61.257551]  ffff88005b307680: 04 f4 f4 f4 f2 f2 f2 f2 04 f4 f4 f4 f2 f2 f2 f2

[   61.260255] >ffff88005b307700: 04 f4 f4 f4 f2 f2 f2 f2 00 f4 f4 f4 f2 f2 f2 f2

[   61.262911]                                                                 ^

[   61.265529]  ffff88005b307780: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

[   61.268218]  ffff88005b307800: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

[   61.270874] ==================================================================

[   61.273558] Disabling lock debugging due to kernel taint

[   61.275648] ==================================================================

[   61.278303] BUG: KASAN: stack-out-of-bounds in unflatten_dt_nodes+0x1236/0x1290 at addr ffff88005b307898

[   61.281794] Read of size 8 by task swapper/0/1

[   61.283483] page:ffffea00016cc1c0 count:0 mapcount:0 mapping:          (null) index:0x0

[   61.286454] flags: 0x1fffff80000000()

[   61.287817] page dumped because: kasan: bad access detected

[   61.289904] CPU: 0 PID: 1 Comm: swapper/0 Tainted: G    B           4.6.0-next-20160518-sasha-00032-gab479e0-dirty #3090

[   61.293896]  1ffff1000b660e83 000000008a2fe4e6 ffff88005b3074a0 ffffffffa3049c42

[   61.296711]  ffffffff00000000 fffffbfff5c6e404 0000000041b58ab3 ffffffffadceb660

[   61.299551]  ffffffffa3049ad0 ffff88005b307480 ffffffffa16ecb83 1ffff1000b660e7c

[   61.302345] Call Trace:

[   61.303276] dump_stack (lib/dump_stack.c:53)
[   61.305261] ? arch_local_irq_restore (./arch/x86/include/asm/paravirt.h:134)
[   61.307630] ? __dump_page (mm/debug.c:62)
[   61.309695] kasan_report_error (include/linux/kasan.h:28 mm/kasan/report.c:211 mm/kasan/report.c:277)
[   61.311931] ? unflatten_dt_nodes (drivers/of/fdt.c:280 drivers/of/fdt.c:417)
[   61.314291] __asan_report_load8_noabort (mm/kasan/report.c:319)
[   61.316748] ? unflatten_dt_nodes (drivers/of/fdt.c:280 drivers/of/fdt.c:417)
[   61.319090] unflatten_dt_nodes (drivers/of/fdt.c:280 drivers/of/fdt.c:417)
[   61.321417] ? reverse_nodes (drivers/of/fdt.c:396)
[   61.323547] ? set_pageblock_migratetype (mm/page_alloc.c:589)
[   61.325990] ? kernel_poison_pages (mm/page_poison.c:163)
[   61.328309] ? lookup_page_ext (mm/page_ext.c:200)
[   61.330487] ? get_page_from_freelist (mm/page_alloc.c:1747 mm/page_alloc.c:3003)
[   61.333007] ? get_from_free_list (lib/idr.c:79)
[   61.335286] ? ida_get_new_above (lib/idr.c:1002)
[   61.337542] ? idr_get_empty_slot (lib/idr.c:933)
[   61.339888] ? split_free_page (mm/page_alloc.c:2901)
[   61.342067] ? ___might_sleep (kernel/sched/core.c:7520 (discriminator 1))
[   61.344201] ? __alloc_pages_nodemask (mm/page_alloc.c:3804)
[   61.346616] ? __alloc_pages_slowpath (mm/page_alloc.c:3749)
[   61.349125] ? alloc_pages_current (mm/mempolicy.c:2078)
[   61.351425] ? kasan_unpoison_shadow (mm/kasan/kasan.c:59)
[   61.353769] ? kasan_kmalloc_large (mm/kasan/kasan.c:612)
[   61.356028] ? of_fdt_unflatten_tree (drivers/of/fdt.c:513)
[   61.358290] __unflatten_device_tree (drivers/of/fdt.c:488)
[   61.360644] of_fdt_unflatten_tree (drivers/of/fdt.c:541)
[   61.362879] of_unittest (drivers/of/unittest.c:924 drivers/of/unittest.c:1936)
[   61.364922] ? initcall_blacklisted (init/main.c:725)
[   61.367248] ? try_to_run_init_process (init/main.c:708)
[   61.369596] ? of_unittest_overlay (drivers/of/unittest.c:1931)
[   61.371961] ? kobject_add (lib/kobject.c:396)
[   61.374017] ? kobject_add_internal (lib/kobject.c:396)
[   61.376375] ? of_unittest_overlay (drivers/of/unittest.c:1931)
[   61.378729] do_one_initcall (init/main.c:770)
[   61.380868] ? initcall_blacklisted (init/main.c:759)
[   61.383256] ? ___might_sleep (kernel/sched/core.c:7522)
[   61.385393] kernel_init_freeable (init/main.c:834 init/main.c:843 init/main.c:861 init/main.c:1008)
[   61.387720] ? start_kernel (init/main.c:978)
[   61.389819] ? compat_start_thread (arch/x86/kernel/process_64.c:259)
[   61.392101] kernel_init (init/main.c:936)
[   61.394078] ret_from_fork (arch/x86/entry/entry_64.S:390)
[   61.396076] ? rest_init (init/main.c:931)
[   61.398002] Memory state around the buggy address:

[   61.399808]  ffff88005b307780: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

[   61.402440]  ffff88005b307800: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

[   61.405131] >ffff88005b307880: f2 f2 f2 f2 00 00 00 00 00 00 00 00 00 00 00 00

[   61.407790]                             ^

[   61.409262]  ffff88005b307900: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

[   61.411905]  ffff88005b307980: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

[   61.414554] ==================================================================

[   61.417425] ================================================================================

[   61.420535] UBSAN: Undefined behaviour in lib/string.c:91:20

[   61.422646] load of null pointer of type 'const char'

[   61.424556] CPU: 0 PID: 1 Comm: swapper/0 Tainted: G    B           4.6.0-next-20160518-sasha-00032-gab479e0-dirty #3090

[   61.428570]  1ffff1000b660e80 000000008a2fe4e6 ffff88005b307488 ffffffffa3049c42

[   61.431389]  ffffffff00000000 fffffbfff5c6e404 0000000041b58ab3 ffffffffadceb660

[   61.434215]  ffffffffa3049ad0 ffff88005b3074b0 ffff88005b307450 ffff88005b307480

[   61.437020] Call Trace:

[   61.437943] dump_stack (lib/dump_stack.c:53)
[   61.439932] ? arch_local_irq_restore (./arch/x86/include/asm/paravirt.h:134)
[   61.442294] ubsan_epilogue (lib/ubsan.c:165)
[   61.444363] __ubsan_handle_type_mismatch (lib/ubsan.c:281 lib/ubsan.c:323)
[   61.446875] ? kobject_init (lib/kobject.c:326)
[   61.449009] ? ubsan_epilogue (lib/ubsan.c:320)
[   61.451095] ? kobject_get_path (lib/kobject.c:326)
[   61.453341] strcpy (lib/string.c:91)
[   61.455147] unflatten_dt_nodes (drivers/of/fdt.c:331 drivers/of/fdt.c:417)
[   61.457381] ? reverse_nodes (drivers/of/fdt.c:396)
[   61.459481] ? set_pageblock_migratetype (mm/page_alloc.c:589)
[   61.461943] ? kernel_poison_pages (mm/page_poison.c:163)
[   61.464233] ? lookup_page_ext (mm/page_ext.c:200)
[   61.466424] ? get_page_from_freelist (mm/page_alloc.c:1747 mm/page_alloc.c:3003)
[   61.468936] ? split_free_page (mm/page_alloc.c:2901)
[   61.471135] ? ___might_sleep (kernel/sched/core.c:7520 (discriminator 1))
[   61.473282] ? __might_sleep (kernel/sched/core.c:7512 (discriminator 14))
[   61.475410] ? __alloc_pages_nodemask (mm/page_alloc.c:3804)
[   61.477792] ? __alloc_pages_slowpath (mm/page_alloc.c:3749)
[   61.480269] ? __alloc_pages_nodemask (mm/page_alloc.c:3804)
[   61.482681] ? alloc_pages_current (mm/mempolicy.c:2078)
[   61.486636] ? kasan_unpoison_shadow (mm/kasan/kasan.c:59)
[   61.488969] ? kasan_kmalloc_large (mm/kasan/kasan.c:612)
[   61.491291] ? kmalloc_order (mm/slab_common.c:1020 (discriminator 4))
[   61.493378] ? __kmalloc (include/linux/slab.h:403 include/linux/slab.h:410 mm/slub.c:3554)
[   61.495360] ? kasan_kmalloc_large (mm/kasan/kasan.c:612)
[   61.497644] __unflatten_device_tree (include/uapi/linux/swab.h:178 include/uapi/linux/byteorder/little_endian.h:81 drivers/of/fdt.c:504)
[   61.500032] of_fdt_unflatten_tree (drivers/of/fdt.c:541)
[   61.502297] of_unittest (drivers/of/unittest.c:924 drivers/of/unittest.c:1936)
[   61.504309] ? initcall_blacklisted (init/main.c:725)
[   61.506641] ? try_to_run_init_process (init/main.c:708)
[   61.509022] ? of_unittest_overlay (drivers/of/unittest.c:1931)
[   61.511404] ? kobject_add (lib/kobject.c:396)
[   61.513443] ? kobject_add_internal (lib/kobject.c:396)
[   61.515804] ? of_unittest_overlay (drivers/of/unittest.c:1931)
[   61.518156] do_one_initcall (init/main.c:770)
[   61.520277] ? initcall_blacklisted (init/main.c:759)
[   61.522605] ? ___might_sleep (kernel/sched/core.c:7522)
[   61.524736] kernel_init_freeable (init/main.c:834 init/main.c:843 init/main.c:861 init/main.c:1008)
[   61.526991] ? start_kernel (init/main.c:978)
[   61.529067] ? compat_start_thread (arch/x86/kernel/process_64.c:259)
[   61.531286] kernel_init (init/main.c:936)
[   61.533257] ret_from_fork (arch/x86/entry/entry_64.S:390)
[   61.535246] ? rest_init (init/main.c:931)
[   61.537187] ================================================================================

[   61.540419] kasan: CONFIG_KASAN_INLINE enabled

[   61.542078] kasan: GPF could be caused by NULL-ptr deref or user memory access[   61.544815] general protection fault: 0000 [#1] PREEMPT SMP KASAN

[   61.547069] Modules linked in:

[   61.548271] CPU: 0 PID: 1 Comm: swapper/0 Tainted: G    B           4.6.0-next-20160518-sasha-00032-gab479e0-dirty #3090

[   61.552201] task: ffff88005b2f8000 ti: ffff88005b300000 task.ti: ffff88005b300000

[   61.554922] RIP: strcpy (lib/string.c:91 (discriminator 1))
[   61.557733] RSP: 0000:ffff88005b307558  EFLAGS: 00010246

[   61.559677] RAX: ffff88004f2a00a8 RBX: ffff88004f2a00a8 RCX: dffffc0000000000

[   61.562283] RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffff88005b2f8b78

[   61.564912] RBP: ffff88005b307590 R08: 0000000000000000 R09: 0000000000000001

[   61.567533] R10: dffffc0000000000 R11: 0000000000000007 R12: 0000000000000000

[   61.570138] R13: ffff88005b2f8000 R14: 0000000000000001 R15: ffff88004f2a00a9

[   61.572753] FS:  0000000000000000(0000) GS:ffff880063e00000(0000) knlGS:0000000000000000

[   61.575709] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033

[   61.577806] CR2: 00000000ffffffff CR3: 000000002e023000 CR4: 00000000000406b0

[   61.580458] Stack:

[   61.581219]  dffffc0000000000 ffff88004f2a00a8 ffff88004f2a00a8 1ffff1000b65f008

[   61.584025]  ffff88005b2f8000 dffffc0000000000 ffff88004f2a0000 ffff88005b307b08

[   61.586790]  ffffffffa9ef0cbd ffff88005b307600 1ffff1000b660ecc ffffed000b660f7b

[   61.589578] Call Trace:

[   61.590498] unflatten_dt_nodes (drivers/of/fdt.c:331 drivers/of/fdt.c:417)
[   61.592745] ? reverse_nodes (drivers/of/fdt.c:396)
[   61.594861] ? set_pageblock_migratetype (mm/page_alloc.c:589)
[   61.597306] ? kernel_poison_pages (mm/page_poison.c:163)
[   61.599552] ? lookup_page_ext (mm/page_ext.c:200)
[   61.601702] ? get_page_from_freelist (mm/page_alloc.c:1747 mm/page_alloc.c:3003)
[   61.604162] ? split_free_page (mm/page_alloc.c:2901)
[   61.606348] ? ___might_sleep (kernel/sched/core.c:7520 (discriminator 1))
[   61.608473] ? __might_sleep (kernel/sched/core.c:7512 (discriminator 14))
[   61.610581] ? __alloc_pages_nodemask (mm/page_alloc.c:3804)
[   61.613009] ? __alloc_pages_slowpath (mm/page_alloc.c:3749)
[   61.615451] ? __alloc_pages_nodemask (mm/page_alloc.c:3804)
[   61.617861] ? alloc_pages_current (mm/mempolicy.c:2078)
[   61.620164] ? kasan_unpoison_shadow (mm/kasan/kasan.c:59)
[   61.622445] ? kasan_kmalloc_large (mm/kasan/kasan.c:612)
[   61.624705] ? kmalloc_order (mm/slab_common.c:1020 (discriminator 4))
[   61.626757] ? __kmalloc (include/linux/slab.h:403 include/linux/slab.h:410 mm/slub.c:3554)
[   61.628714] ? kasan_kmalloc_large (mm/kasan/kasan.c:612)
[   61.630953] __unflatten_device_tree (include/uapi/linux/swab.h:178 include/uapi/linux/byteorder/little_endian.h:81 drivers/of/fdt.c:504)
[   61.633339] of_fdt_unflatten_tree (drivers/of/fdt.c:541)
[   61.635630] of_unittest (drivers/of/unittest.c:924 drivers/of/unittest.c:1936)
[   61.637628] ? initcall_blacklisted (init/main.c:725)
[   61.639961] ? try_to_run_init_process (init/main.c:708)
[   61.642306] ? of_unittest_overlay (drivers/of/unittest.c:1931)
[   61.644668] ? kobject_add (lib/kobject.c:396)
[   61.646708] ? kobject_add_internal (lib/kobject.c:396)
[   61.649048] ? of_unittest_overlay (drivers/of/unittest.c:1931)
[   61.651375] do_one_initcall (init/main.c:770)
[   61.653506] ? initcall_blacklisted (init/main.c:759)
[   61.655861] ? ___might_sleep (kernel/sched/core.c:7522)
[   61.657963] kernel_init_freeable (init/main.c:834 init/main.c:843 init/main.c:861 init/main.c:1008)
[   61.660258] ? start_kernel (init/main.c:978)
[   61.662340] ? compat_start_thread (arch/x86/kernel/process_64.c:259)
[   61.664584] kernel_init (init/main.c:936)
[   61.666529] ret_from_fork (arch/x86/entry/entry_64.S:390)
[   61.668527] ? rest_init (init/main.c:931)
[ 61.670424] Code: 31 f6 48 c7 c7 60 3b 7e b1 48 89 4d c8 48 89 45 d0 e8 46 bc 0d 00 48 8b 4d c8 48 8b 45 d0 4c 89 e2 4c 89 e6 48 c1 ea 03 83 e6 07 <0f> b6 3c 0a 40 38 f7 7f 1d 40 84 ff 74 18 4c 89 e7 48 89 4d c8

All code
========
   0:	31 f6                	xor    %esi,%esi
   2:	48 c7 c7 60 3b 7e b1 	mov    $0xffffffffb17e3b60,%rdi
   9:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
   d:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  11:	e8 46 bc 0d 00       	callq  0xdbc5c
  16:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
  1a:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  1e:	4c 89 e2             	mov    %r12,%rdx
  21:	4c 89 e6             	mov    %r12,%rsi
  24:	48 c1 ea 03          	shr    $0x3,%rdx
  28:	83 e6 07             	and    $0x7,%esi
  2b:*	0f b6 3c 0a          	movzbl (%rdx,%rcx,1),%edi		<-- trapping instruction
  2f:	40 38 f7             	cmp    %sil,%dil
  32:	7f 1d                	jg     0x51
  34:	40 84 ff             	test   %dil,%dil
  37:	74 18                	je     0x51
  39:	4c 89 e7             	mov    %r12,%rdi
  3c:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
	...

Code starting with the faulting instruction
===========================================
   0:	0f b6 3c 0a          	movzbl (%rdx,%rcx,1),%edi
   4:	40 38 f7             	cmp    %sil,%dil
   7:	7f 1d                	jg     0x26
   9:	40 84 ff             	test   %dil,%dil
   c:	74 18                	je     0x26
   e:	4c 89 e7             	mov    %r12,%rdi
  11:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
	...
[   61.679043] RIP strcpy (lib/string.c:91 (discriminator 1))
[   61.680988]  RSP <ffff88005b307558>

[   61.682492] ---[ end trace 9406a61b6302e0e2 ]---

[   61.684450] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b

[   61.684450]

[   61.688150] Kernel Offset: 0x20000000 from 0xffffffff81000000 (relocation range: 0xffffffff80000000-0xffffffffbfffffff)

[   61.692255] Rebooting in 1 seconds..
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

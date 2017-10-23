From: "Wang, Alan 1. (NSB - CN/Hangzhou)" <alan.1.wang-FTnzSCDXTkYjo0HpFSRKWA@public.gmane.org>
Subject: RE: [of] c810c0a17e BUG: unable to handle kernel paging request at
 6b6b6b6b
Date: Mon, 23 Oct 2017 02:16:35 +0000
Message-ID: <VI1PR07MB342181561688D743A1B05D0BA2460@VI1PR07MB3421.eurprd07.prod.outlook.com>
References: <59ebc4a8.j7dAqYigPV5Jdu9G%fengguang.wu@intel.com>
 <20171022182906.godtmavsjcuait2b@wfg-t540p.sh.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171022182906.godtmavsjcuait2b-q6ZYBFIlbFFi0tQiZxhdj1DQ4js95KgL@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fengguang Wu <fengguang.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: "wfg-VuQAYsv1563Yd54FQh9/CA@public.gmane.org" <wfg-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKP <lkp-JC7UmRfGjtg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Fengguang,

Sorry for that bug.
I had find the cause reason and I will send out new patch for this today.=20

Thanks.
Lixin

-----Original Message-----
From: Fengguang Wu [mailto:fengguang.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org]=20
Sent: Monday, October 23, 2017 2:29 AM
To: Wang, Alan 1. (NSB - CN/Hangzhou) <alan.1.wang-FTnzSCDXTkYjo0HpFSRKWA@public.gmane.org>
Cc: wfg-VuQAYsv1563Yd54FQh9/CA@public.gmane.org; Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>; Frank Rowand <frank=
.rowand-7U/KSKJipcs@public.gmane.org>; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org=
; LKP <lkp-JC7UmRfGjtg@public.gmane.org>
Subject: [of] c810c0a17e BUG: unable to handle kernel paging request at 6b6=
b6b6b

Hi Lixin,

FYI, here is another bug triggered by

https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next

commit c810c0a17e019d1e4345bcbc49b6eddcf5dd001d
Author:     Lixin Wang <alan.1.wang-FTnzSCDXTkYjo0HpFSRKWA@public.gmane.org>
AuthorDate: Fri Oct 20 09:59:09 2017 +0800
Commit:     Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
CommitDate: Fri Oct 20 10:27:33 2017 -0500

     of: dynamic: fix memory leak related to properties of __of_node_dup
    =20
     If a node with no properties is dynamically added, then a property is
     dynamically added to the node, then the property is dynamically remove=
d,
     the result will be node->properties =3D=3D NULL and node->deadprops !=
=3D NULL.
    =20
     Add a separate function to release the properties in both lists.
    =20
     Signed-off-by: Lixin Wang <alan.1.wang-FTnzSCDXTkYjo0HpFSRKWA@public.gmane.org>
     Reviewed-by: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>
     Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

4ee7c0d964  of: overlay: make pr_err() string unique c810c0a17e  of: dynami=
c: fix memory leak related to properties of __of_node_dup c810c0a17e  of: d=
ynamic: fix memory leak related to properties of __of_node_dup
+-------------------------------------------------------------+------------=
+------------+------------+
|                                                             |=20
| 4ee7c0d964 | c810c0a17e | c810c0a17e |
+-------------------------------------------------------------+------------=
+------------+------------+
| boot_successes                                              | 1          =
| 0          | 0          |
| boot_failures                                               | 47         =
| 15         | 15         |
| es#_lib.c:#ess_reset_at#:failed                             | 37         =
| 15         | 15         |
| WARNING:at_arch/x86/mm/tlb.c:#initialize_tlbstate_and_flush | 2          =
| 2          | 2          |
| EIP:initialize_tlbstate_and_flush                           | 2          =
| 2          | 2          |
| BUG:workqueue_lockup-pool                                   | 10         =
|            |            |
| WARNING:kernel_stack                                        | 1          =
|            |            |
| BUG:unable_to_handle_kernel                                 | 0          =
| 15         | 15         |
| Oops:#[##]                                                  | 0          =
| 15         | 15         |
| EIP:property_list_free                                      | 0          =
| 15         | 15         |
| Kernel_panic-not_syncing:Fatal_exception                    | 0          =
| 15         | 15         |
+-------------------------------------------------------------+------------=
+------------+------------+

[  100.467439] OF: overlay: node_overlaps_later_cs: #6 overlaps with #7 @/t=
estcase-data/overlay-node/test-bus/test-unittest8
[  100.469350] OF: overlay: overlay #6 is not topmost [  100.483290] BUG: u=
nable to handle kernel paging request at 6b6b6b6b [  100.484270] IP: proper=
ty_list_free+0x8/0x6e [  100.484895] *pde =3D 00000000 [  100.485329] Oops:=
 0000 [#1] SMP [  100.485817] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.1=
4.0-rc1-00047-gc810c0a #1 [  100.486932] Hardware name: QEMU Standard PC (i=
440FX + PIIX, 1996), BIOS 1.10.2-1 04/01/2014 [  100.488085] task: 8f43c040=
 task.stack: 8f43e000 [  100.488712] EIP: property_list_free+0x8/0x6e [  10=
0.489324] EFLAGS: 00210202 CPU: 0 [  100.489847] EAX: 00200246 EBX: 6b6b6b6=
b ECX: 00000004 EDX: 00000007 [  100.492481] ESI: 8dced700 EDI: 828ea738 EB=
P: 8f43fe08 ESP: 8f43fe04 [  100.493433]  DS: 007b ES: 007b FS: 00d8 GS: 00=
00 SS: 0068 [  100.494219] CR0: 80050033 CR2: 6b6b6b6b CR3: 02c1e000 CR4: 0=
0000690 [  100.495122] Call Trace:
[  100.495498]  of_node_release+0x7d/0xe9 [  100.496066]  kobject_put+0x132=
/0x19b [  100.496586]  of_node_put+0x2b/0x3b [  100.497106]  of_changeset_d=
estroy+0x34/0x9a [  100.497748]  free_overlay_changeset+0x36/0xf1 [  100.49=
8360]  of_overlay_remove+0x3d9/0x452 [  100.498960]  ? platform_device_put+=
0x2b/0x3b [  100.499610]  of_unittest_apply_revert_overlay_check+0x17b/0x29=
7
[  100.500665]  of_unittest_overlay+0xc8a/0x1179 [  100.501258]  of_unittes=
t+0xf74/0x1009 [  100.501778]  ? kobject_add+0x89/0x9d [  100.502285]  ? ad=
d_sysfs_fw_map_entry+0xa8/0xef [  100.502986]  ? of_unittest_overlay+0x1179=
/0x1179 [  100.503672]  do_one_initcall+0x10e/0x263 [  100.504263]  ? parse=
_args+0x23f/0x3bd [  100.504883]  ? kernel_init_freeable+0x222/0x3c6 [  100=
.505613]  kernel_init_freeable+0x24c/0x3c6 [  100.506251]  ? rest_init+0x43=
a/0x43a [  100.506713]  kernel_init+0x16/0x248 [  100.507130]  ret_from_for=
k+0x19/0x30 [  100.507566] Code: 00 00 00 8b 50 24 89 53 28 89 58 24 3e 80 =
63 50 fb 83 05 90 d6 8b 84 01 83 15 94 d6 8b 84 00 58 5b 5d c3 55 89
e5 53 89 c3 eb 51 <8b> 03 83 05 98 d7 8b 84 01 83 15 9c d7 8b 84 00 e8 ea 3=
b 45 ff [  100.510025] EIP: property_list_free+0x8/0x6e SS:ESP: 0068:8f43fe=
04
                                                           # HH:MM RESULT G=
OOD BAD GOOD_BUT_DIRTY DIRTY_NOT_BAD git bisect start 227bce24b050beee52867=
e026e92e03e944c8ce4 33d930e59a98fa10a0db9f56c7fa2f21a4aef9b9 --
git bisect  bad c984b398ef43624c3d27240a22eada56263e9b90  # 18:26  B      0=
     3   19   4  Merge 'renesas-drivers/sh-pfc-for-v4.15' into devel-hourly=
-2017102111
git bisect  bad 96eb39168a471cda84010eb8101a5ed8ea1643dc  # 19:31  B      0=
     1   17   4  Merge 'daeinki-drm-exynos/fixes/exynos-drm-fixes-for-v4.14=
-rc5' into devel-hourly-2017102111
git bisect good c975db1a8af80e951a4cf9b6335dbf007cdc2910  # 20:41  G     10=
     0   10  14  Merge 'vkoul-soundwire/topic/patch_v1' into devel-hourly-2=
017102111
git bisect good 82cfe9bb8eadbcd33e85f0177c256a60c0264a1e  # 21:28  G     11=
     0   11  11  Merge 'robclark/msm-next-wip' into devel-hourly-2017102111
git bisect  bad 71e1ffe3feb6bd9741377292f6a2053ba8db3cb9  # 22:07  B      0=
     9   21   0  Merge 'kbuild/fixes' into devel-hourly-2017102111
git bisect good 748badd589d8a3e5224d8ebb5968dfe26665efe3  # 22:52  G     11=
     0   11  15  Merge 'linux-review/Willem-de-Bruijn/sock-correct-sk_wmem_=
queued-accounting-on-efault-in-tcp-zerocopy/20171021-060957' into devel-hou=
rly-2017102111
git bisect good 183e80a3082ac768745b31465bd3360c997c8f69  # 23:33  G     11=
     0   11  15  Merge 'robh/dt/testing' into devel-hourly-2017102111
git bisect good a51e5ec261634da00b45480e367247fb303da406  # 00:51  G     11=
     0   11  15  Merge 'dm/for-4.15/dm' into devel-hourly-2017102111
git bisect  bad a761d220ab2dcc898979a84a889e05bee2009176  # 01:08  B      0=
     1   13   0  Merge 'robh/dt/next' into devel-hourly-2017102111
git bisect good 87f242c119c403e8b948c8b95eca4ab6212fd1a9  # 01:32  G     11=
     0   11  13  of: overlay: expand check of whether overlay changeset can=
 be removed
git bisect good e0a58f3e08d4b7fa8e2a4075c522f1a98c9e4cab  # 01:57  G     11=
     0   10  10  of: overlay: remove a dependency on device node full_name
git bisect good a1d19bd4cf1febf0d5ff60243826a248bd20f1a5  # 03:45  G     11=
     0   10  14  of: overlay: pr_err from return NOTIFY_OK to overlay apply=
/remove
git bisect  bad c810c0a17e019d1e4345bcbc49b6eddcf5dd001d  # 05:31  B      0=
     2   19   5  of: dynamic: fix memory leak related to properties of __of=
_node_dup
git bisect good 4ee7c0d9649d472d31969b9cbb8151161db6a807  # 05:55  G     11=
     0   11  15  of: overlay: make pr_err() string unique
# first bad commit: [c810c0a17e019d1e4345bcbc49b6eddcf5dd001d] of: dynamic:=
 fix memory leak related to properties of __of_node_dup
git bisect good 4ee7c0d9649d472d31969b9cbb8151161db6a807  # 06:42  G     30=
     0   29  44  of: overlay: make pr_err() string unique
# extra tests with CONFIG_DEBUG_INFO_REDUCED
git bisect  bad c810c0a17e019d1e4345bcbc49b6eddcf5dd001d  # 07:39  B      0=
    11   27   4  of: dynamic: fix memory leak related to properties of __of=
_node_dup
# extra tests on HEAD of linux-devel/devel-hourly-2017102111
git bisect  bad 227bce24b050beee52867e026e92e03e944c8ce4  # 07:39  B      0=
    13   28   0  0day head guard for 'devel-hourly-2017102111'
# extra tests on tree/branch robh/for-next
git bisect  bad c810c0a17e019d1e4345bcbc49b6eddcf5dd001d  # 07:46  B      0=
    15   27   0  of: dynamic: fix memory leak related to properties of __of=
_node_dup
# extra tests with first bad commit reverted
git bisect good 773db3dc93897f3a5cc2fe3b9d9698696c9ea367  # 10:04  G     11=
     0   10  10  Revert "of: dynamic: fix memory leak related to properties=
 of __of_node_dup"

---
0-DAY kernel test infrastructure                Open Source Technology Cent=
er
https://lists.01.org/pipermail/lkp                          Intel Corporati=
on
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

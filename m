From: Fengguang Wu <fengguang.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: 289b7bfd48 BUG: KASAN: slab-out-of-bounds in of_device_uevent at
 addr ffff880012049289
Date: Tue, 28 Feb 2017 12:24:03 +0800
Message-ID: <20170228042403.tl3d7v7iedqxoe4n@wfg-t540p.sh.intel.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="tim5cp3jc7as7qdo"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKP <lkp-JC7UmRfGjtg@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--tim5cp3jc7as7qdo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus Walleij,

I'm not sure if this is a good bisect since the merged gpio branch
suffers from another early hang problem which could hide the KASAN
BUG. So also OF people are also included in the loop.

The attached reproduce-* script may easily reproduce the bug.

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

commit 289b7bfd483c8ca3dfde92d7e19a8b70e0b81248
Merge: 183c948 9b8e3ec
Author:     Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
AuthorDate: Sat Apr 9 13:28:50 2016 -0700
Commit:     Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
CommitDate: Sat Apr 9 13:28:50 2016 -0700

     Merge tag 'gpio-v4.6-3' of git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio
     
     Pull GPIO fixes from Linus Walleij:
      "Here is a set of four GPIO fixes.  The two fixes to the core are
       serious as they are regressing minor architectures.
     
       Core fixes:
     
        - Defer GPIO device setup until after gpiolib is initialized.
     
          It turns out that a few very tightly integrated GPIO platform
          drivers initialize so early (befor core_initcall()) so that the
          gpiolib isn't even initialized itself.  That limits what the
          library can do, and we cannot reference uninitialized fields until
          later.
     
          Defer some of the initialization until right after the gpiolib is
          initialized in these (rare) cases.
     
        - As a consequence: do not use devm_* resources when allocating the
          states in the initial set-up of the gpiochip.
     
       Driver fixes:
     
        - In ACPI retrieveal: ignore GpioInt when looking for output GPIOs.
     
        - Fix legacy builds on the PXA without a backing pin controller.
     
        - Use correct datatype on pca953x register writes"
     
     * tag 'gpio-v4.6-3' of git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio:
       gpio: pca953x: Use correct u16 value for register word write
       gpiolib: Defer gpio device setup until after gpiolib initialization
       gpiolib: Do not use devm functions when registering gpio chip
       gpio: pxa: fix legacy non pinctrl aware builds
       gpio / ACPI: ignore GpioInt() GPIOs when requesting GPIO_OUT_*

183c948a3c  Merge tag 'tty-4.6-rc3' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty
9b8e3ec343  gpio: pca953x: Use correct u16 value for register word write
289b7bfd48  Merge tag 'gpio-v4.6-3' of git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio
+-------------------------------------------------+------------+------------+------------+
|                                                 | 183c948a3c | 9b8e3ec343 | 289b7bfd48 |
+-------------------------------------------------+------------+------------+------------+
| boot_successes                                  | 20         | 0          | 0          |
| boot_failures                                   | 68         | 88         | 22         |
| BUG:kernel_hang_in_test_stage                   | 41         |            |            |
| BUG:kernel_in_stage                             | 17         |            |            |
| BUG:kernel_reboot-without-warning_in_boot_stage | 10         |            |            |
| BUG:kernel_hang_in_boot_stage                   | 0          | 88         |            |
| BUG:KASAN:slab-out-of-bounds                    | 0          | 0          | 22         |
| calltrace:of_platform_notify                    | 0          | 0          | 22         |
| calltrace:of_unittest                           | 0          | 0          | 22         |
| calltrace:of_i2c_notify                         | 0          | 0          | 22         |
+-------------------------------------------------+------------+------------+------------+

[   42.299943] /testcase-data/phandle-tests/consumer-a: arguments longer than property
[   42.309772] irq: no irq domain found for /testcase-data/interrupts/intc0 !
[   42.309772] irq: no irq domain found for /testcase-data/interrupts/intc0 !
[   42.398436] ==================================================================
[   42.398436] ==================================================================
[   42.400834] BUG: KASAN: slab-out-of-bounds in of_device_uevent+0x456/0x607 at addr ffff880012049289
[   42.400834] BUG: KASAN: slab-out-of-bounds in of_device_uevent+0x456/0x607 at addr ffff880012049289
[   42.403809] Read of size 1 by task swapper/1
[   42.403809] Read of size 1 by task swapper/1
[   42.405232] CPU: 0 PID: 1 Comm: swapper Not tainted 4.6.0-rc2-00323-g289b7bf #1
[   42.405232] CPU: 0 PID: 1 Comm: swapper Not tainted 4.6.0-rc2-00323-g289b7bf #1
[   42.407620] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.9.3-20161025_171302-gandalf 04/01/2014
[   42.407620] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.9.3-20161025_171302-gandalf 04/01/2014
[   42.410944]  0000000000000000
[   42.410944]  0000000000000000 ffff8800001b7278 ffff8800001b7278 ffffffff81906b23 ffffffff81906b23 ffff8800001b72e8 ffff8800001b72e8

[   42.413405]  ffffffff81585315
[   42.413405]  ffffffff81585315 ffff880012049280 ffff880012049280 0000000000000246 0000000000000246 ffffffff828b0b51 ffffffff828b0b51

[   42.415967]  ffffffff83425c20
[   42.415967]  ffffffff83425c20 0000000000000000 0000000000000000 ffff880012049280 ffff880012049280 1ffffffff083f101 1ffffffff083f101

[   42.418461] Call Trace:
[   42.418461] Call Trace:
[   42.419320]  [<ffffffff81906b23>] dump_stack+0x1e/0x20
[   42.419320]  [<ffffffff81906b23>] dump_stack+0x1e/0x20
[   42.421039]  [<ffffffff81585315>] kasan_report+0x3a7/0x650
[   42.421039]  [<ffffffff81585315>] kasan_report+0x3a7/0x650
[   42.422867]  [<ffffffff828b0b51>] ? of_find_property+0x52/0x5d
[   42.422867]  [<ffffffff828b0b51>] ? of_find_property+0x52/0x5d
[   42.424788]  [<ffffffff815855d7>] __asan_report_load1_noabort+0x19/0x1b
[   42.424788]  [<ffffffff815855d7>] __asan_report_load1_noabort+0x19/0x1b
[   42.426989]  [<ffffffff828bb394>] of_device_uevent+0x456/0x607
[   42.426989]  [<ffffffff828bb394>] of_device_uevent+0x456/0x607
[   42.428898]  [<ffffffff828baf3e>] ? of_device_get_modalias+0x730/0x730
[   42.428898]  [<ffffffff828baf3e>] ? of_device_get_modalias+0x730/0x730
[   42.431051]  [<ffffffff813b0a4f>] ? __sanitizer_cov_trace_pc+0x5/0xbb
[   42.431051]  [<ffffffff813b0a4f>] ? __sanitizer_cov_trace_pc+0x5/0xbb
[   42.433156]  [<ffffffff81e24597>] dev_uevent+0x6d5/0xbd7
[   42.433156]  [<ffffffff81e24597>] dev_uevent+0x6d5/0xbd7
[   42.434906]  [<ffffffff81e23ec2>] ? device_get_devnode+0x5e2/0x5e2
[   42.434906]  [<ffffffff81e23ec2>] ? device_get_devnode+0x5e2/0x5e2
[   42.436955]  [<ffffffff813b0a4f>] ? __sanitizer_cov_trace_pc+0x5/0xbb
[   42.436955]  [<ffffffff813b0a4f>] ? __sanitizer_cov_trace_pc+0x5/0xbb
[   42.439113]  [<ffffffff81915660>] ? add_uevent_var+0x377/0x3aa
[   42.439113]  [<ffffffff81915660>] ? add_uevent_var+0x377/0x3aa
[   42.441006]  [<ffffffff819152e9>] ? kobject_action_type+0x380/0x380
[   42.441006]  [<ffffffff819152e9>] ? kobject_action_type+0x380/0x380
[   42.443093]  [<ffffffff8190fb55>] ? kzalloc+0x26/0x28
[   42.443093]  [<ffffffff8190fb55>] ? kzalloc+0x26/0x28
[   42.444787]  [<ffffffff81916211>] kobject_uevent_env+0xb7e/0x11b4
[   42.444787]  [<ffffffff81916211>] kobject_uevent_env+0xb7e/0x11b4
[   42.446805]  [<ffffffff81916869>] kobject_uevent+0x22/0x24
[   42.446805]  [<ffffffff81916869>] kobject_uevent+0x22/0x24
[   42.448580]  [<ffffffff81e29589>] device_add+0x1b70/0x21a0
[   42.448580]  [<ffffffff81e29589>] device_add+0x1b70/0x21a0
[   42.450412]  [<ffffffff81e27a19>] ? dev_warn+0xff/0xff
[   42.450412]  [<ffffffff81e27a19>] ? dev_warn+0xff/0xff
[   42.452138]  [<ffffffff828bbefb>] ? of_device_make_bus_id+0x25b/0x25b
[   42.452138]  [<ffffffff828bbefb>] ? of_device_make_bus_id+0x25b/0x25b
[   42.454240]  [<ffffffff813e2372>] ? trace_preempt_on+0x30/0x35
[   42.454240]  [<ffffffff813e2372>] ? trace_preempt_on+0x30/0x35
[   42.456186]  [<ffffffff813b0a4f>] ? __sanitizer_cov_trace_pc+0x5/0xbb
[   42.456186]  [<ffffffff813b0a4f>] ? __sanitizer_cov_trace_pc+0x5/0xbb
[   42.458319]  [<ffffffff813e7cd3>] ? ftrace_likely_update+0x436/0x445
[   42.458319]  [<ffffffff813e7cd3>] ? ftrace_likely_update+0x436/0x445
[   42.460374]  [<ffffffff828ba06f>] of_device_add+0x209/0x212
[   42.460374]  [<ffffffff828ba06f>] of_device_add+0x209/0x212
[   42.462195]  [<ffffffff828bc778>] of_platform_device_create_pdata+0x24c/0x2fd
[   42.462195]  [<ffffffff828bc778>] of_platform_device_create_pdata+0x24c/0x2fd
[   42.464568]  [<ffffffff828bd02a>] of_platform_device_create+0x30/0x35
[   42.464568]  [<ffffffff828bd02a>] of_platform_device_create+0x30/0x35
[   42.467269]  [<ffffffff828bd2c9>] of_platform_notify+0x29a/0x541
[   42.467269]  [<ffffffff828bd2c9>] of_platform_notify+0x29a/0x541
[   42.469258]  [<ffffffff828bd02f>] ? of_platform_device_create+0x35/0x35
[   42.469258]  [<ffffffff828bd02f>] ? of_platform_device_create+0x35/0x35
[   42.471468]  [<ffffffff813e2372>] ? trace_preempt_on+0x30/0x35
[   42.471468]  [<ffffffff813e2372>] ? trace_preempt_on+0x30/0x35
[   42.473366]  [<ffffffff8126145d>] ? preempt_count_sub+0xae/0xbd
[   42.473366]  [<ffffffff8126145d>] ? preempt_count_sub+0xae/0xbd
[   42.475310]  [<ffffffff8124602c>] notifier_call_chain+0xd7/0x234
[   42.475310]  [<ffffffff8124602c>] notifier_call_chain+0xd7/0x234
[   42.477317]  [<ffffffff81246a61>] __blocking_notifier_call_chain+0x104/0x12c
[   42.477317]  [<ffffffff81246a61>] __blocking_notifier_call_chain+0x104/0x12c
[   42.479795]  [<ffffffff81246abe>] blocking_notifier_call_chain+0x35/0x37
[   42.479795]  [<ffffffff81246abe>] blocking_notifier_call_chain+0x35/0x37
[   42.481991]  [<ffffffff828be3d0>] of_reconfig_notify+0x29/0x51
[   42.481991]  [<ffffffff828be3d0>] of_reconfig_notify+0x29/0x51
[   42.483925]  [<ffffffff828becc4>] __of_changeset_entry_notify+0x1a7/0x375
[   42.483925]  [<ffffffff828becc4>] __of_changeset_entry_notify+0x1a7/0x375
[   42.486116]  [<ffffffff828beb1d>] ? of_property_notify+0x19b/0x19b
[   42.486116]  [<ffffffff828beb1d>] ? of_property_notify+0x19b/0x19b
[   42.488186]  [<ffffffff82beb361>] ? __mutex_unlock_slowpath+0x734/0x760
[   42.488186]  [<ffffffff82beb361>] ? __mutex_unlock_slowpath+0x734/0x760
[   42.490339]  [<ffffffff82beac2d>] ? __ww_mutex_lock_check_stamp+0x452/0x452
[   42.490339]  [<ffffffff82beac2d>] ? __ww_mutex_lock_check_stamp+0x452/0x452
[   42.492620]  [<ffffffff8129b0b6>] ? mark_held_locks+0xa6/0xdf
[   42.492620]  [<ffffffff8129b0b6>] ? mark_held_locks+0xa6/0xdf
[   42.494529]  [<ffffffff828c1373>] __of_changeset_apply+0x24d/0x2c5
[   42.494529]  [<ffffffff828c1373>] __of_changeset_apply+0x24d/0x2c5
[   42.496548]  [<ffffffff828beb22>] ? __of_changeset_entry_notify+0x5/0x375
[   42.496548]  [<ffffffff828beb22>] ? __of_changeset_entry_notify+0x5/0x375
[   42.498722]  [<ffffffff828c1373>] ? __of_changeset_apply+0x24d/0x2c5
[   42.498722]  [<ffffffff828c1373>] ? __of_changeset_apply+0x24d/0x2c5
[   42.500834]  [<ffffffff828c1126>] ? of_changeset_destroy+0xd9/0xd9
[   42.500834]  [<ffffffff828c1126>] ? of_changeset_destroy+0xd9/0xd9
[   42.502906]  [<ffffffff82bf95e9>] ? _raw_spin_unlock_irqrestore+0x10b/0x18d
[   42.502906]  [<ffffffff82bf95e9>] ? _raw_spin_unlock_irqrestore+0x10b/0x18d
[   42.505136]  [<ffffffff828b1dd0>] ? of_get_next_child+0x47/0x51
[   42.505136]  [<ffffffff828b1dd0>] ? of_get_next_child+0x47/0x51
[   42.507099]  [<ffffffff813b0a4f>] ? __sanitizer_cov_trace_pc+0x5/0xbb
[   42.507099]  [<ffffffff813b0a4f>] ? __sanitizer_cov_trace_pc+0x5/0xbb
[   42.509239]  [<ffffffff828d2512>] ? of_overlay_apply_one+0x8b5/0x8c6
[   42.509239]  [<ffffffff828d2512>] ? of_overlay_apply_one+0x8b5/0x8c6
[   42.511321]  [<ffffffff828d3274>] of_overlay_create+0xd51/0xed8
[   42.511321]  [<ffffffff828d3274>] of_overlay_create+0xd51/0xed8
[   42.513284]  [<ffffffff828c112b>] ? __of_changeset_apply+0x5/0x2c5
[   42.513284]  [<ffffffff828c112b>] ? __of_changeset_apply+0x5/0x2c5
[   42.515324]  [<ffffffff828d3274>] ? of_overlay_create+0xd51/0xed8
[   42.515324]  [<ffffffff828d3274>] ? of_overlay_create+0xd51/0xed8
[   42.517306]  [<ffffffff828d2523>] ? of_overlay_apply_one+0x8c6/0x8c6
[   42.517306]  [<ffffffff828d2523>] ? of_overlay_apply_one+0x8c6/0x8c6
[   42.519437]  [<ffffffff82bf95e9>] ? _raw_spin_unlock_irqrestore+0x10b/0x18d
[   42.519437]  [<ffffffff82bf95e9>] ? _raw_spin_unlock_irqrestore+0x10b/0x18d
[   42.521708]  [<ffffffff813b0a4f>] ? __sanitizer_cov_trace_pc+0x5/0xbb
[   42.521708]  [<ffffffff813b0a4f>] ? __sanitizer_cov_trace_pc+0x5/0xbb
[   42.523822]  [<ffffffff828b2c0b>] ? of_find_node_opts_by_path+0xa64/0xa76
[   42.523822]  [<ffffffff828b2c0b>] ? of_find_node_opts_by_path+0xa64/0xa76
[   42.526072]  [<ffffffff82a69f0a>] of_unittest_apply_overlay+0xf6/0x28c
[   42.526072]  [<ffffffff82a69f0a>] of_unittest_apply_overlay+0xf6/0x28c
[   42.528443]  [<ffffffff82a6a385>] of_unittest_apply_overlay_check+0x137/0x2e7
[   42.528443]  [<ffffffff82a6a385>] of_unittest_apply_overlay_check+0x137/0x2e7
[   42.530754]  [<ffffffff846d6a3e>] of_unittest+0x43b9/0x6081
[   42.530754]  [<ffffffff846d6a3e>] of_unittest+0x43b9/0x6081
[   42.532616]  [<ffffffff846d2685>] ? of_unittest_dynamic+0xa7d/0xa7d
[   42.532616]  [<ffffffff846d2685>] ? of_unittest_dynamic+0xa7d/0xa7d
[   42.534704]  [<ffffffff81584075>] ? kasan_poison_shadow+0x2f/0x31
[   42.534704]  [<ffffffff81584075>] ? kasan_poison_shadow+0x2f/0x31
[   42.536687]  [<ffffffff815830af>] ? kfree+0x1d3/0x1e2
[   42.536687]  [<ffffffff815830af>] ? kfree+0x1d3/0x1e2
[   42.538373]  [<ffffffff8129b4dd>] ? trace_hardirqs_on_caller+0x3ee/0x49d
[   42.538373]  [<ffffffff8129b4dd>] ? trace_hardirqs_on_caller+0x3ee/0x49d
[   42.540568]  [<ffffffff846d2685>] ? of_unittest_dynamic+0xa7d/0xa7d
[   42.540568]  [<ffffffff846d2685>] ? of_unittest_dynamic+0xa7d/0xa7d
[   42.542651]  [<ffffffff845b1b88>] do_one_initcall+0x3cd/0x664
[   42.542651]  [<ffffffff845b1b88>] do_one_initcall+0x3cd/0x664
[   42.544552]  [<ffffffff813b0a4f>] ? __sanitizer_cov_trace_pc+0x5/0xbb
[   42.544552]  [<ffffffff813b0a4f>] ? __sanitizer_cov_trace_pc+0x5/0xbb
[   42.546635]  [<ffffffff845aff2a>] ? repair_env_string+0x252/0x25d
[   42.546635]  [<ffffffff845aff2a>] ? repair_env_string+0x252/0x25d
[   42.548653]  [<ffffffff845b17bb>] ? start_kernel+0x9e8/0x9e8
[   42.548653]  [<ffffffff845b17bb>] ? start_kernel+0x9e8/0x9e8
[   42.550542]  [<ffffffff8123fa2a>] ? parse_args+0xe41/0xe54
[   42.550542]  [<ffffffff8123fa2a>] ? parse_args+0xe41/0xe54
[   42.552347]  [<ffffffff845b22fb>] kernel_init_freeable+0x4dc/0x721
[   42.552347]  [<ffffffff845b22fb>] kernel_init_freeable+0x4dc/0x721
[   42.554330]  [<ffffffff82be085c>] kernel_init+0x16/0x440
[   42.554330]  [<ffffffff82be085c>] kernel_init+0x16/0x440
[   42.556094]  [<ffffffff82bfab92>] ret_from_fork+0x22/0x50
[   42.556094]  [<ffffffff82bfab92>] ret_from_fork+0x22/0x50
[   42.557880]  [<ffffffff82be0846>] ? rest_init+0x28d/0x28d
[   42.557880]  [<ffffffff82be0846>] ? rest_init+0x28d/0x28d
[   42.559645] Object at ffff880012049280, in cache kmalloc-32
[   42.559645] Object at ffff880012049280, in cache kmalloc-32
[   42.561477] Object allocated with size 9 bytes.
[   42.561477] Object allocated with size 9 bytes.
[   42.562953] Allocation:
[   42.562953] Allocation:
[   42.563753] PID = 1
[   42.563753] PID = 1
[   42.564456]  
[   42.564456]  [<ffffffff81095e55>] save_stack_trace+0x2a/0x5a
[<ffffffff81095e55>] save_stack_trace+0x2a/0x5a
[   42.566368]  
[   42.566368]  [<ffffffff815840bd>] save_stack+0x46/0xd6
[<ffffffff815840bd>] save_stack+0x46/0xd6
[   42.568134]  
[   42.568134]  [<ffffffff81584503>] kasan_kmalloc+0xaa/0xb9
[<ffffffff81584503>] kasan_kmalloc+0xaa/0xb9
[   42.569898]  
[   42.569898]  [<ffffffff8158242f>] __kmalloc_track_caller+0x192/0x1bc
[<ffffffff8158242f>] __kmalloc_track_caller+0x192/0x1bc
[   42.572011]  
[   42.572011]  [<ffffffff814ea276>] kmemdup+0x2e/0xd1
[<ffffffff814ea276>] kmemdup+0x2e/0xd1
[   42.573669]  
[   42.573669]  [<ffffffff828c0910>] __of_prop_dup+0x241/0x3c8
[<ffffffff828c0910>] __of_prop_dup+0x241/0x3c8
[   42.575567]  
[   42.575567]  [<ffffffff828d1e11>] of_overlay_apply_one+0x1b4/0x8c6
[<ffffffff828d1e11>] of_overlay_apply_one+0x1b4/0x8c6
[   42.577582]  
[   42.577582]  [<ffffffff828d2393>] of_overlay_apply_one+0x736/0x8c6
[<ffffffff828d2393>] of_overlay_apply_one+0x736/0x8c6
[   42.579661]  
[   42.579661]  [<ffffffff828d3070>] of_overlay_create+0xb4d/0xed8
[<ffffffff828d3070>] of_overlay_create+0xb4d/0xed8
[   42.581636]  
[   42.581636]  [<ffffffff82a69f0a>] of_unittest_apply_overlay+0xf6/0x28c
[<ffffffff82a69f0a>] of_unittest_apply_overlay+0xf6/0x28c
[   42.583980]  

git bisect start v4.6 v4.5 --
git bisect good 63e30271b04c712c684c07567401b61b10d094d4  # 15:36     21+      0  Merge tag 'pci-v4.6-changes' of git://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci
git bisect good d3436a1d03f9a416d8bedd968f16296e0140adcb  # 16:03     20+     20  Merge tag 'for_linus' of git://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost
git bisect  bad 763cfc86ee8fd728a7cf2334b8d3a897af7a7ade  # 16:26      0-      1  Merge branch 'for-4.6-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/tj/cgroup
git bisect  bad 29dde7c25adafcdcbde3a14bce3f07e5a201dc30  # 17:16      0-      6  Merge tag 'for-linus-20160415' of git://git.infradead.org/linux-mtd
git bisect  bad a56711fa0b418a2cf5eefa00ee65e16443e47790  # 18:00      0-     22  Merge tag 'arc-4.6-rc4-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc
git bisect good c6e6e58cc8a636b9b833a7b4bc00cde1fe20892f  # 18:19     22+     22  Merge tag 'staging-4.6-rc3' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging
git bisect  bad 5b5b7fd185e997ebc18f76b98b9f4ff148d3f5bb  # 18:33      0-      4  Merge branch 'parisc-4.6-3' of git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux
git bisect good 183c948a3cb3efbf45eabed41fa7ee04c19378fc  # 18:50     22+      2  Merge tag 'tty-4.6-rc3' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty
git bisect  bad 289b7bfd483c8ca3dfde92d7e19a8b70e0b81248  # 19:02      0-      1  Merge tag 'gpio-v4.6-3' of git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio
git bisect good 476e2fc5cd430bbe17598833e79f8e8b9e4bbbc7  # 19:21     22+      2  gpiolib: Do not use devm functions when registering gpio chip
git bisect good 9b8e3ec34318663affced3c14d960e78d760dd9a  # 01:12     22+     22  gpio: pca953x: Use correct u16 value for register word write
# first bad commit: [289b7bfd483c8ca3dfde92d7e19a8b70e0b81248] Merge tag 'gpio-v4.6-3' of git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio
git bisect good 183c948a3cb3efbf45eabed41fa7ee04c19378fc  # 04:34     62+     64  Merge tag 'tty-4.6-rc3' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty
git bisect good 9b8e3ec34318663affced3c14d960e78d760dd9a  # 08:57     64+     86  gpio: pca953x: Use correct u16 value for register word write
# extra tests with CONFIG_DEBUG_INFO_REDUCED
git bisect  bad 289b7bfd483c8ca3dfde92d7e19a8b70e0b81248  # 09:34      0-      1  Merge tag 'gpio-v4.6-3' of git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio
# extra tests on HEAD of linux-devel/devel-hourly-2017022603
git bisect  bad 0acdc349b86c481b5e17b8a6b54a1191882ebbad  # 09:34      0-     13  0day head guard for 'devel-hourly-2017022603'
# extra tests on tree/branch linus/master
git bisect  bad e5d56efc97f8240d0b5d66c03949382b6d7e5570  # 10:50      0-      3  Merge tag 'watchdog-for-linus-v4.11' of git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging
# extra tests on tree/branch linux-next/master
git bisect good 3e7350242c6f3d41d28e03418bd781cc1b7bad5f  # 01:04     60+     72  Add linux-next specific files for 20170224

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/lkp                          Intel Corporation

--tim5cp3jc7as7qdo
Content-Type: application/gzip
Content-Disposition: attachment; filename="dmesg-quantal-lkp-hsw01-9:20170226190217:x86_64-randconfig-r0-02261213:4.6.0-rc2-00323-g289b7bf:1.gz"
Content-Transfer-Encoding: base64

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
IUEMA3WQliiBKhwthUuGlsl+UFmMCF2vDkPDUKVrVjRCADADF3cs6PQigtxHonY1IySIZOmA
QI4EqN5fcbj671IRUK23Fumisfnpn1gUozgM/Rflgdb5Wp2WxlycBVrnzImezZJdogKqdKba
a0ZnNUAhAeKiBqjafWhEMvRARS5+LmFWJ3TxJ9eoKKAVOm9W8jQP/WA4fR1XlBAJLnVyABKO
jyNLiISvGK+jnY6GBIUvIRJcGx7vejTEtKtJiAS3RJLogEbDKRhNQuTaLRJpMw6GuM+3koRI
COqezmj3oyHhrSMhEi4QirRrB0Pcm7mKhEiIsScFDEnXal0JkXB/THxLRsMp88oSIiGkJfFj
Ohpi9A+UEAmhmWLRIY6GONh3u+hBp1Tw1n6YlRC9vfm0N8OjVXcOhvwYv7RT4L7ULL5Jo6Ew
jquK/iQJa+vcAENWSFcQ/kmafEEnQ15IVxL/yWGlkzwxUKkXB7INYXmFJGINorvnKiWKCsHP
GkQVCkZ8iokVgp81iC4m8ndm9s/v2ZsZYcE1vLza1GXBzxpEa60AxLfWNbqwZtAKREW5H4vG
E9OsQNQ0yAL/9re/3XQv7/3nK/x7/xD0KtMn7eb9DRX25ql5fu67v9+Qm11ze9d3uBTpsw9d
OPXf3Ffj9uGzc3t1242tuZ8Bc63fL160wf6vm/9w8uVpdj7D//1RFiB0Q53pP14B7L7gLvL6
f/e3rkl2cfSL66v6PfhmecS7OK57//hw9/2ma16aX24EsYp8RSRQyZacHBPjyQWVCNvSk5Mb
TH3QOfzH9cFchHyTy2C30SmX66ZJuNyszH33X++aJ4/widm/3Ljv+Luv3+4//od3P/2jv399
//z9+aW/f/+nURsXY/30vn/wsc57t4n7j+3T6437t/DDeAQfnr5+/nB3+/D654fB5/2+eeiG
hIT3e/KehKUvKP/webt9rz6M2qrOhYlbs214t+t6yzrdU9uYVpOetD7Vwnz4du+h//b+nDrL
HYEPhfbdzYfH59v75nP/4R+vzcNLczf98/32cd+PJ/Lz9vO/OY/7G0mZ++fz/dON/+eQhXTT
++f/7w/9i/vvj+4fxP00/NeNu9j7v992k7V9fHy5edx3/f7jw9Zv9fh+33uj+/c/mpftl+7x
882t4oT0z+2J7f2QXXzT9S6ucfb9y/ambZ77j37k5s7fCWd8uu12rum4+eB2/OH5y/2Hr578
wZnfT6d09/Xp/ZfnPwh9b/1p9Pvb5u7GO/2SOM04fBg2z/f7ev/sj7lr3MP2cPtv/lC72+cn
1y+5eXDRub+uzv7yuL95eL27e+ceMS+5e+j8M7V30I9hH/vm3l3BL68PnzdeJrh5ah5utx/p
u5/Ga9I8uf8c/909hPt/bJq7P5rvz5vhCewca/v65BqL/mf3Lxv3KPqBnbu7jb96j68vH32K
5k/uPv18u/NSueeP7j+f9rcPL19/dvv3J/Hx8cGZwn7fux0/P+5efP7F69PxYB7ubzfTTfsY
rO9+enx8ep7+3atgNu5U3AX4+pH5HTz6rInJ4nbZ7dvu5/vbh8f9kNb10YTzcS9V9/Pd4+fN
Xf+tv/vY7/fvfrr97LbqN84ajO9+6pv93ffhmD++vHz/f8jfqWuv/Hm5F+r58a4/b3X/9e1z
89EB7/093v/hjvX24etHd19fb++68Pl6/rB/fXDPUv/awxv9xusbXnH/wvR3v4S/3395fHVH
69WF2m9F+C9LX+5f2ttn90V4PzCZ+PDz9LYvJRz2Si2hhL+n8ngi735q3Tlsv3w8OeQPZw75
3U//+Z//+V82/+N//tN//68ff1xTNvPMuLfo3/37/+0a23/9T7/9f//u5v3wSt042/Bv//p/
OPO7/x9vNOXw3yAFAA==

--tim5cp3jc7as7qdo
Content-Type: application/gzip
Content-Disposition: attachment; filename="dmesg-quantal-lkp-hsw01-10:20170227042851:x86_64-randconfig-r0-02261213:4.6.0-rc2-00317-g183c948:1.gz"
Content-Transfer-Encoding: base64

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
24dfPv35A5AmowBlzejhnyjW/geM+EVtVRQAAA==

--tim5cp3jc7as7qdo
Content-Type: application/gzip
Content-Disposition: attachment; filename="dmesg-quantal-lkp-hsw01-10:20170227044524:x86_64-randconfig-r0-02261213:4.6.0-rc2-00005-g9b8e3ec:3.gz"
Content-Transfer-Encoding: base64

H4sICDtctFgAA2RtZXNnLXF1YW50YWwtbGtwLWhzdzAxLTEwOjIwMTcwMjI3MDQ0NTI0Ong4
Nl82NC1yYW5kY29uZmlnLXIwLTAyMjYxMjEzOjQuNi4wLXJjMi0wMDAwNS1nOWI4ZTNlYzoz
AOVVwW7jNhA9i19BbHvYLUKJsmzHMSCgTZMuCmyxC7Q9LQqBEscyIYlUSMqJU/TfO7TsZB0n
2KCXFqgPJvmGHL4ZzjyBsO2WVkY70wJVmjrwQ4+ABPLJmlLpml5fXdG3IGVuVivqDZXKibKF
d3EcU9MQeOpCQmW63oJzRQNWQ0uU7gdfSOHFkvI7fvhl1flsMpV7cwv6yMrllKdTIGbwaD4y
peOwN52czC4ELzNO7KALp+7hyDhbSUgrIOTqgWYI8oPSw12I6JOwO+D6w09hKY2GmFwa4wPo
10DHmGJCrlvRO5DUqw6vmCGfy9/fL/d2uha4H7NR4lHqvKiB7O6gG8ALjKbTeB5zZqsJ29Fi
9UW5gAwq+k1GfjRdJ7SkrdLo2qKLPJGwSazoOF0Pui68cE3RC62qPMWMl0NNRY+Lceq2zt4U
or0VW1eADs8lqa2GHt8AYpwUVT8UyKpti0AfE5ljUqkGH6uVFh24nNPeKu2bGC9uOlfnyHm8
kKXUmZVvTdUM/QMJ3aniVvhqLU2d70BqTO/209YIWSB9LJ4mn6BrzL1/ADiVtpRxp7SxRWUG
7fNFCMJDJ+PW1PjEG2hzsJaqGvdAgeAOo7vyG5nm3m9/5WdpOptgLPuKfBHkdFOLHJ11oqX2
NuS6yZOmHFQrmQfnXYIFxG4GGCC5GYTGbLG26dna3fI0uVvMi/mUWXwmdLpSNbOc8clknk7S
LGnDUzMZGC53/2xtBiTKJjw9D7t4tty/dzbN0sV8nonVqgKZVelUXsw5nC/k+ZxLeSGWpXJQ
eTb6nEyTeNOF+T17rYfDred8ms3SlKWLx0BoiSFU6/wLxskLjOnlx4+/FT//8sP76zzpm3qM
8iuZqKuKzZPXMk0Oob3YHaeFQkiz6fK3JLqBbmBj1bCRFInYWP0Mt+ACq57ibGfY9+m/FQgy
UFp5K2linOpQHw5F9lBsFRb6PpC4qu/xREdn6QRH1/U0jPhQqgIKQRDPsHlxnePA0TSu6ODA
nil5QHdqZKwEm+tAQRtmIYA4PzQvVfOMc3DlFxgTlQ+itZMXxK2vaCkc5CgCog0SgmCv5Erh
N2AnVW7dYTOh5wRhdtI/LA10kJzC7gunlk9OPXciGff/g4NBwEK+BHRG4ychzJXrW7GlGhU+
pBZxbyzVQ9uSd4SIvgctQ1kdyy+JTvSXRPu0PCowiZ6TYPT1VQ0m0ZEIk+hEhRHayzDecqLD
eP5EiEn0qMQkOpbicMGxFmM4pz0WPavGJHoixyR6SY9J9JwgH6G4epRkzNUtcv1/ijKJXq/K
JPoPyPKzNYNd9ObbP1FvP3//x19vKBtbiiI2zj5/hzD5G/6Lu/aDCgAA

--tim5cp3jc7as7qdo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="reproduce-quantal-lkp-hsw01-9:20170226190217:x86_64-randconfig-r0-02261213:4.6.0-rc2-00323-g289b7bf:1"

#!/bin/bash

kernel=$1
		initrd=quantal-core-x86_64.cgz

		wget --no-clobber https://github.com/fengguang/reproduce-kernel-bug/raw/master/initrd/$initrd

kvm=(
	qemu-system-x86_64
	-enable-kvm
	-cpu kvm64
	-kernel $kernel
	-initrd $initrd
	-m 512
	-smp 2
	-device e1000,netdev=net0
	-netdev user,id=net0
	-boot order=nc
	-no-reboot
	-watchdog i6300esb
	-watchdog-action debug
	-rtc base=localtime
	-serial stdio
	-display none
	-monitor null
)

append=(
	root=/dev/ram0
	hung_task_panic=1
	debug
	apic=debug
	sysrq_always_enabled
	rcupdate.rcu_cpu_stall_timeout=100
	net.ifnames=0
	printk.devkmsg=on
	panic=-1
	softlockup_panic=1
	nmi_watchdog=panic
	oops=panic
	load_ramdisk=2
	prompt_ramdisk=0
	drbd.minor_count=8
	systemd.log_level=err
	ignore_loglevel
	earlyprintk=ttyS0,115200
	console=ttyS0,115200
	console=tty0
	vga=normal
	rw
	drbd.minor_count=8
)

"${kvm[@]}" -append "${append[*]}"

--tim5cp3jc7as7qdo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="config-4.6.0-rc2-00323-g289b7bf"

#
# Automatically generated file; DO NOT EDIT.
# Linux/x86_64 4.6.0-rc2 Kernel Configuration
#
CONFIG_64BIT=y
CONFIG_X86_64=y
CONFIG_X86=y
CONFIG_INSTRUCTION_DECODER=y
CONFIG_PERF_EVENTS_INTEL_UNCORE=y
CONFIG_OUTPUT_FORMAT="elf64-x86-64"
CONFIG_ARCH_DEFCONFIG="arch/x86/configs/x86_64_defconfig"
CONFIG_LOCKDEP_SUPPORT=y
CONFIG_STACKTRACE_SUPPORT=y
CONFIG_MMU=y
CONFIG_ARCH_MMAP_RND_BITS_MIN=28
CONFIG_ARCH_MMAP_RND_BITS_MAX=32
CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MIN=8
CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MAX=16
CONFIG_NEED_DMA_MAP_STATE=y
CONFIG_NEED_SG_DMA_LENGTH=y
CONFIG_GENERIC_BUG=y
CONFIG_GENERIC_BUG_RELATIVE_POINTERS=y
CONFIG_GENERIC_HWEIGHT=y
CONFIG_RWSEM_XCHGADD_ALGORITHM=y
CONFIG_GENERIC_CALIBRATE_DELAY=y
CONFIG_ARCH_HAS_CPU_RELAX=y
CONFIG_ARCH_HAS_CACHE_LINE_SIZE=y
CONFIG_HAVE_SETUP_PER_CPU_AREA=y
CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=y
CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK=y
CONFIG_ARCH_HIBERNATION_POSSIBLE=y
CONFIG_ARCH_SUSPEND_POSSIBLE=y
CONFIG_ARCH_WANT_HUGE_PMD_SHARE=y
CONFIG_ARCH_WANT_GENERAL_HUGETLB=y
CONFIG_ZONE_DMA32=y
CONFIG_AUDIT_ARCH=y
CONFIG_ARCH_SUPPORTS_OPTIMIZED_INLINING=y
CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=y
CONFIG_KASAN_SHADOW_OFFSET=0xdffffc0000000000
CONFIG_ARCH_HWEIGHT_CFLAGS="-fcall-saved-rdi -fcall-saved-rsi -fcall-saved-rdx -fcall-saved-rcx -fcall-saved-r8 -fcall-saved-r9 -fcall-saved-r10 -fcall-saved-r11"
CONFIG_ARCH_SUPPORTS_UPROBES=y
CONFIG_FIX_EARLYCON_MEM=y
CONFIG_DEBUG_RODATA=y
CONFIG_PGTABLE_LEVELS=4
CONFIG_DEFCONFIG_LIST="/lib/modules/$UNAME_RELEASE/.config"
CONFIG_CONSTRUCTORS=y
CONFIG_IRQ_WORK=y
CONFIG_BUILDTIME_EXTABLE_SORT=y

#
# General setup
#
CONFIG_BROKEN_ON_SMP=y
CONFIG_INIT_ENV_ARG_LIMIT=32
CONFIG_CROSS_COMPILE=""
# CONFIG_COMPILE_TEST is not set
CONFIG_LOCALVERSION=""
CONFIG_LOCALVERSION_AUTO=y
CONFIG_HAVE_KERNEL_GZIP=y
CONFIG_HAVE_KERNEL_BZIP2=y
CONFIG_HAVE_KERNEL_LZMA=y
CONFIG_HAVE_KERNEL_XZ=y
CONFIG_HAVE_KERNEL_LZO=y
CONFIG_HAVE_KERNEL_LZ4=y
CONFIG_KERNEL_GZIP=y
# CONFIG_KERNEL_BZIP2 is not set
# CONFIG_KERNEL_LZMA is not set
# CONFIG_KERNEL_XZ is not set
# CONFIG_KERNEL_LZO is not set
# CONFIG_KERNEL_LZ4 is not set
CONFIG_DEFAULT_HOSTNAME="(none)"
# CONFIG_SYSVIPC is not set
# CONFIG_POSIX_MQUEUE is not set
CONFIG_CROSS_MEMORY_ATTACH=y
CONFIG_FHANDLE=y
CONFIG_USELIB=y
# CONFIG_AUDIT is not set
CONFIG_HAVE_ARCH_AUDITSYSCALL=y

#
# IRQ subsystem
#
CONFIG_GENERIC_IRQ_PROBE=y
CONFIG_GENERIC_IRQ_SHOW=y
CONFIG_GENERIC_IRQ_CHIP=y
CONFIG_IRQ_DOMAIN=y
CONFIG_IRQ_DOMAIN_HIERARCHY=y
CONFIG_IRQ_DOMAIN_DEBUG=y
CONFIG_IRQ_FORCED_THREADING=y
CONFIG_SPARSE_IRQ=y
CONFIG_CLOCKSOURCE_WATCHDOG=y
CONFIG_ARCH_CLOCKSOURCE_DATA=y
CONFIG_CLOCKSOURCE_VALIDATE_LAST_CYCLE=y
CONFIG_GENERIC_TIME_VSYSCALL=y
CONFIG_GENERIC_CLOCKEVENTS=y
CONFIG_GENERIC_CLOCKEVENTS_BROADCAST=y
CONFIG_GENERIC_CLOCKEVENTS_MIN_ADJUST=y
CONFIG_GENERIC_CMOS_UPDATE=y

#
# Timers subsystem
#
CONFIG_HZ_PERIODIC=y
# CONFIG_NO_HZ_IDLE is not set
CONFIG_NO_HZ=y
# CONFIG_HIGH_RES_TIMERS is not set

#
# CPU/Task time and stats accounting
#
# CONFIG_TICK_CPU_ACCOUNTING is not set
# CONFIG_VIRT_CPU_ACCOUNTING_GEN is not set
CONFIG_IRQ_TIME_ACCOUNTING=y
# CONFIG_BSD_PROCESS_ACCT is not set
# CONFIG_TASKSTATS is not set

#
# RCU Subsystem
#
CONFIG_PREEMPT_RCU=y
# CONFIG_RCU_EXPERT is not set
CONFIG_SRCU=y
CONFIG_TASKS_RCU=y
CONFIG_RCU_STALL_COMMON=y
# CONFIG_TREE_RCU_TRACE is not set
# CONFIG_RCU_EXPEDITE_BOOT is not set
CONFIG_BUILD_BIN2C=y
CONFIG_IKCONFIG=y
CONFIG_IKCONFIG_PROC=y
CONFIG_LOG_BUF_SHIFT=17
CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=y
CONFIG_ARCH_SUPPORTS_NUMA_BALANCING=y
CONFIG_ARCH_SUPPORTS_INT128=y
CONFIG_CGROUPS=y
CONFIG_PAGE_COUNTER=y
CONFIG_MEMCG=y
CONFIG_CGROUP_SCHED=y
CONFIG_FAIR_GROUP_SCHED=y
CONFIG_CFS_BANDWIDTH=y
# CONFIG_RT_GROUP_SCHED is not set
CONFIG_CGROUP_PIDS=y
CONFIG_CGROUP_FREEZER=y
CONFIG_CGROUP_HUGETLB=y
CONFIG_CPUSETS=y
# CONFIG_PROC_PID_CPUSET is not set
CONFIG_CGROUP_DEVICE=y
# CONFIG_CGROUP_CPUACCT is not set
CONFIG_CGROUP_PERF=y
CONFIG_CGROUP_DEBUG=y
CONFIG_CHECKPOINT_RESTORE=y
CONFIG_NAMESPACES=y
CONFIG_UTS_NS=y
CONFIG_USER_NS=y
# CONFIG_PID_NS is not set
CONFIG_NET_NS=y
CONFIG_SCHED_AUTOGROUP=y
# CONFIG_SYSFS_DEPRECATED is not set
# CONFIG_RELAY is not set
CONFIG_BLK_DEV_INITRD=y
CONFIG_INITRAMFS_SOURCE=""
CONFIG_RD_GZIP=y
CONFIG_RD_BZIP2=y
CONFIG_RD_LZMA=y
CONFIG_RD_XZ=y
CONFIG_RD_LZO=y
CONFIG_RD_LZ4=y
CONFIG_CC_OPTIMIZE_FOR_SIZE=y
CONFIG_SYSCTL=y
CONFIG_ANON_INODES=y
CONFIG_SYSCTL_EXCEPTION_TRACE=y
CONFIG_HAVE_PCSPKR_PLATFORM=y
CONFIG_BPF=y
CONFIG_EXPERT=y
CONFIG_MULTIUSER=y
# CONFIG_SGETMASK_SYSCALL is not set
CONFIG_SYSFS_SYSCALL=y
# CONFIG_SYSCTL_SYSCALL is not set
CONFIG_KALLSYMS=y
CONFIG_KALLSYMS_ALL=y
# CONFIG_KALLSYMS_ABSOLUTE_PERCPU is not set
CONFIG_KALLSYMS_BASE_RELATIVE=y
CONFIG_PRINTK=y
CONFIG_BUG=y
# CONFIG_ELF_CORE is not set
CONFIG_PCSPKR_PLATFORM=y
CONFIG_BASE_FULL=y
CONFIG_FUTEX=y
CONFIG_EPOLL=y
CONFIG_SIGNALFD=y
CONFIG_TIMERFD=y
CONFIG_EVENTFD=y
CONFIG_BPF_SYSCALL=y
# CONFIG_SHMEM is not set
CONFIG_AIO=y
CONFIG_ADVISE_SYSCALLS=y
CONFIG_USERFAULTFD=y
CONFIG_PCI_QUIRKS=y
# CONFIG_MEMBARRIER is not set
CONFIG_EMBEDDED=y
CONFIG_HAVE_PERF_EVENTS=y
CONFIG_PERF_USE_VMALLOC=y

#
# Kernel Performance Events And Counters
#
CONFIG_PERF_EVENTS=y
CONFIG_DEBUG_PERF_USE_VMALLOC=y
CONFIG_VM_EVENT_COUNTERS=y
CONFIG_COMPAT_BRK=y
CONFIG_SLAB=y
# CONFIG_SLUB is not set
# CONFIG_SLOB is not set
# CONFIG_SYSTEM_DATA_VERIFICATION is not set
# CONFIG_PROFILING is not set
CONFIG_TRACEPOINTS=y
CONFIG_KEXEC_CORE=y
CONFIG_HAVE_OPROFILE=y
CONFIG_OPROFILE_NMI_TIMER=y
CONFIG_JUMP_LABEL=y
CONFIG_STATIC_KEYS_SELFTEST=y
CONFIG_UPROBES=y
# CONFIG_HAVE_64BIT_ALIGNED_ACCESS is not set
CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=y
CONFIG_ARCH_USE_BUILTIN_BSWAP=y
CONFIG_HAVE_IOREMAP_PROT=y
CONFIG_HAVE_KPROBES=y
CONFIG_HAVE_KRETPROBES=y
CONFIG_HAVE_OPTPROBES=y
CONFIG_HAVE_KPROBES_ON_FTRACE=y
CONFIG_HAVE_ARCH_TRACEHOOK=y
CONFIG_HAVE_DMA_CONTIGUOUS=y
CONFIG_GENERIC_SMP_IDLE_THREAD=y
CONFIG_ARCH_WANTS_DYNAMIC_TASK_STRUCT=y
CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
CONFIG_HAVE_DMA_API_DEBUG=y
CONFIG_HAVE_HW_BREAKPOINT=y
CONFIG_HAVE_MIXED_BREAKPOINTS_REGS=y
CONFIG_HAVE_USER_RETURN_NOTIFIER=y
CONFIG_HAVE_PERF_EVENTS_NMI=y
CONFIG_HAVE_PERF_REGS=y
CONFIG_HAVE_PERF_USER_STACK_DUMP=y
CONFIG_HAVE_ARCH_JUMP_LABEL=y
CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=y
CONFIG_HAVE_CMPXCHG_LOCAL=y
CONFIG_HAVE_CMPXCHG_DOUBLE=y
CONFIG_HAVE_ARCH_SECCOMP_FILTER=y
CONFIG_SECCOMP_FILTER=y
CONFIG_HAVE_CC_STACKPROTECTOR=y
# CONFIG_CC_STACKPROTECTOR is not set
CONFIG_CC_STACKPROTECTOR_NONE=y
# CONFIG_CC_STACKPROTECTOR_REGULAR is not set
# CONFIG_CC_STACKPROTECTOR_STRONG is not set
CONFIG_HAVE_CONTEXT_TRACKING=y
CONFIG_HAVE_VIRT_CPU_ACCOUNTING_GEN=y
CONFIG_HAVE_IRQ_TIME_ACCOUNTING=y
CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=y
CONFIG_HAVE_ARCH_HUGE_VMAP=y
CONFIG_HAVE_ARCH_SOFT_DIRTY=y
CONFIG_MODULES_USE_ELF_RELA=y
CONFIG_HAVE_IRQ_EXIT_ON_IRQ_STACK=y
CONFIG_ARCH_HAS_ELF_RANDOMIZE=y
CONFIG_HAVE_ARCH_MMAP_RND_BITS=y
CONFIG_ARCH_MMAP_RND_BITS=28
CONFIG_HAVE_ARCH_MMAP_RND_COMPAT_BITS=y
CONFIG_ARCH_MMAP_RND_COMPAT_BITS=8
CONFIG_HAVE_COPY_THREAD_TLS=y
CONFIG_HAVE_STACK_VALIDATION=y

#
# GCOV-based kernel profiling
#
CONFIG_GCOV_KERNEL=y
CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=y
# CONFIG_GCOV_PROFILE_ALL is not set
# CONFIG_GCOV_FORMAT_AUTODETECT is not set
CONFIG_GCOV_FORMAT_3_4=y
# CONFIG_GCOV_FORMAT_4_7 is not set
# CONFIG_HAVE_GENERIC_DMA_COHERENT is not set
CONFIG_SLABINFO=y
CONFIG_RT_MUTEXES=y
CONFIG_BASE_SMALL=0
# CONFIG_MODULES is not set
CONFIG_MODULES_TREE_LOOKUP=y
# CONFIG_BLOCK is not set
CONFIG_ASN1=y
CONFIG_UNINLINE_SPIN_UNLOCK=y
CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=y
CONFIG_ARCH_USE_QUEUED_SPINLOCKS=y
CONFIG_ARCH_USE_QUEUED_RWLOCKS=y
CONFIG_FREEZER=y

#
# Processor type and features
#
# CONFIG_ZONE_DMA is not set
# CONFIG_SMP is not set
CONFIG_X86_FEATURE_NAMES=y
CONFIG_X86_FAST_FEATURE_TESTS=y
# CONFIG_X86_X2APIC is not set
CONFIG_X86_MPPARSE=y
# CONFIG_GOLDFISH is not set
CONFIG_X86_EXTENDED_PLATFORM=y
# CONFIG_X86_GOLDFISH is not set
# CONFIG_X86_INTEL_MID is not set
# CONFIG_X86_INTEL_LPSS is not set
# CONFIG_X86_AMD_PLATFORM_DEVICE is not set
CONFIG_IOSF_MBI=y
CONFIG_IOSF_MBI_DEBUG=y
CONFIG_X86_SUPPORTS_MEMORY_FAILURE=y
# CONFIG_SCHED_OMIT_FRAME_POINTER is not set
CONFIG_HYPERVISOR_GUEST=y
CONFIG_PARAVIRT=y
# CONFIG_PARAVIRT_DEBUG is not set
# CONFIG_XEN is not set
CONFIG_KVM_GUEST=y
# CONFIG_KVM_DEBUG_FS is not set
# CONFIG_PARAVIRT_TIME_ACCOUNTING is not set
CONFIG_PARAVIRT_CLOCK=y
CONFIG_NO_BOOTMEM=y
# CONFIG_MK8 is not set
# CONFIG_MPSC is not set
# CONFIG_MCORE2 is not set
# CONFIG_MATOM is not set
CONFIG_GENERIC_CPU=y
CONFIG_X86_INTERNODE_CACHE_SHIFT=6
CONFIG_X86_L1_CACHE_SHIFT=6
CONFIG_X86_TSC=y
CONFIG_X86_CMPXCHG64=y
CONFIG_X86_CMOV=y
CONFIG_X86_MINIMUM_CPU_FAMILY=64
CONFIG_X86_DEBUGCTLMSR=y
# CONFIG_PROCESSOR_SELECT is not set
CONFIG_CPU_SUP_INTEL=y
CONFIG_CPU_SUP_AMD=y
CONFIG_CPU_SUP_CENTAUR=y
CONFIG_HPET_TIMER=y
CONFIG_DMI=y
# CONFIG_GART_IOMMU is not set
# CONFIG_CALGARY_IOMMU is not set
CONFIG_SWIOTLB=y
CONFIG_IOMMU_HELPER=y
CONFIG_NR_CPUS=1
# CONFIG_PREEMPT_NONE is not set
# CONFIG_PREEMPT_VOLUNTARY is not set
CONFIG_PREEMPT=y
CONFIG_PREEMPT_COUNT=y
CONFIG_UP_LATE_INIT=y
CONFIG_X86_LOCAL_APIC=y
CONFIG_X86_IO_APIC=y
CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS=y
CONFIG_X86_MCE=y
# CONFIG_X86_MCE_INTEL is not set
CONFIG_X86_MCE_AMD=y
CONFIG_X86_MCE_THRESHOLD=y
CONFIG_X86_MCE_INJECT=y
# CONFIG_VM86 is not set
CONFIG_X86_16BIT=y
CONFIG_X86_ESPFIX64=y
CONFIG_X86_VSYSCALL_EMULATION=y
# CONFIG_I8K is not set
# CONFIG_MICROCODE is not set
# CONFIG_PERF_EVENTS_AMD_POWER is not set
# CONFIG_X86_MSR is not set
# CONFIG_X86_CPUID is not set
CONFIG_ARCH_PHYS_ADDR_T_64BIT=y
CONFIG_ARCH_DMA_ADDR_T_64BIT=y
CONFIG_ARCH_SPARSEMEM_ENABLE=y
CONFIG_ARCH_SPARSEMEM_DEFAULT=y
CONFIG_ARCH_SELECT_MEMORY_MODEL=y
CONFIG_ILLEGAL_POINTER_VALUE=0xdead000000000000
CONFIG_SELECT_MEMORY_MODEL=y
CONFIG_SPARSEMEM_MANUAL=y
CONFIG_SPARSEMEM=y
CONFIG_HAVE_MEMORY_PRESENT=y
CONFIG_SPARSEMEM_EXTREME=y
CONFIG_SPARSEMEM_VMEMMAP_ENABLE=y
CONFIG_SPARSEMEM_ALLOC_MEM_MAP_TOGETHER=y
CONFIG_SPARSEMEM_VMEMMAP=y
CONFIG_HAVE_MEMBLOCK=y
CONFIG_HAVE_MEMBLOCK_NODE_MAP=y
CONFIG_ARCH_DISCARD_MEMBLOCK=y
# CONFIG_HAVE_BOOTMEM_INFO_NODE is not set
# CONFIG_MEMORY_HOTPLUG is not set
CONFIG_SPLIT_PTLOCK_CPUS=4
CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK=y
CONFIG_MEMORY_BALLOON=y
# CONFIG_COMPACTION is not set
CONFIG_PHYS_ADDR_T_64BIT=y
CONFIG_ZONE_DMA_FLAG=0
CONFIG_VIRT_TO_BUS=y
CONFIG_KSM=y
CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
CONFIG_ARCH_SUPPORTS_MEMORY_FAILURE=y
# CONFIG_MEMORY_FAILURE is not set
# CONFIG_TRANSPARENT_HUGEPAGE is not set
CONFIG_NEED_PER_CPU_KM=y
# CONFIG_CLEANCACHE is not set
# CONFIG_CMA is not set
# CONFIG_MEM_SOFT_DIRTY is not set
# CONFIG_ZPOOL is not set
CONFIG_ZBUD=y
# CONFIG_ZSMALLOC is not set
CONFIG_GENERIC_EARLY_IOREMAP=y
CONFIG_ARCH_SUPPORTS_DEFERRED_STRUCT_PAGE_INIT=y
# CONFIG_IDLE_PAGE_TRACKING is not set
CONFIG_X86_CHECK_BIOS_CORRUPTION=y
# CONFIG_X86_BOOTPARAM_MEMORY_CORRUPTION_CHECK is not set
CONFIG_X86_RESERVE_LOW=64
CONFIG_MTRR=y
CONFIG_MTRR_SANITIZER=y
CONFIG_MTRR_SANITIZER_ENABLE_DEFAULT=0
CONFIG_MTRR_SANITIZER_SPARE_REG_NR_DEFAULT=1
CONFIG_X86_PAT=y
CONFIG_ARCH_USES_PG_UNCACHED=y
# CONFIG_ARCH_RANDOM is not set
# CONFIG_X86_SMAP is not set
# CONFIG_X86_INTEL_MPX is not set
# CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS is not set
# CONFIG_EFI is not set
CONFIG_SECCOMP=y
# CONFIG_HZ_100 is not set
CONFIG_HZ_250=y
# CONFIG_HZ_300 is not set
# CONFIG_HZ_1000 is not set
CONFIG_HZ=250
# CONFIG_SCHED_HRTICK is not set
# CONFIG_KEXEC is not set
CONFIG_KEXEC_FILE=y
CONFIG_KEXEC_VERIFY_SIG=y
CONFIG_CRASH_DUMP=y
CONFIG_PHYSICAL_START=0x1000000
# CONFIG_RELOCATABLE is not set
CONFIG_PHYSICAL_ALIGN=0x200000
# CONFIG_LEGACY_VSYSCALL_NATIVE is not set
CONFIG_LEGACY_VSYSCALL_EMULATE=y
# CONFIG_LEGACY_VSYSCALL_NONE is not set
# CONFIG_CMDLINE_BOOL is not set
CONFIG_MODIFY_LDT_SYSCALL=y
CONFIG_HAVE_LIVEPATCH=y
CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=y

#
# Power management and ACPI options
#
CONFIG_SUSPEND=y
CONFIG_SUSPEND_FREEZER=y
CONFIG_SUSPEND_SKIP_SYNC=y
CONFIG_PM_SLEEP=y
CONFIG_PM_AUTOSLEEP=y
# CONFIG_PM_WAKELOCKS is not set
CONFIG_PM=y
CONFIG_PM_DEBUG=y
# CONFIG_PM_ADVANCED_DEBUG is not set
CONFIG_PM_SLEEP_DEBUG=y
# CONFIG_PM_TRACE_RTC is not set
# CONFIG_WQ_POWER_EFFICIENT_DEFAULT is not set
CONFIG_ACPI=y
CONFIG_ACPI_LEGACY_TABLES_LOOKUP=y
CONFIG_ARCH_MIGHT_HAVE_ACPI_PDC=y
CONFIG_ACPI_SYSTEM_POWER_STATES_SUPPORT=y
# CONFIG_ACPI_DEBUGGER is not set
CONFIG_ACPI_SLEEP=y
# CONFIG_ACPI_PROCFS_POWER is not set
CONFIG_ACPI_REV_OVERRIDE_POSSIBLE=y
# CONFIG_ACPI_EC_DEBUGFS is not set
CONFIG_ACPI_AC=y
CONFIG_ACPI_BATTERY=y
CONFIG_ACPI_BUTTON=y
# CONFIG_ACPI_VIDEO is not set
CONFIG_ACPI_FAN=y
# CONFIG_ACPI_DOCK is not set
CONFIG_ACPI_CPU_FREQ_PSS=y
CONFIG_ACPI_PROCESSOR_IDLE=y
CONFIG_ACPI_PROCESSOR=y
# CONFIG_ACPI_PROCESSOR_AGGREGATOR is not set
CONFIG_ACPI_THERMAL=y
CONFIG_ACPI_CUSTOM_DSDT_FILE=""
# CONFIG_ACPI_CUSTOM_DSDT is not set
# CONFIG_ACPI_INITRD_TABLE_OVERRIDE is not set
# CONFIG_ACPI_DEBUG is not set
# CONFIG_ACPI_PCI_SLOT is not set
CONFIG_X86_PM_TIMER=y
# CONFIG_ACPI_CONTAINER is not set
CONFIG_ACPI_HOTPLUG_IOAPIC=y
# CONFIG_ACPI_SBS is not set
# CONFIG_ACPI_HED is not set
# CONFIG_ACPI_CUSTOM_METHOD is not set
# CONFIG_ACPI_REDUCED_HARDWARE_ONLY is not set
CONFIG_HAVE_ACPI_APEI=y
CONFIG_HAVE_ACPI_APEI_NMI=y
# CONFIG_ACPI_APEI is not set
# CONFIG_ACPI_EXTLOG is not set
# CONFIG_PMIC_OPREGION is not set
CONFIG_SFI=y

#
# CPU Frequency scaling
#
# CONFIG_CPU_FREQ is not set

#
# CPU Idle
#
CONFIG_CPU_IDLE=y
# CONFIG_CPU_IDLE_GOV_LADDER is not set
CONFIG_CPU_IDLE_GOV_MENU=y
# CONFIG_ARCH_NEEDS_CPU_IDLE_COUPLED is not set
# CONFIG_INTEL_IDLE is not set

#
# Memory power savings
#
# CONFIG_I7300_IDLE is not set

#
# Bus options (PCI etc.)
#
CONFIG_PCI=y
CONFIG_PCI_DIRECT=y
# CONFIG_PCI_MMCONFIG is not set
CONFIG_PCI_DOMAINS=y
# CONFIG_PCI_CNB20LE_QUIRK is not set
# CONFIG_PCIEPORTBUS is not set
CONFIG_PCI_BUS_ADDR_T_64BIT=y
# CONFIG_PCI_MSI is not set
# CONFIG_PCI_DEBUG is not set
# CONFIG_PCI_REALLOC_ENABLE_AUTO is not set
# CONFIG_PCI_STUB is not set
CONFIG_HT_IRQ=y
# CONFIG_PCI_IOV is not set
# CONFIG_PCI_PRI is not set
# CONFIG_PCI_PASID is not set
CONFIG_PCI_LABEL=y
# CONFIG_HOTPLUG_PCI is not set

#
# PCI host controller drivers
#
# CONFIG_PCIE_DW_PLAT is not set
# CONFIG_ISA_DMA_API is not set
CONFIG_AMD_NB=y
CONFIG_PCCARD=y
# CONFIG_PCMCIA is not set
CONFIG_CARDBUS=y

#
# PC-card bridges
#
# CONFIG_YENTA is not set
# CONFIG_RAPIDIO is not set
CONFIG_X86_SYSFB=y

#
# Executable file formats / Emulations
#
CONFIG_BINFMT_ELF=y
CONFIG_BINFMT_SCRIPT=y
# CONFIG_HAVE_AOUT is not set
CONFIG_BINFMT_MISC=y
CONFIG_COREDUMP=y
# CONFIG_IA32_EMULATION is not set
CONFIG_X86_X32=y
CONFIG_COMPAT=y
CONFIG_COMPAT_FOR_U64_ALIGNMENT=y
CONFIG_KEYS_COMPAT=y
CONFIG_X86_DEV_DMA_OPS=y
CONFIG_PMC_ATOM=y
CONFIG_NET=y

#
# Networking options
#
# CONFIG_PACKET is not set
CONFIG_UNIX=y
# CONFIG_UNIX_DIAG is not set
# CONFIG_NET_KEY is not set
# CONFIG_INET is not set
# CONFIG_NETWORK_SECMARK is not set
# CONFIG_NET_PTP_CLASSIFY is not set
# CONFIG_NETWORK_PHY_TIMESTAMPING is not set
# CONFIG_NETFILTER is not set
# CONFIG_ATM is not set
# CONFIG_BRIDGE is not set
# CONFIG_VLAN_8021Q is not set
# CONFIG_DECNET is not set
# CONFIG_LLC2 is not set
# CONFIG_IPX is not set
# CONFIG_ATALK is not set
# CONFIG_X25 is not set
# CONFIG_LAPB is not set
# CONFIG_PHONET is not set
# CONFIG_IEEE802154 is not set
# CONFIG_NET_SCHED is not set
# CONFIG_DCB is not set
# CONFIG_DNS_RESOLVER is not set
# CONFIG_BATMAN_ADV is not set
# CONFIG_VSOCKETS is not set
# CONFIG_NETLINK_DIAG is not set
# CONFIG_MPLS is not set
# CONFIG_HSR is not set
# CONFIG_SOCK_CGROUP_DATA is not set
# CONFIG_CGROUP_NET_PRIO is not set
# CONFIG_CGROUP_NET_CLASSID is not set
CONFIG_NET_RX_BUSY_POLL=y
CONFIG_BQL=y

#
# Network testing
#
# CONFIG_HAMRADIO is not set
# CONFIG_CAN is not set
# CONFIG_IRDA is not set
# CONFIG_BT is not set
CONFIG_WIRELESS=y
# CONFIG_CFG80211 is not set
# CONFIG_LIB80211 is not set

#
# CFG80211 needs to be enabled for MAC80211
#
CONFIG_MAC80211_STA_HASH_MAX_SIZE=0
# CONFIG_WIMAX is not set
# CONFIG_RFKILL is not set
# CONFIG_RFKILL_REGULATOR is not set
# CONFIG_NET_9P is not set
# CONFIG_CAIF is not set
# CONFIG_NFC is not set
# CONFIG_LWTUNNEL is not set
# CONFIG_DST_CACHE is not set
# CONFIG_NET_DEVLINK is not set
CONFIG_MAY_USE_DEVLINK=y
CONFIG_HAVE_BPF_JIT=y

#
# Device Drivers
#

#
# Generic Driver Options
#
# CONFIG_UEVENT_HELPER is not set
CONFIG_DEVTMPFS=y
# CONFIG_DEVTMPFS_MOUNT is not set
# CONFIG_STANDALONE is not set
# CONFIG_PREVENT_FIRMWARE_BUILD is not set
CONFIG_FW_LOADER=y
# CONFIG_FIRMWARE_IN_KERNEL is not set
CONFIG_EXTRA_FIRMWARE=""
CONFIG_FW_LOADER_USER_HELPER=y
CONFIG_FW_LOADER_USER_HELPER_FALLBACK=y
CONFIG_ALLOW_DEV_COREDUMP=y
# CONFIG_DEBUG_DRIVER is not set
# CONFIG_DEBUG_DEVRES is not set
# CONFIG_SYS_HYPERVISOR is not set
# CONFIG_GENERIC_CPU_DEVICES is not set
CONFIG_GENERIC_CPU_AUTOPROBE=y
CONFIG_REGMAP=y
CONFIG_REGMAP_I2C=y
CONFIG_REGMAP_MMIO=y
CONFIG_REGMAP_IRQ=y
# CONFIG_DMA_SHARED_BUFFER is not set

#
# Bus devices
#
# CONFIG_CONNECTOR is not set
CONFIG_MTD=y
CONFIG_MTD_REDBOOT_PARTS=y
CONFIG_MTD_REDBOOT_DIRECTORY_BLOCK=-1
CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED=y
CONFIG_MTD_REDBOOT_PARTS_READONLY=y
CONFIG_MTD_CMDLINE_PARTS=y
CONFIG_MTD_OF_PARTS=y
CONFIG_MTD_AR7_PARTS=y

#
# User Modules And Translation Layers
#
CONFIG_MTD_OOPS=y
CONFIG_MTD_PARTITIONED_MASTER=y

#
# RAM/ROM/Flash chip drivers
#
CONFIG_MTD_CFI=y
CONFIG_MTD_JEDECPROBE=y
CONFIG_MTD_GEN_PROBE=y
CONFIG_MTD_CFI_ADV_OPTIONS=y
# CONFIG_MTD_CFI_NOSWAP is not set
CONFIG_MTD_CFI_BE_BYTE_SWAP=y
# CONFIG_MTD_CFI_LE_BYTE_SWAP is not set
# CONFIG_MTD_CFI_GEOMETRY is not set
CONFIG_MTD_MAP_BANK_WIDTH_1=y
CONFIG_MTD_MAP_BANK_WIDTH_2=y
CONFIG_MTD_MAP_BANK_WIDTH_4=y
# CONFIG_MTD_MAP_BANK_WIDTH_8 is not set
# CONFIG_MTD_MAP_BANK_WIDTH_16 is not set
# CONFIG_MTD_MAP_BANK_WIDTH_32 is not set
CONFIG_MTD_CFI_I1=y
CONFIG_MTD_CFI_I2=y
# CONFIG_MTD_CFI_I4 is not set
# CONFIG_MTD_CFI_I8 is not set
# CONFIG_MTD_OTP is not set
CONFIG_MTD_CFI_INTELEXT=y
CONFIG_MTD_CFI_AMDSTD=y
CONFIG_MTD_CFI_STAA=y
CONFIG_MTD_CFI_UTIL=y
CONFIG_MTD_RAM=y
CONFIG_MTD_ROM=y
CONFIG_MTD_ABSENT=y

#
# Mapping drivers for chip access
#
# CONFIG_MTD_COMPLEX_MAPPINGS is not set
CONFIG_MTD_PHYSMAP=y
CONFIG_MTD_PHYSMAP_COMPAT=y
CONFIG_MTD_PHYSMAP_START=0x8000000
CONFIG_MTD_PHYSMAP_LEN=0
CONFIG_MTD_PHYSMAP_BANKWIDTH=2
# CONFIG_MTD_PHYSMAP_OF is not set
CONFIG_MTD_AMD76XROM=y
# CONFIG_MTD_ICHXROM is not set
# CONFIG_MTD_ESB2ROM is not set
# CONFIG_MTD_CK804XROM is not set
# CONFIG_MTD_SCB2_FLASH is not set
# CONFIG_MTD_NETtel is not set
CONFIG_MTD_L440GX=y
# CONFIG_MTD_INTEL_VR_NOR is not set
CONFIG_MTD_PLATRAM=y

#
# Self-contained MTD device drivers
#
# CONFIG_MTD_PMC551 is not set
# CONFIG_MTD_SLRAM is not set
CONFIG_MTD_PHRAM=y
CONFIG_MTD_MTDRAM=y
CONFIG_MTDRAM_TOTAL_SIZE=4096
CONFIG_MTDRAM_ERASE_SIZE=128
CONFIG_MTDRAM_ABS_POS=0

#
# Disk-On-Chip Device Drivers
#
CONFIG_MTD_DOCG3=y
CONFIG_BCH_CONST_M=14
CONFIG_BCH_CONST_T=4
CONFIG_MTD_NAND_ECC=y
CONFIG_MTD_NAND_ECC_SMC=y
CONFIG_MTD_NAND=y
CONFIG_MTD_NAND_BCH=y
CONFIG_MTD_NAND_ECC_BCH=y
# CONFIG_MTD_SM_COMMON is not set
# CONFIG_MTD_NAND_DENALI_PCI is not set
# CONFIG_MTD_NAND_GPIO is not set
# CONFIG_MTD_NAND_OMAP_BCH_BUILD is not set
CONFIG_MTD_NAND_IDS=y
# CONFIG_MTD_NAND_RICOH is not set
CONFIG_MTD_NAND_DISKONCHIP=y
# CONFIG_MTD_NAND_DISKONCHIP_PROBE_ADVANCED is not set
CONFIG_MTD_NAND_DISKONCHIP_PROBE_ADDRESS=0
# CONFIG_MTD_NAND_DISKONCHIP_BBTWRITE is not set
# CONFIG_MTD_NAND_DOCG4 is not set
# CONFIG_MTD_NAND_CAFE is not set
CONFIG_MTD_NAND_NANDSIM=y
# CONFIG_MTD_NAND_PLATFORM is not set
CONFIG_MTD_NAND_HISI504=y
CONFIG_MTD_ONENAND=y
# CONFIG_MTD_ONENAND_VERIFY_WRITE is not set
# CONFIG_MTD_ONENAND_GENERIC is not set
# CONFIG_MTD_ONENAND_OTP is not set
# CONFIG_MTD_ONENAND_2X_PROGRAM is not set

#
# LPDDR & LPDDR2 PCM memory drivers
#
CONFIG_MTD_LPDDR=y
CONFIG_MTD_QINFO_PROBE=y
CONFIG_MTD_SPI_NOR=y
# CONFIG_MTD_MT81xx_NOR is not set
# CONFIG_MTD_SPI_NOR_USE_4K_SECTORS is not set
CONFIG_MTD_UBI=y
CONFIG_MTD_UBI_WL_THRESHOLD=4096
CONFIG_MTD_UBI_BEB_LIMIT=20
CONFIG_MTD_UBI_FASTMAP=y
CONFIG_MTD_UBI_GLUEBI=y
CONFIG_DTC=y
CONFIG_OF=y
CONFIG_OF_UNITTEST=y
CONFIG_OF_FLATTREE=y
CONFIG_OF_EARLY_FLATTREE=y
CONFIG_OF_DYNAMIC=y
CONFIG_OF_ADDRESS=y
CONFIG_OF_ADDRESS_PCI=y
CONFIG_OF_IRQ=y
CONFIG_OF_PCI=y
CONFIG_OF_PCI_IRQ=y
CONFIG_OF_MTD=y
CONFIG_OF_RESOLVE=y
CONFIG_OF_OVERLAY=y
CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=y
CONFIG_PARPORT=y
CONFIG_PARPORT_PC=y
# CONFIG_PARPORT_SERIAL is not set
# CONFIG_PARPORT_PC_FIFO is not set
CONFIG_PARPORT_PC_SUPERIO=y
# CONFIG_PARPORT_GSC is not set
CONFIG_PARPORT_AX88796=y
# CONFIG_PARPORT_1284 is not set
CONFIG_PARPORT_NOT_PC=y
CONFIG_PNP=y
CONFIG_PNP_DEBUG_MESSAGES=y

#
# Protocols
#
CONFIG_PNPACPI=y

#
# Misc devices
#
CONFIG_SENSORS_LIS3LV02D=y
# CONFIG_AD525X_DPOT is not set
CONFIG_DUMMY_IRQ=y
# CONFIG_IBM_ASM is not set
# CONFIG_PHANTOM is not set
# CONFIG_SGI_IOC4 is not set
# CONFIG_TIFM_CORE is not set
# CONFIG_ICS932S401 is not set
CONFIG_ENCLOSURE_SERVICES=y
# CONFIG_HP_ILO is not set
CONFIG_APDS9802ALS=y
CONFIG_ISL29003=y
# CONFIG_ISL29020 is not set
CONFIG_SENSORS_TSL2550=y
# CONFIG_SENSORS_BH1780 is not set
# CONFIG_SENSORS_BH1770 is not set
# CONFIG_SENSORS_APDS990X is not set
# CONFIG_HMC6352 is not set
CONFIG_DS1682=y
# CONFIG_BMP085_I2C is not set
CONFIG_USB_SWITCH_FSA9480=y
CONFIG_SRAM=y
CONFIG_PANEL=y
CONFIG_PANEL_PARPORT=0
CONFIG_PANEL_PROFILE=5
CONFIG_PANEL_CHANGE_MESSAGE=y
CONFIG_PANEL_BOOT_MESSAGE=""
CONFIG_C2PORT=y
# CONFIG_C2PORT_DURAMAR_2150 is not set

#
# EEPROM support
#
CONFIG_EEPROM_AT24=y
CONFIG_EEPROM_LEGACY=y
# CONFIG_EEPROM_MAX6875 is not set
CONFIG_EEPROM_93CX6=y
# CONFIG_CB710_CORE is not set

#
# Texas Instruments shared transport line discipline
#
# CONFIG_TI_ST is not set
CONFIG_SENSORS_LIS3_I2C=y

#
# Altera FPGA firmware download module
#
# CONFIG_ALTERA_STAPL is not set
# CONFIG_INTEL_MEI is not set
# CONFIG_INTEL_MEI_ME is not set
# CONFIG_INTEL_MEI_TXE is not set
# CONFIG_VMWARE_VMCI is not set

#
# Intel MIC Bus Driver
#
# CONFIG_INTEL_MIC_BUS is not set

#
# SCIF Bus Driver
#
# CONFIG_SCIF_BUS is not set

#
# VOP Bus Driver
#
# CONFIG_VOP_BUS is not set

#
# Intel MIC Host Driver
#

#
# Intel MIC Card Driver
#

#
# SCIF Driver
#

#
# Intel MIC Coprocessor State Management (COSM) Drivers
#

#
# VOP Driver
#
# CONFIG_GENWQE is not set
CONFIG_ECHO=y
# CONFIG_CXL_BASE is not set
# CONFIG_CXL_KERNEL_API is not set
# CONFIG_CXL_EEH is not set
CONFIG_HAVE_IDE=y

#
# SCSI device support
#
CONFIG_SCSI_MOD=y
# CONFIG_SCSI_DMA is not set
# CONFIG_SCSI_NETLINK is not set
# CONFIG_FUSION is not set

#
# IEEE 1394 (FireWire) support
#
CONFIG_FIREWIRE=y
# CONFIG_FIREWIRE_OHCI is not set
# CONFIG_FIREWIRE_NOSY is not set
# CONFIG_MACINTOSH_DRIVERS is not set
# CONFIG_NETDEVICES is not set
# CONFIG_VHOST_NET is not set
# CONFIG_VHOST_CROSS_ENDIAN_LEGACY is not set

#
# Input device support
#
CONFIG_INPUT=y
# CONFIG_INPUT_LEDS is not set
CONFIG_INPUT_FF_MEMLESS=y
CONFIG_INPUT_POLLDEV=y
CONFIG_INPUT_SPARSEKMAP=y
CONFIG_INPUT_MATRIXKMAP=y

#
# Userland interfaces
#
# CONFIG_INPUT_MOUSEDEV is not set
CONFIG_INPUT_JOYDEV=y
# CONFIG_INPUT_EVDEV is not set
CONFIG_INPUT_EVBUG=y

#
# Input Device Drivers
#
CONFIG_INPUT_KEYBOARD=y
# CONFIG_KEYBOARD_ADP5520 is not set
# CONFIG_KEYBOARD_ADP5588 is not set
# CONFIG_KEYBOARD_ADP5589 is not set
CONFIG_KEYBOARD_ATKBD=y
# CONFIG_KEYBOARD_QT1070 is not set
# CONFIG_KEYBOARD_QT2160 is not set
# CONFIG_KEYBOARD_LKKBD is not set
# CONFIG_KEYBOARD_GPIO is not set
# CONFIG_KEYBOARD_GPIO_POLLED is not set
# CONFIG_KEYBOARD_TCA6416 is not set
# CONFIG_KEYBOARD_TCA8418 is not set
# CONFIG_KEYBOARD_MATRIX is not set
# CONFIG_KEYBOARD_LM8323 is not set
# CONFIG_KEYBOARD_LM8333 is not set
# CONFIG_KEYBOARD_MAX7359 is not set
# CONFIG_KEYBOARD_MCS is not set
# CONFIG_KEYBOARD_MPR121 is not set
# CONFIG_KEYBOARD_NEWTON is not set
# CONFIG_KEYBOARD_OPENCORES is not set
# CONFIG_KEYBOARD_STOWAWAY is not set
# CONFIG_KEYBOARD_SUNKBD is not set
# CONFIG_KEYBOARD_OMAP4 is not set
# CONFIG_KEYBOARD_TC3589X is not set
# CONFIG_KEYBOARD_TWL4030 is not set
# CONFIG_KEYBOARD_XTKBD is not set
# CONFIG_KEYBOARD_CROS_EC is not set
# CONFIG_KEYBOARD_CAP11XX is not set
CONFIG_INPUT_MOUSE=y
CONFIG_MOUSE_PS2=y
# CONFIG_MOUSE_PS2_ALPS is not set
# CONFIG_MOUSE_PS2_BYD is not set
CONFIG_MOUSE_PS2_LOGIPS2PP=y
CONFIG_MOUSE_PS2_SYNAPTICS=y
CONFIG_MOUSE_PS2_CYPRESS=y
# CONFIG_MOUSE_PS2_LIFEBOOK is not set
# CONFIG_MOUSE_PS2_TRACKPOINT is not set
# CONFIG_MOUSE_PS2_ELANTECH is not set
# CONFIG_MOUSE_PS2_SENTELIC is not set
# CONFIG_MOUSE_PS2_TOUCHKIT is not set
CONFIG_MOUSE_PS2_FOCALTECH=y
# CONFIG_MOUSE_PS2_VMMOUSE is not set
CONFIG_MOUSE_SERIAL=y
CONFIG_MOUSE_APPLETOUCH=y
CONFIG_MOUSE_BCM5974=y
CONFIG_MOUSE_CYAPA=y
CONFIG_MOUSE_ELAN_I2C=y
# CONFIG_MOUSE_ELAN_I2C_I2C is not set
CONFIG_MOUSE_ELAN_I2C_SMBUS=y
CONFIG_MOUSE_VSXXXAA=y
CONFIG_MOUSE_GPIO=y
CONFIG_MOUSE_SYNAPTICS_I2C=y
# CONFIG_MOUSE_SYNAPTICS_USB is not set
CONFIG_INPUT_JOYSTICK=y
CONFIG_JOYSTICK_ANALOG=y
CONFIG_JOYSTICK_A3D=y
# CONFIG_JOYSTICK_ADI is not set
CONFIG_JOYSTICK_COBRA=y
CONFIG_JOYSTICK_GF2K=y
CONFIG_JOYSTICK_GRIP=y
CONFIG_JOYSTICK_GRIP_MP=y
CONFIG_JOYSTICK_GUILLEMOT=y
# CONFIG_JOYSTICK_INTERACT is not set
# CONFIG_JOYSTICK_SIDEWINDER is not set
CONFIG_JOYSTICK_TMDC=y
# CONFIG_JOYSTICK_IFORCE is not set
CONFIG_JOYSTICK_WARRIOR=y
CONFIG_JOYSTICK_MAGELLAN=y
CONFIG_JOYSTICK_SPACEORB=y
# CONFIG_JOYSTICK_SPACEBALL is not set
# CONFIG_JOYSTICK_STINGER is not set
CONFIG_JOYSTICK_TWIDJOY=y
CONFIG_JOYSTICK_ZHENHUA=y
# CONFIG_JOYSTICK_DB9 is not set
CONFIG_JOYSTICK_GAMECON=y
CONFIG_JOYSTICK_TURBOGRAFX=y
CONFIG_JOYSTICK_AS5011=y
CONFIG_JOYSTICK_JOYDUMP=y
CONFIG_JOYSTICK_XPAD=y
# CONFIG_JOYSTICK_XPAD_FF is not set
# CONFIG_JOYSTICK_XPAD_LEDS is not set
# CONFIG_INPUT_TABLET is not set
# CONFIG_INPUT_TOUCHSCREEN is not set
# CONFIG_INPUT_MISC is not set
CONFIG_RMI4_CORE=y
CONFIG_RMI4_I2C=y
# CONFIG_RMI4_F11 is not set
# CONFIG_RMI4_F12 is not set
# CONFIG_RMI4_F30 is not set

#
# Hardware I/O ports
#
CONFIG_SERIO=y
CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=y
CONFIG_SERIO_I8042=y
CONFIG_SERIO_SERPORT=y
CONFIG_SERIO_CT82C710=y
CONFIG_SERIO_PARKBD=y
# CONFIG_SERIO_PCIPS2 is not set
CONFIG_SERIO_LIBPS2=y
CONFIG_SERIO_RAW=y
CONFIG_SERIO_ALTERA_PS2=y
CONFIG_SERIO_PS2MULT=y
CONFIG_SERIO_ARC_PS2=y
# CONFIG_SERIO_APBPS2 is not set
CONFIG_USERIO=y
CONFIG_GAMEPORT=y
# CONFIG_GAMEPORT_NS558 is not set
# CONFIG_GAMEPORT_L4 is not set
# CONFIG_GAMEPORT_EMU10K1 is not set
# CONFIG_GAMEPORT_FM801 is not set

#
# Character devices
#
CONFIG_TTY=y
# CONFIG_VT is not set
CONFIG_UNIX98_PTYS=y
# CONFIG_DEVPTS_MULTIPLE_INSTANCES is not set
# CONFIG_LEGACY_PTYS is not set
# CONFIG_SERIAL_NONSTANDARD is not set
# CONFIG_NOZOMI is not set
# CONFIG_N_GSM is not set
# CONFIG_TRACE_SINK is not set
# CONFIG_DEVMEM is not set
# CONFIG_DEVKMEM is not set

#
# Serial drivers
#
CONFIG_SERIAL_EARLYCON=y
CONFIG_SERIAL_8250=y
# CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
CONFIG_SERIAL_8250_PNP=y
CONFIG_SERIAL_8250_CONSOLE=y
CONFIG_SERIAL_8250_PCI=y
CONFIG_SERIAL_8250_NR_UARTS=4
CONFIG_SERIAL_8250_RUNTIME_UARTS=4
CONFIG_SERIAL_8250_EXTENDED=y
CONFIG_SERIAL_8250_MANY_PORTS=y
# CONFIG_SERIAL_8250_SHARE_IRQ is not set
# CONFIG_SERIAL_8250_DETECT_IRQ is not set
CONFIG_SERIAL_8250_RSA=y
# CONFIG_SERIAL_8250_FSL is not set
# CONFIG_SERIAL_8250_DW is not set
# CONFIG_SERIAL_8250_FINTEK is not set
CONFIG_SERIAL_8250_MID=y
# CONFIG_SERIAL_8250_MOXA is not set
# CONFIG_SERIAL_OF_PLATFORM is not set

#
# Non-8250 serial port support
#
CONFIG_SERIAL_UARTLITE=y
CONFIG_SERIAL_UARTLITE_CONSOLE=y
CONFIG_SERIAL_CORE=y
CONFIG_SERIAL_CORE_CONSOLE=y
# CONFIG_SERIAL_JSM is not set
# CONFIG_SERIAL_SCCNXP is not set
# CONFIG_SERIAL_SC16IS7XX is not set
# CONFIG_SERIAL_ALTERA_JTAGUART is not set
CONFIG_SERIAL_ALTERA_UART=y
CONFIG_SERIAL_ALTERA_UART_MAXPORTS=4
CONFIG_SERIAL_ALTERA_UART_BAUDRATE=115200
# CONFIG_SERIAL_ALTERA_UART_CONSOLE is not set
# CONFIG_SERIAL_XILINX_PS_UART is not set
CONFIG_SERIAL_ARC=y
# CONFIG_SERIAL_ARC_CONSOLE is not set
CONFIG_SERIAL_ARC_NR_PORTS=1
# CONFIG_SERIAL_RP2 is not set
CONFIG_SERIAL_FSL_LPUART=y
# CONFIG_SERIAL_FSL_LPUART_CONSOLE is not set
CONFIG_SERIAL_CONEXANT_DIGICOLOR=y
# CONFIG_SERIAL_CONEXANT_DIGICOLOR_CONSOLE is not set
# CONFIG_SERIAL_MVEBU_UART is not set
CONFIG_TTY_PRINTK=y
CONFIG_PRINTER=y
CONFIG_LP_CONSOLE=y
CONFIG_PPDEV=y
CONFIG_HVC_DRIVER=y
CONFIG_VIRTIO_CONSOLE=y
# CONFIG_IPMI_HANDLER is not set
# CONFIG_HW_RANDOM is not set
CONFIG_NVRAM=y
# CONFIG_R3964 is not set
# CONFIG_APPLICOM is not set
CONFIG_MWAVE=y
# CONFIG_HPET is not set
CONFIG_HANGCHECK_TIMER=y
# CONFIG_TCG_TPM is not set
CONFIG_TELCLOCK=y
CONFIG_DEVPORT=y
CONFIG_XILLYBUS=y
# CONFIG_XILLYBUS_OF is not set

#
# I2C support
#
CONFIG_I2C=y
CONFIG_ACPI_I2C_OPREGION=y
CONFIG_I2C_BOARDINFO=y
CONFIG_I2C_COMPAT=y
CONFIG_I2C_CHARDEV=y
CONFIG_I2C_MUX=y

#
# Multiplexer I2C Chip support
#
CONFIG_I2C_ARB_GPIO_CHALLENGE=y
CONFIG_I2C_MUX_GPIO=y
# CONFIG_I2C_MUX_PCA9541 is not set
# CONFIG_I2C_MUX_PCA954x is not set
# CONFIG_I2C_MUX_REG is not set
CONFIG_I2C_HELPER_AUTO=y
CONFIG_I2C_SMBUS=y
CONFIG_I2C_ALGOBIT=y

#
# I2C Hardware Bus support
#

#
# PC SMBus host controller drivers
#
# CONFIG_I2C_ALI1535 is not set
# CONFIG_I2C_ALI1563 is not set
# CONFIG_I2C_ALI15X3 is not set
# CONFIG_I2C_AMD756 is not set
# CONFIG_I2C_AMD8111 is not set
# CONFIG_I2C_I801 is not set
# CONFIG_I2C_ISCH is not set
# CONFIG_I2C_ISMT is not set
# CONFIG_I2C_PIIX4 is not set
# CONFIG_I2C_NFORCE2 is not set
# CONFIG_I2C_SIS5595 is not set
# CONFIG_I2C_SIS630 is not set
# CONFIG_I2C_SIS96X is not set
# CONFIG_I2C_VIA is not set
# CONFIG_I2C_VIAPRO is not set

#
# ACPI drivers
#
# CONFIG_I2C_SCMI is not set

#
# I2C system bus drivers (mostly embedded / system-on-chip)
#
CONFIG_I2C_CBUS_GPIO=y
# CONFIG_I2C_DESIGNWARE_PCI is not set
CONFIG_I2C_GPIO=y
CONFIG_I2C_KEMPLD=y
CONFIG_I2C_OCORES=y
# CONFIG_I2C_PCA_PLATFORM is not set
# CONFIG_I2C_PXA_PCI is not set
# CONFIG_I2C_SIMTEC is not set
# CONFIG_I2C_XILINX is not set

#
# External I2C/SMBus adapter drivers
#
CONFIG_I2C_DIOLAN_U2C=y
CONFIG_I2C_PARPORT=y
# CONFIG_I2C_PARPORT_LIGHT is not set
CONFIG_I2C_ROBOTFUZZ_OSIF=y
CONFIG_I2C_TAOS_EVM=y
# CONFIG_I2C_TINY_USB is not set
# CONFIG_I2C_VIPERBOARD is not set

#
# Other I2C/SMBus bus drivers
#
CONFIG_I2C_CROS_EC_TUNNEL=y
# CONFIG_I2C_SLAVE is not set
# CONFIG_I2C_DEBUG_CORE is not set
# CONFIG_I2C_DEBUG_ALGO is not set
# CONFIG_I2C_DEBUG_BUS is not set
# CONFIG_SPI is not set
# CONFIG_SPMI is not set
CONFIG_HSI=y
CONFIG_HSI_BOARDINFO=y

#
# HSI controllers
#

#
# HSI clients
#
CONFIG_HSI_CHAR=y

#
# PPS support
#
CONFIG_PPS=y
# CONFIG_PPS_DEBUG is not set

#
# PPS clients support
#
# CONFIG_PPS_CLIENT_KTIMER is not set
CONFIG_PPS_CLIENT_LDISC=y
CONFIG_PPS_CLIENT_PARPORT=y
# CONFIG_PPS_CLIENT_GPIO is not set

#
# PPS generators support
#

#
# PTP clock support
#
# CONFIG_PTP_1588_CLOCK is not set

#
# Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional clocks.
#
CONFIG_ARCH_WANT_OPTIONAL_GPIOLIB=y
CONFIG_GPIOLIB=y
CONFIG_GPIO_DEVRES=y
CONFIG_OF_GPIO=y
CONFIG_GPIO_ACPI=y
CONFIG_GPIOLIB_IRQCHIP=y
CONFIG_DEBUG_GPIO=y
CONFIG_GPIO_SYSFS=y
CONFIG_GPIO_GENERIC=y
CONFIG_GPIO_MAX730X=y

#
# Memory mapped GPIO drivers
#
CONFIG_GPIO_74XX_MMIO=y
CONFIG_GPIO_ALTERA=y
# CONFIG_GPIO_AMDPT is not set
CONFIG_GPIO_DWAPB=y
CONFIG_GPIO_GENERIC_PLATFORM=y
CONFIG_GPIO_GRGPIO=y
# CONFIG_GPIO_ICH is not set
# CONFIG_GPIO_LYNXPOINT is not set
CONFIG_GPIO_SYSCON=y
# CONFIG_GPIO_VX855 is not set
CONFIG_GPIO_XILINX=y
# CONFIG_GPIO_ZX is not set

#
# Port-mapped I/O GPIO drivers
#
# CONFIG_GPIO_104_DIO_48E is not set
# CONFIG_GPIO_104_IDIO_16 is not set
# CONFIG_GPIO_104_IDI_48 is not set
CONFIG_GPIO_F7188X=y
CONFIG_GPIO_IT87=y
# CONFIG_GPIO_SCH is not set
# CONFIG_GPIO_SCH311X is not set
# CONFIG_GPIO_WS16C48 is not set

#
# I2C GPIO expanders
#
CONFIG_GPIO_ADP5588=y
CONFIG_GPIO_ADP5588_IRQ=y
CONFIG_GPIO_ADNP=y
CONFIG_GPIO_MAX7300=y
# CONFIG_GPIO_MAX732X is not set
CONFIG_GPIO_PCA953X=y
# CONFIG_GPIO_PCA953X_IRQ is not set
# CONFIG_GPIO_PCF857X is not set
# CONFIG_GPIO_SX150X is not set
CONFIG_GPIO_TPIC2810=y

#
# MFD GPIO expanders
#
CONFIG_GPIO_ADP5520=y
CONFIG_GPIO_ARIZONA=y
CONFIG_GPIO_CRYSTAL_COVE=y
CONFIG_GPIO_DA9052=y
CONFIG_GPIO_KEMPLD=y
CONFIG_GPIO_LP3943=y
CONFIG_GPIO_TC3589X=y
CONFIG_GPIO_TPS65086=y
CONFIG_GPIO_TPS65218=y
# CONFIG_GPIO_TWL4030 is not set
# CONFIG_GPIO_TWL6040 is not set
# CONFIG_GPIO_WM831X is not set
# CONFIG_GPIO_WM8994 is not set

#
# PCI GPIO expanders
#
# CONFIG_GPIO_AMD8111 is not set
# CONFIG_GPIO_BT8XX is not set
# CONFIG_GPIO_INTEL_MID is not set
# CONFIG_GPIO_ML_IOH is not set
# CONFIG_GPIO_RDC321X is not set
# CONFIG_GPIO_SODAVILLE is not set

#
# SPI or I2C GPIO expanders
#
CONFIG_GPIO_MCP23S08=y

#
# USB GPIO expanders
#
CONFIG_GPIO_VIPERBOARD=y
# CONFIG_W1 is not set
CONFIG_POWER_SUPPLY=y
# CONFIG_POWER_SUPPLY_DEBUG is not set
# CONFIG_PDA_POWER is not set
# CONFIG_GENERIC_ADC_BATTERY is not set
# CONFIG_WM831X_BACKUP is not set
# CONFIG_WM831X_POWER is not set
# CONFIG_TEST_POWER is not set
# CONFIG_BATTERY_88PM860X is not set
# CONFIG_BATTERY_ACT8945A is not set
# CONFIG_BATTERY_DS2780 is not set
# CONFIG_BATTERY_DS2781 is not set
# CONFIG_BATTERY_DS2782 is not set
# CONFIG_BATTERY_SBS is not set
# CONFIG_BATTERY_BQ27XXX is not set
# CONFIG_BATTERY_DA9052 is not set
# CONFIG_CHARGER_DA9150 is not set
# CONFIG_BATTERY_DA9150 is not set
# CONFIG_AXP288_CHARGER is not set
# CONFIG_AXP288_FUEL_GAUGE is not set
# CONFIG_BATTERY_MAX17040 is not set
# CONFIG_BATTERY_MAX17042 is not set
# CONFIG_CHARGER_ISP1704 is not set
# CONFIG_CHARGER_MAX8903 is not set
# CONFIG_CHARGER_TWL4030 is not set
# CONFIG_CHARGER_LP8727 is not set
# CONFIG_CHARGER_GPIO is not set
# CONFIG_CHARGER_MANAGER is not set
# CONFIG_CHARGER_MAX14577 is not set
# CONFIG_CHARGER_MAX77693 is not set
# CONFIG_CHARGER_BQ2415X is not set
# CONFIG_CHARGER_BQ24190 is not set
# CONFIG_CHARGER_BQ24257 is not set
# CONFIG_CHARGER_BQ24735 is not set
# CONFIG_CHARGER_BQ25890 is not set
# CONFIG_CHARGER_SMB347 is not set
# CONFIG_CHARGER_TPS65090 is not set
# CONFIG_CHARGER_TPS65217 is not set
# CONFIG_BATTERY_GAUGE_LTC2941 is not set
# CONFIG_CHARGER_RT9455 is not set
# CONFIG_AXP20X_POWER is not set
# CONFIG_POWER_RESET is not set
# CONFIG_POWER_AVS is not set
CONFIG_HWMON=y
CONFIG_HWMON_VID=y
# CONFIG_HWMON_DEBUG_CHIP is not set

#
# Native drivers
#
# CONFIG_SENSORS_ABITUGURU is not set
CONFIG_SENSORS_ABITUGURU3=y
CONFIG_SENSORS_AD7414=y
CONFIG_SENSORS_AD7418=y
CONFIG_SENSORS_ADM1021=y
CONFIG_SENSORS_ADM1025=y
CONFIG_SENSORS_ADM1026=y
CONFIG_SENSORS_ADM1029=y
# CONFIG_SENSORS_ADM1031 is not set
CONFIG_SENSORS_ADM9240=y
CONFIG_SENSORS_ADT7X10=y
CONFIG_SENSORS_ADT7410=y
CONFIG_SENSORS_ADT7411=y
# CONFIG_SENSORS_ADT7462 is not set
CONFIG_SENSORS_ADT7470=y
CONFIG_SENSORS_ADT7475=y
CONFIG_SENSORS_ASC7621=y
# CONFIG_SENSORS_K8TEMP is not set
# CONFIG_SENSORS_K10TEMP is not set
# CONFIG_SENSORS_FAM15H_POWER is not set
CONFIG_SENSORS_APPLESMC=y
CONFIG_SENSORS_ASB100=y
CONFIG_SENSORS_ATXP1=y
CONFIG_SENSORS_DS620=y
CONFIG_SENSORS_DS1621=y
# CONFIG_SENSORS_DELL_SMM is not set
CONFIG_SENSORS_DA9052_ADC=y
# CONFIG_SENSORS_I5K_AMB is not set
CONFIG_SENSORS_F71805F=y
CONFIG_SENSORS_F71882FG=y
CONFIG_SENSORS_F75375S=y
CONFIG_SENSORS_MC13783_ADC=y
CONFIG_SENSORS_FSCHMD=y
CONFIG_SENSORS_GL518SM=y
CONFIG_SENSORS_GL520SM=y
CONFIG_SENSORS_G760A=y
CONFIG_SENSORS_G762=y
# CONFIG_SENSORS_GPIO_FAN is not set
CONFIG_SENSORS_HIH6130=y
CONFIG_SENSORS_IIO_HWMON=y
# CONFIG_SENSORS_I5500 is not set
CONFIG_SENSORS_CORETEMP=y
CONFIG_SENSORS_IT87=y
CONFIG_SENSORS_JC42=y
CONFIG_SENSORS_POWR1220=y
CONFIG_SENSORS_LINEAGE=y
CONFIG_SENSORS_LTC2945=y
CONFIG_SENSORS_LTC2990=y
# CONFIG_SENSORS_LTC4151 is not set
CONFIG_SENSORS_LTC4215=y
# CONFIG_SENSORS_LTC4222 is not set
# CONFIG_SENSORS_LTC4245 is not set
CONFIG_SENSORS_LTC4260=y
# CONFIG_SENSORS_LTC4261 is not set
CONFIG_SENSORS_MAX16065=y
CONFIG_SENSORS_MAX1619=y
CONFIG_SENSORS_MAX1668=y
# CONFIG_SENSORS_MAX197 is not set
CONFIG_SENSORS_MAX6639=y
# CONFIG_SENSORS_MAX6642 is not set
CONFIG_SENSORS_MAX6650=y
# CONFIG_SENSORS_MAX6697 is not set
CONFIG_SENSORS_MAX31790=y
# CONFIG_SENSORS_MCP3021 is not set
CONFIG_SENSORS_LM63=y
CONFIG_SENSORS_LM73=y
# CONFIG_SENSORS_LM75 is not set
# CONFIG_SENSORS_LM77 is not set
CONFIG_SENSORS_LM78=y
# CONFIG_SENSORS_LM80 is not set
CONFIG_SENSORS_LM83=y
CONFIG_SENSORS_LM85=y
CONFIG_SENSORS_LM87=y
CONFIG_SENSORS_LM90=y
CONFIG_SENSORS_LM92=y
CONFIG_SENSORS_LM93=y
CONFIG_SENSORS_LM95234=y
CONFIG_SENSORS_LM95241=y
CONFIG_SENSORS_LM95245=y
# CONFIG_SENSORS_PC87360 is not set
CONFIG_SENSORS_PC87427=y
# CONFIG_SENSORS_NTC_THERMISTOR is not set
CONFIG_SENSORS_NCT6683=y
CONFIG_SENSORS_NCT6775=y
CONFIG_SENSORS_NCT7802=y
CONFIG_SENSORS_NCT7904=y
# CONFIG_SENSORS_PCF8591 is not set
CONFIG_PMBUS=y
CONFIG_SENSORS_PMBUS=y
CONFIG_SENSORS_ADM1275=y
# CONFIG_SENSORS_LM25066 is not set
CONFIG_SENSORS_LTC2978=y
# CONFIG_SENSORS_LTC2978_REGULATOR is not set
CONFIG_SENSORS_LTC3815=y
CONFIG_SENSORS_MAX16064=y
CONFIG_SENSORS_MAX20751=y
CONFIG_SENSORS_MAX34440=y
# CONFIG_SENSORS_MAX8688 is not set
# CONFIG_SENSORS_TPS40422 is not set
CONFIG_SENSORS_UCD9000=y
CONFIG_SENSORS_UCD9200=y
CONFIG_SENSORS_ZL6100=y
CONFIG_SENSORS_PWM_FAN=y
# CONFIG_SENSORS_SHT15 is not set
CONFIG_SENSORS_SHT21=y
CONFIG_SENSORS_SHTC1=y
# CONFIG_SENSORS_SIS5595 is not set
CONFIG_SENSORS_DME1737=y
# CONFIG_SENSORS_EMC1403 is not set
CONFIG_SENSORS_EMC2103=y
CONFIG_SENSORS_EMC6W201=y
CONFIG_SENSORS_SMSC47M1=y
CONFIG_SENSORS_SMSC47M192=y
CONFIG_SENSORS_SMSC47B397=y
CONFIG_SENSORS_SCH56XX_COMMON=y
# CONFIG_SENSORS_SCH5627 is not set
CONFIG_SENSORS_SCH5636=y
CONFIG_SENSORS_SMM665=y
# CONFIG_SENSORS_ADC128D818 is not set
CONFIG_SENSORS_ADS1015=y
CONFIG_SENSORS_ADS7828=y
CONFIG_SENSORS_AMC6821=y
CONFIG_SENSORS_INA209=y
# CONFIG_SENSORS_INA2XX is not set
CONFIG_SENSORS_TC74=y
# CONFIG_SENSORS_THMC50 is not set
CONFIG_SENSORS_TMP102=y
CONFIG_SENSORS_TMP103=y
CONFIG_SENSORS_TMP401=y
# CONFIG_SENSORS_TMP421 is not set
CONFIG_SENSORS_VIA_CPUTEMP=y
# CONFIG_SENSORS_VIA686A is not set
CONFIG_SENSORS_VT1211=y
# CONFIG_SENSORS_VT8231 is not set
CONFIG_SENSORS_W83781D=y
# CONFIG_SENSORS_W83791D is not set
# CONFIG_SENSORS_W83792D is not set
# CONFIG_SENSORS_W83793 is not set
# CONFIG_SENSORS_W83795 is not set
CONFIG_SENSORS_W83L785TS=y
CONFIG_SENSORS_W83L786NG=y
CONFIG_SENSORS_W83627HF=y
CONFIG_SENSORS_W83627EHF=y
CONFIG_SENSORS_WM831X=y

#
# ACPI drivers
#
# CONFIG_SENSORS_ACPI_POWER is not set
# CONFIG_SENSORS_ATK0110 is not set
CONFIG_THERMAL=y
CONFIG_THERMAL_HWMON=y
# CONFIG_THERMAL_OF is not set
CONFIG_THERMAL_WRITABLE_TRIPS=y
# CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE is not set
# CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
# CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
CONFIG_THERMAL_DEFAULT_GOV_POWER_ALLOCATOR=y
# CONFIG_THERMAL_GOV_FAIR_SHARE is not set
CONFIG_THERMAL_GOV_STEP_WISE=y
CONFIG_THERMAL_GOV_BANG_BANG=y
CONFIG_THERMAL_GOV_USER_SPACE=y
CONFIG_THERMAL_GOV_POWER_ALLOCATOR=y
CONFIG_THERMAL_EMULATION=y
CONFIG_INTEL_POWERCLAMP=y
CONFIG_INTEL_SOC_DTS_IOSF_CORE=y
CONFIG_INTEL_SOC_DTS_THERMAL=y
# CONFIG_INT340X_THERMAL is not set
# CONFIG_INTEL_PCH_THERMAL is not set
CONFIG_WATCHDOG=y
CONFIG_WATCHDOG_CORE=y
CONFIG_WATCHDOG_NOWAYOUT=y
CONFIG_WATCHDOG_SYSFS=y

#
# Watchdog Device Drivers
#
CONFIG_SOFT_WATCHDOG=y
CONFIG_DA9052_WATCHDOG=y
CONFIG_GPIO_WATCHDOG=y
CONFIG_GPIO_WATCHDOG_ARCH_INITCALL=y
CONFIG_WM831X_WATCHDOG=y
CONFIG_XILINX_WATCHDOG=y
# CONFIG_ZIIRAVE_WATCHDOG is not set
CONFIG_CADENCE_WATCHDOG=y
CONFIG_DW_WATCHDOG=y
CONFIG_TWL4030_WATCHDOG=y
CONFIG_MAX63XX_WATCHDOG=y
CONFIG_ACQUIRE_WDT=y
# CONFIG_ADVANTECH_WDT is not set
# CONFIG_ALIM1535_WDT is not set
# CONFIG_ALIM7101_WDT is not set
# CONFIG_EBC_C384_WDT is not set
# CONFIG_F71808E_WDT is not set
# CONFIG_SP5100_TCO is not set
CONFIG_SBC_FITPC2_WATCHDOG=y
# CONFIG_EUROTECH_WDT is not set
CONFIG_IB700_WDT=y
CONFIG_IBMASR=y
CONFIG_WAFER_WDT=y
# CONFIG_I6300ESB_WDT is not set
# CONFIG_IE6XX_WDT is not set
# CONFIG_ITCO_WDT is not set
# CONFIG_IT8712F_WDT is not set
CONFIG_IT87_WDT=y
# CONFIG_HP_WATCHDOG is not set
CONFIG_KEMPLD_WDT=y
CONFIG_SC1200_WDT=y
CONFIG_PC87413_WDT=y
# CONFIG_NV_TCO is not set
CONFIG_60XX_WDT=y
# CONFIG_CPU5_WDT is not set
CONFIG_SMSC_SCH311X_WDT=y
CONFIG_SMSC37B787_WDT=y
# CONFIG_VIA_WDT is not set
CONFIG_W83627HF_WDT=y
CONFIG_W83877F_WDT=y
CONFIG_W83977F_WDT=y
# CONFIG_MACHZ_WDT is not set
CONFIG_SBC_EPX_C3_WATCHDOG=y
# CONFIG_NI903X_WDT is not set
CONFIG_MEN_A21_WDT=y

#
# PCI-based Watchdog Cards
#
# CONFIG_PCIPCWATCHDOG is not set
# CONFIG_WDTPCI is not set

#
# USB-based Watchdog Cards
#
# CONFIG_USBPCWATCHDOG is not set
CONFIG_SSB_POSSIBLE=y

#
# Sonics Silicon Backplane
#
CONFIG_SSB=y
CONFIG_SSB_SPROM=y
CONFIG_SSB_PCIHOST_POSSIBLE=y
CONFIG_SSB_PCIHOST=y
# CONFIG_SSB_B43_PCI_BRIDGE is not set
# CONFIG_SSB_SILENT is not set
CONFIG_SSB_DEBUG=y
CONFIG_SSB_DRIVER_PCICORE_POSSIBLE=y
# CONFIG_SSB_DRIVER_PCICORE is not set
CONFIG_SSB_DRIVER_GPIO=y
CONFIG_BCMA_POSSIBLE=y

#
# Broadcom specific AMBA
#
# CONFIG_BCMA is not set

#
# Multifunction device drivers
#
CONFIG_MFD_CORE=y
CONFIG_MFD_ACT8945A=y
CONFIG_MFD_AS3711=y
# CONFIG_MFD_AS3722 is not set
CONFIG_PMIC_ADP5520=y
# CONFIG_MFD_AAT2870_CORE is not set
# CONFIG_MFD_ATMEL_FLEXCOM is not set
# CONFIG_MFD_ATMEL_HLCDC is not set
CONFIG_MFD_BCM590XX=y
CONFIG_MFD_AXP20X=y
CONFIG_MFD_AXP20X_I2C=y
CONFIG_MFD_CROS_EC=y
CONFIG_MFD_CROS_EC_I2C=y
# CONFIG_PMIC_DA903X is not set
CONFIG_PMIC_DA9052=y
CONFIG_MFD_DA9052_I2C=y
# CONFIG_MFD_DA9055 is not set
# CONFIG_MFD_DA9062 is not set
# CONFIG_MFD_DA9063 is not set
CONFIG_MFD_DA9150=y
# CONFIG_MFD_DLN2 is not set
CONFIG_MFD_MC13XXX=y
CONFIG_MFD_MC13XXX_I2C=y
# CONFIG_MFD_HI6421_PMIC is not set
# CONFIG_HTC_PASIC3 is not set
# CONFIG_HTC_I2CPLD is not set
# CONFIG_LPC_ICH is not set
# CONFIG_LPC_SCH is not set
CONFIG_INTEL_SOC_PMIC=y
# CONFIG_MFD_INTEL_LPSS_ACPI is not set
# CONFIG_MFD_INTEL_LPSS_PCI is not set
# CONFIG_MFD_JANZ_CMODIO is not set
CONFIG_MFD_KEMPLD=y
CONFIG_MFD_88PM800=y
# CONFIG_MFD_88PM805 is not set
CONFIG_MFD_88PM860X=y
CONFIG_MFD_MAX14577=y
CONFIG_MFD_MAX77686=y
CONFIG_MFD_MAX77693=y
CONFIG_MFD_MAX77843=y
CONFIG_MFD_MAX8907=y
# CONFIG_MFD_MAX8925 is not set
# CONFIG_MFD_MAX8997 is not set
# CONFIG_MFD_MAX8998 is not set
CONFIG_MFD_MT6397=y
# CONFIG_MFD_MENF21BMC is not set
CONFIG_MFD_VIPERBOARD=y
# CONFIG_MFD_RETU is not set
# CONFIG_MFD_PCF50633 is not set
# CONFIG_MFD_RDC321X is not set
# CONFIG_MFD_RTSX_PCI is not set
# CONFIG_MFD_RT5033 is not set
CONFIG_MFD_RTSX_USB=y
# CONFIG_MFD_RC5T583 is not set
# CONFIG_MFD_RK808 is not set
# CONFIG_MFD_RN5T618 is not set
# CONFIG_MFD_SEC_CORE is not set
# CONFIG_MFD_SI476X_CORE is not set
# CONFIG_MFD_SM501 is not set
# CONFIG_MFD_SKY81452 is not set
CONFIG_MFD_SMSC=y
# CONFIG_ABX500_CORE is not set
# CONFIG_MFD_STMPE is not set
CONFIG_MFD_SYSCON=y
CONFIG_MFD_TI_AM335X_TSCADC=y
CONFIG_MFD_LP3943=y
# CONFIG_MFD_LP8788 is not set
# CONFIG_MFD_PALMAS is not set
CONFIG_TPS6105X=y
# CONFIG_TPS65010 is not set
# CONFIG_TPS6507X is not set
CONFIG_MFD_TPS65086=y
CONFIG_MFD_TPS65090=y
CONFIG_MFD_TPS65217=y
CONFIG_MFD_TPS65218=y
# CONFIG_MFD_TPS6586X is not set
# CONFIG_MFD_TPS65910 is not set
# CONFIG_MFD_TPS65912_I2C is not set
CONFIG_MFD_TPS80031=y
CONFIG_TWL4030_CORE=y
# CONFIG_MFD_TWL4030_AUDIO is not set
CONFIG_TWL6040_CORE=y
CONFIG_MFD_WL1273_CORE=y
CONFIG_MFD_LM3533=y
CONFIG_MFD_TC3589X=y
# CONFIG_MFD_TMIO is not set
# CONFIG_MFD_VX855 is not set
CONFIG_MFD_ARIZONA=y
CONFIG_MFD_ARIZONA_I2C=y
CONFIG_MFD_CS47L24=y
CONFIG_MFD_WM5102=y
CONFIG_MFD_WM5110=y
CONFIG_MFD_WM8997=y
# CONFIG_MFD_WM8998 is not set
# CONFIG_MFD_WM8400 is not set
CONFIG_MFD_WM831X=y
CONFIG_MFD_WM831X_I2C=y
# CONFIG_MFD_WM8350_I2C is not set
CONFIG_MFD_WM8994=y
CONFIG_REGULATOR=y
CONFIG_REGULATOR_DEBUG=y
CONFIG_REGULATOR_FIXED_VOLTAGE=y
# CONFIG_REGULATOR_VIRTUAL_CONSUMER is not set
CONFIG_REGULATOR_USERSPACE_CONSUMER=y
CONFIG_REGULATOR_88PM800=y
CONFIG_REGULATOR_88PM8607=y
CONFIG_REGULATOR_ACT8865=y
# CONFIG_REGULATOR_ACT8945A is not set
CONFIG_REGULATOR_AD5398=y
CONFIG_REGULATOR_ANATOP=y
CONFIG_REGULATOR_AS3711=y
CONFIG_REGULATOR_AXP20X=y
CONFIG_REGULATOR_BCM590XX=y
# CONFIG_REGULATOR_DA9052 is not set
CONFIG_REGULATOR_DA9210=y
CONFIG_REGULATOR_DA9211=y
# CONFIG_REGULATOR_FAN53555 is not set
# CONFIG_REGULATOR_GPIO is not set
CONFIG_REGULATOR_ISL9305=y
CONFIG_REGULATOR_ISL6271A=y
# CONFIG_REGULATOR_LP3971 is not set
CONFIG_REGULATOR_LP3972=y
# CONFIG_REGULATOR_LP872X is not set
CONFIG_REGULATOR_LP8755=y
CONFIG_REGULATOR_LTC3589=y
CONFIG_REGULATOR_MAX14577=y
CONFIG_REGULATOR_MAX1586=y
CONFIG_REGULATOR_MAX8649=y
CONFIG_REGULATOR_MAX8660=y
CONFIG_REGULATOR_MAX8907=y
CONFIG_REGULATOR_MAX8952=y
# CONFIG_REGULATOR_MAX8973 is not set
# CONFIG_REGULATOR_MAX77686 is not set
# CONFIG_REGULATOR_MAX77693 is not set
CONFIG_REGULATOR_MAX77802=y
CONFIG_REGULATOR_MC13XXX_CORE=y
CONFIG_REGULATOR_MC13783=y
CONFIG_REGULATOR_MC13892=y
CONFIG_REGULATOR_MT6311=y
CONFIG_REGULATOR_MT6397=y
CONFIG_REGULATOR_PFUZE100=y
CONFIG_REGULATOR_PV88060=y
CONFIG_REGULATOR_PV88090=y
CONFIG_REGULATOR_PWM=y
CONFIG_REGULATOR_TPS51632=y
# CONFIG_REGULATOR_TPS6105X is not set
CONFIG_REGULATOR_TPS62360=y
CONFIG_REGULATOR_TPS65023=y
# CONFIG_REGULATOR_TPS6507X is not set
CONFIG_REGULATOR_TPS65086=y
# CONFIG_REGULATOR_TPS65090 is not set
CONFIG_REGULATOR_TPS65217=y
CONFIG_REGULATOR_TPS65218=y
CONFIG_REGULATOR_TPS80031=y
# CONFIG_REGULATOR_TWL4030 is not set
CONFIG_REGULATOR_WM831X=y
CONFIG_REGULATOR_WM8994=y
CONFIG_MEDIA_SUPPORT=y

#
# Multimedia core support
#
# CONFIG_MEDIA_CAMERA_SUPPORT is not set
CONFIG_MEDIA_ANALOG_TV_SUPPORT=y
# CONFIG_MEDIA_DIGITAL_TV_SUPPORT is not set
CONFIG_MEDIA_RADIO_SUPPORT=y
# CONFIG_MEDIA_SDR_SUPPORT is not set
# CONFIG_MEDIA_RC_SUPPORT is not set
CONFIG_MEDIA_CONTROLLER=y
# CONFIG_MEDIA_CONTROLLER_DVB is not set
CONFIG_VIDEO_DEV=y
CONFIG_VIDEO_V4L2_SUBDEV_API=y
CONFIG_VIDEO_V4L2=y
# CONFIG_VIDEO_ADV_DEBUG is not set
# CONFIG_VIDEO_FIXED_MINOR_RANGES is not set
# CONFIG_V4L2_FLASH_LED_CLASS is not set
# CONFIG_TTPCI_EEPROM is not set

#
# Media drivers
#
# CONFIG_MEDIA_USB_SUPPORT is not set
# CONFIG_MEDIA_PCI_SUPPORT is not set

#
# Supported MMC/SDIO adapters
#
# CONFIG_RADIO_ADAPTERS is not set
# CONFIG_CYPRESS_FIRMWARE is not set

#
# Media ancillary drivers (tuners, sensors, i2c, frontends)
#
# CONFIG_MEDIA_SUBDRV_AUTOSELECT is not set

#
# Encoders, decoders, sensors and other helper chips
#

#
# Audio decoders, processors and mixers
#
CONFIG_VIDEO_TVAUDIO=y
CONFIG_VIDEO_TDA7432=y
# CONFIG_VIDEO_TDA9840 is not set
CONFIG_VIDEO_TEA6415C=y
CONFIG_VIDEO_TEA6420=y
CONFIG_VIDEO_MSP3400=y
# CONFIG_VIDEO_CS3308 is not set
CONFIG_VIDEO_CS5345=y
CONFIG_VIDEO_CS53L32A=y
# CONFIG_VIDEO_TLV320AIC23B is not set
CONFIG_VIDEO_UDA1342=y
CONFIG_VIDEO_WM8775=y
CONFIG_VIDEO_WM8739=y
CONFIG_VIDEO_VP27SMPX=y
CONFIG_VIDEO_SONY_BTF_MPX=y

#
# RDS decoders
#
# CONFIG_VIDEO_SAA6588 is not set

#
# Video decoders
#
CONFIG_VIDEO_ADV7180=y
CONFIG_VIDEO_ADV7183=y
CONFIG_VIDEO_ADV7604=y
# CONFIG_VIDEO_ADV7842 is not set
CONFIG_VIDEO_BT819=y
CONFIG_VIDEO_BT856=y
# CONFIG_VIDEO_BT866 is not set
CONFIG_VIDEO_KS0127=y
# CONFIG_VIDEO_ML86V7667 is not set
CONFIG_VIDEO_SAA7110=y
CONFIG_VIDEO_SAA711X=y
CONFIG_VIDEO_TC358743=y
CONFIG_VIDEO_TVP514X=y
# CONFIG_VIDEO_TVP5150 is not set
CONFIG_VIDEO_TVP7002=y
CONFIG_VIDEO_TW2804=y
CONFIG_VIDEO_TW9903=y
CONFIG_VIDEO_TW9906=y
CONFIG_VIDEO_VPX3220=y

#
# Video and audio decoders
#
CONFIG_VIDEO_SAA717X=y
CONFIG_VIDEO_CX25840=y

#
# Video encoders
#
CONFIG_VIDEO_SAA7127=y
# CONFIG_VIDEO_SAA7185 is not set
CONFIG_VIDEO_ADV7170=y
# CONFIG_VIDEO_ADV7175 is not set
CONFIG_VIDEO_ADV7343=y
# CONFIG_VIDEO_ADV7393 is not set
CONFIG_VIDEO_ADV7511=y
CONFIG_VIDEO_AD9389B=y
CONFIG_VIDEO_AK881X=y
CONFIG_VIDEO_THS8200=y

#
# Camera sensor devices
#
# CONFIG_VIDEO_OV9650 is not set
# CONFIG_VIDEO_S5K4ECGX is not set
CONFIG_VIDEO_S5K5BAF=y

#
# Flash devices
#

#
# Video improvement chips
#
CONFIG_VIDEO_UPD64031A=y
CONFIG_VIDEO_UPD64083=y

#
# Audio/Video compression chips
#
CONFIG_VIDEO_SAA6752HS=y

#
# Miscellaneous helper chips
#
# CONFIG_VIDEO_THS7303 is not set
# CONFIG_VIDEO_M52790 is not set

#
# Sensors used on soc_camera driver
#
CONFIG_MEDIA_TUNER=y

#
# Customize TV tuners
#
# CONFIG_MEDIA_TUNER_SIMPLE is not set
CONFIG_MEDIA_TUNER_TDA8290=y
CONFIG_MEDIA_TUNER_TDA827X=y
CONFIG_MEDIA_TUNER_TDA18271=y
CONFIG_MEDIA_TUNER_TDA9887=y
CONFIG_MEDIA_TUNER_TEA5761=y
CONFIG_MEDIA_TUNER_TEA5767=y
CONFIG_MEDIA_TUNER_MT20XX=y
# CONFIG_MEDIA_TUNER_MT2060 is not set
# CONFIG_MEDIA_TUNER_MT2063 is not set
CONFIG_MEDIA_TUNER_MT2266=y
CONFIG_MEDIA_TUNER_MT2131=y
CONFIG_MEDIA_TUNER_QT1010=y
CONFIG_MEDIA_TUNER_XC2028=y
CONFIG_MEDIA_TUNER_XC5000=y
CONFIG_MEDIA_TUNER_XC4000=y
# CONFIG_MEDIA_TUNER_MXL5005S is not set
CONFIG_MEDIA_TUNER_MXL5007T=y
CONFIG_MEDIA_TUNER_MC44S803=y
CONFIG_MEDIA_TUNER_MAX2165=y
CONFIG_MEDIA_TUNER_TDA18218=y
CONFIG_MEDIA_TUNER_FC0011=y
# CONFIG_MEDIA_TUNER_FC0012 is not set
CONFIG_MEDIA_TUNER_FC0013=y
CONFIG_MEDIA_TUNER_TDA18212=y
# CONFIG_MEDIA_TUNER_E4000 is not set
CONFIG_MEDIA_TUNER_FC2580=y
CONFIG_MEDIA_TUNER_M88RS6000T=y
CONFIG_MEDIA_TUNER_TUA9001=y
CONFIG_MEDIA_TUNER_SI2157=y
# CONFIG_MEDIA_TUNER_IT913X is not set
CONFIG_MEDIA_TUNER_R820T=y
# CONFIG_MEDIA_TUNER_MXL301RF is not set
CONFIG_MEDIA_TUNER_QM1D1C0042=y

#
# Customise DVB Frontends
#
CONFIG_DVB_AU8522=y
CONFIG_DVB_AU8522_V4L=y
CONFIG_DVB_TUNER_DIB0070=y
CONFIG_DVB_TUNER_DIB0090=y

#
# Tools to develop new frontends
#
# CONFIG_DVB_DUMMY_FE is not set

#
# Graphics support
#
# CONFIG_AGP is not set
CONFIG_VGA_ARB=y
CONFIG_VGA_ARB_MAX_GPUS=16
# CONFIG_VGA_SWITCHEROO is not set
# CONFIG_DRM is not set

#
# ACP (Audio CoProcessor) Configuration
#
# CONFIG_DRM_AMD_ACP is not set

#
# Frame buffer Devices
#
CONFIG_FB=y
CONFIG_FIRMWARE_EDID=y
CONFIG_FB_CMDLINE=y
CONFIG_FB_NOTIFY=y
# CONFIG_FB_DDC is not set
# CONFIG_FB_BOOT_VESA_SUPPORT is not set
CONFIG_FB_CFB_FILLRECT=y
CONFIG_FB_CFB_COPYAREA=y
CONFIG_FB_CFB_IMAGEBLIT=y
# CONFIG_FB_CFB_REV_PIXELS_IN_BYTE is not set
CONFIG_FB_SYS_FILLRECT=y
CONFIG_FB_SYS_COPYAREA=y
CONFIG_FB_SYS_IMAGEBLIT=y
# CONFIG_FB_FOREIGN_ENDIAN is not set
CONFIG_FB_SYS_FOPS=y
CONFIG_FB_DEFERRED_IO=y
CONFIG_FB_HECUBA=y
# CONFIG_FB_SVGALIB is not set
# CONFIG_FB_MACMODES is not set
CONFIG_FB_BACKLIGHT=y
CONFIG_FB_MODE_HELPERS=y
CONFIG_FB_TILEBLITTING=y

#
# Frame buffer hardware drivers
#
# CONFIG_FB_CIRRUS is not set
# CONFIG_FB_PM2 is not set
# CONFIG_FB_CYBER2000 is not set
CONFIG_FB_ARC=y
# CONFIG_FB_ASILIANT is not set
# CONFIG_FB_IMSTT is not set
# CONFIG_FB_VGA16 is not set
# CONFIG_FB_VESA is not set
CONFIG_FB_N411=y
# CONFIG_FB_HGA is not set
CONFIG_FB_OPENCORES=y
# CONFIG_FB_S1D13XXX is not set
# CONFIG_FB_NVIDIA is not set
# CONFIG_FB_RIVA is not set
# CONFIG_FB_I740 is not set
# CONFIG_FB_LE80578 is not set
# CONFIG_FB_MATROX is not set
# CONFIG_FB_RADEON is not set
# CONFIG_FB_ATY128 is not set
# CONFIG_FB_ATY is not set
# CONFIG_FB_S3 is not set
# CONFIG_FB_SAVAGE is not set
# CONFIG_FB_SIS is not set
# CONFIG_FB_VIA is not set
# CONFIG_FB_NEOMAGIC is not set
# CONFIG_FB_KYRO is not set
# CONFIG_FB_3DFX is not set
# CONFIG_FB_VOODOO1 is not set
# CONFIG_FB_VT8623 is not set
# CONFIG_FB_TRIDENT is not set
# CONFIG_FB_ARK is not set
# CONFIG_FB_PM3 is not set
# CONFIG_FB_CARMINE is not set
CONFIG_FB_SMSCUFX=y
CONFIG_FB_UDL=y
# CONFIG_FB_IBM_GXT4500 is not set
CONFIG_FB_VIRTUAL=y
CONFIG_FB_METRONOME=y
# CONFIG_FB_MB862XX is not set
CONFIG_FB_BROADSHEET=y
# CONFIG_FB_AUO_K190X is not set
CONFIG_FB_SIMPLE=y
CONFIG_FB_SSD1307=y
# CONFIG_FB_SM712 is not set
CONFIG_BACKLIGHT_LCD_SUPPORT=y
CONFIG_LCD_CLASS_DEVICE=y
CONFIG_LCD_PLATFORM=y
CONFIG_BACKLIGHT_CLASS_DEVICE=y
CONFIG_BACKLIGHT_GENERIC=y
# CONFIG_BACKLIGHT_LM3533 is not set
CONFIG_BACKLIGHT_PWM=y
CONFIG_BACKLIGHT_DA9052=y
# CONFIG_BACKLIGHT_APPLE is not set
CONFIG_BACKLIGHT_PM8941_WLED=y
# CONFIG_BACKLIGHT_SAHARA is not set
CONFIG_BACKLIGHT_WM831X=y
CONFIG_BACKLIGHT_ADP5520=y
CONFIG_BACKLIGHT_ADP8860=y
CONFIG_BACKLIGHT_ADP8870=y
CONFIG_BACKLIGHT_88PM860X=y
# CONFIG_BACKLIGHT_LM3630A is not set
# CONFIG_BACKLIGHT_LM3639 is not set
# CONFIG_BACKLIGHT_LP855X is not set
CONFIG_BACKLIGHT_PANDORA=y
CONFIG_BACKLIGHT_TPS65217=y
CONFIG_BACKLIGHT_AS3711=y
CONFIG_BACKLIGHT_GPIO=y
# CONFIG_BACKLIGHT_LV5207LP is not set
CONFIG_BACKLIGHT_BD6107=y
# CONFIG_VGASTATE is not set
CONFIG_HDMI=y
# CONFIG_LOGO is not set
CONFIG_SOUND=y
# CONFIG_SOUND_OSS_CORE is not set
# CONFIG_SND is not set
# CONFIG_SOUND_PRIME is not set

#
# HID support
#
CONFIG_HID=y
# CONFIG_HID_BATTERY_STRENGTH is not set
CONFIG_HIDRAW=y
CONFIG_UHID=y
CONFIG_HID_GENERIC=y

#
# Special HID drivers
#
CONFIG_HID_A4TECH=y
CONFIG_HID_ACRUX=y
CONFIG_HID_ACRUX_FF=y
# CONFIG_HID_APPLE is not set
# CONFIG_HID_AUREAL is not set
CONFIG_HID_BELKIN=y
CONFIG_HID_CHERRY=y
CONFIG_HID_CHICONY=y
# CONFIG_HID_CORSAIR is not set
CONFIG_HID_CMEDIA=y
# CONFIG_HID_CYPRESS is not set
CONFIG_HID_DRAGONRISE=y
# CONFIG_DRAGONRISE_FF is not set
CONFIG_HID_EMS_FF=y
# CONFIG_HID_ELECOM is not set
# CONFIG_HID_EZKEY is not set
CONFIG_HID_GEMBIRD=y
# CONFIG_HID_GFRM is not set
CONFIG_HID_KEYTOUCH=y
CONFIG_HID_KYE=y
# CONFIG_HID_WALTOP is not set
CONFIG_HID_GYRATION=y
# CONFIG_HID_ICADE is not set
CONFIG_HID_TWINHAN=y
CONFIG_HID_KENSINGTON=y
CONFIG_HID_LCPOWER=y
CONFIG_HID_LENOVO=y
CONFIG_HID_LOGITECH=y
# CONFIG_HID_LOGITECH_DJ is not set
# CONFIG_HID_LOGITECH_HIDPP is not set
CONFIG_LOGITECH_FF=y
CONFIG_LOGIRUMBLEPAD2_FF=y
# CONFIG_LOGIG940_FF is not set
# CONFIG_LOGIWHEELS_FF is not set
# CONFIG_HID_MAGICMOUSE is not set
CONFIG_HID_MICROSOFT=y
CONFIG_HID_MONTEREY=y
CONFIG_HID_MULTITOUCH=y
CONFIG_HID_ORTEK=y
CONFIG_HID_PANTHERLORD=y
# CONFIG_PANTHERLORD_FF is not set
CONFIG_HID_PETALYNX=y
CONFIG_HID_PICOLCD=y
CONFIG_HID_PICOLCD_FB=y
# CONFIG_HID_PICOLCD_BACKLIGHT is not set
CONFIG_HID_PICOLCD_LCD=y
CONFIG_HID_PICOLCD_LEDS=y
CONFIG_HID_PLANTRONICS=y
CONFIG_HID_PRIMAX=y
CONFIG_HID_SAITEK=y
CONFIG_HID_SAMSUNG=y
CONFIG_HID_SPEEDLINK=y
# CONFIG_HID_STEELSERIES is not set
CONFIG_HID_SUNPLUS=y
# CONFIG_HID_RMI is not set
CONFIG_HID_GREENASIA=y
CONFIG_GREENASIA_FF=y
# CONFIG_HID_SMARTJOYPLUS is not set
CONFIG_HID_TIVO=y
CONFIG_HID_TOPSEED=y
# CONFIG_HID_THINGM is not set
# CONFIG_HID_THRUSTMASTER is not set
# CONFIG_HID_WACOM is not set
# CONFIG_HID_WIIMOTE is not set
# CONFIG_HID_XINMO is not set
CONFIG_HID_ZEROPLUS=y
# CONFIG_ZEROPLUS_FF is not set
# CONFIG_HID_ZYDACRON is not set
CONFIG_HID_SENSOR_HUB=y
CONFIG_HID_SENSOR_CUSTOM_SENSOR=y

#
# USB HID support
#
# CONFIG_USB_HID is not set
CONFIG_HID_PID=y

#
# USB HID Boot Protocol drivers
#
CONFIG_USB_KBD=y
# CONFIG_USB_MOUSE is not set

#
# I2C HID support
#
CONFIG_I2C_HID=y
CONFIG_USB_OHCI_LITTLE_ENDIAN=y
CONFIG_USB_SUPPORT=y
CONFIG_USB_COMMON=y
CONFIG_USB_ARCH_HAS_HCD=y
CONFIG_USB=y
CONFIG_USB_ANNOUNCE_NEW_DEVICES=y

#
# Miscellaneous USB options
#
# CONFIG_USB_DEFAULT_PERSIST is not set
# CONFIG_USB_DYNAMIC_MINORS is not set
# CONFIG_USB_OTG is not set
CONFIG_USB_OTG_WHITELIST=y
# CONFIG_USB_OTG_BLACKLIST_HUB is not set
CONFIG_USB_ULPI_BUS=y
# CONFIG_USB_MON is not set
CONFIG_USB_WUSB_CBAF=y
# CONFIG_USB_WUSB_CBAF_DEBUG is not set

#
# USB Host Controller Drivers
#
CONFIG_USB_C67X00_HCD=y
# CONFIG_USB_XHCI_HCD is not set
CONFIG_USB_EHCI_HCD=y
CONFIG_USB_EHCI_ROOT_HUB_TT=y
# CONFIG_USB_EHCI_TT_NEWSCHED is not set
CONFIG_USB_EHCI_PCI=y
CONFIG_USB_EHCI_HCD_PLATFORM=y
# CONFIG_USB_OXU210HP_HCD is not set
# CONFIG_USB_ISP116X_HCD is not set
CONFIG_USB_ISP1362_HCD=y
CONFIG_USB_FOTG210_HCD=y
CONFIG_USB_OHCI_HCD=y
CONFIG_USB_OHCI_HCD_PCI=y
# CONFIG_USB_OHCI_HCD_SSB is not set
# CONFIG_USB_OHCI_HCD_PLATFORM is not set
# CONFIG_USB_UHCI_HCD is not set
CONFIG_USB_SL811_HCD=y
CONFIG_USB_SL811_HCD_ISO=y
CONFIG_USB_R8A66597_HCD=y
# CONFIG_USB_HCD_SSB is not set
# CONFIG_USB_HCD_TEST_MODE is not set

#
# USB Device Class drivers
#
CONFIG_USB_ACM=y
CONFIG_USB_PRINTER=y
# CONFIG_USB_WDM is not set
# CONFIG_USB_TMC is not set

#
# NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
#

#
# also be needed; see USB_STORAGE Help for more info
#

#
# USB Imaging devices
#
CONFIG_USB_MDC800=y
# CONFIG_USBIP_CORE is not set
CONFIG_USB_MUSB_HDRC=y
# CONFIG_USB_MUSB_HOST is not set
# CONFIG_USB_MUSB_GADGET is not set
CONFIG_USB_MUSB_DUAL_ROLE=y

#
# Platform Glue Layer
#

#
# MUSB DMA mode
#
CONFIG_MUSB_PIO_ONLY=y
# CONFIG_USB_DWC3 is not set
CONFIG_USB_DWC2=y
# CONFIG_USB_DWC2_HOST is not set

#
# Gadget/Dual-role mode requires USB Gadget support to be enabled
#
CONFIG_USB_DWC2_PERIPHERAL=y
# CONFIG_USB_DWC2_DUAL_ROLE is not set
# CONFIG_USB_DWC2_PCI is not set
# CONFIG_USB_DWC2_DEBUG is not set
CONFIG_USB_DWC2_TRACK_MISSED_SOFS=y
CONFIG_USB_CHIPIDEA=y
CONFIG_USB_CHIPIDEA_OF=y
CONFIG_USB_CHIPIDEA_PCI=y
CONFIG_USB_CHIPIDEA_UDC=y
CONFIG_USB_CHIPIDEA_HOST=y
# CONFIG_USB_ISP1760 is not set

#
# USB port drivers
#
CONFIG_USB_USS720=y
CONFIG_USB_SERIAL=y
# CONFIG_USB_SERIAL_CONSOLE is not set
CONFIG_USB_SERIAL_GENERIC=y
CONFIG_USB_SERIAL_SIMPLE=y
# CONFIG_USB_SERIAL_AIRCABLE is not set
CONFIG_USB_SERIAL_ARK3116=y
CONFIG_USB_SERIAL_BELKIN=y
CONFIG_USB_SERIAL_CH341=y
CONFIG_USB_SERIAL_WHITEHEAT=y
CONFIG_USB_SERIAL_DIGI_ACCELEPORT=y
CONFIG_USB_SERIAL_CP210X=y
CONFIG_USB_SERIAL_CYPRESS_M8=y
# CONFIG_USB_SERIAL_EMPEG is not set
CONFIG_USB_SERIAL_FTDI_SIO=y
CONFIG_USB_SERIAL_VISOR=y
CONFIG_USB_SERIAL_IPAQ=y
# CONFIG_USB_SERIAL_IR is not set
CONFIG_USB_SERIAL_EDGEPORT=y
CONFIG_USB_SERIAL_EDGEPORT_TI=y
CONFIG_USB_SERIAL_F81232=y
CONFIG_USB_SERIAL_GARMIN=y
CONFIG_USB_SERIAL_IPW=y
CONFIG_USB_SERIAL_IUU=y
CONFIG_USB_SERIAL_KEYSPAN_PDA=y
CONFIG_USB_SERIAL_KEYSPAN=y
# CONFIG_USB_SERIAL_KLSI is not set
CONFIG_USB_SERIAL_KOBIL_SCT=y
CONFIG_USB_SERIAL_MCT_U232=y
CONFIG_USB_SERIAL_METRO=y
# CONFIG_USB_SERIAL_MOS7720 is not set
CONFIG_USB_SERIAL_MOS7840=y
# CONFIG_USB_SERIAL_MXUPORT is not set
CONFIG_USB_SERIAL_NAVMAN=y
CONFIG_USB_SERIAL_PL2303=y
# CONFIG_USB_SERIAL_OTI6858 is not set
# CONFIG_USB_SERIAL_QCAUX is not set
CONFIG_USB_SERIAL_QUALCOMM=y
# CONFIG_USB_SERIAL_SPCP8X5 is not set
CONFIG_USB_SERIAL_SAFE=y
CONFIG_USB_SERIAL_SAFE_PADDED=y
CONFIG_USB_SERIAL_SIERRAWIRELESS=y
CONFIG_USB_SERIAL_SYMBOL=y
# CONFIG_USB_SERIAL_TI is not set
# CONFIG_USB_SERIAL_CYBERJACK is not set
CONFIG_USB_SERIAL_XIRCOM=y
CONFIG_USB_SERIAL_WWAN=y
CONFIG_USB_SERIAL_OPTION=y
CONFIG_USB_SERIAL_OMNINET=y
CONFIG_USB_SERIAL_OPTICON=y
CONFIG_USB_SERIAL_XSENS_MT=y
CONFIG_USB_SERIAL_WISHBONE=y
CONFIG_USB_SERIAL_SSU100=y
CONFIG_USB_SERIAL_QT2=y
CONFIG_USB_SERIAL_DEBUG=y

#
# USB Miscellaneous drivers
#
# CONFIG_USB_EMI62 is not set
CONFIG_USB_EMI26=y
# CONFIG_USB_ADUTUX is not set
CONFIG_USB_SEVSEG=y
CONFIG_USB_RIO500=y
CONFIG_USB_LEGOTOWER=y
CONFIG_USB_LCD=y
# CONFIG_USB_LED is not set
# CONFIG_USB_CYPRESS_CY7C63 is not set
CONFIG_USB_CYTHERM=y
# CONFIG_USB_IDMOUSE is not set
# CONFIG_USB_FTDI_ELAN is not set
CONFIG_USB_APPLEDISPLAY=y
# CONFIG_USB_SISUSBVGA is not set
CONFIG_USB_LD=y
# CONFIG_USB_TRANCEVIBRATOR is not set
CONFIG_USB_IOWARRIOR=y
# CONFIG_USB_TEST is not set
CONFIG_USB_EHSET_TEST_FIXTURE=y
CONFIG_USB_ISIGHTFW=y
CONFIG_USB_YUREX=y
CONFIG_USB_EZUSB_FX2=y
# CONFIG_USB_HSIC_USB3503 is not set
CONFIG_USB_LINK_LAYER_TEST=y

#
# USB Physical Layer drivers
#
CONFIG_USB_PHY=y
CONFIG_NOP_USB_XCEIV=y
# CONFIG_USB_GPIO_VBUS is not set
CONFIG_USB_ISP1301=y
CONFIG_USB_GADGET=y
CONFIG_USB_GADGET_DEBUG=y
CONFIG_USB_GADGET_VERBOSE=y
# CONFIG_USB_GADGET_DEBUG_FILES is not set
# CONFIG_USB_GADGET_DEBUG_FS is not set
CONFIG_USB_GADGET_VBUS_DRAW=2
CONFIG_USB_GADGET_STORAGE_NUM_BUFFERS=2

#
# USB Peripheral Controller
#
# CONFIG_USB_FOTG210_UDC is not set
CONFIG_USB_GR_UDC=y
# CONFIG_USB_R8A66597 is not set
CONFIG_USB_PXA27X=y
# CONFIG_USB_MV_UDC is not set
# CONFIG_USB_MV_U3D is not set
CONFIG_USB_M66592=y
# CONFIG_USB_BDC_UDC is not set
# CONFIG_USB_AMD5536UDC is not set
# CONFIG_USB_NET2272 is not set
# CONFIG_USB_NET2280 is not set
# CONFIG_USB_GOKU is not set
# CONFIG_USB_EG20T is not set
CONFIG_USB_GADGET_XILINX=y
CONFIG_USB_DUMMY_HCD=y
CONFIG_USB_LIBCOMPOSITE=y
CONFIG_USB_F_SS_LB=y
# CONFIG_USB_CONFIGFS is not set
CONFIG_USB_ZERO=y
# CONFIG_USB_ETH is not set
# CONFIG_USB_G_NCM is not set
# CONFIG_USB_GADGETFS is not set
# CONFIG_USB_FUNCTIONFS is not set
# CONFIG_USB_G_SERIAL is not set
# CONFIG_USB_G_PRINTER is not set
# CONFIG_USB_CDC_COMPOSITE is not set
# CONFIG_USB_G_HID is not set
# CONFIG_USB_G_DBGP is not set
# CONFIG_USB_G_WEBCAM is not set
# CONFIG_USB_LED_TRIG is not set
# CONFIG_UWB is not set
# CONFIG_MMC is not set
# CONFIG_MEMSTICK is not set
CONFIG_NEW_LEDS=y
CONFIG_LEDS_CLASS=y
CONFIG_LEDS_CLASS_FLASH=y

#
# LED drivers
#
CONFIG_LEDS_88PM860X=y
# CONFIG_LEDS_BCM6328 is not set
CONFIG_LEDS_BCM6358=y
CONFIG_LEDS_LM3530=y
CONFIG_LEDS_LM3533=y
# CONFIG_LEDS_LM3642 is not set
CONFIG_LEDS_PCA9532=y
CONFIG_LEDS_PCA9532_GPIO=y
CONFIG_LEDS_GPIO=y
CONFIG_LEDS_LP3944=y
CONFIG_LEDS_LP55XX_COMMON=y
CONFIG_LEDS_LP5521=y
# CONFIG_LEDS_LP5523 is not set
# CONFIG_LEDS_LP5562 is not set
CONFIG_LEDS_LP8501=y
CONFIG_LEDS_LP8860=y
# CONFIG_LEDS_CLEVO_MAIL is not set
CONFIG_LEDS_PCA955X=y
CONFIG_LEDS_PCA963X=y
CONFIG_LEDS_WM831X_STATUS=y
# CONFIG_LEDS_DA9052 is not set
CONFIG_LEDS_PWM=y
# CONFIG_LEDS_REGULATOR is not set
CONFIG_LEDS_BD2802=y
# CONFIG_LEDS_INTEL_SS4200 is not set
# CONFIG_LEDS_LT3593 is not set
CONFIG_LEDS_ADP5520=y
# CONFIG_LEDS_MC13783 is not set
CONFIG_LEDS_TCA6507=y
CONFIG_LEDS_TLC591XX=y
# CONFIG_LEDS_MAX77693 is not set
CONFIG_LEDS_LM355x=y
# CONFIG_LEDS_KTD2692 is not set
CONFIG_LEDS_IS31FL32XX=y

#
# LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)
#
CONFIG_LEDS_BLINKM=y
# CONFIG_LEDS_SYSCON is not set

#
# LED Triggers
#
CONFIG_LEDS_TRIGGERS=y
# CONFIG_LEDS_TRIGGER_TIMER is not set
CONFIG_LEDS_TRIGGER_ONESHOT=y
CONFIG_LEDS_TRIGGER_HEARTBEAT=y
# CONFIG_LEDS_TRIGGER_BACKLIGHT is not set
# CONFIG_LEDS_TRIGGER_CPU is not set
CONFIG_LEDS_TRIGGER_GPIO=y
CONFIG_LEDS_TRIGGER_DEFAULT_ON=y

#
# iptables trigger is under Netfilter config (LED target)
#
# CONFIG_LEDS_TRIGGER_TRANSIENT is not set
CONFIG_LEDS_TRIGGER_CAMERA=y
# CONFIG_ACCESSIBILITY is not set
CONFIG_EDAC_ATOMIC_SCRUB=y
CONFIG_EDAC_SUPPORT=y
# CONFIG_EDAC is not set
CONFIG_RTC_LIB=y
# CONFIG_RTC_CLASS is not set
# CONFIG_DMADEVICES is not set
# CONFIG_AUXDISPLAY is not set
# CONFIG_UIO is not set
CONFIG_VIRT_DRIVERS=y
CONFIG_VIRTIO=y

#
# Virtio drivers
#
# CONFIG_VIRTIO_PCI is not set
CONFIG_VIRTIO_BALLOON=y
# CONFIG_VIRTIO_INPUT is not set
CONFIG_VIRTIO_MMIO=y
CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES=y

#
# Microsoft Hyper-V guest support
#
# CONFIG_HYPERV is not set
CONFIG_STAGING=y
# CONFIG_SLICOSS is not set

#
# IIO staging drivers
#

#
# Accelerometers
#

#
# Analog to digital converters
#
CONFIG_AD7606=y
# CONFIG_AD7606_IFACE_PARALLEL is not set

#
# Analog digital bi-direction converters
#
CONFIG_ADT7316=y
CONFIG_ADT7316_I2C=y

#
# Capacitance to digital converters
#
CONFIG_AD7150=y
CONFIG_AD7152=y
CONFIG_AD7746=y

#
# Direct Digital Synthesis
#

#
# Digital gyroscope sensors
#

#
# Network Analyzer, Impedance Converters
#
# CONFIG_AD5933 is not set

#
# Light sensors
#
CONFIG_SENSORS_ISL29018=y
CONFIG_SENSORS_ISL29028=y
# CONFIG_TSL2583 is not set
CONFIG_TSL2x7x=y

#
# Active energy metering IC
#
# CONFIG_ADE7854 is not set

#
# Resolver to digital converters
#

#
# Triggers - standalone
#
# CONFIG_FB_SM750 is not set
# CONFIG_FB_XGI is not set

#
# Speakup console speech
#
CONFIG_STAGING_MEDIA=y

#
# Android
#
CONFIG_FIREWIRE_SERIAL=y
CONFIG_FWTTY_MAX_TOTAL_PORTS=64
CONFIG_FWTTY_MAX_CARD_PORTS=32
# CONFIG_DGNC is not set
CONFIG_GS_FPGABOOT=y
CONFIG_CRYPTO_SKEIN=y
# CONFIG_UNISYSSPAR is not set
CONFIG_MOST=y
CONFIG_MOSTCORE=y
CONFIG_AIM_CDEV=y
# CONFIG_AIM_NETWORK is not set
# CONFIG_AIM_V4L2 is not set
CONFIG_HDM_I2C=y
# CONFIG_HDM_USB is not set
CONFIG_X86_PLATFORM_DEVICES=y
# CONFIG_ACERHDF is not set
# CONFIG_ASUS_LAPTOP is not set
CONFIG_DELL_SMBIOS=y
# CONFIG_DELL_LAPTOP is not set
# CONFIG_DELL_SMO8800 is not set
# CONFIG_FUJITSU_LAPTOP is not set
# CONFIG_FUJITSU_TABLET is not set
# CONFIG_HP_ACCEL is not set
# CONFIG_HP_WIRELESS is not set
# CONFIG_PANASONIC_LAPTOP is not set
# CONFIG_THINKPAD_ACPI is not set
# CONFIG_SENSORS_HDAPS is not set
# CONFIG_INTEL_MENLOW is not set
# CONFIG_ASUS_WIRELESS is not set
# CONFIG_ACPI_WMI is not set
# CONFIG_TOPSTAR_LAPTOP is not set
# CONFIG_TOSHIBA_BT_RFKILL is not set
# CONFIG_TOSHIBA_HAPS is not set
# CONFIG_ACPI_CMPC is not set
# CONFIG_INTEL_HID_EVENT is not set
# CONFIG_INTEL_IPS is not set
# CONFIG_IBM_RTL is not set
# CONFIG_SAMSUNG_LAPTOP is not set
# CONFIG_SAMSUNG_Q10 is not set
# CONFIG_APPLE_GMUX is not set
# CONFIG_INTEL_RST is not set
# CONFIG_INTEL_SMARTCONNECT is not set
# CONFIG_PVPANIC is not set
# CONFIG_INTEL_PMC_IPC is not set
# CONFIG_SURFACE_PRO3_BUTTON is not set
CONFIG_INTEL_PUNIT_IPC=y
CONFIG_CHROME_PLATFORMS=y
CONFIG_CHROMEOS_LAPTOP=y
CONFIG_CHROMEOS_PSTORE=y
CONFIG_CROS_EC_CHARDEV=y
CONFIG_CROS_EC_LPC=y
CONFIG_CROS_EC_PROTO=y

#
# Hardware Spinlock drivers
#

#
# Clock Source drivers
#
CONFIG_CLKEVT_I8253=y
CONFIG_I8253_LOCK=y
CONFIG_CLKBLD_I8253=y
# CONFIG_ATMEL_PIT is not set
# CONFIG_SH_TIMER_CMT is not set
# CONFIG_SH_TIMER_MTU2 is not set
# CONFIG_SH_TIMER_TMU is not set
# CONFIG_EM_TIMER_STI is not set
# CONFIG_MAILBOX is not set
CONFIG_IOMMU_SUPPORT=y

#
# Generic IOMMU Pagetable Support
#
# CONFIG_AMD_IOMMU is not set

#
# Remoteproc drivers
#
# CONFIG_STE_MODEM_RPROC is not set

#
# Rpmsg drivers
#

#
# SOC (System On Chip) specific Drivers
#
# CONFIG_SUNXI_SRAM is not set
# CONFIG_SOC_TI is not set
# CONFIG_PM_DEVFREQ is not set
CONFIG_EXTCON=y

#
# Extcon Device Drivers
#
# CONFIG_EXTCON_ADC_JACK is not set
CONFIG_EXTCON_AXP288=y
CONFIG_EXTCON_GPIO=y
# CONFIG_EXTCON_MAX14577 is not set
CONFIG_EXTCON_MAX3355=y
CONFIG_EXTCON_MAX77693=y
# CONFIG_EXTCON_MAX77843 is not set
CONFIG_EXTCON_RT8973A=y
# CONFIG_EXTCON_SM5502 is not set
CONFIG_EXTCON_USB_GPIO=y
CONFIG_MEMORY=y
CONFIG_IIO=y
CONFIG_IIO_BUFFER=y
CONFIG_IIO_BUFFER_CB=y
CONFIG_IIO_KFIFO_BUF=y
CONFIG_IIO_TRIGGERED_BUFFER=y
CONFIG_IIO_CONFIGFS=y
CONFIG_IIO_TRIGGER=y
CONFIG_IIO_CONSUMERS_PER_TRIGGER=2
# CONFIG_IIO_SW_TRIGGER is not set

#
# Accelerometers
#
# CONFIG_BMA180 is not set
CONFIG_BMC150_ACCEL=y
CONFIG_BMC150_ACCEL_I2C=y
CONFIG_HID_SENSOR_ACCEL_3D=y
CONFIG_IIO_ST_ACCEL_3AXIS=y
CONFIG_IIO_ST_ACCEL_I2C_3AXIS=y
CONFIG_KXCJK1013=y
CONFIG_MMA7455=y
CONFIG_MMA7455_I2C=y
CONFIG_MMA8452=y
CONFIG_MMA9551_CORE=y
# CONFIG_MMA9551 is not set
CONFIG_MMA9553=y
# CONFIG_MXC4005 is not set
CONFIG_MXC6255=y
CONFIG_STK8312=y
CONFIG_STK8BA50=y

#
# Analog to digital converters
#
CONFIG_AD7291=y
CONFIG_AD799X=y
# CONFIG_AXP288_ADC is not set
CONFIG_DA9150_GPADC=y
# CONFIG_INA2XX_ADC is not set
CONFIG_MAX1363=y
CONFIG_MCP3422=y
# CONFIG_NAU7802 is not set
CONFIG_TI_ADC081C=y
# CONFIG_TI_AM335X_ADC is not set
# CONFIG_TWL4030_MADC is not set
# CONFIG_TWL6030_GPADC is not set
CONFIG_VF610_ADC=y
# CONFIG_VIPERBOARD_ADC is not set

#
# Amplifiers
#

#
# Chemical Sensors
#
CONFIG_ATLAS_PH_SENSOR=y
CONFIG_IAQCORE=y
CONFIG_VZ89X=y

#
# Hid Sensor IIO Common
#
CONFIG_HID_SENSOR_IIO_COMMON=y
CONFIG_HID_SENSOR_IIO_TRIGGER=y
CONFIG_IIO_MS_SENSORS_I2C=y

#
# SSP Sensor Common
#
CONFIG_IIO_ST_SENSORS_I2C=y
CONFIG_IIO_ST_SENSORS_CORE=y

#
# Digital to analog converters
#
# CONFIG_AD5064 is not set
CONFIG_AD5380=y
# CONFIG_AD5446 is not set
CONFIG_M62332=y
# CONFIG_MAX517 is not set
# CONFIG_MAX5821 is not set
# CONFIG_MCP4725 is not set
# CONFIG_VF610_DAC is not set

#
# IIO dummy driver
#
CONFIG_IIO_DUMMY_EVGEN=y
CONFIG_IIO_SIMPLE_DUMMY=y
CONFIG_IIO_SIMPLE_DUMMY_EVENTS=y
# CONFIG_IIO_SIMPLE_DUMMY_BUFFER is not set

#
# Frequency Synthesizers DDS/PLL
#

#
# Clock Generator/Distribution
#

#
# Phase-Locked Loop (PLL) frequency synthesizers
#

#
# Digital gyroscope sensors
#
CONFIG_BMG160=y
CONFIG_BMG160_I2C=y
CONFIG_HID_SENSOR_GYRO_3D=y
# CONFIG_IIO_ST_GYRO_3AXIS is not set
CONFIG_ITG3200=y

#
# Health Sensors
#

#
# Heart Rate Monitors
#
CONFIG_AFE4404=y
CONFIG_MAX30100=y

#
# Humidity sensors
#
CONFIG_DHT11=y
CONFIG_HDC100X=y
CONFIG_HTU21=y
CONFIG_SI7005=y
CONFIG_SI7020=y

#
# Inertial measurement units
#
CONFIG_KMX61=y
# CONFIG_INV_MPU6050_I2C is not set

#
# Light sensors
#
# CONFIG_ACPI_ALS is not set
CONFIG_ADJD_S311=y
CONFIG_AL3320A=y
CONFIG_APDS9300=y
CONFIG_APDS9960=y
CONFIG_BH1750=y
# CONFIG_CM32181 is not set
# CONFIG_CM3232 is not set
CONFIG_CM3323=y
# CONFIG_CM36651 is not set
# CONFIG_GP2AP020A00F is not set
CONFIG_ISL29125=y
# CONFIG_HID_SENSOR_ALS is not set
# CONFIG_HID_SENSOR_PROX is not set
# CONFIG_JSA1212 is not set
CONFIG_RPR0521=y
CONFIG_SENSORS_LM3533=y
CONFIG_LTR501=y
CONFIG_OPT3001=y
CONFIG_PA12203001=y
CONFIG_STK3310=y
CONFIG_TCS3414=y
CONFIG_TCS3472=y
# CONFIG_SENSORS_TSL2563 is not set
CONFIG_TSL4531=y
CONFIG_US5182D=y
# CONFIG_VCNL4000 is not set

#
# Magnetometer sensors
#
CONFIG_AK8975=y
# CONFIG_AK09911 is not set
# CONFIG_BMC150_MAGN is not set
CONFIG_MAG3110=y
# CONFIG_HID_SENSOR_MAGNETOMETER_3D is not set
CONFIG_MMC35240=y
# CONFIG_IIO_ST_MAGN_3AXIS is not set
CONFIG_SENSORS_HMC5843=y
CONFIG_SENSORS_HMC5843_I2C=y

#
# Inclinometer sensors
#
CONFIG_HID_SENSOR_INCLINOMETER_3D=y
# CONFIG_HID_SENSOR_DEVICE_ROTATION is not set

#
# Triggers - standalone
#
CONFIG_IIO_INTERRUPT_TRIGGER=y
CONFIG_IIO_SYSFS_TRIGGER=y

#
# Digital potentiometers
#
CONFIG_MCP4531=y
CONFIG_TPL0102=y

#
# Pressure sensors
#
# CONFIG_BMP280 is not set
# CONFIG_HID_SENSOR_PRESS is not set
CONFIG_MPL115=y
CONFIG_MPL115_I2C=y
CONFIG_MPL3115=y
CONFIG_MS5611=y
CONFIG_MS5611_I2C=y
CONFIG_MS5637=y
# CONFIG_IIO_ST_PRESS is not set
CONFIG_T5403=y

#
# Lightning sensors
#

#
# Proximity sensors
#
CONFIG_LIDAR_LITE_V2=y
CONFIG_SX9500=y

#
# Temperature sensors
#
# CONFIG_MLX90614 is not set
CONFIG_TMP006=y
# CONFIG_TSYS01 is not set
CONFIG_TSYS02D=y
# CONFIG_NTB is not set
# CONFIG_VME_BUS is not set
CONFIG_PWM=y
CONFIG_PWM_SYSFS=y
CONFIG_PWM_CRC=y
CONFIG_PWM_FSL_FTM=y
CONFIG_PWM_LP3943=y
# CONFIG_PWM_LPSS_PCI is not set
# CONFIG_PWM_LPSS_PLATFORM is not set
CONFIG_PWM_PCA9685=y
CONFIG_PWM_TWL=y
# CONFIG_PWM_TWL_LED is not set
CONFIG_IRQCHIP=y
CONFIG_ARM_GIC_MAX_NR=1
CONFIG_IPACK_BUS=y
# CONFIG_BOARD_TPCI200 is not set
# CONFIG_SERIAL_IPOCTAL is not set
CONFIG_RESET_CONTROLLER=y
CONFIG_FMC=y
# CONFIG_FMC_FAKEDEV is not set
CONFIG_FMC_TRIVIAL=y
CONFIG_FMC_WRITE_EEPROM=y
CONFIG_FMC_CHARDEV=y

#
# PHY Subsystem
#
CONFIG_GENERIC_PHY=y
CONFIG_PHY_PXA_28NM_HSIC=y
CONFIG_PHY_PXA_28NM_USB2=y
CONFIG_BCM_KONA_USB2_PHY=y
CONFIG_PHY_SAMSUNG_USB2=y
# CONFIG_PHY_EXYNOS4210_USB2 is not set
# CONFIG_PHY_EXYNOS4X12_USB2 is not set
# CONFIG_PHY_EXYNOS5250_USB2 is not set
CONFIG_PHY_TUSB1210=y
CONFIG_POWERCAP=y
CONFIG_INTEL_RAPL=y
# CONFIG_MCB is not set

#
# Performance monitor support
#
CONFIG_RAS=y
# CONFIG_THUNDERBOLT is not set

#
# Android
#
# CONFIG_ANDROID is not set
CONFIG_NVMEM=y
# CONFIG_STM is not set
CONFIG_INTEL_TH=y
# CONFIG_INTEL_TH_PCI is not set
# CONFIG_INTEL_TH_GTH is not set
CONFIG_INTEL_TH_MSU=y
CONFIG_INTEL_TH_PTI=y
CONFIG_INTEL_TH_DEBUG=y

#
# FPGA Configuration Support
#
# CONFIG_FPGA is not set

#
# Firmware Drivers
#
CONFIG_EDD=y
# CONFIG_EDD_OFF is not set
CONFIG_FIRMWARE_MEMMAP=y
# CONFIG_DELL_RBU is not set
CONFIG_DCDBAS=y
# CONFIG_DMIID is not set
CONFIG_DMI_SYSFS=y
CONFIG_DMI_SCAN_MACHINE_NON_EFI_FALLBACK=y
# CONFIG_ISCSI_IBFT_FIND is not set
# CONFIG_FW_CFG_SYSFS is not set
CONFIG_GOOGLE_FIRMWARE=y

#
# Google Firmware Drivers
#
# CONFIG_GOOGLE_MEMCONSOLE is not set

#
# File systems
#
CONFIG_DCACHE_WORD_ACCESS=y
# CONFIG_FS_POSIX_ACL is not set
CONFIG_EXPORTFS=y
CONFIG_FILE_LOCKING=y
CONFIG_MANDATORY_FILE_LOCKING=y
CONFIG_FSNOTIFY=y
# CONFIG_DNOTIFY is not set
CONFIG_INOTIFY_USER=y
CONFIG_FANOTIFY=y
# CONFIG_QUOTA is not set
# CONFIG_QUOTACTL is not set
CONFIG_AUTOFS4_FS=y
CONFIG_FUSE_FS=y
CONFIG_CUSE=y
# CONFIG_OVERLAY_FS is not set

#
# Caches
#
CONFIG_FSCACHE=y
# CONFIG_FSCACHE_STATS is not set
# CONFIG_FSCACHE_HISTOGRAM is not set
# CONFIG_FSCACHE_DEBUG is not set
# CONFIG_FSCACHE_OBJECT_LIST is not set

#
# Pseudo filesystems
#
CONFIG_PROC_FS=y
# CONFIG_PROC_KCORE is not set
CONFIG_PROC_VMCORE=y
CONFIG_PROC_SYSCTL=y
CONFIG_PROC_PAGE_MONITOR=y
CONFIG_PROC_CHILDREN=y
CONFIG_KERNFS=y
CONFIG_SYSFS=y
CONFIG_HUGETLBFS=y
CONFIG_HUGETLB_PAGE=y
CONFIG_CONFIGFS_FS=y
# CONFIG_MISC_FILESYSTEMS is not set
CONFIG_NETWORK_FILESYSTEMS=y
CONFIG_NLS=y
CONFIG_NLS_DEFAULT="iso8859-1"
# CONFIG_NLS_CODEPAGE_437 is not set
# CONFIG_NLS_CODEPAGE_737 is not set
# CONFIG_NLS_CODEPAGE_775 is not set
CONFIG_NLS_CODEPAGE_850=y
CONFIG_NLS_CODEPAGE_852=y
CONFIG_NLS_CODEPAGE_855=y
# CONFIG_NLS_CODEPAGE_857 is not set
CONFIG_NLS_CODEPAGE_860=y
# CONFIG_NLS_CODEPAGE_861 is not set
# CONFIG_NLS_CODEPAGE_862 is not set
CONFIG_NLS_CODEPAGE_863=y
CONFIG_NLS_CODEPAGE_864=y
# CONFIG_NLS_CODEPAGE_865 is not set
# CONFIG_NLS_CODEPAGE_866 is not set
CONFIG_NLS_CODEPAGE_869=y
CONFIG_NLS_CODEPAGE_936=y
CONFIG_NLS_CODEPAGE_950=y
# CONFIG_NLS_CODEPAGE_932 is not set
# CONFIG_NLS_CODEPAGE_949 is not set
CONFIG_NLS_CODEPAGE_874=y
CONFIG_NLS_ISO8859_8=y
CONFIG_NLS_CODEPAGE_1250=y
CONFIG_NLS_CODEPAGE_1251=y
CONFIG_NLS_ASCII=y
CONFIG_NLS_ISO8859_1=y
CONFIG_NLS_ISO8859_2=y
# CONFIG_NLS_ISO8859_3 is not set
CONFIG_NLS_ISO8859_4=y
CONFIG_NLS_ISO8859_5=y
CONFIG_NLS_ISO8859_6=y
CONFIG_NLS_ISO8859_7=y
CONFIG_NLS_ISO8859_9=y
# CONFIG_NLS_ISO8859_13 is not set
# CONFIG_NLS_ISO8859_14 is not set
# CONFIG_NLS_ISO8859_15 is not set
CONFIG_NLS_KOI8_R=y
CONFIG_NLS_KOI8_U=y
CONFIG_NLS_MAC_ROMAN=y
CONFIG_NLS_MAC_CELTIC=y
CONFIG_NLS_MAC_CENTEURO=y
# CONFIG_NLS_MAC_CROATIAN is not set
CONFIG_NLS_MAC_CYRILLIC=y
# CONFIG_NLS_MAC_GAELIC is not set
# CONFIG_NLS_MAC_GREEK is not set
# CONFIG_NLS_MAC_ICELAND is not set
# CONFIG_NLS_MAC_INUIT is not set
# CONFIG_NLS_MAC_ROMANIAN is not set
# CONFIG_NLS_MAC_TURKISH is not set
# CONFIG_NLS_UTF8 is not set

#
# Kernel hacking
#
CONFIG_TRACE_IRQFLAGS_SUPPORT=y

#
# printk and dmesg options
#
CONFIG_PRINTK_TIME=y
CONFIG_MESSAGE_LOGLEVEL_DEFAULT=4
# CONFIG_BOOT_PRINTK_DELAY is not set
# CONFIG_DYNAMIC_DEBUG is not set

#
# Compile-time checks and compiler options
#
# CONFIG_DEBUG_INFO is not set
# CONFIG_ENABLE_WARN_DEPRECATED is not set
# CONFIG_ENABLE_MUST_CHECK is not set
CONFIG_FRAME_WARN=8192
CONFIG_STRIP_ASM_SYMS=y
CONFIG_READABLE_ASM=y
# CONFIG_UNUSED_SYMBOLS is not set
# CONFIG_PAGE_OWNER is not set
CONFIG_DEBUG_FS=y
CONFIG_HEADERS_CHECK=y
# CONFIG_DEBUG_SECTION_MISMATCH is not set
CONFIG_SECTION_MISMATCH_WARN_ONLY=y
CONFIG_ARCH_WANT_FRAME_POINTERS=y
CONFIG_FRAME_POINTER=y
# CONFIG_STACK_VALIDATION is not set
CONFIG_DEBUG_FORCE_WEAK_PER_CPU=y
CONFIG_MAGIC_SYSRQ=y
CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=0x1
CONFIG_DEBUG_KERNEL=y

#
# Memory Debugging
#
CONFIG_PAGE_EXTENSION=y
CONFIG_DEBUG_PAGEALLOC=y
# CONFIG_DEBUG_PAGEALLOC_ENABLE_DEFAULT is not set
# CONFIG_PAGE_POISONING is not set
CONFIG_DEBUG_PAGE_REF=y
CONFIG_DEBUG_OBJECTS=y
# CONFIG_DEBUG_OBJECTS_SELFTEST is not set
CONFIG_DEBUG_OBJECTS_FREE=y
# CONFIG_DEBUG_OBJECTS_TIMERS is not set
# CONFIG_DEBUG_OBJECTS_WORK is not set
CONFIG_DEBUG_OBJECTS_RCU_HEAD=y
# CONFIG_DEBUG_OBJECTS_PERCPU_COUNTER is not set
CONFIG_DEBUG_OBJECTS_ENABLE_DEFAULT=1
# CONFIG_DEBUG_SLAB is not set
CONFIG_HAVE_DEBUG_KMEMLEAK=y
# CONFIG_DEBUG_KMEMLEAK is not set
# CONFIG_DEBUG_STACK_USAGE is not set
# CONFIG_DEBUG_VM is not set
# CONFIG_DEBUG_VIRTUAL is not set
CONFIG_DEBUG_MEMORY_INIT=y
CONFIG_HAVE_DEBUG_STACKOVERFLOW=y
CONFIG_DEBUG_STACKOVERFLOW=y
CONFIG_HAVE_ARCH_KMEMCHECK=y
CONFIG_HAVE_ARCH_KASAN=y
CONFIG_KASAN=y
# CONFIG_KASAN_OUTLINE is not set
CONFIG_KASAN_INLINE=y
CONFIG_ARCH_HAS_KCOV=y
CONFIG_KCOV=y
CONFIG_DEBUG_SHIRQ=y

#
# Debug Lockups and Hangs
#
CONFIG_LOCKUP_DETECTOR=y
CONFIG_HARDLOCKUP_DETECTOR=y
CONFIG_BOOTPARAM_HARDLOCKUP_PANIC=y
CONFIG_BOOTPARAM_HARDLOCKUP_PANIC_VALUE=1
CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC=y
CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC_VALUE=1
# CONFIG_DETECT_HUNG_TASK is not set
CONFIG_WQ_WATCHDOG=y
# CONFIG_PANIC_ON_OOPS is not set
CONFIG_PANIC_ON_OOPS_VALUE=0
CONFIG_PANIC_TIMEOUT=0
CONFIG_SCHED_DEBUG=y
# CONFIG_SCHED_INFO is not set
# CONFIG_SCHEDSTATS is not set
CONFIG_SCHED_STACK_END_CHECK=y
# CONFIG_DEBUG_TIMEKEEPING is not set
# CONFIG_TIMER_STATS is not set
# CONFIG_DEBUG_PREEMPT is not set

#
# Lock Debugging (spinlocks, mutexes, etc...)
#
CONFIG_DEBUG_RT_MUTEXES=y
CONFIG_DEBUG_SPINLOCK=y
CONFIG_DEBUG_MUTEXES=y
# CONFIG_DEBUG_WW_MUTEX_SLOWPATH is not set
CONFIG_DEBUG_LOCK_ALLOC=y
CONFIG_PROVE_LOCKING=y
CONFIG_LOCKDEP=y
CONFIG_LOCK_STAT=y
# CONFIG_DEBUG_LOCKDEP is not set
CONFIG_DEBUG_ATOMIC_SLEEP=y
CONFIG_DEBUG_LOCKING_API_SELFTESTS=y
CONFIG_LOCK_TORTURE_TEST=y
CONFIG_TRACE_IRQFLAGS=y
CONFIG_STACKTRACE=y
# CONFIG_DEBUG_KOBJECT is not set
CONFIG_DEBUG_BUGVERBOSE=y
CONFIG_DEBUG_LIST=y
CONFIG_DEBUG_PI_LIST=y
# CONFIG_DEBUG_SG is not set
# CONFIG_DEBUG_NOTIFIERS is not set
CONFIG_DEBUG_CREDENTIALS=y

#
# RCU Debugging
#
CONFIG_PROVE_RCU=y
# CONFIG_PROVE_RCU_REPEATEDLY is not set
# CONFIG_SPARSE_RCU_POINTER is not set
CONFIG_TORTURE_TEST=y
CONFIG_RCU_TORTURE_TEST=y
# CONFIG_RCU_TORTURE_TEST_RUNNABLE is not set
CONFIG_RCU_TORTURE_TEST_SLOW_PREINIT=y
CONFIG_RCU_TORTURE_TEST_SLOW_PREINIT_DELAY=3
# CONFIG_RCU_TORTURE_TEST_SLOW_INIT is not set
# CONFIG_RCU_TORTURE_TEST_SLOW_CLEANUP is not set
CONFIG_RCU_CPU_STALL_TIMEOUT=21
# CONFIG_RCU_TRACE is not set
CONFIG_RCU_EQS_DEBUG=y
CONFIG_DEBUG_WQ_FORCE_RR_CPU=y
CONFIG_NOTIFIER_ERROR_INJECTION=y
# CONFIG_PM_NOTIFIER_ERROR_INJECT is not set
CONFIG_OF_RECONFIG_NOTIFIER_ERROR_INJECT=y
# CONFIG_NETDEV_NOTIFIER_ERROR_INJECT is not set
CONFIG_FAULT_INJECTION=y
CONFIG_FAILSLAB=y
CONFIG_FAIL_PAGE_ALLOC=y
# CONFIG_FAIL_FUTEX is not set
CONFIG_FAULT_INJECTION_DEBUG_FS=y
# CONFIG_LATENCYTOP is not set
CONFIG_ARCH_HAS_DEBUG_STRICT_USER_COPY_CHECKS=y
CONFIG_USER_STACKTRACE_SUPPORT=y
CONFIG_NOP_TRACER=y
CONFIG_HAVE_FUNCTION_TRACER=y
CONFIG_HAVE_FUNCTION_GRAPH_TRACER=y
CONFIG_HAVE_FUNCTION_GRAPH_FP_TEST=y
CONFIG_HAVE_DYNAMIC_FTRACE=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=y
CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
CONFIG_HAVE_SYSCALL_TRACEPOINTS=y
CONFIG_HAVE_FENTRY=y
CONFIG_HAVE_C_RECORDMCOUNT=y
CONFIG_TRACER_MAX_TRACE=y
CONFIG_TRACE_CLOCK=y
CONFIG_RING_BUFFER=y
CONFIG_EVENT_TRACING=y
CONFIG_CONTEXT_SWITCH_TRACER=y
CONFIG_RING_BUFFER_ALLOW_SWAP=y
CONFIG_TRACING=y
CONFIG_GENERIC_TRACER=y
CONFIG_TRACING_SUPPORT=y
CONFIG_FTRACE=y
CONFIG_FUNCTION_TRACER=y
CONFIG_FUNCTION_GRAPH_TRACER=y
# CONFIG_IRQSOFF_TRACER is not set
CONFIG_PREEMPT_TRACER=y
# CONFIG_SCHED_TRACER is not set
# CONFIG_FTRACE_SYSCALLS is not set
CONFIG_TRACER_SNAPSHOT=y
CONFIG_TRACER_SNAPSHOT_PER_CPU_SWAP=y
CONFIG_TRACE_BRANCH_PROFILING=y
# CONFIG_BRANCH_PROFILE_NONE is not set
# CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
CONFIG_PROFILE_ALL_BRANCHES=y
CONFIG_TRACING_BRANCHES=y
CONFIG_BRANCH_TRACER=y
CONFIG_STACK_TRACER=y
CONFIG_UPROBE_EVENT=y
CONFIG_BPF_EVENTS=y
CONFIG_PROBE_EVENTS=y
# CONFIG_DYNAMIC_FTRACE is not set
CONFIG_FUNCTION_PROFILER=y
# CONFIG_FTRACE_STARTUP_TEST is not set
# CONFIG_MMIOTRACE is not set
# CONFIG_TRACEPOINT_BENCHMARK is not set
# CONFIG_RING_BUFFER_BENCHMARK is not set
# CONFIG_RING_BUFFER_STARTUP_TEST is not set
CONFIG_TRACE_ENUM_MAP_FILE=y
# CONFIG_TRACING_EVENTS_GPIO is not set

#
# Runtime Testing
#
# CONFIG_TEST_LIST_SORT is not set
# CONFIG_BACKTRACE_SELF_TEST is not set
CONFIG_RBTREE_TEST=y
# CONFIG_ATOMIC64_SELFTEST is not set
CONFIG_TEST_HEXDUMP=y
CONFIG_TEST_STRING_HELPERS=y
CONFIG_TEST_KSTRTOX=y
# CONFIG_TEST_PRINTF is not set
# CONFIG_TEST_BITMAP is not set
CONFIG_TEST_RHASHTABLE=y
# CONFIG_PROVIDE_OHCI1394_DMA_INIT is not set
CONFIG_BUILD_DOCSRC=y
# CONFIG_DMA_API_DEBUG is not set
CONFIG_TEST_FIRMWARE=y
CONFIG_TEST_UDELAY=y
# CONFIG_MEMTEST is not set
# CONFIG_SAMPLES is not set
CONFIG_HAVE_ARCH_KGDB=y
# CONFIG_KGDB is not set
CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=y
CONFIG_UBSAN=y
# CONFIG_UBSAN_SANITIZE_ALL is not set
# CONFIG_UBSAN_ALIGNMENT is not set
CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=y
# CONFIG_STRICT_DEVMEM is not set
CONFIG_X86_VERBOSE_BOOTUP=y
CONFIG_EARLY_PRINTK=y
# CONFIG_EARLY_PRINTK_DBGP is not set
CONFIG_X86_PTDUMP_CORE=y
CONFIG_X86_PTDUMP=y
# CONFIG_DEBUG_RODATA_TEST is not set
CONFIG_DEBUG_WX=y
CONFIG_DOUBLEFAULT=y
# CONFIG_DEBUG_TLBFLUSH is not set
CONFIG_IOMMU_STRESS=y
CONFIG_HAVE_MMIOTRACE_SUPPORT=y
CONFIG_IO_DELAY_TYPE_0X80=0
CONFIG_IO_DELAY_TYPE_0XED=1
CONFIG_IO_DELAY_TYPE_UDELAY=2
CONFIG_IO_DELAY_TYPE_NONE=3
# CONFIG_IO_DELAY_0X80 is not set
# CONFIG_IO_DELAY_0XED is not set
CONFIG_IO_DELAY_UDELAY=y
# CONFIG_IO_DELAY_NONE is not set
CONFIG_DEFAULT_IO_DELAY_TYPE=2
# CONFIG_DEBUG_BOOT_PARAMS is not set
# CONFIG_CPA_DEBUG is not set
CONFIG_OPTIMIZE_INLINING=y
# CONFIG_DEBUG_ENTRY is not set
# CONFIG_DEBUG_NMI_SELFTEST is not set
CONFIG_X86_DEBUG_FPU=y
# CONFIG_PUNIT_ATOM_DEBUG is not set

#
# Security options
#
CONFIG_KEYS=y
# CONFIG_PERSISTENT_KEYRINGS is not set
CONFIG_ENCRYPTED_KEYS=y
CONFIG_SECURITY_DMESG_RESTRICT=y
# CONFIG_SECURITY is not set
# CONFIG_SECURITYFS is not set
CONFIG_DEFAULT_SECURITY_DAC=y
CONFIG_DEFAULT_SECURITY=""
CONFIG_CRYPTO=y

#
# Crypto core or helper
#
CONFIG_CRYPTO_ALGAPI=y
CONFIG_CRYPTO_ALGAPI2=y
CONFIG_CRYPTO_AEAD=y
CONFIG_CRYPTO_AEAD2=y
CONFIG_CRYPTO_BLKCIPHER=y
CONFIG_CRYPTO_BLKCIPHER2=y
CONFIG_CRYPTO_HASH=y
CONFIG_CRYPTO_HASH2=y
CONFIG_CRYPTO_RNG=y
CONFIG_CRYPTO_RNG2=y
CONFIG_CRYPTO_RNG_DEFAULT=y
CONFIG_CRYPTO_AKCIPHER2=y
CONFIG_CRYPTO_AKCIPHER=y
CONFIG_CRYPTO_RSA=y
CONFIG_CRYPTO_MANAGER=y
CONFIG_CRYPTO_MANAGER2=y
# CONFIG_CRYPTO_USER is not set
CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=y
CONFIG_CRYPTO_GF128MUL=y
CONFIG_CRYPTO_NULL=y
CONFIG_CRYPTO_NULL2=y
CONFIG_CRYPTO_WORKQUEUE=y
CONFIG_CRYPTO_CRYPTD=y
CONFIG_CRYPTO_MCRYPTD=y
CONFIG_CRYPTO_AUTHENC=y
CONFIG_CRYPTO_ABLK_HELPER=y
CONFIG_CRYPTO_GLUE_HELPER_X86=y

#
# Authenticated Encryption with Associated Data
#
CONFIG_CRYPTO_CCM=y
# CONFIG_CRYPTO_GCM is not set
# CONFIG_CRYPTO_CHACHA20POLY1305 is not set
CONFIG_CRYPTO_SEQIV=y
CONFIG_CRYPTO_ECHAINIV=y

#
# Block modes
#
CONFIG_CRYPTO_CBC=y
CONFIG_CRYPTO_CTR=y
CONFIG_CRYPTO_CTS=y
CONFIG_CRYPTO_ECB=y
CONFIG_CRYPTO_LRW=y
# CONFIG_CRYPTO_PCBC is not set
CONFIG_CRYPTO_XTS=y
# CONFIG_CRYPTO_KEYWRAP is not set

#
# Hash modes
#
CONFIG_CRYPTO_CMAC=y
CONFIG_CRYPTO_HMAC=y
CONFIG_CRYPTO_XCBC=y
# CONFIG_CRYPTO_VMAC is not set

#
# Digest
#
CONFIG_CRYPTO_CRC32C=y
CONFIG_CRYPTO_CRC32C_INTEL=y
CONFIG_CRYPTO_CRC32=y
# CONFIG_CRYPTO_CRC32_PCLMUL is not set
# CONFIG_CRYPTO_CRCT10DIF is not set
CONFIG_CRYPTO_GHASH=y
CONFIG_CRYPTO_POLY1305=y
# CONFIG_CRYPTO_POLY1305_X86_64 is not set
CONFIG_CRYPTO_MD4=y
CONFIG_CRYPTO_MD5=y
# CONFIG_CRYPTO_MICHAEL_MIC is not set
# CONFIG_CRYPTO_RMD128 is not set
# CONFIG_CRYPTO_RMD160 is not set
# CONFIG_CRYPTO_RMD256 is not set
CONFIG_CRYPTO_RMD320=y
CONFIG_CRYPTO_SHA1=y
# CONFIG_CRYPTO_SHA1_SSSE3 is not set
CONFIG_CRYPTO_SHA256_SSSE3=y
CONFIG_CRYPTO_SHA512_SSSE3=y
CONFIG_CRYPTO_SHA1_MB=y
CONFIG_CRYPTO_SHA256=y
CONFIG_CRYPTO_SHA512=y
CONFIG_CRYPTO_TGR192=y
CONFIG_CRYPTO_WP512=y
CONFIG_CRYPTO_GHASH_CLMUL_NI_INTEL=y

#
# Ciphers
#
CONFIG_CRYPTO_AES=y
CONFIG_CRYPTO_AES_X86_64=y
CONFIG_CRYPTO_AES_NI_INTEL=y
CONFIG_CRYPTO_ANUBIS=y
CONFIG_CRYPTO_ARC4=y
CONFIG_CRYPTO_BLOWFISH=y
CONFIG_CRYPTO_BLOWFISH_COMMON=y
CONFIG_CRYPTO_BLOWFISH_X86_64=y
CONFIG_CRYPTO_CAMELLIA=y
CONFIG_CRYPTO_CAMELLIA_X86_64=y
CONFIG_CRYPTO_CAMELLIA_AESNI_AVX_X86_64=y
CONFIG_CRYPTO_CAMELLIA_AESNI_AVX2_X86_64=y
CONFIG_CRYPTO_CAST_COMMON=y
CONFIG_CRYPTO_CAST5=y
CONFIG_CRYPTO_CAST5_AVX_X86_64=y
CONFIG_CRYPTO_CAST6=y
# CONFIG_CRYPTO_CAST6_AVX_X86_64 is not set
CONFIG_CRYPTO_DES=y
CONFIG_CRYPTO_DES3_EDE_X86_64=y
# CONFIG_CRYPTO_FCRYPT is not set
CONFIG_CRYPTO_KHAZAD=y
# CONFIG_CRYPTO_SALSA20 is not set
CONFIG_CRYPTO_SALSA20_X86_64=y
CONFIG_CRYPTO_CHACHA20=y
CONFIG_CRYPTO_CHACHA20_X86_64=y
CONFIG_CRYPTO_SEED=y
CONFIG_CRYPTO_SERPENT=y
CONFIG_CRYPTO_SERPENT_SSE2_X86_64=y
CONFIG_CRYPTO_SERPENT_AVX_X86_64=y
CONFIG_CRYPTO_SERPENT_AVX2_X86_64=y
# CONFIG_CRYPTO_TEA is not set
CONFIG_CRYPTO_TWOFISH=y
CONFIG_CRYPTO_TWOFISH_COMMON=y
CONFIG_CRYPTO_TWOFISH_X86_64=y
CONFIG_CRYPTO_TWOFISH_X86_64_3WAY=y
CONFIG_CRYPTO_TWOFISH_AVX_X86_64=y

#
# Compression
#
CONFIG_CRYPTO_DEFLATE=y
CONFIG_CRYPTO_LZO=y
CONFIG_CRYPTO_842=y
CONFIG_CRYPTO_LZ4=y
CONFIG_CRYPTO_LZ4HC=y

#
# Random Number Generation
#
# CONFIG_CRYPTO_ANSI_CPRNG is not set
CONFIG_CRYPTO_DRBG_MENU=y
CONFIG_CRYPTO_DRBG_HMAC=y
# CONFIG_CRYPTO_DRBG_HASH is not set
# CONFIG_CRYPTO_DRBG_CTR is not set
CONFIG_CRYPTO_DRBG=y
CONFIG_CRYPTO_JITTERENTROPY=y
# CONFIG_CRYPTO_USER_API_HASH is not set
# CONFIG_CRYPTO_USER_API_SKCIPHER is not set
# CONFIG_CRYPTO_USER_API_RNG is not set
# CONFIG_CRYPTO_USER_API_AEAD is not set
CONFIG_CRYPTO_HW=y
CONFIG_CRYPTO_DEV_PADLOCK=y
# CONFIG_CRYPTO_DEV_PADLOCK_AES is not set
# CONFIG_CRYPTO_DEV_PADLOCK_SHA is not set
# CONFIG_CRYPTO_DEV_CCP is not set
# CONFIG_CRYPTO_DEV_QAT_DH895xCC is not set
# CONFIG_CRYPTO_DEV_QAT_C3XXX is not set
# CONFIG_CRYPTO_DEV_QAT_C62X is not set
# CONFIG_CRYPTO_DEV_QAT_DH895xCCVF is not set
# CONFIG_CRYPTO_DEV_QAT_C3XXXVF is not set
# CONFIG_CRYPTO_DEV_QAT_C62XVF is not set
# CONFIG_ASYMMETRIC_KEY_TYPE is not set

#
# Certificates for signature checking
#
# CONFIG_SYSTEM_TRUSTED_KEYRING is not set
CONFIG_HAVE_KVM=y
CONFIG_VIRTUALIZATION=y
CONFIG_BINARY_PRINTF=y

#
# Library routines
#
CONFIG_BITREVERSE=y
# CONFIG_HAVE_ARCH_BITREVERSE is not set
CONFIG_RATIONAL=y
CONFIG_GENERIC_STRNCPY_FROM_USER=y
CONFIG_GENERIC_STRNLEN_USER=y
CONFIG_GENERIC_NET_UTILS=y
CONFIG_GENERIC_FIND_FIRST_BIT=y
CONFIG_GENERIC_PCI_IOMAP=y
CONFIG_GENERIC_IOMAP=y
CONFIG_GENERIC_IO=y
CONFIG_ARCH_USE_CMPXCHG_LOCKREF=y
CONFIG_ARCH_HAS_FAST_MULTIPLIER=y
CONFIG_CRC_CCITT=y
CONFIG_CRC16=y
# CONFIG_CRC_T10DIF is not set
CONFIG_CRC_ITU_T=y
CONFIG_CRC32=y
# CONFIG_CRC32_SELFTEST is not set
# CONFIG_CRC32_SLICEBY8 is not set
# CONFIG_CRC32_SLICEBY4 is not set
CONFIG_CRC32_SARWATE=y
# CONFIG_CRC32_BIT is not set
CONFIG_CRC7=y
CONFIG_LIBCRC32C=y
# CONFIG_CRC8 is not set
# CONFIG_AUDIT_ARCH_COMPAT_GENERIC is not set
# CONFIG_RANDOM32_SELFTEST is not set
CONFIG_842_COMPRESS=y
CONFIG_842_DECOMPRESS=y
CONFIG_ZLIB_INFLATE=y
CONFIG_ZLIB_DEFLATE=y
CONFIG_LZO_COMPRESS=y
CONFIG_LZO_DECOMPRESS=y
CONFIG_LZ4_COMPRESS=y
CONFIG_LZ4HC_COMPRESS=y
CONFIG_LZ4_DECOMPRESS=y
CONFIG_XZ_DEC=y
CONFIG_XZ_DEC_X86=y
CONFIG_XZ_DEC_POWERPC=y
CONFIG_XZ_DEC_IA64=y
CONFIG_XZ_DEC_ARM=y
CONFIG_XZ_DEC_ARMTHUMB=y
CONFIG_XZ_DEC_SPARC=y
CONFIG_XZ_DEC_BCJ=y
# CONFIG_XZ_DEC_TEST is not set
CONFIG_DECOMPRESS_GZIP=y
CONFIG_DECOMPRESS_BZIP2=y
CONFIG_DECOMPRESS_LZMA=y
CONFIG_DECOMPRESS_XZ=y
CONFIG_DECOMPRESS_LZO=y
CONFIG_DECOMPRESS_LZ4=y
CONFIG_GENERIC_ALLOCATOR=y
CONFIG_REED_SOLOMON=y
CONFIG_REED_SOLOMON_DEC16=y
CONFIG_BCH=y
CONFIG_BCH_CONST_PARAMS=y
CONFIG_ASSOCIATIVE_ARRAY=y
CONFIG_HAS_IOMEM=y
CONFIG_HAS_IOPORT_MAP=y
CONFIG_HAS_DMA=y
CONFIG_DQL=y
CONFIG_NLATTR=y
CONFIG_ARCH_HAS_ATOMIC64_DEC_IF_POSITIVE=y
CONFIG_CLZ_TAB=y
# CONFIG_CORDIC is not set
# CONFIG_DDR is not set
CONFIG_IRQ_POLL=y
CONFIG_MPILIB=y
CONFIG_LIBFDT=y
# CONFIG_SG_SPLIT is not set
CONFIG_ARCH_HAS_SG_CHAIN=y
CONFIG_ARCH_HAS_PMEM_API=y
CONFIG_ARCH_HAS_MMIO_FLUSH=y
CONFIG_STACKDEPOT=y

--tim5cp3jc7as7qdo--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

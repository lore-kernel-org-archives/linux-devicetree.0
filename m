From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Subject: Re: [lkp] [printk] 34578dc67f: EIP is at vprintk_emit+0x1ea/0x600
Date: Wed, 24 Feb 2016 10:19:41 +0900
Message-ID: <20160224011941.GA7683@swordfish>
References: <87fuwk1c0o.fsf@yhuang-dev.intel.com>
 <20160223131538.GA2048@swordfish>
 <20160223155331.GA448@swordfish>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160223155331.GA448@swordfish>
Sender: linux-kernel-owner@vger.kernel.org
To: kernel test robot <ying.huang@linux.intel.com>
Cc: lkp@01.org, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Calvin Owens <calvinowens@fb.com>, Dave Jones <davej@codemonkey.org.uk>, Kyle McMartin <kyle@kernel.org>, Tejun Heo <tj@kernel.org>, Jan Kara <jack@suse.com>, Petr Mladek <pmladek@suse.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
List-Id: devicetree@vger.kernel.org


Hello,

Cc Rob, Frank, Grant

On (02/24/16 00:53), Sergey Senozhatsky wrote:
[..]
>  284 [    0.000000]  per task-struct memory footprint: 2112 bytes
>  285 [    0.000000]  per task-struct memory footprint: 2112 bytes
>  286 [    0.000000] ------------------------
>  287 [    0.000000] ------------------------
>  288 [    0.000000] | Locking API testsuite:
>  289 [    0.000000] | Locking API testsuite:
>  290 [    0.000000] ----------------------------------------------------------------------------
>  291 [    0.000000] ----------------------------------------------------------------------------
>  292 [    0.000000]                                  | spin |wlock |rlock |mutex | wsem | rsem |
>  293 [    0.000000]                                  | spin |wlock |rlock |mutex | wsem | rsem |
>  294 [    0.000000]   --------------------------------------------------------------------------
>  295 [    0.000000]   --------------------------------------------------------------------------
> 
> 
> looking at your Kernel command line
> 
> [    0.000000] Kernel command line: root=/dev/ram0 user=lkp job=/lkp/scheduled/vm-kbuild-yocto-i386-53/bisect_boot-1-yocto-minimal-i386.cgz-i386-randconfig-h1-02192137-34578dc67f38c02ccbe696e4099967884caa8e15-20160220-72722-vao2m5-0.yaml ARCH=i386 kconfig=i386-randconfig-h1-02192137 branch=linux-next/master commi     t=34578dc67f38c02ccbe696e4099967884caa8e15 BOOT_IMAGE=/pkg/linux/i386-randconfig-h1-02192137/gcc-5/34578dc67f38c02ccbe696e4099967884caa8e15/vmlinuz-4.5.0-rc4-00295-g34578dc max_uptime=600 RESULT_ROOT=/result/boot/1/vm-kbuild-yocto-i386/yocto-minimal-i386.cgz/i386-randconfig-h1-02192137/gcc-5/34578dc67f38c02ccbe69     6e4099967884caa8e15/9 LKP_SERVER=inn earlyprintk=ttyS0,115200 systemd.log_level=err debug apic=debug sysrq_always_enabled rcupdate.rcu_cpu_stall_timeout=100 pan
 ic=-1 softlockup_panic=1 nmi_watchdog=panic oops=panic load_ramdisk=2 prompt_ramdisk=0 console=ttyS0,115200 console=tty0 vga=normal rw ip=::::vm-kbuild-yo     cto-i386-53::dhcp drbd.minor_count=8
> 
> 
> - earlyprintk=ttyS0,115200
> - console=ttyS0,115200
> - console=tty0
> 
> and I see "bootconsole [earlyser0] enabled" but no "bootconsole [earlyser0] disabled" message, which
> I'd expect to see...
> 


and you get the NMI watchdog softlockup because you have a whole bunch of

   "of_overlay_destroy: Could not find overlay #6"
   "### dt-test ### of_unittest_destroy_tracked_overlays: overlay destroy failed for #6"

messages to print. seems that somehitng just pushes them in a loop.
there are too many of them:

** 16981217 printk messages dropped ** 
[   33.495591] ### dt-test ### of_unittest_destroy_tracked_overlays: overlay destroy failed for #6
** 16981217 printk messages dropped ** 
[   33.495591] ### dt-test ### of_unittest_destroy_tracked_overlays: overlay destroy failed for #6
[   33.495593] of_overlay_destroy: Could not find overlay #6
[   33.495593] of_overlay_destroy: Could not find overlay #6


 ** 16981217 printk messages dropped **



[   33.497583] of_overlay_destroy: Could not find overlay #6
[   33.497583] of_overlay_destroy: Could not find overlay #6
[   33.497584] ### dt-test ### of_unittest_destroy_tracked_overlays: overlay destroy failed for #6
[   33.497584] ### dt-test ### of_unittest_destroy_tracked_overlays: overlay destroy failed for #6
[   33.497586] of_overlay_destroy: Could not find overlay #6
[   33.497586] of_overlay_destroy: Could not find overlay #6
[   33.497587] ### dt-test ### of_unittest_destroy_tracked_overlays: overlay destroy failed for #6
[   33.497587] ### dt-test ### of_unittest_destroy_tracked_overlays: overlay destroy failed for #6
[   33.497589] of_overlay_destroy: Could not find overlay #6
[   33.497589] of_overlay_destroy: Could not find overlay #6
[   33.497589] ### dt-test ### of_unittest_destroy_tracked_overlays: overlay destroy failed for #6
[   33.497589] ### dt-test ### of_unittest_destroy_tracked_overlays: overlay destroy failed for #6
[   33.497591] of_overlay_destroy: Could not find overlay #6
[   33.497591] of_overlay_destroy: Could not find overlay #6
[   33.497592] ### dt-test ### of_unittest_destroy_tracked_overlays: overlay destroy failed for #6
[   33.497592] ### dt-test ### of_unittest_destroy_tracked_overlays: overlay destroy failed for #6
[   33.497594] of_overlay_destroy: Could not find overlay #6
[   33.497594] of_overlay_destroy: Could not find overlay #6
[   33.497595] ### dt-test ### of_unittest_destroy_tracked_overlays: overlay destroy failed for #6
[   33.497595] ### dt-test ### of_unittest_destroy_tracked_overlays: overlay destroy failed for #6
[   33.497596] of_overlay_destroy: Could not find overlay #6
[   33.497596] of_overlay_destroy: Could not find overlay #6
[   33.497597] ### dt-test ### of_unittest_destroy_tracked_overlays: overlay destroy failed for #6
[   33.497597] ### dt-test ### of_unittest_destroy_tracked_overlays: overlay destroy failed for #6
[   33.497599] of_overlay_destroy: Could not find overlay #6
[   33.497599] of_overlay_destroy: Could not find overlay #6
[   33.497600] ### dt-test ### of_unittest_destroy_tracked_overlays: overlay destroy failed for #6
[   33.497600] ### dt-test ### of_unittest_destroy_tracked_overlays: overlay destroy failed for #6
[   33.497601] of_overlay_destroy: Could not find overlay #6
[   33.497601] of_overlay_destroy: Could not find overlay #6
[   33.497602] ### dt-test ### of_unittest_destroy_tracked_overlays: overlay destroy failed for #6
[   33.497602] ### dt-test ### of_unittest_destroy_tracked_overlays: overlay destroy failed for #6
[   33.497604] of_overlay_destroy: Could not find overlay #6
[   33.497604] of_overlay_destroy: Could not find overlay #6
[   33.497605] ### dt-test ### of_unittest_destroy_tracked_overlays: overlay destroy failed for #6
[   33.497605] ### dt-test ### of_unittest_destroy_tracked_overlays: overlay destroy failed for #6




the source of "too many messages to printk" is this `while (1) loop'

static void of_unittest_destroy_tracked_overlays(void)
{
	int id, ret, defers;

	if (overlay_first_id < 0)
		return;

	/* try until no defers */
	do {
		defers = 0;
		/* remove in reverse order */
		for (id = MAX_UNITTEST_OVERLAYS - 1; id >= 0; id--) {
			if (!(overlay_id_bits[BIT_WORD(id)] & BIT_MASK(id)))
				continue;

			ret = of_overlay_destroy(id + overlay_first_id);
			if (ret != 0) {
				defers++;
				pr_warn("%s: overlay destroy failed for #%d\n",
					__func__, id + overlay_first_id);
				continue;
			}

			overlay_id_bits[BIT_WORD(id)] &= ~BIT_MASK(id);
		}
	} while (defers > 0);
}


I don't know what's the root cause of missing overlay id in idr,
but in this particular case the loop transform into /* well, "defers" should
overflow at some point, but I doubt we must count on it */

	do {
		ret = of_overlay_destroy()->idr_find()->pr_err("Could not find overlay"), return -ENODEV
		if (ret != 0) {
			pr_warn("overlay destroy failed for");
			continue;
		}

	} while (1);


the "while (1) printk();" pattern is known to be dangerous; we need to
fix printk().





so something like this perhaps.


From: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Subject: [PATCH] fix endless loop

---
 drivers/of/unittest.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index 979b6e4..5058017 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -1165,6 +1165,12 @@ static void of_unittest_destroy_tracked_overlays(void)
 				continue;
 
 			ret = of_overlay_destroy(id + overlay_first_id);
+			if (ret == -ENODEV) {
+				pr_warn("%s: no overlay to destroy for #%d\n",
+						__func__, id + overlay_first_id);
+				continue;
+			}
+
 			if (ret != 0) {
 				defers++;
 				pr_warn("%s: overlay destroy failed for #%d\n",
-- 
2.7.1

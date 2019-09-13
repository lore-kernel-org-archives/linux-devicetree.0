From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: KASAN: slab-out-of-bounds Read in handle_vmptrld
Date: Fri, 13 Sep 2019 09:34:32 +0200
Message-ID: <db02a285-ad1d-6094-6359-ba80e6d3f2e0@redhat.com>
References: <000000000000a9d4f705924cff7a@google.com>
 <87lfutei1j.fsf@vitty.brq.redhat.com>
 <5218e70e-8a80-7c5f-277b-01d9ab70692a@redhat.com>
 <20190913044614.GA120223@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190913044614.GA120223@kroah.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Vitaly Kuznetsov <vkuznets@redhat.com>, kvm@vger.kernel.org, bp@alien8.de, carlo@caione.org, catalin.marinas@arm.com, devicetree@vger.kernel.org, hpa@zytor.com, jmattson@google.com, joro@8bytes.org, khilman@baylibre.com, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, mark.rutland@arm.com, mingo@redhat.com, narmstrong@baylibre.com, rkrcmar@redhat.com, robh+dt@kernel.org, sean.j.christopherson@intel.com, syzkaller-bugs@googlegroups.com, tglx@linutronix.de, wanpengli@tencent.com, will.deacon@arm.com, x86@kernel.org, syzbot <syzbot+46f1dd7dbbe2bfb98b10@syzkaller.appspotmail.com>, Dmitry Vyukov <dvyukov@google.com>, USB list <linux-usb@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 13/09/19 06:46, Greg Kroah-Hartman wrote:
> USB drivers expect kmalloc to return DMA-able memory.  I don't know
> about specific alignment issues, that should only an issue for the host
> controller being used here, which you do not say in the above list.

I have no idea, this is just the analysis of a syzkaller report.  From 
the backtrace, it's one that ends up calling kmalloc; all of them should
have the same issue with KASAN.

The specific alignment requirement for this bug comes from this call in
usbdev_mmap:

	if (remap_pfn_range(vma, vma->vm_start,
			virt_to_phys(usbm->mem) >> PAGE_SHIFT,
			size, vma->vm_page_prot) < 0) {

> We have had some reports that usbdev_mmap() does not do the "correct
> thing" for all host controllers, but a lot of the DMA work that is in
> linux-next for 5.4-rc1 should have helped resolve those issues.  What
> tree are you seeing these bug reports happening from?

It's in master, but the relevant code is the same in linux-next; in fact
in this case there is no DMA involved at all.  hcd_buffer_alloc hits
the case "some USB hosts just use PIO".

On those host controllers, it should be reproducible with just this:

diff --git a/drivers/usb/core/usb.c b/drivers/usb/core/usb.c
index 7fcb9f782931..cc0460730bce 100644
--- a/drivers/usb/core/usb.c
+++ b/drivers/usb/core/usb.c
@@ -905,9 +905,12 @@ EXPORT_SYMBOL_GPL(__usb_get_extra_descriptor);
 void *usb_alloc_coherent(struct usb_device *dev, size_t size, gfp_t mem_flags,
 			 dma_addr_t *dma)
 {
+	void *buf;
 	if (!dev || !dev->bus)
 		return NULL;
-	return hcd_buffer_alloc(dev->bus, size, mem_flags, dma);
+	buf = hcd_buffer_alloc(dev->bus, size, mem_flags, dma);
+	WARN_ON_ONCE(virt_to_phys(buf) & ~PAGE_MASK);
+	return buf;
 }
 EXPORT_SYMBOL_GPL(usb_alloc_coherent);
 

and CONFIG_KASAN=y or possibly just CONFIG_DEBUG_SLAB=y.  mmap-ing /dev/usb
should warn if my analysis is correct.

If you think the above patch makes sense, I can test it and submit it formally.

Paolo

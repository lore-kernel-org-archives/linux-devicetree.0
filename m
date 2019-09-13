From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: KASAN: slab-out-of-bounds Read in handle_vmptrld
Date: Fri, 13 Sep 2019 17:01:22 +0200
Message-ID: <6a0ec3a2-2a52-f67a-6140-e0a60874538a@redhat.com>
References: <000000000000a9d4f705924cff7a@google.com>
 <87lfutei1j.fsf@vitty.brq.redhat.com>
 <5218e70e-8a80-7c5f-277b-01d9ab70692a@redhat.com>
 <20190913044614.GA120223@kroah.com>
 <db02a285-ad1d-6094-6359-ba80e6d3f2e0@redhat.com>
 <20190913130226.GB403359@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190913130226.GB403359@kroah.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Vitaly Kuznetsov <vkuznets@redhat.com>, kvm@vger.kernel.org, bp@alien8.de, carlo@caione.org, catalin.marinas@arm.com, devicetree@vger.kernel.org, hpa@zytor.com, jmattson@google.com, joro@8bytes.org, khilman@baylibre.com, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, mark.rutland@arm.com, mingo@redhat.com, narmstrong@baylibre.com, rkrcmar@redhat.com, robh+dt@kernel.org, sean.j.christopherson@intel.com, syzkaller-bugs@googlegroups.com, tglx@linutronix.de, wanpengli@tencent.com, will.deacon@arm.com, x86@kernel.org, syzbot <syzbot+46f1dd7dbbe2bfb98b10@syzkaller.appspotmail.com>, Dmitry Vyukov <dvyukov@google.com>, USB list <linux-usb@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 13/09/19 15:02, Greg Kroah-Hartman wrote:
> Look at linux-next, we "should" have fixed up hcd_buffer_alloc() now to
> not need this type of thing.  If we got it wrong, please let us know and
> then yes, a fix like this would be most appreciated :)

I still see

	/* some USB hosts just use PIO */
	if (!hcd_uses_dma(hcd)) {
		*dma = ~(dma_addr_t) 0;
		return kmalloc(size, mem_flags);
	}

in linux-next's hcd_buffer_alloc and also in usb.git's usb-next branch.
 I also see the same

	if (remap_pfn_range(vma, vma->vm_start,
			virt_to_phys(usbm->mem) >> PAGE_SHIFT,
			size, vma->vm_page_prot) < 0) {
		...
	}

in usbdev_mmap.  Of course it's possible that I'm looking at the wrong
branch, or just being dense.

Paolo

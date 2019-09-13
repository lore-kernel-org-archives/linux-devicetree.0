From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: KASAN: slab-out-of-bounds Read in handle_vmptrld
Date: Fri, 13 Sep 2019 18:14:26 +0200
Message-ID: <1a8a6449-2740-b0a3-805a-47466e0d71c6@redhat.com>
References: <Pine.LNX.4.44L0.1909131129390.1466-100000@iolanthe.rowland.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44L0.1909131129390.1466-100000@iolanthe.rowland.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Vitaly Kuznetsov <vkuznets@redhat.com>, kvm@vger.kernel.org, bp@alien8.de, carlo@caione.org, catalin.marinas@arm.com, devicetree@vger.kernel.org, hpa@zytor.com, jmattson@google.com, joro@8bytes.org, khilman@baylibre.com, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, mark.rutland@arm.com, mingo@redhat.com, narmstrong@baylibre.com, rkrcmar@redhat.com, robh+dt@kernel.org, sean.j.christopherson@intel.com, syzkaller-bugs@googlegroups.com, tglx@linutronix.de, wanpengli@tencent.com, will.deacon@arm.com, x86@kernel.org, syzbot <syzbot+46f1dd7dbbe2bfb98b10@syzkaller.appspotmail.com>, Dmitry Vyukov <dvyukov@google.com>, USB list <linux-usb@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 13/09/19 17:36, Alan Stern wrote:
> On Fri, 13 Sep 2019, Paolo Bonzini wrote:
> 
>> On 13/09/19 15:02, Greg Kroah-Hartman wrote:
>>> Look at linux-next, we "should" have fixed up hcd_buffer_alloc() now to
>>> not need this type of thing.  If we got it wrong, please let us know and
>>> then yes, a fix like this would be most appreciated :)
>>
>> I still see
>>
>> 	/* some USB hosts just use PIO */
>> 	if (!hcd_uses_dma(hcd)) {
>> 		*dma = ~(dma_addr_t) 0;
>> 		return kmalloc(size, mem_flags);
>> 	}
>>
>> in linux-next's hcd_buffer_alloc and also in usb.git's usb-next branch.
>>  I also see the same
>>
>> 	if (remap_pfn_range(vma, vma->vm_start,
>> 			virt_to_phys(usbm->mem) >> PAGE_SHIFT,
>> 			size, vma->vm_page_prot) < 0) {
>> 		...
>> 	}
>>
>> in usbdev_mmap.  Of course it's possible that I'm looking at the wrong
>> branch, or just being dense.
> 
> Have you seen
> 
> 	https://marc.info/?l=linux-usb&m=156758511218419&w=2
> 
> ?  It certainly is relevant, although Greg hasn't replied to it.

It helps but it's not a full fix, since the address would fail
is_vmalloc_addr.  On top of that, hcd_buffer_alloc and hcd_buffer_free
need to switch from kmalloc to vmalloc.

> Also, just warning about a non-page-aligned allocation doesn't really 
> help.  It would be better to fix the misbehaving allocator.

Of course.  The above patch does not fix the issue, it should just allow
for an easier reproduction not involving KVM.  More long term, it points
out where the contracts mismatch (i.e. between hcd_buffer_alloc and
usb_alloc_coherent), and more selfishly whose bug it is when syzkaller
complains. :)

Paolo

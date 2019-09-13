From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: KASAN: slab-out-of-bounds Read in handle_vmptrld
Date: Fri, 13 Sep 2019 23:39:03 +0200
Message-ID: <a85cee75-99f9-7de3-6e5c-86f9bb41bca5@redhat.com>
References: <000000000000a9d4f705924cff7a@google.com>
 <87lfutei1j.fsf@vitty.brq.redhat.com>
 <5218e70e-8a80-7c5f-277b-01d9ab70692a@redhat.com>
 <20190913044614.GA120223@kroah.com>
 <db02a285-ad1d-6094-6359-ba80e6d3f2e0@redhat.com>
 <20190913130226.GB403359@kroah.com>
 <6a0ec3a2-2a52-f67a-6140-e0a60874538a@redhat.com>
 <462660f4-1537-cece-b55f-0ceba0269eb8@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <462660f4-1537-cece-b55f-0ceba0269eb8@arm.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Robin Murphy <robin.murphy@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: mark.rutland@arm.com, x86@kernel.org, wanpengli@tencent.com, kvm@vger.kernel.org, narmstrong@baylibre.com, catalin.marinas@arm.com, will.deacon@arm.com, hpa@zytor.com, khilman@baylibre.com, joro@8bytes.org, rkrcmar@redhat.com, mingo@redhat.com, Dmitry Vyukov <dvyukov@google.com>, syzbot <syzbot+46f1dd7dbbe2bfb98b10@syzkaller.appspotmail.com>, devicetree@vger.kernel.org, syzkaller-bugs@googlegroups.com, robh+dt@kernel.org, bp@alien8.de, linux-amlogic@lists.infradead.org, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, jmattson@google.com, USB list <linux-usb@vger.kernel.org>, linux-kernel@vger.kernel.org, sean.j.christopherson@intel.com, carlo@caione.org, Vitaly Kuznetsov <vkuznets@redhat.com>
List-Id: devicetree@vger.kernel.org

On 13/09/19 17:32, Robin Murphy wrote:
> Oh, that bit of usbdev_mmap() is already known to be pretty much totally
> bogus for various reasons - there have been a few threads about it, of
> which I think [1] is both the most recent and the most informative.
> There was another patch[2], but that might have stalled (and might need
> reworking with additional hcd_uses_dma() checks anyway).

Neither is enough, see my reply to Alan.  Memory from kmalloc just
*cannot* be passed down to remap_pfn_range, dma_mmap_coherent or
anything like that.  It's a simple alignment issue.

Paolo

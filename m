From: John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH 1/2] usb: dwc2: add amcc,dwc-otg support
Date: Fri, 11 Nov 2016 13:22:16 -0800
Message-ID: <bfd8be90-930d-1648-e663-0e0e8c496e02@synopsys.com>
References: <b1ec4a4425388cdee36be081971484db2a7d048a.1478897792.git.chunkeey@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <b1ec4a4425388cdee36be081971484db2a7d048a.1478897792.git.chunkeey@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Christian Lamparter <chunkeey@googlemail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Cc: John Youn <John.Youn@synopsys.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <felipe.balbi@linux.intel.com>
List-Id: devicetree@vger.kernel.org

On 11/11/2016 12:59 PM, Christian Lamparter wrote:
> This patch adds support for the "amcc,usb-otg" device
> which is found in the PowerPC Canyonlands' dts.
> 
> The device definition was added by:
> commit c89b3458d8cc ("powerpc/44x: Add USB DWC DTS entry to Canyonlands board")'
> but without any driver support as the dwc2 driver wasn't
> available at that time.
> 
> Note: The system can't use the generic "snps,dwc2" compatible
> because of the special ahbcfg configuration. The default
> GAHBCFG_HBSTLEN_INCR4 of snps,dwc2 can cause a system hang
> when the USB and SATA is used concurrently.

Hi,

I don't want to add any more of these param structures to the driver
unless really necessary. We're trying to remove usage of them in favor
of using auto-detected defaults and device properties to override
them.

The AHB Burst is actually one of the ones we were going to do next
because our platform also doesn't work well with INCR4. In fact I'm
thinking of making the default INCR.

If that's all you need then a devicetree binding should be enough
right?

Regards,
John

From: Raviteja Garimella <raviteja.garimella-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 2/2] Synopsys USB 2.0 Device Controller (UDC) Driver
Date: Wed, 30 Nov 2016 18:12:19 +0530
Message-ID: <CAEHZuqNgDwJL7HCP18R_M8TZcW-mENQsfyChv0_Zmm4M2ZTOkg@mail.gmail.com>
References: <1480485910-7797-1-git-send-email-raviteja.garimella@broadcom.com>
 <1480485910-7797-3-git-send-email-raviteja.garimella@broadcom.com> <874m2pntdh.fsf@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <874m2pntdh.fsf-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, BCM Kernel Feedback <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Balbi,

On Wed, Nov 30, 2016 at 4:10 PM, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>
> Hi,
>
> Raviteja Garimella <raviteja.garimella-dY08KVG/lbpWk0Htik3J/w@public.gmane.org> writes:
>> This is driver for Synopsys Designware Cores USB Device
>> Controller (UDC) Subsystem with the AMBA Advanced High-Performance
>> Bus (AHB). This driver works with Synopsys UDC20 products.
>>
>> Signed-off-by: Raviteja Garimella <raviteja.garimella-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>
> use drivers/usb/dwc2 instead of duplicating it.

The ones we have in drivers/usb/dwc2 is for Designware high speed OTG
controller IP. The one that I submitted for review is for USB Device
controller IP (UDC). The IPs are different.

Thanks,
Ravi
>
> --
> balbi
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

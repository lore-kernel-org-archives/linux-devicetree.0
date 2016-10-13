From: James Hartley <James.Hartley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH 2/2] MIPS: DTS: img: add device tree for Marduk board
Date: Thu, 13 Oct 2016 08:49:34 +0000
Message-ID: <72BC0C8BD7BB6F45988A99382E5FBAE5889ED617@HHMAIL01.hh.imgtec.org>
References: <1475757094-31089-1-git-send-email-rahul.bedarkar@imgtec.com>
 <1475757094-31089-2-git-send-email-rahul.bedarkar@imgtec.com>
 <20161010142152.GA7920@rob-hp-laptop> <57FF3172.4010709@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <57FF3172.4010709-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rahul Bedarkar <Rahul.Bedarkar-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org" <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rahul,

> -----Original Message-----
> From: Rahul Bedarkar
> Sent: 13 October 2016 08:02
> To: Rob Herring
> Cc: Ralf Baechle; Mark Rutland; James Hartley; linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org;
> devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Subject: Re: [PATCH 2/2] MIPS: DTS: img: add device tree for Marduk board
> 
> Hi,
> 
> On Monday 10 October 2016 07:51 PM, Rob Herring wrote:
> >> +
> >> +	memory {
> >
> > Is 0 the actual base, or that gets filled in by bootloader? If the
> > formet, add unit address.
> >
> 
> Bootloader (uboot) can override or fixup memory node. But with version of
> bootloader I tested with, base address is hardcoded to 0 and only size may
> get changed. But since booloader can override or fixup memory node, I
> assume we don't add unit address in this case.
> 
> >> +		device_type = "memory";
> >> +		reg =  <0x00000000 0x08000000>;
> 
> I now realized that size is incorrectly specified in memory node. It should be
> 256MB and not 128MB. I will fix this in v2.

This is board dependent, and since you have already explained that the boot loader is expected to configure this, I would recommend leaving it at 128MB (which I believe is the size of the smallest DDR part in use on existing boards). This would mean that if for some reason the boot loader did not adjust the settings, it would still boot on all currently known boards.

James.

> 
> Thanks,
> Rahul
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

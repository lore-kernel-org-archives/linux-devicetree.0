From: James Hartley <James.Hartley@imgtec.com>
Subject: RE: [PATCH 2/2] MIPS: DTS: img: add device tree for Marduk board
Date: Thu, 13 Oct 2016 13:49:01 +0000
Message-ID: <72BC0C8BD7BB6F45988A99382E5FBAE5889EDBE5@HHMAIL01.hh.imgtec.org>
References: <1475757094-31089-1-git-send-email-rahul.bedarkar@imgtec.com>
 <1475757094-31089-2-git-send-email-rahul.bedarkar@imgtec.com>
 <20161010142152.GA7920@rob-hp-laptop> <57FF3172.4010709@imgtec.com>
 <72BC0C8BD7BB6F45988A99382E5FBAE5889ED617@HHMAIL01.hh.imgtec.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <72BC0C8BD7BB6F45988A99382E5FBAE5889ED617@HHMAIL01.hh.imgtec.org>
Content-Language: en-US
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: James Hartley <James.Hartley@imgtec.com>, Rahul Bedarkar <Rahul.Bedarkar@imgtec.com>, Rob Herring <robh@kernel.org>
Cc: Ralf Baechle <ralf@linux-mips.org>, Mark Rutland <mark.rutland@arm.com>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Rahul,

> -----Original Message-----
> From: linux-mips-bounce@linux-mips.org [mailto:linux-mips-bounce@linux-
> mips.org] On Behalf Of James Hartley
> Sent: 13 October 2016 09:50
> To: Rahul Bedarkar; Rob Herring
> Cc: Ralf Baechle; Mark Rutland; linux-mips@linux-mips.org;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: RE: [PATCH 2/2] MIPS: DTS: img: add device tree for Marduk board
> 
> Hi Rahul,
> 
> > -----Original Message-----
> > From: Rahul Bedarkar
> > Sent: 13 October 2016 08:02
> > To: Rob Herring
> > Cc: Ralf Baechle; Mark Rutland; James Hartley;
> > linux-mips@linux-mips.org; devicetree@vger.kernel.org;
> > linux-kernel@vger.kernel.org
> > Subject: Re: [PATCH 2/2] MIPS: DTS: img: add device tree for Marduk
> > board
> >
> > Hi,
> >
> > On Monday 10 October 2016 07:51 PM, Rob Herring wrote:
> > >> +
> > >> +	memory {
> > >
> > > Is 0 the actual base, or that gets filled in by bootloader? If the
> > > formet, add unit address.
> > >
> >
> > Bootloader (uboot) can override or fixup memory node. But with version
> > of bootloader I tested with, base address is hardcoded to 0 and only
> > size may get changed. But since booloader can override or fixup memory
> > node, I assume we don't add unit address in this case.
> >
> > >> +		device_type = "memory";
> > >> +		reg =  <0x00000000 0x08000000>;
> >
> > I now realized that size is incorrectly specified in memory node. It
> > should be 256MB and not 128MB. I will fix this in v2.
> 
> This is board dependent, and since you have already explained that the boot
> loader is expected to configure this, I would recommend leaving it at 128MB
> (which I believe is the size of the smallest DDR part in use on existing boards).
> This would mean that if for some reason the boot loader did not adjust the
> settings, it would still boot on all currently known boards.

So it seems the 128MB boards are not CI40 based, so since this dts is CI40 specific, it's fine to have 256MB.

James.

> 
> James.
> 
> >
> > Thanks,
> > Rahul

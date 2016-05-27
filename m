From: maitysanchayan@gmail.com
Subject: Re: [PATCH v3 4/4] soc: Add SoC driver for Freescale Vybrid platform
Date: Fri, 27 May 2016 15:38:17 +0530
Message-ID: <20160527100817.GA8294@Sanchayan-Arch.localdomain>
References: <cover.1463737502.git.maitysanchayan@gmail.com>
 <CAL_JsqKCwy=aXveTfnaQuZ5b3Ld9nzABgPfdPm1JX3CBuvzG+Q@mail.gmail.com>
 <20160527063301.GB1554@Sanchayan-Arch.localdomain>
 <9495361.v6aft1QR0M@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <9495361.v6aft1QR0M@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Stefan Agner <stefan@agner.ch>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 16-05-27 10:31:55, Arnd Bergmann wrote:
> On Friday, May 27, 2016 12:03:01 PM CEST maitysanchayan@gmail.com wrote:
> > 
> > So if I understand correctly, the binding at the SoC level is fine.
> > Keeping that but removing the additional made-up properties, viz. below
> > 
> > rom-revision: phandle to the on-chip ROM node
> > mscm: phandle to the MSCM CPU configuration node
> > nvmem-cells: phandles to two OCOTP child nodes ocotp_cfg0 and ocotp_cfg1
> > nvmem-cell-names: should contain string names "cfg0" and "cfg1"
> > 
> > would be fine?
> > 
> > We would have something similar to here
> > http://www.spinics.net/lists/devicetree/msg80655.html
> > 
> > but now with the DT binding under SoC bus.
> > 
> 
> 
> You look up the OTP device as a syscon here, which seems odd since there
> is already an nvmem driver for it. Shouldn't you use the nvmem API for
> that?
> 
> 	Arnd

I need the following 

nvmem-cells: phandles to two OCOTP child nodes ocotp_cfg0 and ocotp_cfg1
nvmem-cell-names: should contain string names "cfg0" and "cfg1"

to be able to use the NVMEM consumer API.

If I can put them at SoC node level then I certainly can use the NVMEM API.

Regards,
Sanchayan.

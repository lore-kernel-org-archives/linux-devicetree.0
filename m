From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH 2/5] mtd: nand: gpmi: add i.MX 7 SoC support
Date: Tue, 2 May 2017 11:17:58 +0200
Message-ID: <20170502111758.53e9a959@bbrezillon>
References: <20170421010755.18025-1-stefan@agner.ch>
 <20170421010755.18025-3-stefan@agner.ch>
 <af3fe671-c5fb-d3cf-c891-e6b7c973baa1@gmail.com>
 <5cf26d2b020392c875464c7504a9fb5b@agner.ch>
 <8377dadc-043f-5932-cb13-3367db38a6dd@gmail.com>
 <494a7bc044457240a302d92b3a50b8e5@agner.ch>
 <57336d7e-7b48-8855-9e87-3eb370facd05@gmail.com>
 <a9cdc47795433e7b152dcdd123f9bd63@agner.ch>
 <CA+EcR20FCPSec+ihTMA=SGwogd7p5tsnECCp3CR-Nv6fUciK4g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CA+EcR20FCPSec+ihTMA=SGwogd7p5tsnECCp3CR-Nv6fUciK4g@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Han Xu <xhnjupt@gmail.com>
Cc: mark.rutland@arm.com, Fabio Estevam <fabio.estevam@freescale.com>, devicetree@vger.kernel.org, Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>, Marek Vasut <marek.vasut@gmail.com>, robh+dt@kernel.org, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Sascha Hauer <kernel@pengutronix.de>, Han Xu <han.xu@nxp.com>, Cyrille Pitchen <cyrille.pitchen@atmel.com>, Brian Norris <computersforpeace@gmail.com>, Shawn Guo <shawnguo@kernel.org>, David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org, LW@karo-electronics.de
List-Id: devicetree@vger.kernel.org

Hi Han,

On Fri, 21 Apr 2017 13:29:16 -0500
Han Xu <xhnjupt@gmail.com> wrote:

> >>  
> >>>>> But then, adding the type would only require 2-3 lines of change if I
> >>>>> add it to the GPMI_IS_MX6 macro...  
> >>>>
> >>>> Then at least add a comment because using type = IMX6SX right under
> >>>> gpmi_data_mx7d can trigger some head-scratching. And put my R-B on V2.  
> >>>
> >>> FWIW, I mentioned it in the commit message.
> >>>
> >>> I think rather then adding a comment it is cleaner to just add IS_IMX7D
> >>> and add it to the GPMI_IS_MX6 macro. That does not need a comment since
> >>> it implicitly says we have a i.MX 7 but treat it like i.MX 6 and it is a
> >>> rather small change. Does that sound acceptable?  
> >>
> >> Sure, that's even better, thanks.
> >>
> >> btw isn't there some single-core mx7 (mx7s ?) , maybe we should just go
> >> with mx7 (without the d suffix). I dunno if it has GPMI NAND though, so
> >> maybe mx7d is the right thing to do here ...
> >>  
> >
> > There is a Solo version yes, and it has GPMI NAND too. However, almost
> > all i.MX 7 IPs have been named imx7d by NXP for some reason (including
> > compatible strings, see grep -r -e imx7 Documentation/), so I thought I
> > stay consistent here...  
> 
> Hi Guys,
> 
> Yes, there should be a i.MX7 Solo version with one core fused out. IMO, can
> we use QUIRK to distinguish them rather than SoC name. I know I also sent
> some patch set with SoC Name but I prefer to use QUIRK now.

Not sure what this means. Are you okay with Stefan's v2?

Regards,

Boris

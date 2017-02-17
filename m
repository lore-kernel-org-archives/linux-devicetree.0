From: Rask Ingemann Lambertsen <rask-SivP7zSAdNDZaaYASwVUlg@public.gmane.org>
Subject: Re: AXP808 vs. AXP806 debugged, no difference? (Was: [PATCH v6 5/5]
 ARM: dts: sun9i: Initial support for the Sunchip CX-A99 board)
Date: Fri, 17 Feb 2017 22:28:03 +0100
Message-ID: <20170217212802.erggx2hdjrmisfhn@localhost>
References: <cover.1486592470.git.rask@formelder.dk>
 <d4211c5d57f80b0281d7d332edc7d69e66202d3d.1486592471.git.rask@formelder.dk>
 <20170210085920.7l7gswm6yjuqgdfx@lukather>
 <CAGb2v64AfBW+CHHkFvvNzCGBG09UK-sPcAZi2QgCR9wM=jguxw@mail.gmail.com>
 <20170214233538.enkffjiw3kkfromu@localhost>
 <20170216211630.u3xddzzcpazlodkz@localhost>
 <CAGb2v65gpJKs8yf35cHkowxjEYNYH33nZGtmM7E6rwfTPfPdug@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAGb2v65gpJKs8yf35cHkowxjEYNYH33nZGtmM7E6rwfTPfPdug-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Feb 17, 2017 at 11:08:59AM +0800, Chen-Yu Tsai wrote:
> On Fri, Feb 17, 2017 at 5:16 AM, Rask Ingemann Lambertsen
> <rask-SivP7zSAdNDZaaYASwVUlg@public.gmane.org> wrote:
> > In summary: I'll propose a new property "extended-address" or so to the
> > existing "x-powers,axp806" compatible, because the axp808 does seem to have
> > the register at 0xff after all, it just needs a value of 0 instead of the 16
> > which drivers/mfd/axp20x.c as of recently is now writing unconditionally
> > to 0xff. A new "x-powers,axp808" compatible and new AXP808_ID is therefore
> > not needed. This should make for a simpler and smaller patch.
> 
> It might be the same core as the AXP806, though without a datasheet to actually
> confirm it, it might be best to stick to a new compatible.

Yes, an extra compatible is cheap. Also, it occurs to me that either could
turn out to have features that the other one doesn't.

FWIW, both are 56-pin devices going by board photos. I'd say they differ in
the power-on voltages. On the AXP808, I've measured (in FEL mode, assuming
that the BROM doesn't have any PMIC code at all):

aldo1	3.0 V
aldo2	off
aldo3	off
bldo1	1.8 V
bldo2	0.9 V	(here the AXP806 gives 1.8 V for DLL and PLL)
bldo3	off
bldo4	?	(haven't found it yet)
cldo1	3.3 V
cldo2	off
cldo3	off
dcdca	0.9 V
dcdcb	1.5 V
dcdcc	0.9 V
dcdcd	0.9 V
dcdce	3.3 V	(AXP806 set to 2.1 V in Optimus and Cubieboard4 dts)
sw0	?	(haven't found it yet)

It would also explain why they were given the same chip ID, as from driver
point of view, they behave in the same way. The Allwinner kernel tree also
uses the same driver (confusingly called axp15) for both.

> However, we could add a new property "x-powers,master-mode". If the driver
> sees it, it would clear bit 4, instead of setting it. The hardware bit is
> latched from the external pin, so this would be per board.

Patch coming.

-- 
Rask Ingemann Lambertsen
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

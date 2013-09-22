From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH RESEND 0/3] ARM: dts: mxs: add pinctrl header files
Date: Sun, 22 Sep 2013 14:11:43 +0800
Message-ID: <20130922061140.GA31787@S2101-09.ap.freescale.net>
References: <1379573990-27556-1-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1379573990-27556-1-git-send-email-LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lothar =?iso-8859-1?Q?Wa=DFmann?= <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 19, 2013 at 08:59:46AM +0200, Lothar Wa=DFmann wrote:
> These patches add header files for the MXS arch and convert the DTS
> files to use the pad definitions from those files rather than
> hardcoding the numerical pinctrl values.
>=20
> The conversion from numerical representation to symbolic names has
> been done with a perl script that checked the definitions for
> consistency of the pin function comments and the numerical values
> used. This revealed an inconsistency in:
> arch/arm/boot/dts/imx28-apx4devkit.dts, which pretended to use
> MX28_PAD_SSP2_SS0__GPIO_2_19 (equivalent to 0x2133) in the comment,
> but actually was using MX28_PAD_SSP2_SS0__AUART3_TX by the numerical
> value 0x2131.
>=20
> I decided to use the (possibly unintended) assignment
> MX28_PAD_SSP2_SS0__AUART3_TX because that is what is actually
> configured without this patch.

Applied these 3 patches, thanks.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

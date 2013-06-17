From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] pinctrl: rockchip: correctly handle arguments of
 pinconf options
Date: Mon, 17 Jun 2013 17:48:23 +0200
Message-ID: <CACRpkdZx9pjfqzn_keKTGGPsP1jHOY2=4OQX9mmymeo9EPn=Cg@mail.gmail.com>
References: <201306141741.46077.heiko@sntech.de>
	<201306161302.32156.heiko@sntech.de>
	<CACRpkdZxO-8rQPBRPsxAx8OBfwvh_BQuts7NAi379gMZG+1ocg@mail.gmail.com>
	<201306161741.17048.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <201306161741.17048.heiko@sntech.de>
Sender: linux-kernel-owner@vger.kernel.org
To: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, James Hogan <james.hogan@imgtec.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
List-Id: devicetree@vger.kernel.org

On Sun, Jun 16, 2013 at 5:41 PM, Heiko St=FCbner <heiko@sntech.de> wrot=
e:

> Change the rockchip pinctrl driver to handle the arguments to the pul=
l
> pinconfig options correctly. So only accept non-0 values for the
> pull options as the rockchip pin-controller can only turn pulls on an=
d
> off (this via BIAS_DISABLE).
>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
> changes since v1:
>  really respect the values for arguments of the pull options (aka 0 i=
s not
>  meant to turn off a pull).
>  Replacing the patch also makes sure that no wrong knowledge stays in=
 the
>  kernel via the old commit message, least somebody else reads it and =
takes
>  it as true.

OK took out the v1 and put in this v2 version instead...

Thanks!
Linus Walleij

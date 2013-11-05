From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 3/4] ARM: pinctrl: Add Broadcom Capri pinctrl driver
Date: Mon, 04 Nov 2013 17:04:14 -0700
Message-ID: <527835FE.2030102@wwwdotorg.org>
References: <1380846199-12829-1-git-send-email-syin@broadcom.com> <051069C10411E24D9749790C498526FA1BE0B7D7@SJEXCHMB12.corp.ad.broadcom.com> <CACRpkdYSLxp2M4HghcUdjEYGh-UQ+DaiCGp6yee+Qds6DR9poA@mail.gmail.com> <201311050026.56321.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <201311050026.56321.heiko@sntech.de>
Sender: linux-kernel-owner@vger.kernel.org
To: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>, Linus Walleij <linus.walleij@linaro.org>
Cc: Sherman Yin <syin@broadcom.com>, Laxman Dewangan <ldewangan@nvidia.com>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Christian Daudt <bcm@fixthebug.org>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <rob.herring@calxeda.com>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, Rob Landley <rob@landley.net>, Grant Likely <grant.likely@linaro.org>, Matt Porter <matt.porter@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 11/04/2013 04:26 PM, Heiko St=FCbner wrote:

> I remember we had a discussion about how things like bias-disable exp=
licitly=20
> shouldn't have a value, when they are represented in the list-format:
>=20
> 		pcfg_pull_none: pcfg_pull_none {
> 			bias-disable;
> 		};
>=20
> so a bias-disable =3D <1> was explicitly "forbidden" [for a lack of a=
 better=20
> word]. And it was similar for other options, the parameter not meant =
to be=20
> indicating if they are active but really only setting the "strength" =
or so.

Pure Boolean values should be represented as a valueless property. If
the property is present, the value is true, otherwise false.

However, pinctrl bindings often don't represent Boolean values, but
rather tri-states, with the following values:

* Don't touch this configuration option at all (missing)
* Enable the option (<1>)
* Disable the option (<0>)

The reason for using tri-states being that you might want to write:

xxx1 {
    pins =3D <PINA>, <PINB>, <PINC>;
    function =3D <...>;
    // this node doesn't affect pullup
}
xxx2 {
    pins =3D <PINA>, <PINB>;
    // this node doesn't affect function
    pull-up =3D <1>; // change, and enable
}
xxx3 {
    pins =3D <PINAC>;
    // this node doesn't affect function
    pull-up =3D <0>; // change, and disable
}

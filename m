From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 0/5] pinctrl: fix some issues with new pinconfig dt parsing
Date: Mon, 17 Jun 2013 05:03:22 +0200
Message-ID: <2162180.An6kI8rHhm@avalon>
References: <201306141741.46077.heiko@sntech.de> <51BB3C62.4070000@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <51BB3C62.4070000@imgtec.com>
Sender: linux-kernel-owner@vger.kernel.org
To: James Hogan <james.hogan@imgtec.com>
Cc: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>, Linus Walleij <linus.walleij@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@linaro.org>, rob.herring@calxeda.com, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

Hi Heiko,

On Friday 14 June 2013 16:53:06 James Hogan wrote:
> On 14/06/13 16:41, Heiko St=FCbner wrote:
> > Some issues with the recently submitted generic pinconfig parsing f=
rom dt
> > came up, so fix these in this follow-up series.
> >=20
> > Hopefully I did catch all of them.
> >=20
> > Tested on my rk3066 device.
> >=20
> > Heiko Stuebner (5):
> >   pinctrl: update the documentation for some pinconfig params
> >   pinctrl: clarify some dt pinconfig options
> >   pinctrl: handle zero found dt pinconfig properties better
> >   pinctrl: dynamically alloc temp array when parsing dt pinconf opt=
ions
>=20
> patches 1-4:
> Reviewed-by: James Hogan <james.hogan@imgtec.com>

Probably too late as Linus has already applied the patches, but for 2, =
3 and 4

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

--=20
Regards,

Laurent Pinchart

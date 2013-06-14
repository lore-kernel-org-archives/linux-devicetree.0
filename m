From: James Hogan <james.hogan@imgtec.com>
Subject: Re: [PATCH 0/5] pinctrl: fix some issues with new pinconfig dt parsing
Date: Fri, 14 Jun 2013 16:53:06 +0100
Message-ID: <51BB3C62.4070000@imgtec.com>
References: <201306141741.46077.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <201306141741.46077.heiko@sntech.de>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@linaro.org>, rob.herring@calxeda.com, devicetree-discuss@lists.ozlabs.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
List-Id: devicetree@vger.kernel.org

On 14/06/13 16:41, Heiko St=C3=BCbner wrote:
> Some issues with the recently submitted generic pinconfig parsing fro=
m dt
> came up, so fix these in this follow-up series.
>=20
> Hopefully I did catch all of them.
>=20
> Tested on my rk3066 device.
>=20
> Heiko Stuebner (5):
>   pinctrl: update the documentation for some pinconfig params
>   pinctrl: clarify some dt pinconfig options
>   pinctrl: handle zero found dt pinconfig properties better
>   pinctrl: dynamically alloc temp array when parsing dt pinconf optio=
ns

patches 1-4:
Reviewed-by: James Hogan <james.hogan@imgtec.com>

Cheers
James

>   pinctrl: rockchip: correctly handle arguments of pinconf options
>=20
>  .../bindings/pinctrl/pinctrl-bindings.txt          |   22 ++++++++++=
+-
>  drivers/pinctrl/pinconf-generic.c                  |   38 ++++++++++=
+++++-----
>  drivers/pinctrl/pinctrl-rockchip.c                 |   37 ++++++++++=
++++++---
>  include/linux/pinctrl/pinconf-generic.h            |   18 ++++++----
>  4 files changed, 93 insertions(+), 22 deletions(-)
>=20

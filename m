From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 2/5] pinctrl: clarify some dt pinconfig options
Date: Wed, 19 Jun 2013 16:10:39 -0600
Message-ID: <51C22C5F.5020402@wwwdotorg.org>
References: <201306141741.46077.heiko@sntech.de> <201306141742.49923.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <201306141742.49923.heiko@sntech.de>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@linaro.org>, rob.herring@calxeda.com, devicetree-discuss@lists.ozlabs.org, James Hogan <james.hogan@imgtec.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
List-Id: devicetree@vger.kernel.org

On 06/14/2013 09:42 AM, Heiko St=C3=BCbner wrote:
> The bias-pull-* options use values > 0 to indicate that the pull shou=
ld
> be activated and optionally also indicate the strength of the pull.
> Therefore use an default value of 1 for these options.
>=20
> Split the low-power-mode option into low-power-enable and -disable.
>=20
> Update the documentation to describe the param arguments better.
>=20
> Wrong default options
> Reported-by: James Hogan <james.hogan@imgtec.com>
>=20

That blank line should be before the Reported-by not after it.

> Signed-off-by: Heiko Stuebner <heiko@sntech.de>

> diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-bindin=
gs.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt

> -low-power-mode		- low power mode
> +low-power-enable	- enable low power mode
> +low-power-disable	- disable low power mode

Hmmm. That's changing the binding definition. What if somebody already
wrote their device tree according previous definition?

It seems to be that tri-states are preferable for pinctrl DT:

no entry: do nothing
=3D 0: disable
=3D 1: enable

> +Arguments for parameters:
> +
> +- bias-pull-up, -down and -pin-default take as optional argument 0 t=
o disable
> +  the pull, on hardware supporting it the pull strength in Ohm. bias=
-disable
> +  will also disable any active pull.

Does this agree with the latest definition of the kernel-internal
meaning of 0 for pull-up/down?

> +- input-schmitt takes as argument the adjustable hysteresis in a
> +  driver-specific format
> +
> +- input-debounce takes the debounce time as argument or 0 to disable=
 debouncing
> +
> +- power-source argument is the custom value describing the source to=
 select
> +
> +- slew-rate takes as argument the target rate in a driver-specific f=
ormat

If those things have driver-specific (note: should be
DT-binding-specific, not driver-specific) values, then I'm not convince=
d
that having a generic parameter name for them is a good idea; it makes
things look the same when they aren't. By forcing each binding to
include the vendor prefix on those properties and hence define a custom
property name, you're making it clear that the semantics may be differe=
nt.

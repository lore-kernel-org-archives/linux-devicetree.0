From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 4/4] pinctrl: remove bindings for pinconf options needing
 more thought
Date: Tue, 25 Jun 2013 15:34:25 +0200
Message-ID: <CACRpkdZ-3+1jKbOeCA3UZ0ZAjgROV38N94LALq4G5y9Ac=f0qQ@mail.gmail.com>
References: <201306251455.01540.heiko@sntech.de>
	<201306251457.10980.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <201306251457.10980.heiko@sntech.de>
Sender: linux-kernel-owner@vger.kernel.org
To: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>
Cc: Stephen Warren <swarren@wwwdotorg.org>, James Hogan <james.hogan@imgtec.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 25, 2013 at 2:57 PM, Heiko St=FCbner <heiko@sntech.de> wrot=
e:

> Some options currently take arguments in unspecified driver-specific =
units.
> As pointed out by Stephen Warren, driver specific values should not b=
e part
> of generic devicetree bindings describing the hardware.
>
> Therefore remove the critical bindings again, before they become part=
 of
> an official release.
>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>

Patch applied.

Yours,
Linus Walleij

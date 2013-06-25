From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/4] pinctrl: more clarifications for generic pull configs
Date: Tue, 25 Jun 2013 15:14:28 +0200
Message-ID: <CACRpkdZcGDWWU6gAh13dTAaf=UrZZu3nNuCadj0W6xvWpkeV7A@mail.gmail.com>
References: <201306251455.01540.heiko@sntech.de>
	<201306251455.42495.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <201306251455.42495.heiko@sntech.de>
Sender: linux-kernel-owner@vger.kernel.org
To: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>
Cc: Stephen Warren <swarren@wwwdotorg.org>, James Hogan <james.hogan@imgtec.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 25, 2013 at 2:55 PM, Heiko St=FCbner <heiko@sntech.de> wrot=
e:

> PULL_PIN_DEFAULT is meant for hardware completely hiding any pull
> settings from the driver, so that it's really only possible to turn
> the pull on or off, but it not being possible to determine any
> pull settings from software.
>
> Also the binding-documentation for the pull arguments did not match
> the changes to the expected values.
>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>

Patch applied.

Yours,
Linus Walleij

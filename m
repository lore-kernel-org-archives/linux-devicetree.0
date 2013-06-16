From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/5] pinctrl: clarify some dt pinconfig options
Date: Sun, 16 Jun 2013 12:28:37 +0200
Message-ID: <CACRpkdYiMNJUtz5NmaJu-XOdfErC4FGCP8+_VwX-=2MQbsPfuA@mail.gmail.com>
References: <201306141741.46077.heiko@sntech.de>
	<201306141742.49923.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <201306141742.49923.heiko@sntech.de>
Sender: linux-kernel-owner@vger.kernel.org
To: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, James Hogan <james.hogan@imgtec.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 14, 2013 at 5:42 PM, Heiko St=FCbner <heiko@sntech.de> wrot=
e:

> The bias-pull-* options use values > 0 to indicate that the pull shou=
ld
> be activated and optionally also indicate the strength of the pull.
> Therefore use an default value of 1 for these options.
>
> Split the low-power-mode option into low-power-enable and -disable.
>
> Update the documentation to describe the param arguments better.
>
> Wrong default options
> Reported-by: James Hogan <james.hogan@imgtec.com>
>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>

Patch applied.

Yours,
Linus Walleij

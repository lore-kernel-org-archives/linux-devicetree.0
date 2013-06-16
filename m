From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 4/5] pinctrl: dynamically alloc temp array when parsing dt
 pinconf options
Date: Sun, 16 Jun 2013 12:31:42 +0200
Message-ID: <CACRpkdZaSng72gpULBtpPKvYw+7jp2rePFv==xGQrWHqBsHrFg@mail.gmail.com>
References: <201306141741.46077.heiko@sntech.de>
	<201306141743.55811.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <201306141743.55811.heiko@sntech.de>
Sender: linux-kernel-owner@vger.kernel.org
To: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, James Hogan <james.hogan@imgtec.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 14, 2013 at 5:43 PM, Heiko St=FCbner <heiko@sntech.de> wrot=
e:

> Allocating the temorary array in pinconf_generic_parse_dt_config on s=
tack
> might cause problems later on, when the number of options grows over =
time.
> Therefore also allocate this array dynamically to be on the safe side=
=2E
>
> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>

Patch applied.

Yours,
Linus Walleij

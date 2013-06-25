From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/4] pinctrl: set unit for debounce time pinconfig to usec
Date: Tue, 25 Jun 2013 15:15:38 +0200
Message-ID: <CACRpkdb8C=hR3JP9cpo4Hvj176AwGJ16M9o9Wd40AjTfP+9aEA@mail.gmail.com>
References: <201306251455.01540.heiko@sntech.de>
	<201306251456.12150.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <201306251456.12150.heiko@sntech.de>
Sender: linux-kernel-owner@vger.kernel.org
To: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>
Cc: Stephen Warren <swarren@wwwdotorg.org>, James Hogan <james.hogan@imgtec.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 25, 2013 at 2:56 PM, Heiko St=FCbner <heiko@sntech.de> wrot=
e:

> Currently the debounce time pinconfig option uses an unspecified
> "time units" unit. As pinconfig options should use SI units and a
> real unit is also necessary for generic dt bindings, change it
> to usec. Currently no driver is using the generic pinconfig option
> for this, so the unit change is safe to do.
>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>

Patch applied.

Yours,
Linus Walleij

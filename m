From: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Subject: RE: [PATCH 9/9] regulator: bd71837: Build BD71837 regulator driver
Date: Thu, 24 May 2018 17:34:24 +0000
Message-ID: <042F8805D2046347BB8420BEAE397A4016C06B52@WILL-MAIL002.REu.RohmEu.com>
References: <20180524060114.GJ4249@localhost.localdomain>,<20180524140159.GT4828@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180524140159.GT4828@sirena.org.uk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "lee.jones@linaro.org" <lee.jones@linaro.org>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Mutanen, Mikko" <Mikko.Mutanen@fi.rohmeurope.com>, "Haikola, Heikki" <Heikki.Haikola@fi.rohmeurope.com>
List-Id: devicetree@vger.kernel.org



> On Thu, May 24, 2018 at 09:01:14AM +0300, Matti Vaittinen wrote:
> > Configurations and Makefile for BD71837 regulator driver
> >
> > Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> > ---
> >  drivers/regulator/Kconfig  | 11 +++++++++++
> >  drivers/regulator/Makefile |  1 +
> >  2 files changed, 12 insertions(+)
>
> Just squash this into the single patch adding the driver, it makes life
> easier.

Will do. I was wondering if it is nicer to have smaller patches and thus
decided to split this but if it is easier to read them in one patch
- no problem.

Br,
    Matti Vaittinen

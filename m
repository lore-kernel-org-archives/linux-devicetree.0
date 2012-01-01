From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC PATCH v3 3/5] pinctrl: imx: add pinctrl imx driver
Date: Sun, 1 Jan 2012 15:02:13 +0100
Message-ID: <CACRpkdZ3iTwLUsrvYL8_YaWf-DF9OF8Hc3o=XLza60iuomQn2Q@mail.gmail.com>
References: <1324402840-32451-1-git-send-email-b29396@freescale.com>
	<1324402840-32451-4-git-send-email-b29396@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1324402840-32451-4-git-send-email-b29396@freescale.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dong Aisheng <b29396@freescale.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linus.walleij@stericsson.com, s.hauer@pengutronix.de, shawn.guo@freescale.com, kernel@pengutronix.de, grant.likely@secretlab.ca, rob.herring@calxeda.com, devicetree-discuss@lists.ozlabs.org, cjb@laptop.org, w.sang@pengutronix.de
List-Id: devicetree@vger.kernel.org

On Tue, Dec 20, 2011 at 6:40 PM, Dong Aisheng <b29396@freescale.com> wrote:

> From: Dong Aisheng <dong.aisheng@linaro.org>
>
> The driver contains the initial support for imx53 and
> imx6q.

Looks real good from a pinctrl point of view.
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Now I guess it's that patch 2/5 that is at the heart of how we proceed
with this. I guess this patch depends on 2/5?

Yours,
Linus Walleij

From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v5 1/1] dt: add of_get_child_count helper function
Date: Wed, 2 May 2012 01:05:16 +0200
Message-ID: <CACRpkdbgZA5p0YWZDjDxGfX-TQS+NHa1WcwCL0jnjDp-QW_hdg@mail.gmail.com>
References: <20120427032831.GE26070@shlinux2.ap.freescale.net>
	<1335497780-1164-1-git-send-email-b29396@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1335497780-1164-1-git-send-email-b29396@freescale.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dong Aisheng <b29396@freescale.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, linus.walleij@stericsson.com, swarren@wwwdotorg.org, s.hauer@pengutronix.de, shawn.guo@freescale.com, kernel@pengutronix.de, grant.likely@secretlab.ca, rob.herring@calxeda.com, cjb@laptop.org, b20223@freescale.com
List-Id: devicetree@vger.kernel.org

On Fri, Apr 27, 2012 at 5:36 AM, Dong Aisheng <b29396@freescale.com> wrote:

> From: Dong Aisheng <dong.aisheng@linaro.org>
>
> Currently most code to get child count in kernel are almost same,
> add a helper to implement this function for dt to use.
>
> Cc: Grant Likely <grant.likely@secretlab.ca>
> Acked-by: Rob Herring <rob.herring@calxeda.com>
> Signed-off-by: Dong Aisheng <dong.aisheng@linaro.org>
>
> ---
> Rob missed this patch for 3.4 kernel.
> Based on Rob's suggestion, we can get it go in with pinctrl driver.
> Since Rob once had applied it, i added Rob's ack.
> See:
> https://lkml.org/lkml/2012/4/14/239

OK I've applied this to the pinctrl tree with Stephens ACK.

Yours,
Linus Walleij

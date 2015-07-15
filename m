From: Ludovic Desroches <ludovic.desroches@atmel.com>
Subject: Re: [RESEND PATCH 1/2] pinctrl: change function behavior for per pin
 muxing controllers
Date: Wed, 15 Jul 2015 10:29:18 +0200
Message-ID: <20150715082918.GB14886@odux.rfo.atmel.com>
References: <1433948699-19800-1-git-send-email-ludovic.desroches@atmel.com>
 <1433948699-19800-2-git-send-email-ludovic.desroches@atmel.com>
 <557EF60D.8020007@wwwdotorg.org>
 <20150617123816.GB12295@odux.rfo.atmel.com>
 <5581988C.50000@wwwdotorg.org>
 <20150618123348.GB20227@odux.rfo.atmel.com>
 <20150714055749.GB5161@pengutronix.de>
 <20150715074642.GA14886@odux.rfo.atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150715074642.GA14886@odux.rfo.atmel.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Sascha Hauer <s.hauer@pengutronix.de>, Stephen Warren <swarren@wwwdotorg.org>, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linus.walleij@linaro.org, nicolas.ferre@atmel.com
List-Id: devicetree@vger.kernel.org

On Wed, Jul 15, 2015 at 09:46:42AM +0200, Ludovic Desroches wrote:
> This driver fits most of my needs but I didn't do it in this way for the
> two previous reasons. If it is not an issue to add a new
> dt_node_to_map() implementation which should be quite close to the
> mediatek one, let's do it.

Thinking more about it, there is something I have missed that can change
many things is that one pin is one group in Mediatek driver.

If I add the pin mux value in my macros with the pin number and the
ioset, group_defs node is still useful to declare group of pins.

Ludovic

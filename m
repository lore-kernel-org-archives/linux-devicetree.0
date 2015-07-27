From: Ludovic Desroches <ludovic.desroches@atmel.com>
Subject: Re: [RESEND PATCH 1/2] pinctrl: change function behavior for per pin
 muxing controllers
Date: Mon, 27 Jul 2015 14:12:09 +0200
Message-ID: <20150727121209.GE15112@odux.rfo.atmel.com>
References: <1433948699-19800-1-git-send-email-ludovic.desroches@atmel.com>
 <1433948699-19800-2-git-send-email-ludovic.desroches@atmel.com>
 <557EF60D.8020007@wwwdotorg.org>
 <20150617123816.GB12295@odux.rfo.atmel.com>
 <5581988C.50000@wwwdotorg.org>
 <20150618123348.GB20227@odux.rfo.atmel.com>
 <20150714055749.GB5161@pengutronix.de>
 <20150715074642.GA14886@odux.rfo.atmel.com>
 <CACRpkdZOeMqT0cZWYPOrtKGL2FdAy4=19JZMmF8KuU7pYZYuMQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdZOeMqT0cZWYPOrtKGL2FdAy4=19JZMmF8KuU7pYZYuMQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, Stephen Warren <swarren@wwwdotorg.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicolas Ferre <nicolas.ferre@atmel.com>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 27, 2015 at 11:43:52AM +0200, Linus Walleij wrote:
> On Wed, Jul 15, 2015 at 9:46 AM, Ludovic Desroches
> <ludovic.desroches@atmel.com> wrote:
> > On Tue, Jul 14, 2015 at 07:57:49AM +0200, Sascha Hauer wrote:
> >>
> >> Note that in the recently introduced Mediatek pinctrl driver we used
> >> 'pinmux' for the property that you name 'pins' here. We probably want to
> >> use the same name.
> >
> > This driver fits most of my needs but I didn't do it in this way for the
> > two previous reasons. If it is not an issue to add a new
> > dt_node_to_map() implementation which should be quite close to the
> > mediatek one, let's do it.
> 
> OK if you can do that so we have some order and obtain Sascha's
> ACK I'm in for the patch.
> 
> Maybe there is something like that further up in my mailbox, need
> to browse :)

I am doing the changes and merging my gpio driver into it. I'll send a
new version probably this week.

Regards

Ludovic

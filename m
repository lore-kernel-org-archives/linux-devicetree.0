From: Dmitry Torokhov <dtor@google.com>
Subject: Re: [PATCH v3 3/4] pinctrl: cygnus: add initial IOMUX driver support
Date: Tue, 3 Feb 2015 12:00:09 -0800
Message-ID: <20150203200009.GB15969@dtor-ws>
References: <rjui@broadcom.com>
 <1422928894-20716-1-git-send-email-rjui@broadcom.com>
 <1422928894-20716-4-git-send-email-rjui@broadcom.com>
 <20150203174042.GA15969@dtor-ws>
 <54D121A0.6070602@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <54D121A0.6070602@broadcom.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Ray Jui <rjui@broadcom.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Christian Daudt <bcm@fixthebug.org>, Matt Porter <mporter@linaro.org>, Florian Fainelli <f.fainelli@gmail.com>, Russell King <linux@arm.linux.org.uk>, Scott Branden <sbranden@broadcom.com>, Anatol Pomazau <anatol@google.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Feb 03, 2015 at 11:29:36AM -0800, Ray Jui wrote:
> On 2/3/2015 9:40 AM, Dmitry Torokhov wrote:
> > On Mon, Feb 02, 2015 at 06:01:33PM -0800, Ray Jui wrote:
> >> +
> >> +/*
> >> + * List of pins in Cygnus
> >> + */
> >> +static struct cygnus_pin cygnus_pins[] = {
> > 
> > const?
> > 
> I cannot make it const here, since the address of "gpio_mux" is later
> passed to pinctrl_pin_desc's private data:
> 
> pins[i].drv_data = &cygnus_pins[i].gpio_mux;

The pinctrl code says:

"@drv_data: driver-defined per-pin data. pinctrl core does not touch
this"

so we could theoretically cast away the constness and restore it when
we access drv_data in pin control methods, but I won't insist. I am
not sure which way looks nicer.

Thanks.

-- 
Dmitry

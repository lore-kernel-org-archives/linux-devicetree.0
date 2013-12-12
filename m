From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/3] pinctrl: Add msm8x74 configuration
Date: Thu, 12 Dec 2013 22:16:12 +0100
Message-ID: <CACRpkdZedEataWivqxL4vN4Xy+KtZDuZyH7AoqXUhNxHKBKdrQ@mail.gmail.com>
References: <1386295805-13708-1-git-send-email-bjorn.andersson@sonymobile.com>
	<1386295805-13708-3-git-send-email-bjorn.andersson@sonymobile.com>
	<52A24E08.706@codeaurora.org>
	<20131210084140.GF11990@sonymobile.com>
	<52A7C4BB.6000701@codeaurora.org>
	<CACRpkdY9Z71VcS6ERiaDbg9P7qPEK_jCVXLvoCDx6YztYCnR2Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <CACRpkdY9Z71VcS6ERiaDbg9P7qPEK_jCVXLvoCDx6YztYCnR2Q@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Bjorn Andersson <bjorn.andersson@sonymobile.com>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Landley <rob@landley.net>, Grant Likely <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, Dec 12, 2013 at 8:15 PM, Linus Walleij <linus.walleij@linaro.or=
g> wrote:

> On a related key I guess drivers/gpio/gpio-msm-v2.c needs
> to be patched to call pinctrl_request_gpio()/
> pinctrl_free_gpio()/pinctrl_gpio_direction_input()/
> pinctrl_gpio_direction_output() before the GPIO back-end
> works at all so there is still time to change this (plus it is
> not part of the DT binding or anything so it can be changed
> at any time).

I think Bj=F6rn answered this in his other mail - so the new
pin control driver replaces the GPIO drivers' functionality
and that's just fine.

Yours,
Linus Walleij

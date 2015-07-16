From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC PATCH] pinctrl-single: Use of pinctrl-single for external
 device over I2C
Date: Thu, 16 Jul 2015 14:58:13 +0200
Message-ID: <CACRpkdZwucqETn3OkX1GPO43JpwWL67OB1FExHFD5CzWTA3D5g@mail.gmail.com>
References: <1435855992-10312-1-git-send-email-vaibhav.hiremath@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1435855992-10312-1-git-send-email-vaibhav.hiremath@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Vaibhav Hiremath <vaibhav.hiremath@linaro.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, Lee Jones <lee.jones@linaro.org>, Will Deacon <will.deacon@arm.com>, Tony Lindgren <tony@atomide.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 2, 2015 at 6:53 PM, Vaibhav Hiremath
<vaibhav.hiremath@linaro.org> wrote:

> In some usecases, the external device (in my case it PMIC over I2C)
> does support pin in multiple configuration, we may need to control/configure them
> during boot or runtime.

What is missing from this patch is an explanation why pinctrl-single should
be used for this PMIC.

Repeat: pinctrl-single: when you have exactly one register per pin, and
the description of the pins is delivered in an opaque ASIC-specific format
without developers knowing much about how the hardware actually works,
just "set these magic values".

I strongly prefer that this PMIC has its own pin controller using standard
bindings with groups and functions, see eg. drivers/pinctrl/nomadik/pinctrl-ab*
for a PMIC pinctrl driver.

Yours,
Linus Walleij

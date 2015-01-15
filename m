From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 RESEND 2/3] Documentation: gpio: Add APM X-Gene standby
 GPIO controller DTS binding
Date: Thu, 15 Jan 2015 17:16:01 +0100
Message-ID: <CACRpkdaQWf6jOFkX1Lq0NWm_wfxw1NuajOwpJwA5_sZ8CdAa4Q@mail.gmail.com>
References: <1418793050-26927-1-git-send-email-yvo@apm.com>
	<1418793050-26927-3-git-send-email-yvo@apm.com>
	<CACRpkdbcdf7Ub9uYbeqUe1La1dnVeWCxK8N7=iVZuBtuKHFHFA@mail.gmail.com>
	<CAL4ahLfcMsu2i2efiwq96a3YD4dChBEuJeEnQ7tsZH6et8H=sw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CAL4ahLfcMsu2i2efiwq96a3YD4dChBEuJeEnQ7tsZH6et8H=sw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Y Vo <yvo@apm.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Phong Vo <pvo@apm.com>, Toan Le <toanle@apm.com>, patches <patches@apm.com>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 13, 2015 at 10:41 AM, Y Vo <yvo@apm.com> wrote:
> Yes, exactly 6 interrupts. As I describe before:
> - There are 22 GPIO_DSs.
> - Only 6 GPIO_DSs from 0x08..0xD which supports interrupts

What I'm saying is that you need to describe this in the binding
document itself.

If you described it somewhere else doesn't count.

So update the patch.

Yours,
Linus Walleij

From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/4] gpio: syscon: add soc specific callback to assign
 output value
Date: Fri, 29 Aug 2014 08:19:13 +0200
Message-ID: <CACRpkdaq2=f92yEEZgGHOtixDk35O9tmN2PZkSPKrGwGVDS_mQ@mail.gmail.com>
References: <1407946582-20927-1-git-send-email-grygorii.strashko@ti.com>
	<1407946582-20927-2-git-send-email-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1407946582-20927-2-git-send-email-grygorii.strashko@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Santosh Shilimkar <santosh.shilimkar@ti.com>, Alexander Shiyan <shc_work@mail.ru>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Alexandre Courbot <gnurou@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 13, 2014 at 6:16 PM, Grygorii Strashko
<grygorii.strashko@ti.com> wrote:

> Some SoCs (like Keystone) may require to perform special
> sequence of operations to assign output GPIO value, so default
> implementation of .set() callback from gpio-syscon driver
> can't be used.
>
> Hence, add optional, SoC specific callback to assign output
> gpio value.
>
> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>

Hm :-/

I didn't realize this wasn't a quite so straight-forward a
syscon GPIO driver.

Now I start to think that it looks kludgy to bolt this onto
the other driver and think we may need to go back to the
other version which puts it as a separate driver. I guess
that is what you refer to as v1?

I have a hard time to make my mind up about these
syscon things, sorry :-(

Now I have to ask you: which way do you prefer to do it,
if you can choose freely? The initial driver or augmenting
the syscon driver (patch v1)?

Yours,
Linus Walleij

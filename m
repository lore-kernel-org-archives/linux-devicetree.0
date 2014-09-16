From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 0/4] gpio: syscon: reuse for keystone 2 socs
Date: Tue, 16 Sep 2014 14:43:17 -0700
Message-ID: <CACRpkdaB7YpYjuND+Dic2eM=0OB0Sk=gGRRd7QrQj1Ze1MYXaQ@mail.gmail.com>
References: <1409763935-5713-1-git-send-email-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1409763935-5713-1-git-send-email-grygorii.strashko@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Santosh Shilimkar <santosh.shilimkar@ti.com>, Alexander Shiyan <shc_work@mail.ru>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Alexandre Courbot <gnurou@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 3, 2014 at 10:05 AM, Grygorii Strashko
<grygorii.strashko@ti.com> wrote:

> This series intended to integrate Keystone 2 DSP GPIO controller functionality
> into gpio-syscon driver (drivers/gpio/gpio-syscon.c) as requested
> by Linus Walleij in [1].

OK no comments on DT stuff etc for two weeks, so merged patches
1-3, the 4th you can take through the keystone git.

Yours,
Linus Walleij

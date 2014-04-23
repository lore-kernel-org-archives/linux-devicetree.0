From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH 1/2] gpio: pl061: get gpio base from alias id
Date: Wed, 23 Apr 2014 13:52:20 -0500
Message-ID: <CAL_JsqKo0uV9_SX5aAfgPyRSa0Cv5O=tdp4s1oSQs=76vZC+ww@mail.gmail.com>
References: <1398130543-19454-1-git-send-email-haojian.zhuang@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1398130543-19454-1-git-send-email-haojian.zhuang@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Haojian Zhuang <haojian.zhuang@linaro.org>
Cc: xuwei5@hisilicon.com, Linus Walleij <linus.walleij@linaro.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, baruch@tkos.co.il
List-Id: devicetree@vger.kernel.org

On Mon, Apr 21, 2014 at 8:35 PM, Haojian Zhuang
<haojian.zhuang@linaro.org> wrote:
> If gpio base number isn't specified, the gpio base will be find from
> the end of gpio number. In order to keep with schematics, use alias
> to get the ID of gpio chip.

NAK. This is an abuse aliases.

> Signed-off-by: Haojian Zhuang <haojian.zhuang@linaro.org>
> ---
>  .../devicetree/bindings/gpio/gpio-pl061.txt        | 31 ++++++++++++++++++++++

Is something wrong with the binding doc already in pl061-gpio.txt?

Rob

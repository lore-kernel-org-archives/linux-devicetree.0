From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 5/8] gpio: Add Fujitsu MB86S7x GPIO driver
Date: Mon, 12 Jan 2015 01:04:10 +0100
Message-ID: <CACRpkdajpv0yK-m3WRxRRKJyQiBZxRppOiay+-CLTr_adOw9ww@mail.gmail.com>
References: <1420802369-3840-1-git-send-email-Vincent.Yang@tw.fujitsu.com>
	<1420803212-4350-1-git-send-email-Vincent.Yang@tw.fujitsu.com>
	<CACRpkdZk3sLN43zmuWM+VYLB7vJdNCSq_goTx6mDSnzHrO=UHw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdZk3sLN43zmuWM+VYLB7vJdNCSq_goTx6mDSnzHrO=UHw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Vincent Yang <vincent.yang.fujitsu@gmail.com>, Kamlakant Patel <kamlakant.patel@linaro.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>, =?UTF-8?Q?Pawe=C5=82_Moll?= <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Andy Green <andy.green@linaro.org>, Patch Tracking <patches@linaro.org>, Jaswinder Singh <jaswinder.singh@linaro.org>, Vincent Yang <Vincent.Yang@tw.fujitsu.com>, Tetsuya Nuriya <nuriya.tetsuya@jp.fujitsu.com>
List-Id: devicetree@vger.kernel.org

On Sun, Jan 11, 2015 at 11:40 PM, Linus Walleij
<linus.walleij@linaro.org> wrote:

> First I thought maybe this could use the generic MMIO driver
> but it seems you need this double register access for setting
> the direction so it won't work.
>
> Otherwise it's sort of close ... have you looks at the option?

Bah, sorry I saw I already asked this in the past and you explained
that the arithmetic is not simple enough. Sorry for forgetting what
I already asked. This is over all looking very good, but waiting since
you had some pending change, then I'll merge it.

Yours,
Linus Walleij

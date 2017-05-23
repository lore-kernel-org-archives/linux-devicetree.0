From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [DT Question] "simple-mfd" DT binding
Date: Tue, 23 May 2017 08:05:47 +0100
Message-ID: <20170523070547.hhxwrst6np6fpqql@dell>
References: <CAK7LNARQmfX+3RwFgwtvf2Qu79XNX1zh0O741-pPFWS6npytLw@mail.gmail.com>
 <CACRpkdY88Zdp2zqabWPfYPnTwSzYuCqSQHQg9vF_+Zd=TFOvaA@mail.gmail.com>
 <CAK7LNAQ+DimarhHJOg=BqbH+EB19s+wgtRqJ8-XuLKW6_0FFaQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAK7LNAQ+DimarhHJOg=BqbH+EB19s+wgtRqJ8-XuLKW6_0FFaQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On Tue, 23 May 2017, Masahiro Yamada wrote:

> Hi Lee, Linus,
> 
> Thanks for your comments!
> 
> 2017-05-22 17:43 GMT+09:00 Linus Walleij <linus.walleij@linaro.org>:
> > On Mon, May 22, 2017 at 3:29 AM, Masahiro Yamada
> > <yamada.masahiro@socionext.com> wrote:
> >
> >> Because "simple-bus" indicates that child nodes are
> >> simply memory mapped, but the node "register-bit-led"
> >> can not be memory-mapped.
> >> So, "simple-mfd" can not be replaced "simple-bus" here.
> >
> > Yeah... just like Lee points out, you are spot on, this is exactly
> > the reason why we created "simple-mfd" in the first place
> > IIRC.
> 
> OK, Linux treats simple-bus and simple-mfd in the same way
> as far as I see drivers/of/platform.c

Correct.  As I said, the functionality of the two are the same.  The
difference is their meaning.  Initially we were using "simple-mfd" to
achieve our aim (see below), but there was push-back due to the
differences in what the two properties were trying to achieve.  Ergo,
we introduced a second property.

> Perhaps, can we document the difference between simple-bus and
> simple-mfd clearly?
> For example, "Unlike simple-bus, it is legitimate that simple-mfd has
> subnodes without reg property"
> 
> 
> I think this is typical when "simple-mfd" is used together with "syscon".
> The child devices will use regmap of the parent node.
> I'd like to be sure this is valid usage.

"simple-mfd" simply means "register all of my child nodes using the
platform API without any further intervention".  It's goal is to
prevent the MFD subsystem from being stuffed full of drivers where
their only purpose is to call of_platform_populate().  All other rules
and policy which must be followed are generic DT ones.  To that end, I
do not believe making further statements is necessary.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog

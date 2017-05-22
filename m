From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [DT Question] "simple-mfd" DT binding
Date: Mon, 22 May 2017 10:43:29 +0200
Message-ID: <CACRpkdY88Zdp2zqabWPfYPnTwSzYuCqSQHQg9vF_+Zd=TFOvaA@mail.gmail.com>
References: <CAK7LNARQmfX+3RwFgwtvf2Qu79XNX1zh0O741-pPFWS6npytLw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK7LNARQmfX+3RwFgwtvf2Qu79XNX1zh0O741-pPFWS6npytLw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee.jones@linaro.org>, masahiroy@kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On Mon, May 22, 2017 at 3:29 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> Because "simple-bus" indicates that child nodes are
> simply memory mapped, but the node "register-bit-led"
> can not be memory-mapped.
> So, "simple-mfd" can not be replaced "simple-bus" here.

Yeah... just like Lee points out, you are spot on, this is exactly
the reason why we created "simple-mfd" in the first place
IIRC.

Yours,
Linus Walleij

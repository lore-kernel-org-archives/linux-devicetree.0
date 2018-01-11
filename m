From: Icenowy Zheng <icenowy@aosc.io>
Subject: Re: [linux-sunxi] Re: [PATCH 0/7] Initial Allwinner H6 support
Date: Thu, 11 Jan 2018 17:38:39 +0800
Message-ID: <6025395.Uh4Z0ipbrK@ice-x220i>
References: <20180106041813.46256-1-icenowy@aosc.io> <CACRpkdY3xY-7-YTCS=QmRQ3hmXiJZ_2M=ZhJRTTMx7XNfXRRSw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdY3xY-7-YTCS=QmRQ3hmXiJZ_2M=ZhJRTTMx7XNfXRRSw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: linux-sunxi@googlegroups.com, linus.walleij@linaro.org
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, linux-clk <linux-clk@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org
List-Id: devicetree@vger.kernel.org

在 2018年1月11日星期四 CST 下午5:36:39，Linus Walleij 写道：
> On Sat, Jan 6, 2018 at 5:18 AM, Icenowy Zheng <icenowy@aosc.io> wrote:
> > This patchset adds initial support for the Allwinner H6 SoC.
> 
> Can I apply the pin control patches without the clock patches?

I think it's OK.

Note: on H6 now the pin controller do not depend on
the CCU at all -- it only needs two oscillators now.

> 
> Also waiting for Maxime and/or Chen-Yu to provide some review
> before merging this.
> 
> Yours,
> Linus Walleij



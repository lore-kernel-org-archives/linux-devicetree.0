From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCHv4 3/5] pinctrl: mvebu: pinctrl driver for 98DX3236 SoC
Date: Thu, 26 Jan 2017 15:11:14 +0100
Message-ID: <CACRpkdZ2M4g+wFMADsvx_yBV6ZjsZz33VLH4vspO-sd9hZ6Qhw@mail.gmail.com>
References: <20170113091222.7132-1-chris.packham@alliedtelesis.co.nz>
 <20170113091222.7132-4-chris.packham@alliedtelesis.co.nz> <20170119100244.GX27312@n2100.armlinux.org.uk>
 <c873040cba1a4d5aa15dbaf3c5cc44e0@svr-chch-ex1.atlnz.lc> <6eb30a9ec3cf4fc9971f33742f334980@svr-chch-ex1.atlnz.lc>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <6eb30a9ec3cf4fc9971f33742f334980@svr-chch-ex1.atlnz.lc>
Sender: linux-gpio-owner@vger.kernel.org
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc: Russell King - ARM Linux <linux@armlinux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Kalyan Kinthada <Kalyan.Kinthada@alliedtelesis.co.nz>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 23, 2017 at 9:18 AM, Chris Packham
<Chris.Packham@alliedtelesis.co.nz> wrote:

> I noticed the mvebu pinctrl series isn't in Linus's (Torvalds) tree. Is
> this on the cards for v4.10 or is it waiting for the next merge window?

Next merge window.

> In other words should I send v5 or my series now or wait for this to be
> merged so I can rebase on top of it?

Rebase it on my devel branch in the pin control tree:
git clone git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
cd linux-pinctrl
git checkout -b devel origin/devel
[git am .. / git pull old-branch]

Yours,
Linus Walleij

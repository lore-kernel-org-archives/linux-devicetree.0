From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 0/3] Add the rk3368 evb board with the act8846 pmic
Date: Wed, 02 Dec 2015 00:50:29 +0100
Message-ID: <5501370.GQCpicsLkL@diego>
References: <1448961206-23769-1-git-send-email-wxt@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1448961206-23769-1-git-send-email-wxt@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Caesar Wang <wxt@rock-chips.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, Douglas Anderson <dianders@chromium.org>, devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Stephen Boyd <sboyd@codeaurora.org>, Olof Johansson <olof@lixom.net>, Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Roger Chen <roger.chen@rock-chips.com>, Pawel Moll <pawel.moll@arm.com>, Yunzhi Li <lyz@rock-chips.com>, Will Deacon <will.deacon@arm.com>, Romain Perier <romain.perier@gmail.com>, Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Caesar,

Am Dienstag, 1. Dezember 2015, 17:13:23 schrieb Caesar Wang:
> This series pacthes try to add the evb dts for rk3368 SoCs,
> This's similar with the rj3288 evb board.
> 
> On the moment, pwm/backlight/usb/thermal/emmc stuff can work for this
> board, I add the base version for the future firstly.
applied all 3 to relevant branches for 4.5, with some small changes:

> PATCH [1/3]: Force rk3368 PWM clock (and its parents) On
> That's similar HACK way to work.
shortened the comment in the code a bit

> PATCH [2/3]: Add the RK3368 EVB board for with the act8846 pmic for dtsi
Moved some minor stuff around a bit (ordering, etc)

> PATCH [3/3]: Add the PWM node info for rk3368 core.
this now comes before the addition of the evb files


Heiko

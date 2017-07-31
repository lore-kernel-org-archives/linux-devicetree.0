From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 03/14] pinctrl: rockchip: add input schmitt support for rv1108
Date: Mon, 31 Jul 2017 13:26:11 +0200
Message-ID: <17667109.HATuc3212V@diego>
References: <1501495449-21290-1-git-send-email-andy.yan@rock-chips.com> <1501495822-21503-1-git-send-email-andy.yan@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1501495822-21503-1-git-send-email-andy.yan@rock-chips.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Andy Yan <andy.yan@rock-chips.com>
Cc: linus.walleij@linaro.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-gpio@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Am Montag, 31. Juli 2017, 18:10:22 CEST schrieb Andy Yan:
> Some pins like i2c SCL/SDA need the schmitt input function
> to avoid crosstalk problems.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>



From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH] ARM: dts: enable sdmmc for rockchip rv1108 evb
Date: Sat, 22 Jul 2017 22:47:35 +0200
Message-ID: <14029252.zVFmYa7h66@phil>
References: <1500545621-20746-1-git-send-email-andy.yan@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1500545621-20746-1-git-send-email-andy.yan@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Yan <andy.yan@rock-chips.com>
Cc: devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Am Donnerstag, 20. Juli 2017, 18:13:41 CEST schrieb Andy Yan:
> Enable sdmmc on rv1108 evaluation board. Also
> add pinctrl for sdmmc controller.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

applied for 4.14, after adapting the subject to
	ARM: dts: rockchip: enable sdmmc for rv1108 evb

and moving the pinctrl properties down some lines


Heiko

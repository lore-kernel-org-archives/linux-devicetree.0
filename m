From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 10/14] ARM: dts: rockchip: add watchdog dt node for rv1108
Date: Tue, 01 Aug 2017 17:16:40 +0200
Message-ID: <2141124.xYyIjBTT8Y@phil>
References: <1501495449-21290-1-git-send-email-andy.yan@rock-chips.com> <1501496310-21961-1-git-send-email-andy.yan@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1501496310-21961-1-git-send-email-andy.yan@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Yan <andy.yan@rock-chips.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Andy,

Am Montag, 31. Juli 2017, 18:18:30 CEST schrieb Andy Yan:
> Add watchdog device tree node for rv1108
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

I've adapted this patch to apply against the current rv1108.dtsi
and applied it for 4.14. So resends of your series should take this
change into account please :-) .

See
https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git/log/?h=v4.14-armsoc/dts32
for reference


Heiko

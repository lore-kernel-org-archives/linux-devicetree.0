From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH] ARM: dts: rockchip: increase SD clock frequency on Radxa Rock
Date: Wed, 22 Mar 2017 17:47:41 +0100
Message-ID: <1978752.xjtBqdMt97@phil>
References: <1490110822-3310-1-git-send-email-al.kochet@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1490110822-3310-1-git-send-email-al.kochet@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexander Kochetkov <al.kochet@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

Am Dienstag, 21. März 2017, 18:40:22 CET schrieb Alexander Kochetkov:
> The patch set SD clock frequency to maximum possible to SD-card
> (50MHz). This change actual clock frequency from 32MHz to 48MHz
> (speedup 1.5X).
> 
> Banner line before patch: 'mmc_host mmc0: Bus speed (slot 0) = 32000000Hz
> (slot req 50000000Hz, actual 32000000HZ div = 0)'.
> Banner line after patch: 'mmc_host mmc0: Bus speed (slot 0) = 96000000Hz
> (slot req 50000000Hz, actual 48000000HZ div = 1)'
> 
> Signed-off-by: Alexander Kochetkov <al.kochet@gmail.com>

sorry, but I will not apply this patch at this time.

When testing on my radxarock with the card I always use upon entering the 
rootfs everything explodes with -110 errors, while without that patch the card 
runs stable as far as I can tell.

I also don't have the time to investigate further right now though.


Heiko

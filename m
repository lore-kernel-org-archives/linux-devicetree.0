From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH] ARM: dts: rockchip: Make rk3288-veyron-minnie run at hs200
Date: Tue, 07 May 2019 14:03:39 +0200
Message-ID: <4345663.CAMg3MOt9f@phil>
References: <20190503234142.228982-1-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190503234142.228982-1-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Douglas Anderson <dianders@chromium.org>
Cc: Shawn Lin <shawn.lin@rock-chips.com>, linux-rockchip@lists.infradead.org, briannorris@chromium.org, mka@chromium.org, amstan@chromium.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Am Samstag, 4. Mai 2019, 01:41:42 CEST schrieb Douglas Anderson:
> As some point hs200 was failing on rk3288-veyron-minnie.  See commit
> 984926781122 ("ARM: dts: rockchip: temporarily remove emmc hs200 speed
> from rk3288 minnie").  Although I didn't track down exactly when it
> started working, it seems to work OK now, so let's turn it back on.
> 
> To test this, I booted from SD card and then used this script to
> stress the enumeration process after fixing a memory leak [1]:
>   cd /sys/bus/platform/drivers/dwmmc_rockchip
>   for i in $(seq 1 3000); do
>     echo "========================" $i
>     echo ff0f0000.dwmmc > unbind
>     sleep .5
>     echo ff0f0000.dwmmc > bind
>     while true; do
>       if [ -e /dev/mmcblk2 ]; then
>         break;
>       fi
>       sleep .1
>     done
>   done
> 
> It worked fine.
> 
> [1] https://lkml.kernel.org/r/20190503233526.226272-1-dianders@chromium.org
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

applied for 5.3

Thanks
Heiko

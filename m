From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH] ARM: dts: rockchip: Make rk3288-veyron-mickey's emmc work again
Date: Tue, 07 May 2019 14:02:23 +0200
Message-ID: <3454489.epEtZypnqP@phil>
References: <20190503234537.230177-1-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190503234537.230177-1-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Douglas Anderson <dianders@chromium.org>
Cc: Shawn Lin <shawn.lin@rock-chips.com>, linux-rockchip@lists.infradead.org, briannorris@chromium.org, mka@chromium.org, amstan@chromium.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Am Samstag, 4. Mai 2019, 01:45:37 CEST schrieb Douglas Anderson:
> When I try to boot rk3288-veyron-mickey I totally fail to make the
> eMMC work.  Specifically my logs (on Chrome OS 4.19):
> 
>   mmc_host mmc1: card is non-removable.
>   mmc_host mmc1: Bus speed (slot 0) = 400000Hz (slot req 400000Hz, actual 400000HZ div = 0)
>   mmc_host mmc1: Bus speed (slot 0) = 50000000Hz (slot req 52000000Hz, actual 50000000HZ div = 0)
>   mmc1: switch to bus width 8 failed
>   mmc1: switch to bus width 4 failed
>   mmc1: new high speed MMC card at address 0001
>   mmcblk1: mmc1:0001 HAG2e 14.7 GiB
>   mmcblk1boot0: mmc1:0001 HAG2e partition 1 4.00 MiB
>   mmcblk1boot1: mmc1:0001 HAG2e partition 2 4.00 MiB
>   mmcblk1rpmb: mmc1:0001 HAG2e partition 3 4.00 MiB, chardev (243:0)
>   mmc_host mmc1: Bus speed (slot 0) = 400000Hz (slot req 400000Hz, actual 400000HZ div = 0)
>   mmc_host mmc1: Bus speed (slot 0) = 50000000Hz (slot req 52000000Hz, actual 50000000HZ div = 0)
>   mmc1: switch to bus width 8 failed
>   mmc1: switch to bus width 4 failed
>   mmc1: tried to HW reset card, got error -110
>   mmcblk1: error -110 requesting status
>   mmcblk1: recovery failed!
>   print_req_error: I/O error, dev mmcblk1, sector 0
>   ...
> 
> When I remove the '/delete-property/mmc-hs200-1_8v' then everything is
> hunky dory.
> 
> That line comes from the original submission of the mickey dts
> upstream, so presumably at the time the HS200 was failing and just
> enumerating things as a high speed device was fine.  ...or maybe it's
> just that some mickey devices work when enumerating at "high speed",
> just not mine?
> 
> In any case, hs200 seems good now.  Let's turn it on.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

applied for 5.3

Thanks
Heiko

From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH V2] DT: rockchip: Fix stability issues with the 'performance' governor on rock960
Date: Tue, 30 Oct 2018 15:18:06 +0100
Message-ID: <10930709.0rTHelch2x@phil>
References: <1539767918-26587-1-git-send-email-daniel.lezcano@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1539767918-26587-1-git-send-email-daniel.lezcano@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: linux-kernel@vger.kernel.org, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Vicente Bergas <vicencb@gmail.com>, Ezequiel Garcia <ezequiel@collabora.com>, Shawn Lin <shawn.lin@rock-chips.com>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM/Rockchip SoC support" <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Am Mittwoch, 17. Oktober 2018, 11:18:30 CET schrieb Daniel Lezcano:
> When the performance governor is set as default, the rock960 hangs
> around one minute after booting, whatever the activity is (idle, key
> pressed, loaded, ...).
> 
> Based on the commit log found at https://patchwork.kernel.org/patch/10092377/
> 
> "vdd_log has no consumer and therefore will not be set to a specific
> voltage. Still the PWM output pin gets configured and thence the vdd_log
> output voltage will changed from it's default. Depending on the idle
> state of the PWM this will slightly over or undervoltage the logic supply
> of the RK3399 and cause instability with GbE (undervoltage) and PCIe
> (overvoltage). Since the default value set by a voltage divider is the
> correct supply voltage and we don't need to change it during runtime we
> remove the rail from the devicetree completely so the PWM pin will not
> be configured."
> 
> After removing the vdd-log from the rock960's specific DT, the board
> does no longer hang and shows a stable behavior.
> 
> Apply the same change for the rock960 by removing the vdd-log from the
> DT.
> 
> Fixes: 874846f1fccd ("arm64: dts: rockchip: add 96boards RK3399 Ficus board")
> Tested-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>

applied as fix for 4.20
after including a stable-tag (board entered in previous kernel version)
and modified subject line a bit.


Thanks
Heiko

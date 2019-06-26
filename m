From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH] ARM: dts: rockchip: Configure BT_DEV_WAKE in on rk3288-veyron
Date: Wed, 26 Jun 2019 23:59:58 +0200
Message-ID: <1962605.yMxvVRIssp@phil>
References: <20190619183425.149470-1-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190619183425.149470-1-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Douglas Anderson <dianders@chromium.org>
Cc: linux-rockchip@lists.infradead.org, mka@chromium.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Am Mittwoch, 19. Juni 2019, 20:34:25 CEST schrieb Douglas Anderson:
> This is the other half of the hacky solution from commit f497ab6b4bb8
> ("ARM: dts: rockchip: Configure BT_HOST_WAKE as wake-up signal on
> veyron").  Specifically the LPM driver that the Broadcom Bluetooth
> expects to have (but is missing in mainline) has two halves of the
> equation: BT_HOST_WAKE and BT_DEV_WAKE.  The BT_HOST_WAKE (which was
> handled in the previous commit) is the one that lets the Bluetooth
> wake the system up.  The BT_DEV_WAKE (this patch) tells the Bluetooth
> that it's OK to go into a low power mode.  That means we were burning
> a bit of extra power in S3 without this patch.  Measurements are a bit
> noisy, but it appears to be a few mA worth of difference.
> 
> NOTE: Though these pins don't do much on systems with Marvell
> Bluetooth, downstream kernels set it on all veyron boards so we'll do
> the same.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

applied for 5.3

Thanks
Heiko

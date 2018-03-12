From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH] arm64: dts: rockchip: assign clock rate for ACLK_VIO
Date: Mon, 12 Mar 2018 11:52:54 +0100
Message-ID: <4610682.YhluMk2iks@phil>
References: <1520819448-8316-1-git-send-email-zhengsq@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1520819448-8316-1-git-send-email-zhengsq@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Shunqian Zheng <zhengsq@rock-chips.com>
Cc: linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, dianders@chromium.org
List-Id: devicetree@vger.kernel.org

Am Montag, 12. März 2018, 02:50:48 CET schrieb Shunqian Zheng:
> The ACLK_VIO is a parent clock used by a several children,
> its suggested clock rate is 400MHz. Right now it gets 400MHz
> because it sources from CPLL(800M) and divides by 2 after reset.
> It's good not to rely on default values like this, so let's
> explicitly set it.
> NOTE: it's expected that at least one board may override cru node and
> set the CPLL to 1.6 GHz. On that board it will be very important to be
> explicit about aclk-vio being 400 MHz.
> 
> Signed-off-by: Shunqian Zheng <zhengsq@rock-chips.com>

applied for 4.17

Thanks
Heiko

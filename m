From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v8 2/3] ARM: dts: Add LVDS info for rk3288
Date: Sat, 09 Sep 2017 01:45:53 +0200
Message-ID: <35833616.zLl8rNldH8@phil>
References: <1504351723-135876-1-git-send-email-hjc@rock-chips.com> <1504351732-135989-1-git-send-email-hjc@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1504351732-135989-1-git-send-email-hjc@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sandy Huang <hjc@rock-chips.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Am Samstag, 2. September 2017, 19:28:52 CEST schrieb Sandy Huang:
> add LVDS info in rk3288.dtsi for LVDS driver
> This based on the patches from Mark yao and Heiko Stuebner.
> 
> Signed-off-by: Mark yao <mark.yao@rock-chips.com>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> Signed-off-by: Sandy Huang <hjc@rock-chips.com>

applied for 4.15 after moving both the lvds node to its correct
position (please always sort by address) and fixed the register
addressing to honor the recent rk3288 64bit conversion.


Heiko

From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 6/6] arm64: dts: rockchip: Fix roc-rk3399-pc regulator input rails
Date: Fri, 04 Oct 2019 00:50:03 +0200
Message-ID: <3794940.QX3D9CpLXO@phil>
References: <20190919052822.10403-1-jagan@amarulasolutions.com> <20190919052822.10403-7-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190919052822.10403-7-jagan@amarulasolutions.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Levin Du <djw@t-chip.com.cn>, Akash Gajjar <akash@openedev.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Da Xue <da@lessconfused.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com
List-Id: devicetree@vger.kernel.org

Am Donnerstag, 19. September 2019, 07:28:22 CEST schrieb Jagan Teki:
> Few, know rk808 pmic regulators VCC[1-4], VCC[6-7], VCC[9-11],
> VDD_LOG, VDD_GPU, VDD_CPU_B, VCC3V3_SYS are inputting with vcc_sys
> which is 5V power rail from dc_12v.
> 
> So, replace the vin-supply of above mentioned regulators
> with vcc_sys as per the PMIC-RK808-D page of roc-rk3399-pc
> schematics.
> 
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>

applied for 5.5 (with the filename changed to the current one of course)

Thanks
Heiko

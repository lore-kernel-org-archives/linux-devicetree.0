From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 1/2] arm64: dts: rockchip: rockpro64 fix regulator gpios
Date: Thu, 06 Dec 2018 13:48:09 +0100
Message-ID: <1745654.q3GSn5YZ1a@phil>
References: <20181201100817.20688-1-oskari@lemmela.net> <20181201100817.20688-2-oskari@lemmela.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181201100817.20688-2-oskari@lemmela.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Oskari Lemmela <oskari@lemmela.net>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Akash Gajjar <Akash_Gajjar@mentor.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Am Samstag, 1. Dezember 2018, 11:08:16 CET schrieb Oskari Lemmela:
> Rockpro64 is not able boot if GPIO1_C1 pin is pulled high
> before loading linux kernel.
> 
> In rockpro64 GPIO1_C1 pin is connected vdd_cpu_b regulator
> VSEL pin. Pin should be pulled down in normal operation and
> pulled high in suspend.
> 
> PMIC LDO_REG2 is connected to touch panel connector.
> Rename regulator and set it to correct voltage.
> 
> PCIe power is controller by GPIO1_D0.
> 
> Schematics can be downloaded from:
> http://files.pine64.org/doc/rockpro64/rockpro64_v21-SCH.pdf
> 
> Signed-off-by: Oskari Lemmela <oskari@lemmela.net>

applied as fix for 4.20

Thanks
Heiko

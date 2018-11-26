From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v2] ARM: dts: rv1108: enable eMMC support
Date: Mon, 26 Nov 2018 10:03:15 +0100
Message-ID: <2374110.cSv9E7W1qs@phil>
References: <20181125211427.4926-1-otavio@ossystems.com.br>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181125211427.4926-1-otavio@ossystems.com.br>
Sender: linux-kernel-owner@vger.kernel.org
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Am Sonntag, 25. November 2018, 22:14:27 CET schrieb Otavio Salvador:
> Enable eMMC support for rv1108.dtsi as it can be used across multiple
> boards.
> 
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

applied for 4.21 after reordering the emmc pinctrl nodes a bit
and modifying the suject + commit message to be a bit more specific
in that we only add the common pin settings.


Heiko

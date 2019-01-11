From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 4/4] ARM: dts: rv1108: Add support for rv1108-elgin-r1
 board
Date: Fri, 11 Jan 2019 13:29:15 -0600
Message-ID: <20190111192915.GA17772@bogus>
References: <20190104014023.17973-1-otavio@ossystems.com.br>
 <20190104014023.17973-4-otavio@ossystems.com.br>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190104014023.17973-4-otavio@ossystems.com.br>
Sender: linux-kernel-owner@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Jason Zhu <jason.zhu@rock-chips.com>, Vicent Chi <vicent.chi@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>, Philipp Tomsic <philipp.tomsich@theobroma-systems.com>, Otavio Salvador <otavio@ossystems.com.br>, devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, Olof Johansson <olof@lixom.net>
List-Id: devicetree@vger.kernel.org

On Thu,  3 Jan 2019 23:40:23 -0200, Otavio Salvador wrote:
> rv1108-elgin-r1 board is based on Rockchip RV1108 SoC.
> 
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
> 
>  .../devicetree/bindings/arm/rockchip.yaml     |   5 +
>  arch/arm/boot/dts/Makefile                    |   1 +
>  arch/arm/boot/dts/rv1108-elgin-r1.dts         | 206 ++++++++++++++++++
>  3 files changed, 212 insertions(+)
>  create mode 100644 arch/arm/boot/dts/rv1108-elgin-r1.dts
> 

Reviewed-by: Rob Herring <robh@kernel.org>

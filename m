From: Dinh Nguyen <dinguyen@kernel.org>
Subject: Re: [PATCH] ARM: dts: socfpga: update to new Denali NAND binding
Date: Mon, 24 Jun 2019 10:39:20 -0500
Message-ID: <0e357fa8-3241-4ce4-fae7-d0ad36fb14c6@kernel.org>
References: <20190621112306.17769-1-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190621112306.17769-1-yamada.masahiro@socionext.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 6/21/19 6:23 AM, Masahiro Yamada wrote:
> With commit d8e8fd0ebf8b ("mtd: rawnand: denali: decouple controller
> and NAND chips"), the Denali NAND controller driver migrated to the
> new controller/chip representation.
> 
> Update DT for it.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
>  arch/arm/boot/dts/socfpga.dtsi                |  2 +-
>  arch/arm/boot/dts/socfpga_arria10.dtsi        |  2 +-
>  .../boot/dts/socfpga_arria10_socdk_nand.dts   | 20 ++++++++++++-------
>  3 files changed, 15 insertions(+), 9 deletions(-)
> 

Applied! Thanks!

Dinh

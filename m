From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 09/13] arm64: dts: rockchip: document explicit px30 cru
 dependencies
Date: Mon, 30 Sep 2019 17:58:11 -0500
Message-ID: <20190930225811.GA14016@bogus>
References: <20190917082659.25549-1-heiko@sntech.de>
 <20190917082659.25549-9-heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190917082659.25549-9-heiko@sntech.de>
Sender: linux-kernel-owner@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-rockchip@lists.infradead.org, christoph.muellner@theobroma-systems.com, Heiko Stuebner <heiko@sntech.de>
List-Id: devicetree@vger.kernel.org

On Tue, 17 Sep 2019 10:26:55 +0200, Heiko Stuebner wrote:
> The px30 contains 2 separate clock controllers the regular cru creating
> most clocks as well as the pmucru managing the GPLL and some other clocks.
> 
> The gpll of course also is needed by the cru, so while we normally do rely
> on clock names to associate clocks getting probed later on (for example
> xin32k coming from an i2c device in most cases) it is safer to declare the
> explicit dependency between the two crus. This makes sure that for example
> the clock-framework probes them in the correct order from the start.
> 
> The assigned-clocks properties were simply working by chance in the past
> so split them accordingly to the 2 crus to honor the loading direction.
> 
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  .../bindings/clock/rockchip,px30-cru.txt      |  5 ++++
>  arch/arm64/boot/dts/rockchip/px30.dtsi        | 25 +++++++++++--------
>  2 files changed, 20 insertions(+), 10 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

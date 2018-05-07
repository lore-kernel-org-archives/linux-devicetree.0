From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V2 4/8] ARM: dts: stm32: Add syscfg on stm32mp1
Date: Mon, 7 May 2018 11:36:19 -0500
Message-ID: <20180507163619.GB15212@rob-hp-laptop>
References: <1525270723-18241-1-git-send-email-christophe.roullier@st.com>
 <1525270723-18241-5-git-send-email-christophe.roullier@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1525270723-18241-5-git-send-email-christophe.roullier@st.com>
Sender: netdev-owner@vger.kernel.org
To: Christophe Roullier <christophe.roullier@st.com>
Cc: mark.rutland@arm.com, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, peppe.cavallaro@st.com, devicetree@vger.kernel.org, andrew@lunn.ch, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, May 02, 2018 at 04:18:39PM +0200, Christophe Roullier wrote:
> System configuration controller is mainly used to manage
> the compensation cell and other IOs and system related
> settings.
> 
> Signed-off-by: Christophe Roullier <christophe.roullier@st.com>
> ---
>  arch/arm/boot/dts/stm32mp157c.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/stm32mp157c.dtsi b/arch/arm/boot/dts/stm32mp157c.dtsi
> index bc3eddc..86421ba 100644
> --- a/arch/arm/boot/dts/stm32mp157c.dtsi
> +++ b/arch/arm/boot/dts/stm32mp157c.dtsi
> @@ -167,6 +167,11 @@
>  			#reset-cells = <1>;
>  		};
>  
> +		syscfg: system-config@50020000 {
> +			compatible = "syscon";
> +			reg = <0x50020000 0x400>;
> +		};

NAK as explained in the documentation patch.

Rob

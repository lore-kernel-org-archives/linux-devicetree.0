From: Nishanth Menon <nm@ti.com>
Subject: Re: [PATCH 3/3] arm64: dts: ti: k3-am654-base-board: enable USB1
Date: Tue, 15 Jan 2019 08:37:12 -0600
Message-ID: <20190115143712.hb2ogjcjxwokkioa@kahuna>
References: <1547200861-17795-1-git-send-email-rogerq@ti.com>
 <1547200861-17795-4-git-send-email-rogerq@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1547200861-17795-4-git-send-email-rogerq@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Roger Quadros <rogerq@ti.com>
Cc: devicetree@vger.kernel.org, vigneshr@ti.com, nsekhar@ti.com, linux-kernel@vger.kernel.org, t-kristo@ti.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 12:01-20190111, Roger Quadros wrote:
> Add pinmux for USB1 and enable it as a dual role port.
> 
> Signed-off-by: Roger Quadros <rogerq@ti.com>
> ---
>  arch/arm64/boot/dts/ti/k3-am654-base-board.dts | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am654-base-board.dts b/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
> index e41fc3a..c4f7b29 100644
> --- a/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
> @@ -69,6 +69,12 @@
>  			AM65X_IOPAD(0x01bc, PIN_OUTPUT, 0) /* (AG13) SPI0_CS0 */
>  		>;
>  	};
> +
> +	usb1_pins_default: usb1_pins_default {
> +		pinctrl-single,pins = <
> +			AM65X_IOPAD(0x02c0, PIN_OUTPUT, 0) /* (AC8) USB1_DRVVBUS */
> +		>;
> +	};
>  };
>  
>  &main_pmx1 {
> @@ -163,3 +169,17 @@
>  		#size-cells= <1>;
>  	};
>  };
> +
> +&dwc3_1 {
> +	status = "okay";
> +};
> +
> +&usb1_phy {
> +	status = "okay";
> +};

NAK -> we dont do status = "okay" in ARMV8.

> +
> +&usb1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&usb1_pins_default>;
> +	dr_mode = "otg";
> +};
> -- 
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
> 

-- 
Regards,
Nishanth Menon

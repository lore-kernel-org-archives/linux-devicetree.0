From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 4/4] ARM: dts: rockchip: Point rk3288 dwc2 usb at the full
 PHY reset
Date: Sun, 21 Aug 2016 14:06:18 +0300
Message-ID: <95d6e178-b9c5-ed40-2adc-5ffd1d78db07@cogentembedded.com>
References: <4c931176-a09a-546c-d2b6-ea74028c78a2@cogentembedded.com>
 <1471766205-12940-1-git-send-email-ayaka@soulik.info>
 <1471766205-12940-5-git-send-email-ayaka@soulik.info>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1471766205-12940-5-git-send-email-ayaka@soulik.info>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Li <ayaka@soulik.info>, linux-usb@vger.kernel.org
Cc: johnyoun@synopsys.com, gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, eddie.cai@rock-chips.com, randy.li@rock-chips.com, kishon@ti.com, linux-kernel@vger.kernel.org, heiko@sntech.de, linux-rockchip@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hello.

On 8/21/2016 10:56 AM, Randy Li wrote:

> The "host1" port (AKA the dwc2 port that isn't the OTG port) on rk3288
> has a hardware errata that causes everything to get confused when we get
> a remote wakeup.  We'll use the reset that's in the CRU to reset the
> port when it's in a bad state.
>
> Note that we add the reset to both dwc2 controllers even though only one
> has the errata in case we find some other use for this reset that's
> unrelated to the current hardware errata.  Only the host port gets the
> quirk property, though.
>
> This patch came from Doug Anderson <dianders@chromium.org> originally.

    Was it signed off by him? Don't you need to keep his authorship via th 
"From:" tag?

> Signed-off-by: Randy Li <ayaka@soulik.info>
> ---
>  arch/arm/boot/dts/rk3288.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
> index 48ca4e4..646f49d 100644
> --- a/arch/arm/boot/dts/rk3288.dtsi
> +++ b/arch/arm/boot/dts/rk3288.dtsi
[...]
> @@ -871,6 +873,9 @@
>  				clocks = <&cru SCLK_OTGPHY2>;
>  				clock-names = "phyclk";
>  				#clock-cells = <0>;
> +				resets = <&cru SRST_USBHOST1_PHY>;
> +				reset-names = "phy-reset";
> +

    Don't need empty line here.

>  			};
>  		};
>  	};

MBR , Sergei

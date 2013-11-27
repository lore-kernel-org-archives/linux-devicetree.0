From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH v3 9/9] ARM: dts: add usb udc support to bcm281xx
Date: Wed, 27 Nov 2013 14:27:19 +0530
Message-ID: <5295B3EF.8010602@ti.com>
References: <1385403367-18144-1-git-send-email-matt.porter@linaro.org>
 <1385403367-18144-10-git-send-email-matt.porter@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1385403367-18144-10-git-send-email-matt.porter@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Matt Porter <matt.porter@linaro.org>, Felipe Balbi <balbi@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Christian Daudt <bcm@fixthebug.org>, Paul Zimmerman <paulz@synopsys.com>
Cc: Devicetree List <devicetree@vger.kernel.org>, Kamil Debski <k.debski@samsung.com>, Linaro Patches <patches@linaro.org>, Tomasz Figa <t.figa@samsung.com>, Linux USB List <linux-usb@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Linux ARM Kernel List <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Monday 25 November 2013 11:46 PM, Matt Porter wrote:
> Adds USB OTG/PHY and clock support to BCM281xx and enables
> UDC support on the bcm11351-brt and bcm28155-ap boards.
> 
> Signed-off-by: Matt Porter <matt.porter@linaro.org>
> Reviewed-by: Markus Mayer <markus.mayer@linaro.org>
> Reviewed-by: Tim Kryger <tim.kryger@linaro.org>
> ---
>  arch/arm/boot/dts/bcm11351-brt.dts |  6 ++++++
>  arch/arm/boot/dts/bcm11351.dtsi    | 18 ++++++++++++++++++
>  arch/arm/boot/dts/bcm28155-ap.dts  |  8 ++++++++
>  3 files changed, 32 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/bcm11351-brt.dts b/arch/arm/boot/dts/bcm11351-brt.dts
> index 23cd16d..396b704 100644
> --- a/arch/arm/boot/dts/bcm11351-brt.dts
> +++ b/arch/arm/boot/dts/bcm11351-brt.dts
> @@ -44,5 +44,11 @@
>  		status = "okay";
>  	};
>  
> +	usbotg: usb@3f120000 {
> +		status = "okay";
> +	};

using &usbotg could have been better. I mean if you have something like
&usbotg, you realise that the node has been created somewhere and we are just
referencing it here to add more properties.

Thanks
Kishon

From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v7 11/13] ARM: dts: Berlin: enable USB on the BG2Q DMP
Date: Fri, 14 Nov 2014 21:47:11 +0300
Message-ID: <54664E2F.6070701@cogentembedded.com>
References: <1415978763-27345-1-git-send-email-antoine.tenart@free-electrons.com> <1415978763-27345-12-git-send-email-antoine.tenart@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1415978763-27345-12-git-send-email-antoine.tenart@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Antoine Tenart <antoine.tenart@free-electrons.com>, sebastian.hesselbarth@gmail.com, Peter.Chen@freescale.com, balbi@ti.com, p.zabel@pengutronix.de
Cc: alexandre.belloni@free-electrons.com, thomas.petazzoni@free-electrons.com, zmxu@marvell.com, jszhang@marvell.com, linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello.

On 11/14/2014 06:26 PM, Antoine Tenart wrote:

> Enable the 2 available USB PHY and USB nodes on the Marvell Berlin BG2Q
> DMP.

> Signed-off-by: Antoine Tenart <antoine.tenart@free-electrons.com>
> ---
>   arch/arm/boot/dts/berlin2q-marvell-dmp.dts | 53 ++++++++++++++++++++++++++++++
>   1 file changed, 53 insertions(+)

> diff --git a/arch/arm/boot/dts/berlin2q-marvell-dmp.dts b/arch/arm/boot/dts/berlin2q-marvell-dmp.dts
> index ea1f99b8eed6..f7c25580e122 100644
> --- a/arch/arm/boot/dts/berlin2q-marvell-dmp.dts
> +++ b/arch/arm/boot/dts/berlin2q-marvell-dmp.dts
[...]
> @@ -21,6 +23,39 @@
>   	choosen {
>   		bootargs = "console=ttyS0,115200 earlyprintk";
>   	};
> +
> +	regulators {
> +		compatible = "simple-bus";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		reg_usb0_vbus: regulator@0 {

    Erm, I'm not seeing the "reg" prop. The <unit-address> part of the name 
shouldn't be used without the "reg" prop.

[...]

WBR, Sergei

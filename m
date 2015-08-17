From: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V6 1/3] DT: nvmem: add binding for mxs-ocotp
Date: Mon, 17 Aug 2015 13:35:47 +0100
Message-ID: <55D1D523.3000309@linaro.org>
References: <1439418116-1833-1-git-send-email-stefan.wahren@i2se.com> <1439418116-1833-2-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1439418116-1833-2-git-send-email-stefan.wahren-eS4NqCHxEME@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, =?UTF-8?B?SmFudXN6IFXFvHlja2k=?= <j.uzycki-cjVIcFy54eMe9JSWTWOYM+658FiBabzs@public.gmane.org>, Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 12/08/15 23:21, Stefan Wahren wrote:
> This patch adds the devicetree bindings for the Freescale MXS On Chip
> OTP driver.
>
> Signed-off-by: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>

Acked-by: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

> ---
>   .../devicetree/bindings/nvmem/mxs-ocotp.txt        |   25 ++++++++++++++++++++
>   1 file changed, 25 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/nvmem/mxs-ocotp.txt
>
> diff --git a/Documentation/devicetree/bindings/nvmem/mxs-ocotp.txt b/Documentation/devicetree/bindings/nvmem/mxs-ocotp.txt
> new file mode 100644
> index 0000000..daebce9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/nvmem/mxs-ocotp.txt
> @@ -0,0 +1,25 @@
> +On-Chip OTP Memory for Freescale i.MX23/i.MX28
> +
> +Required properties :
> +- compatible :
> +  - "fsl,imx23-ocotp" for i.MX23
> +  - "fsl,imx28-ocotp" for i.MX28
> +- #address-cells : Should be 1
> +- #size-cells : Should be 1
> +- reg : Address and length of OTP controller registers
> +- clocks : Should contain a reference to the hbus clock
> +
> += Data cells =
> +Are child nodes of mxs-ocotp, bindings of which as described in
> +bindings/nvmem/nvmem.txt
> +
> +Example for i.MX28:
> +
> +	ocotp: ocotp@8002c000 {
> +		compatible = "fsl,imx28-ocotp", "fsl,ocotp";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		reg = <0x8002c000 0x2000>;
> +		clocks = <&clks 25>;
> +		status = "okay";
> +	};
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

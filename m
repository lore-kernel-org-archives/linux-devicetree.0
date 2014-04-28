From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [Ac100] [PATCH v2 5/6] ARM: tegra: paz00: add dt bindings for
 nvec
Date: Mon, 28 Apr 2014 17:04:13 -0600
Message-ID: <535EDE6D.2050505@wwwdotorg.org>
References: <[PATCH 0/3] ARM: tegra: add nvec keyboard support for paz00> <1398561270-25091-1-git-send-email-danindrey@mail.ru> <1398561270-25091-6-git-send-email-danindrey@mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1398561270-25091-6-git-send-email-danindrey-JGs/UdohzUI@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrey Danin <danindrey-JGs/UdohzUI@public.gmane.org>, Tom Warren <TWarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Julian Andres Klode <jak-4HMq4SXA452hPH1hqNUYSQ@public.gmane.org>, ac100-oU9gvf+ajcQ97yFScArB1dHuzzzSOjJt@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 04/26/2014 07:14 PM, Andrey Danin wrote:

This patch isn't adding DT bindings for NVEC, but rather add DT nodes.
The binding is the schema, not the content.

We need a DT binding document that's been reviewed by the DT binding
maintainers. Can you please first submit a patch to the Linux kernel
that modifies the existing I2C core and Tegra I2C controller binding
documentation to add slave mode support. Once that's fully reviewed and
ack'd, this patch series can implement support for it in U-Boot.

> diff --git a/arch/arm/dts/tegra20-paz00.dts b/arch/arm/dts/tegra20-paz00.dts

>  	i2c@7000c500 {
> -		status = "disabled";
> +		status = "okay";
> +		clock-frequency = <40000>;
> +		slave-addr = <138>;
> +		nvec {
> +			compatible = "nvidia,tegra20-nvec";
> +			request-gpios = <&gpio 170 0>; /* gpio PV2 */

The reg property is missing here. Since the i2c node has
#address-cells/#size-cells, there must be a reg property in the children.

There's nothing here to indicate that this node is a slave device rather
than a master device, and doesn't seem to be any allowance for a single
I2C controller to support both master and slave nodes at the same time
(which I think Tegra's controller can IIRC).

IIRC, I had previously suggested something like encoding master/slave
into the reg property of the I2C child nodes. We could either do:

a) Set some top-bit to indicate a slave device.

b) If #address-cells=<1>, only master devices are present. If
#address-cells=<2>, either master or slave devices could be present.
Cell 0 could be 0==master, 1==slave, and cell 1 the actual I2C bus address.

Either of those approaches would allow representing an I2C controller
that supported multiple slave addresses. Even though I think Tegra's
slave controller doesn't support that, I still think we should use a
generic binding so that I2C slave mode looks the same everywhere.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

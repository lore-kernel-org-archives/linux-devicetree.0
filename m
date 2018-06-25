From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: Re: [PATCH v2 3/7] bus: add bus driver for accessing
 Allwinner A64 DE2
Date: Mon, 25 Jun 2018 23:59:37 +0800
Message-ID: <4DFADAD6-3E17-425F-8B03-CAC4402BF14F@aosc.io>
References: <20180622124540.56203-1-icenowy@aosc.io> <20180622124540.56203-2-icenowy@aosc.io> <20180625155805.kds7bl3cburblwv6@flea>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBC5FYTMQKGQEYGIQWNQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180625155805.kds7bl3cburblwv6@flea>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org



=E4=BA=8E 2018=E5=B9=B46=E6=9C=8825=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=8811=
:58:05, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> =E5=86=99=E5=88=B0:
>On Fri, Jun 22, 2018 at 08:45:36PM +0800, Icenowy Zheng wrote:
>> The "Display Engine 2.0" (usually called DE2) on the Allwinner A64
>SoC
>> is different from the ones on other Allwinner SoCs. It requires a
>SRAM
>> region to be claimed, otherwise all DE2 subblocks won't be
>accessible.
>>=20
>> Add a bus driver for the Allwinner A64 DE2 part which claims the SRAM
>> region when probing.
>>=20
>> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
>> ---
>> No changes since v1.
>>=20
>>  drivers/bus/Kconfig      | 10 ++++++++
>>  drivers/bus/Makefile     |  1 +
>>  drivers/bus/sun50i-de2.c | 49
>++++++++++++++++++++++++++++++++++++++++
>>  3 files changed, 60 insertions(+)
>>  create mode 100644 drivers/bus/sun50i-de2.c
>>=20
>> diff --git a/drivers/bus/Kconfig b/drivers/bus/Kconfig
>> index d1c0b60e9326..1851112ccc29 100644
>> --- a/drivers/bus/Kconfig
>> +++ b/drivers/bus/Kconfig
>> @@ -103,6 +103,16 @@ config SIMPLE_PM_BUS
>>  	  Controller (BSC, sometimes called "LBSC within Bus Bridge", or
>>  	  "External Bus Interface") as found on several Renesas ARM SoCs.
>> =20
>> +config SUN50I_DE2_BUS
>> +	bool "Allwinner A64 DE2 Bus Driver"
>> +	  default ARM64
>> +	  depends on ARCH_SUNXI
>> +	  select SUNXI_SRAM
>> +	  help
>
>The alignment here should be one tab.
>
>> +static int sun50i_de2_bus_probe(struct platform_device *pdev)
>> +{
>> +	struct device_node *np =3D pdev->dev.of_node;
>> +	int ret;
>> +
>> +	ret =3D sunxi_sram_claim(&pdev->dev);
>> +	if (ret) {
>> +		dev_err(&pdev->dev, "Error couldn't map SRAM to device\n");
>> +		return ret;
>> +	}
>> +
>> +	if (np)
>> +		of_platform_populate(np, NULL, NULL, &pdev->dev);
>
>Why do you need to test np here?

Oh thanks. Currently it's only probeable via dt.

>
>Maxime

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

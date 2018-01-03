From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: Re: [PATCH v2] ARM: dts: imx6: RDU2: disable internal watchdog
Date: Wed, 3 Jan 2018 09:04:55 -0800
Message-ID: <CAHQ1cqGE8GzHiHq0NRPoAKmrqv6ZDcFO+0=hnAEtog8jcnapyQ@mail.gmail.com>
References: <20180101212451.11516-1-andrew.smirnov@gmail.com> <CAOMZO5AZU0LOcz6s2w-mThJfJeO0_mXga_1Cc2-aBkMOXk_-dA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOMZO5AZU0LOcz6s2w-mThJfJeO0_mXga_1Cc2-aBkMOXk_-dA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Fabio Estevam <festevam@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Chris Healy <cphealy@gmail.com>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Lucas Stach <l.stach@pengutronix.de>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 1, 2018 at 1:50 PM, Fabio Estevam <festevam@gmail.com> wrote:
> Hi Andrey,
>
> On Mon, Jan 1, 2018 at 7:24 PM, Andrey Smirnov <andrew.smirnov@gmail.com> wrote:
>
>> diff --git a/arch/arm/boot/dts/imx6qdl-zii-rdu2.dtsi b/arch/arm/boot/dts/imx6qdl-zii-rdu2.dtsi
>> index 6bef9a98678e..818bfc8692a5 100644
>> --- a/arch/arm/boot/dts/imx6qdl-zii-rdu2.dtsi
>> +++ b/arch/arm/boot/dts/imx6qdl-zii-rdu2.dtsi
>> @@ -838,6 +838,10 @@
>>         status = "okay";
>>  };
>>
>> +&wdog1 {
>> +       status = "disabled";
>> +};
>> +
>>  &audmux {
>
> We should keep the nodes in alphabetical order. Other than that:
>
> Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>

It seems that with exception of "audmux" and "iomuxc" the nodes are in
alphabetical order (and I suspect "audmux" falls under the same
exception "iomuxc" does?). What did you have in mind for that node?
Placing it after "audmux"?

Thanks,
Andrey Smirnov

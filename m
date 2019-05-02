From: Rui Miguel Silva <rui.silva@linaro.org>
Subject: Re: [PATCH 1/2] ARM: dts: imx6ul: Add csi node
Date: Thu, 02 May 2019 16:49:06 +0100
Message-ID: <m3ftpw6eml.fsf@linaro.org>
References: <20190430074730.8236-1-sebastien.szymanski@armadeus.com> <CAOMZO5D=BHWgOieLfz4bxL8v4bDmNOutUUnYSzW89KNtYn=Z9g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <CAOMZO5D=BHWgOieLfz4bxL8v4bDmNOutUUnYSzW89KNtYn=Z9g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Fabio Estevam <festevam@gmail.com>
Cc: =?utf-8?Q?S=C3=A9bastien?= Szymanski <sebastien.szymanski@armadeus.com>, linux-kernel <linux-kernel@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

Oi Fabio,
On Thu 02 May 2019 at 16:28, Fabio Estevam wrote:
> [Adding Rui]
>
> On Tue, Apr 30, 2019 at 4:47 AM S=C3=A9bastien Szymanski
> <sebastien.szymanski@armadeus.com> wrote:
>>
>> Add csi node for i.MX6UL SoC.
>>
>> Signed-off-by: S=C3=A9bastien Szymanski <sebastien.szymanski@armadeus.co=
m>
>> ---
>>  arch/arm/boot/dts/imx6ul.dtsi | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/imx6ul.dtsi b/arch/arm/boot/dts/imx6ul.dt=
si
>> index 62ed30c781ed..af322bc58333 100644
>> --- a/arch/arm/boot/dts/imx6ul.dtsi
>> +++ b/arch/arm/boot/dts/imx6ul.dtsi
>> @@ -951,6 +951,17 @@
>>                                 };
>>                         };
>>
>> +                       csi: csi@21c4000 {
>> +                               compatible =3D "fsl,imx6ul-csi", "fsl,im=
x7-csi";
>> +                               reg =3D <0x021c4000 0x4000>;
>> +                               interrupts =3D <GIC_SPI 7 IRQ_TYPE_LEVEL=
_HIGH>;
>> +                               clocks =3D <&clks IMX6UL_CLK_DUMMY>,
>> +                                        <&clks IMX6UL_CLK_CSI>,
>> +                                        <&clks IMX6UL_CLK_DUMMY>;
>> +                               clock-names =3D "axi", "mclk", "dcic";
>
> Also, I understand you followed
> Documentation/devicetree/bindings/media/imx7-csi.txt and passed these
> three clocks, but looking at the i.MX7D and i.MX6UL/ULL Reference
> Manuals, I don't find the  the descriptions for the "axi" and "dcic"
> CSI clocks.
>
> It looks like that only "mclk" is what we really need here.

Yeah, you are right.

>
> Should we change the bindings and the imx7-csi driver to not request
> "axi" and "dcic" clocks?
>
> Rui, what do you think? If you agree I can send a fix for this.

If you please, that would be great. thanks.

---
Cheers,
	Rui

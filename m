From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 1/4] dt: fsl-imx-esdhc.txt: Fix gpio number assignment
Date: Sun, 10 Jun 2012 23:03:21 -0300
Message-ID: <CAOMZO5A-QUA_i0HOWm-dZq6pbcFPMyuQbX+1N3hr7NVbRhjxVw@mail.gmail.com>
References: <1339349050-3105-1-git-send-email-festevam@gmail.com>
	<4FD529B0.6010401@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <4FD529B0.6010401@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: grant.likely@secretlab.ca, Fabio Estevam <fabio.estevam@freescale.com>, linux-doc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, rob.herring@calxeda.com, kernel@pengutronix.de
List-Id: devicetree@vger.kernel.org

On Sun, Jun 10, 2012 at 8:11 PM, Rob Herring <robherring2@gmail.com> wr=
ote:
> On 06/10/2012 12:24 PM, Fabio Estevam wrote:
>> From: Fabio Estevam <fabio.estevam@freescale.com>
>>
>> Fix gpio number assignment, so that it can match the number stated i=
n the comment.
>>
>> Cc:
>> Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
>> ---
>> =C2=A0.../devicetree/bindings/mmc/fsl-imx-esdhc.txt =C2=A0 =C2=A0 =C2=
=A0| =C2=A0 =C2=A04 ++--
>> =C2=A01 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.txt=
 b/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.txt
>> index c7e404b..fea541e 100644
>> --- a/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.txt
>> +++ b/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.txt
>> @@ -29,6 +29,6 @@ esdhc@70008000 {
>> =C2=A0 =C2=A0 =C2=A0 compatible =3D "fsl,imx51-esdhc";
>> =C2=A0 =C2=A0 =C2=A0 reg =3D <0x70008000 0x4000>;
>> =C2=A0 =C2=A0 =C2=A0 interrupts =3D <2>;
>> - =C2=A0 =C2=A0 cd-gpios =3D <&gpio0 6 0>; /* GPIO1_6 */
>> - =C2=A0 =C2=A0 wp-gpios =3D <&gpio0 5 0>; /* GPIO1_5 */
>> + =C2=A0 =C2=A0 cd-gpios =3D <&gpio1 6 0>; /* GPIO1_6 */
>> + =C2=A0 =C2=A0 wp-gpios =3D <&gpio1 5 0>; /* GPIO1_5 */
>
> Are you sure all these aren't just DT is 0 based and the chip is 1 ba=
sed
> numbering?

We start counting gpio number from 0 in i.mx, so the DT number and the
GPIO number should match.

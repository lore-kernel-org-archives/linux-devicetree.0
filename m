From: Jason Hui <jason.hui-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V2 2/3] arm/dt: add very basic dts file for babbage board
Date: Tue, 8 Mar 2011 10:20:33 +0800
Message-ID: <AANLkTi=NO+=wa8m980Q_uEMQDOXOUwy7h8Fzi4KZJ+a0@mail.gmail.com>
References: <1299503160-9910-1-git-send-email-jason.hui@linaro.org>
	<1299503160-9910-3-git-send-email-jason.hui@linaro.org>
	<20110307145136.GC9978@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110307145136.GC9978-rvtDTF3kK1ictlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi, Shawn,

On Mon, Mar 7, 2011 at 10:51 PM, Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> Aha, Jason. =A0Grant and I put many comments on v1 of this patch, but it
> seems that v2 is identical to v1, except adding Rob Herring sign-off.

Please compare with v1 and say it once again, It should include the
grant and your comments except the mxctty1
due to I think that it's not one issue, So, I did not take your comments.

But I observed that some comments as Grant suggest to use decimal not
hex value for #address-cells and #size-cells,
not applied to this file globally, I will fix it in the V3 patch if need.

>
> On Mon, Mar 07, 2011 at 09:05:59PM +0800, Jason Liu wrote:
>> Signed-off-by: Jason Liu <r64343-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>> Singed-off-by: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>> =A0arch/arm/boot/dts/babbage.dts | =A0110 ++++++++++++++++++++++++++++++=
+++++++++++
>> =A01 files changed, 110 insertions(+), 0 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/babbage.dts b/arch/arm/boot/dts/babbage.d=
ts
>> new file mode 100644
>> index 0000000..46a3071
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/babbage.dts
>> @@ -0,0 +1,110 @@
>> +/dts-v1/;
>> +
>> +/ {
>> + =A0 =A0 model =3D "Freescale i.MX51 Babbage";
>> + =A0 =A0 compatible =3D "fsl,mx51-babbage";
>> + =A0 =A0 #address-cells =3D <0x1>;
>> + =A0 =A0 #size-cells =3D <0x1>;
>> + =A0 =A0 #interrupt-cells =3D <0x1>;
>> + =A0 =A0 interrupt-parent =3D <&tzic>;
>> +
>> + =A0 =A0 memory {
>> + =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x90000000 0x20000000>;
>> + =A0 =A0 };
>> +
>> + =A0 =A0 chosen {
>> + =A0 =A0 =A0 =A0 =A0 =A0 bootargs =3D "console=3Dttymxc1,115200n8 debug=
 earlyprintk";
>> + =A0 =A0 };
>> +
>> + =A0 =A0 soc {
>> + =A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D <1>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 #size-cells =3D <1>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "simple-bus";
>> + =A0 =A0 =A0 =A0 =A0 =A0 ranges;
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 tzic: tzic@0 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D <0>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #interrupt-cells =3D <1>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupt-controller;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0xe0000000 0x1000>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "fsl,imx51-tzic=
";
>> + =A0 =A0 =A0 =A0 =A0 =A0 };
>> + =A0 =A0 };
>> +
>> + =A0 =A0 clocks {
>> + =A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D <1>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 #size-cells =3D <0>;
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 uart0_clk: uart@0 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "clock";
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clock-outputs =3D "imx-uart.0";
>> + =A0 =A0 =A0 =A0 =A0 =A0 };
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 uart1_clk: uart@1 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "clock";
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clock-outputs =3D "imx-uart.1";
>> + =A0 =A0 =A0 =A0 =A0 =A0 };
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 uart2_clk: uart@2 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "clock";
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clock-outputs =3D "imx-uart.2";
>> + =A0 =A0 =A0 =A0 =A0 =A0 };
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 fec_clk: fec@0 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "clock";
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clock-outputs =3D "fec.0";
>> + =A0 =A0 =A0 =A0 =A0 =A0 };
>> + =A0 =A0 };
>> +
>> + =A0 =A0 spba@70000000 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D <0x1>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 #size-cells =3D <0x1>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "simple-bus";
>> + =A0 =A0 =A0 =A0 =A0 =A0 ranges =3D <0x0 0x70000000 0x100000>;
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 imx-uart@c000 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "imx-uart";
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0xc000 0x1000>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <0x21>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 rts-cts;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 uart-clock =3D <&uart2_clk>, "=
uart";
>> + =A0 =A0 =A0 =A0 =A0 =A0 };
>> + =A0 =A0 };
>> +
>> + =A0 =A0 aips@73f00000 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D <0x1>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 #size-cells =3D <0x1>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "simple-bus";
>> + =A0 =A0 =A0 =A0 =A0 =A0 ranges =3D <0x0 0x73f00000 0x100000>;
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 imx-uart@bc000 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "imx-uart";
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0xbc000 0x1000>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <0x1f>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 rts-cts;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 uart-clock =3D <&uart0_clk>, "=
uart";
>> + =A0 =A0 =A0 =A0 =A0 =A0 };
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 imx-uart@c0000 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "imx-uart";
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0xc0000 0x1000>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <0x20>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 rts-cts;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 uart-clock =3D <&uart1_clk>, "=
uart";
>> + =A0 =A0 =A0 =A0 =A0 =A0 };
>> + =A0 =A0 };
>> +
>> + =A0 =A0 aips@83f00000 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D <0x1>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 #size-cells =3D <0x1>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "simple-bus";
>> + =A0 =A0 =A0 =A0 =A0 =A0 ranges =3D <0x0 0x83f00000 0x100000>;
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 fec@ec000 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "fec";
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0xec000 0x1000>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <0x57>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 fec_clk-clock =3D <&fec_clk>, =
"fec";
>> + =A0 =A0 =A0 =A0 =A0 =A0 };
>> + =A0 =A0 };
>> +};
>> --
>> 1.7.0.4
>>
>>
>> _______________________________________________
>> linaro-dev mailing list
>> linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
>> http://lists.linaro.org/mailman/listinfo/linaro-dev
>>
>
> --
> Regards,
> Shawn
>
>

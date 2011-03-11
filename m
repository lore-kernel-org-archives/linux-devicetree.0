From: Jason Hui <jason.hui-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V4 2/5] arm/dt: add very basic dts file for babbage board
Date: Fri, 11 Mar 2011 15:33:24 +0800
Message-ID: <AANLkTinRtj1WpAgyPzD2+eHeESMVLZL=ziQvAfZDXb87@mail.gmail.com>
References: <1299733185-2172-1-git-send-email-jason.hui@linaro.org>
	<1299733185-2172-3-git-send-email-jason.hui@linaro.org>
	<20110311065655.GA2827@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
In-Reply-To: <20110311065655.GA2827-rvtDTF3kK1ictlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi, Shawn,

On Fri, Mar 11, 2011 at 2:56 PM, Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> Hi Jason,
>
> On Thu, Mar 10, 2011 at 12:59:42PM +0800, Jason Liu wrote:
>> Signed-off-by: Jason Liu <jason.hui-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> Signed-off-by: Jason Liu <r64343-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>> Singed-off-by: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>> =A0arch/arm/boot/dts/babbage.dts | =A0122 ++++++++++++++++++++++++++++++=
+++++++++++
>> =A01 files changed, 122 insertions(+), 0 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/babbage.dts b/arch/arm/boot/dts/babbage.d=
ts
>> new file mode 100644
>> index 0000000..ab87a1b
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/babbage.dts
>> @@ -0,0 +1,122 @@
>> +/*
>> + * Copyright 2011 Linaro Ltd.
>> + * Copyright 2011 Freescale Semiconductor, Inc.
>> + *
>> + * The code contained herein is licensed under the GNU General Public
>> + * License. You may obtain a copy of the GNU General Public License
>> + * Version 2 or later at the following locations:
>> + *
>> + * http://www.opensource.org/licenses/gpl-license.html
>> + * http://www.gnu.org/copyleft/gpl.html
>> + */
>> +
>> +/dts-v1/;
>> +
>> +/ {
>> + =A0 =A0 model =3D "Freescale i.MX51 Babbage";
>> + =A0 =A0 compatible =3D "fsl,mx51-babbage";
>> + =A0 =A0 #address-cells =3D <1>;
>> + =A0 =A0 #size-cells =3D <1>;
>> + =A0 =A0 #interrupt-cells =3D <1>;
>> + =A0 =A0 interrupt-parent =3D <&tzic>;
>> +
>> + =A0 =A0 memory {
>> + =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x90000000 0x20000000>;
>> + =A0 =A0 };
>> +
>> + =A0 =A0 chosen {
>> + =A0 =A0 =A0 =A0 =A0 =A0 bootargs =3D "console=3Dttymxc0,115200n8 debug=
 earlyprintk ip=3Ddhcp";
>> + =A0 =A0 };
>> +
>> + =A0 =A0 soc {
>> + =A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D <1>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 #size-cells =3D <1>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "simple-bus";
>> + =A0 =A0 =A0 =A0 =A0 =A0 ranges;
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 tzic: tz-interrupt-controller {
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
>> + =A0 =A0 =A0 =A0 =A0 =A0 uart0_clk: uart0 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "clock";
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clock-outputs =3D "imx-uart.0";
>> + =A0 =A0 =A0 =A0 =A0 =A0 };
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 uart1_clk: uart1 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "clock";
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clock-outputs =3D "imx-uart.1";
>> + =A0 =A0 =A0 =A0 =A0 =A0 };
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 uart2_clk: uart2 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "clock";
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clock-outputs =3D "imx-uart.2";
>> + =A0 =A0 =A0 =A0 =A0 =A0 };
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 fec_clk: fec {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "clock";
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clock-outputs =3D "fec.0";
>> + =A0 =A0 =A0 =A0 =A0 =A0 };
>> + =A0 =A0 };
>> +
>> + =A0 =A0 aips@73f00000 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D <1>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 #size-cells =3D <1>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "simple-bus";
>> + =A0 =A0 =A0 =A0 =A0 =A0 ranges =3D <0x0 0x73f00000 0x100000>;
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 imx-uart@bc000 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "fsl,imx51-uart=
";
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0xbc000 0x1000>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <0x1f>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 fsl,has-rts-cts;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 uart-clock =3D <&uart0_clk>, "=
uart";
>> + =A0 =A0 =A0 =A0 =A0 =A0 };
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 imx-uart@c0000 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "fsl,imx51-uart=
";
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0xc0000 0x1000>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <0x20>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 fsl,has-rts-cts;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 uart-clock =3D <&uart1_clk>, "=
uart";
>> + =A0 =A0 =A0 =A0 =A0 =A0 };
>> + =A0 =A0 };
>> +
>> + =A0 =A0 spba@70000000 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D <1>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 #size-cells =3D <1>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "simple-bus";
>> + =A0 =A0 =A0 =A0 =A0 =A0 ranges =3D <0x0 0x70000000 0x100000>;
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 imx-uart@c000 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "fsl,imx51-uart=
";
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0xc000 0x1000>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <0x21>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 fsl,has-rts-cts;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 uart-clock =3D <&uart2_clk>, "=
uart";
>> + =A0 =A0 =A0 =A0 =A0 =A0 };
>> + =A0 =A0 };
>> +
> Moving spba@70000000 section after aips@73f00000 seems a quick fix to
> get console=3Dttymxc0, but not a right fix to me.
>
> I do not find a real example on mx51, but let's make one, saying
> there are two instance of one IP block, xyz1 and xyz2, and xyz1 is on
> bus spba@70000000) while xyz2 is on bus apis@73f00000. =A0Your fix is
> broken here, as you need to put spba@70000000 after aips@73f00000 for
> uart driver, while xyz driver requires spba@70000000 stays before
> aips@73f00000.

No, I don't think so. Where the section is put is not one strict rule,
take a look at
powerpc dts file, you will see that.

>
> Also this quick fix is working for uart, but will not for some others,
> for example, eCSPI and SSI, which requires spba@70000000 even behind
> aips@83f00000 with your solution.

I don't see what's wrong with eCSPI and SSI when put spba behind aips
just like uart.
I will not take your comments.

BR,
Jason

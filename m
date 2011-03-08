From: Jason Hui <jason.hui-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/5] arm/dts: babbage: add gpt and uart related clock nodes
Date: Tue, 8 Mar 2011 15:27:07 +0800
Message-ID: <AANLkTi=O-p6bX2W7UXjWQSUmjP4M370JpzPTd6j3=-Cq@mail.gmail.com>
References: <1299514932-13558-1-git-send-email-shawn.guo@linaro.org>
	<1299514932-13558-2-git-send-email-shawn.guo@linaro.org>
	<AANLkTima=zGr96dZUaYvCN6oE=KCY=ySOgOLweEJYk97@mail.gmail.com>
	<20110308070716.GA16642@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110308070716.GA16642-rvtDTF3kK1ictlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
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
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi, Shawn,

On Tue, Mar 8, 2011 at 3:07 PM, Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> On Tue, Mar 08, 2011 at 02:56:52PM +0800, Jason Hui wrote:
>> Hi, Shawn,
>>
>> On Tue, Mar 8, 2011 at 12:22 AM, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>> > The patch is to add all gpt, uart related dt clock nodes for babbage.
>> > It sticks to the clock name used in clock-mx51-mx53.c, so that
>> > everything gets consistent to Reference Manual. =A0For example, the
>> > numbering in clock name usually starts from 1, while 'reg' property
>> > numbering starts from 0 to easy clock binding.
>> >
>> > Besides the generally used clock bindings, the following properties
>> > are proposed in this patch.
>> >
>> > * clock-alias
>> > Like clock-outputs to reflect cl->dev_id, property clock-alias is
>> > defined to reflect cl->con_id.
>> >
>> > * clock-depend
>> > The mxc 'struct clk' has the member 'secondary' to refer to the clock
>> > that the 'clk' has dependency on. =A0This 'secondary' clock needs to be
>> > on whenever the 'clk' is set to on. =A0This clock-depend property is
>> > defined to reflect this 'secondary' clock.
>> >
>> > Signed-off-by: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> > ---
>> > =A0arch/arm/boot/dts/babbage.dts | =A0162 ++++++++++++++++++++++++++++=
+++++++++++--
>> > =A01 files changed, 156 insertions(+), 6 deletions(-)
>> >
>> > diff --git a/arch/arm/boot/dts/babbage.dts b/arch/arm/boot/dts/babbage=
.dts
>> > index 46a3071..1774cec 100644
>> > --- a/arch/arm/boot/dts/babbage.dts
>> > +++ b/arch/arm/boot/dts/babbage.dts
>> > @@ -35,19 +35,169 @@
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0#address-cells =3D <1>;
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0#size-cells =3D <0>;
>> >
>> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 uart0_clk: uart@0 {
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ckil_clk: clkil {
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "fixed-cl=
ock";
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #frequency-cells =3D <1>;
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clock-outputs =3D "clil";
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clock-frequency =3D <327=
68>;
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
>> > +
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ckih_clk: ckih {
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "fixed-cl=
ock";
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #frequency-cells =3D <1>;
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clock-outputs =3D "ckih";
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clock-frequency =3D <225=
79200>;
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
>> > +
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 osc_clk: soc {
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "fixed-cl=
ock";
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #frequency-cells =3D <1>;
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clock-outputs =3D "osc";
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clock-frequency =3D <240=
00000>;
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
>> > +
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pll1_main_clk: pll1_main {
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "clock";
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0>;
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clock-outputs =3D "pll1_=
main";
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clock-source =3D <&osc_c=
lk>;
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
>> > +
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pll1_sw_clk: pll_switch@0 {
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "clock";
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0>;
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clock-outputs =3D "pll1_=
sw";
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clock-source =3D <&pll1_=
main_clk>;
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
>> > +
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pll2_sw_clk: pll_switch@1 {
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "clock";
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <1>;
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clock-outputs =3D "pll2_=
sw";
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clock-source =3D <&osc_c=
lk>;
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
>> >
>>
>> It seems that you mis-used the reg property, it need fixed globally.
>>
> I guessed it out from Grant's comment on your babbage.dts as below.

I don't understand clearly. Can we have the this usage, grant? reg=3D<1>
in this case, it will  be
decoded as clk->id finally.

pll2_sw_clk: pll_switch@1 {
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "clock";
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <1>;
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clock-outputs =3D "pll2_=
sw";
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clock-source =3D <&osc_c=
lk>;
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };

I just want to raise the problems. According to ePAPR,
2.3.6 reg
Property: reg
Value type: <prop-encoded-array> encoded as arbitrary number of
(address,length) pairs.
Description:
The reg property describes the address and length of a device=92s memory
mapped register
space within its parent=92s address space. The value is a
<prop-encoded-array>, composed of
an arbitrary number of pairs of address and length, <address, length>.
The number of <u32> cells required to specify the address and length
are bus-specific and are
specified by the #address-cells and #size-cells properties in the
parent of the device node. If
the parent node specifies a value of 0 for #size-cells, the length
field in the value of reg shall
be omitted.
Example:
Suppose a device within a system-on-a-chip had two blocks of
registers=97a 32-byte block at
offset 0x3000 in the SOC and a 256-byte block at offset 0xFE00. The
reg property would be
encoded as follows (assuming #address-cells and #size-cells values of 1):
reg =3D <0x3000 0x20 0xFE00 0x100>;

> --- quote end ---
>
> --
> Regards,
> Shawn
>
>

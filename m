From: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH 1/5] arm/dts: babbage: add gpt and uart related clock nodes
Date: Tue, 8 Mar 2011 15:07:17 +0800
Message-ID: <20110308070716.GA16642@S2101-09.ap.freescale.net>
References: <1299514932-13558-1-git-send-email-shawn.guo@linaro.org>
	<1299514932-13558-2-git-send-email-shawn.guo@linaro.org>
	<AANLkTima=zGr96dZUaYvCN6oE=KCY=ySOgOLweEJYk97@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <AANLkTima=zGr96dZUaYvCN6oE=KCY=ySOgOLweEJYk97-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: Jason Hui <jason.hui-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Mar 08, 2011 at 02:56:52PM +0800, Jason Hui wrote:
> Hi, Shawn,
> =

> On Tue, Mar 8, 2011 at 12:22 AM, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> > The patch is to add all gpt, uart related dt clock nodes for babbage.
> > It sticks to the clock name used in clock-mx51-mx53.c, so that
> > everything gets consistent to Reference Manual. =A0For example, the
> > numbering in clock name usually starts from 1, while 'reg' property
> > numbering starts from 0 to easy clock binding.
> >
> > Besides the generally used clock bindings, the following properties
> > are proposed in this patch.
> >
> > * clock-alias
> > Like clock-outputs to reflect cl->dev_id, property clock-alias is
> > defined to reflect cl->con_id.
> >
> > * clock-depend
> > The mxc 'struct clk' has the member 'secondary' to refer to the clock
> > that the 'clk' has dependency on. =A0This 'secondary' clock needs to be
> > on whenever the 'clk' is set to on. =A0This clock-depend property is
> > defined to reflect this 'secondary' clock.
> >
> > Signed-off-by: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > ---
> > =A0arch/arm/boot/dts/babbage.dts | =A0162 +++++++++++++++++++++++++++++=
++++++++++--
> > =A01 files changed, 156 insertions(+), 6 deletions(-)
> >
> > diff --git a/arch/arm/boot/dts/babbage.dts b/arch/arm/boot/dts/babbage.=
dts
> > index 46a3071..1774cec 100644
> > --- a/arch/arm/boot/dts/babbage.dts
> > +++ b/arch/arm/boot/dts/babbage.dts
> > @@ -35,19 +35,169 @@
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0#address-cells =3D <1>;
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0#size-cells =3D <0>;
> >
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 uart0_clk: uart@0 {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ckil_clk: clkil {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "fixed-clo=
ck";
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #frequency-cells =3D <1>;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clock-outputs =3D "clil";
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clock-frequency =3D <3276=
8>;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> > +
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ckih_clk: ckih {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "fixed-clo=
ck";
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #frequency-cells =3D <1>;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clock-outputs =3D "ckih";
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clock-frequency =3D <2257=
9200>;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> > +
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 osc_clk: soc {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "fixed-clo=
ck";
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #frequency-cells =3D <1>;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clock-outputs =3D "osc";
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clock-frequency =3D <2400=
0000>;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> > +
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pll1_main_clk: pll1_main {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "clock";
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0>;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clock-outputs =3D "pll1_m=
ain";
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clock-source =3D <&osc_cl=
k>;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> > +
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pll1_sw_clk: pll_switch@0 {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "clock";
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0>;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clock-outputs =3D "pll1_s=
w";
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clock-source =3D <&pll1_m=
ain_clk>;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> > +
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pll2_sw_clk: pll_switch@1 {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "clock";
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <1>;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clock-outputs =3D "pll2_s=
w";
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clock-source =3D <&osc_cl=
k>;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> >
> =

> It seems that you mis-used the reg property, it need fixed globally.
> =

I guessed it out from Grant's comment on your babbage.dts as below.

--- quote begin ---
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 uart_clk0: uart@0 {

@0 should only be specified if the node has a 'reg =3D <0>' property.
In this case it doesn't so either 'reg' should be added, or '@0'
should be removed.
--- quote end ---

-- =

Regards,
Shawn

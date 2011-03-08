From: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH 1/5] arm/dts: babbage: add gpt and uart related clock nodes
Date: Tue, 8 Mar 2011 11:44:48 +0800
Message-ID: <20110308034447.GB14370@S2101-09.ap.freescale.net>
References: <1299514932-13558-1-git-send-email-shawn.guo@linaro.org>
	<1299514932-13558-2-git-send-email-shawn.guo@linaro.org>
	<AANLkTimn4fNvM0bSHnpuQmCAweTZ00JQCZCZ=vOdV4NZ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <AANLkTimn4fNvM0bSHnpuQmCAweTZ00JQCZCZ=vOdV4NZ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Mar 07, 2011 at 10:48:10AM -0700, Grant Likely wrote:
> On Mon, Mar 7, 2011 at 9:22 AM, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
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
> =

> This feels like leakage of Linux kernel implementation details getting
> encoded into the binding.  There shouldn't be any need for a clock
> alias property.  It should all just work to have multiple devices
> explicitly refer to the same clock node because the dt clock support
> patch gets first crack at resolving a struct clk pointer before clkdev
> does its lookup.
> =

This is to make clk_get() work.  Let's take a look at this example.
i.MX28 integrates a amba-pl011 uart controller, and there are two
places calling clk_get() with the same dev_id to get the different
'clk'.

static struct clk_lookup lookups[] =3D {
        /* for amba bus driver */
        _REGISTER_CLOCK("duart", "apb_pclk", xbus_clk)
        /* for amba-pl011 driver */
        _REGISTER_CLOCK("duart", NULL, uart_clk)
	...
};

* drivers/amba/bus.c - to get xbus_clk
static int amba_get_enable_pclk(struct amba_device *pcdev)
{
        struct clk *pclk =3D clk_get(&pcdev->dev, "apb_pclk");
        int ret;

        pcdev->pclk =3D pclk;

        if (IS_ERR(pclk))
                return PTR_ERR(pclk);

        ret =3D clk_enable(pclk);
        if (ret)
                clk_put(pclk);

        return ret;
}

* drivers/tty/serial/amba-pl011.c - to get uart_clk
static int pl011_probe(struct amba_device *dev, struct amba_id *id)
{
	...

        uap->clk =3D clk_get(&dev->dev, NULL);
        if (IS_ERR(uap->clk)) {
                ret =3D PTR_ERR(uap->clk);
                goto unmap;
        }

	...
}

Will this be broken if we do not have an alias in dt clock to reflect
con_id?

> >
> > * clock-depend
> > The mxc 'struct clk' has the member 'secondary' to refer to the clock
> > that the 'clk' has dependency on. =A0This 'secondary' clock needs to be
> > on whenever the 'clk' is set to on. =A0This clock-depend property is
> > defined to reflect this 'secondary' clock.
> =

> This is fine, but it is a Freescale specific binding.  Each of the
> imx51 clock nodes should have compatible set to something like
> "fsl,imx51-clock" so that the OS can know that it should be using this
> binding.
> =

I doubt this is Freescale clock only use case.  But I will do what you
suggest here anyway.

Oh, I forgot another new property, clock-source, which is to reflect
the parent clock.  This should be very common one, but not sure if
the naming is proper. The naming 'clock-provider' should not be the
one, I guess.

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
> =

> As hinted on above, "clock" doesn't look like a good compatible
> property.  It should specify the specific implementation of a clock
> device.  ie. "fsl,imx51-clock".  Even that example may be too generic
> if there are multiple types of clock controllers in the imx51 SoC.
> =

We are implementing clock-mx51-mx53.c.  Would it be better to use
'fsl,mx5-clock'?  Or, we will have to scan 'fsl,imx51-clock' and
'fsl,imx53-clock'.  Oh, i.MX50 is also coming.

-- =

Regards,
Shawn

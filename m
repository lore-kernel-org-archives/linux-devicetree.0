From: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH 1/5] arm/dts: babbage: add gpt and uart related clock nodes
Date: Sun, 13 Mar 2011 16:08:30 +0800
Message-ID: <20110313080829.GB10194@S2100-06.ap.freescale.net>
References: <1299514932-13558-1-git-send-email-shawn.guo@linaro.org>
	<1299514932-13558-2-git-send-email-shawn.guo@linaro.org>
	<AANLkTimn4fNvM0bSHnpuQmCAweTZ00JQCZCZ=vOdV4NZ@mail.gmail.com>
	<20110308034447.GB14370@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110308034447.GB14370-rvtDTF3kK1ictlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
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

On Tue, Mar 08, 2011 at 11:44:48AM +0800, Shawn Guo wrote:
> On Mon, Mar 07, 2011 at 10:48:10AM -0700, Grant Likely wrote:
> > On Mon, Mar 7, 2011 at 9:22 AM, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> > > The patch is to add all gpt, uart related dt clock nodes for babbage.
> > > It sticks to the clock name used in clock-mx51-mx53.c, so that
> > > everything gets consistent to Reference Manual. =A0For example, the
> > > numbering in clock name usually starts from 1, while 'reg' property
> > > numbering starts from 0 to easy clock binding.
> > >
> > > Besides the generally used clock bindings, the following properties
> > > are proposed in this patch.
> > >
> > > * clock-alias
> > > Like clock-outputs to reflect cl->dev_id, property clock-alias is
> > > defined to reflect cl->con_id.
> > =

> > This feels like leakage of Linux kernel implementation details getting
> > encoded into the binding.  There shouldn't be any need for a clock
> > alias property.  It should all just work to have multiple devices
> > explicitly refer to the same clock node because the dt clock support
> > patch gets first crack at resolving a struct clk pointer before clkdev
> > does its lookup.
> > =

> This is to make clk_get() work.  Let's take a look at this example.
> i.MX28 integrates a amba-pl011 uart controller, and there are two
> places calling clk_get() with the same dev_id to get the different
> 'clk'.
> =

> static struct clk_lookup lookups[] =3D {
>         /* for amba bus driver */
>         _REGISTER_CLOCK("duart", "apb_pclk", xbus_clk)
>         /* for amba-pl011 driver */
>         _REGISTER_CLOCK("duart", NULL, uart_clk)
> 	...
> };
> =

> * drivers/amba/bus.c - to get xbus_clk
> static int amba_get_enable_pclk(struct amba_device *pcdev)
> {
>         struct clk *pclk =3D clk_get(&pcdev->dev, "apb_pclk");
>         int ret;
> =

>         pcdev->pclk =3D pclk;
> =

>         if (IS_ERR(pclk))
>                 return PTR_ERR(pclk);
> =

>         ret =3D clk_enable(pclk);
>         if (ret)
>                 clk_put(pclk);
> =

>         return ret;
> }
> =

> * drivers/tty/serial/amba-pl011.c - to get uart_clk
> static int pl011_probe(struct amba_device *dev, struct amba_id *id)
> {
> 	...
> =

>         uap->clk =3D clk_get(&dev->dev, NULL);
>         if (IS_ERR(uap->clk)) {
>                 ret =3D PTR_ERR(uap->clk);
>                 goto unmap;
>         }
> =

> 	...
> }
> =

> Will this be broken if we do not have an alias in dt clock to reflect
> con_id?
> =

Sorry.  The argument above is invalid, as neither dev_id nor con_id
will be used to find the 'clk' when DT clock code applies.  So, yes,
property clock-alias is not needed.

-- =

Regards,
Shawn

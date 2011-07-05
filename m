From: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH 1/2] gpio/mxc: get rid of the uses of cpu_is_mx()
Date: Tue, 5 Jul 2011 11:32:28 +0800
Message-ID: <20110705033227.GC10594@S2100-06.ap.freescale.net>
References: <1309681017-22970-1-git-send-email-shawn.guo@linaro.org>
	<1309681017-22970-2-git-send-email-shawn.guo@linaro.org>
	<20110704064603.GW6069@pengutronix.de>
	<20110704092800.GG10245@S2100-06.ap.freescale.net>
	<20110704094921.GG6069@pengutronix.de>
	<20110704102008.GH10245@S2100-06.ap.freescale.net>
	<20110704164457.GJ6069@pengutronix.de>
	<20110705030121.GB10594@S2100-06.ap.freescale.net>
	<CACxGe6vHF-k+xCXAYwuQnuRXceD9eJC4ZpSbNXey8cnkX1J2-Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACxGe6vHF-k+xCXAYwuQnuRXceD9eJC4ZpSbNXey8cnkX1J2-Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jul 04, 2011 at 09:04:55PM -0600, Grant Likely wrote:
> On Mon, Jul 4, 2011 at 9:01 PM, Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> > On Mon, Jul 04, 2011 at 06:44:57PM +0200, Sascha Hauer wrote:
> >> Read again. We have three different types of gpio irq controllers, they
> >> are first seen in the imx1, imx21 and imx31. So all others can be made
> >> compatible with these three. No need for imx-gpio, imx25-gpio and
> >> imx27-gpio. The mxc_gpio_devtype would look like this:
> >>
> >> static struct platform_device_id mxc_gpio_devtype[] =3D {
> >> =A0 =A0 =A0 {
> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =3D "imx1-gpio",
> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 .driver_data =3D IMX1_GPIO,
> >> =A0 =A0 =A0 }, {
> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =3D "imx21-gpio",
> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 .driver_data =3D IMX21_GPIO,
> >> =A0 =A0 =A0 }, {
> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =3D "imx31-gpio",
> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 .driver_data =3D IMX31_GPIO,
> >> =A0 =A0 =A0 }, {
> >> =A0 =A0 =A0 }
> >> };
> >>
> > This is really what I want to do with dt match table. =A0But before we
> > totally remove platform device probe and switch it over to dt, I'm
> > unsure we want to do this. =A0It will require the following changes on
> > platform device code registration right now. =A0I guess this is
> > something you do not want, right?
> =

> What is the problem with the below changes?  I see no issue with
> changing the static platform_device registrations in this way.
> =

We end up to register "imx21-gpio" in imx27_soc_init, and "imx31-gpio"
in imx25/35/50/51/53 per-soc-init function.  The may confuse people
who only look at platform device registration code.  This is something
may concern Sascha.  Let's see what he thinks.

-- =

Regards,
Shawn

> =

> >
> > diff --git a/arch/arm/mach-imx/mm-imx25.c b/arch/arm/mach-imx/mm-imx25.c
> > index 1e0c956..ba3009e 100644
> > --- a/arch/arm/mach-imx/mm-imx25.c
> > +++ b/arch/arm/mach-imx/mm-imx25.c
> > @@ -86,10 +86,10 @@ static struct sdma_platform_data imx25_sdma_pdata _=
_initdata =3D {
> >
> > =A0void __init imx25_soc_init(void)
> > =A0{
> > - =A0 =A0 =A0 mxc_register_gpio(0, MX25_GPIO1_BASE_ADDR, SZ_16K, MX25_I=
NT_GPIO1, 0);
> > - =A0 =A0 =A0 mxc_register_gpio(1, MX25_GPIO2_BASE_ADDR, SZ_16K, MX25_I=
NT_GPIO2, 0);
> > - =A0 =A0 =A0 mxc_register_gpio(2, MX25_GPIO3_BASE_ADDR, SZ_16K, MX25_I=
NT_GPIO3, 0);
> > - =A0 =A0 =A0 mxc_register_gpio(3, MX25_GPIO4_BASE_ADDR, SZ_16K, MX25_I=
NT_GPIO4, 0);
> > + =A0 =A0 =A0 mxc_register_gpio("imx31-gpio", 0, MX25_GPIO1_BASE_ADDR, =
SZ_16K, MX25_INT_GPIO1, 0);
> > + =A0 =A0 =A0 mxc_register_gpio("imx31-gpio", 1, MX25_GPIO2_BASE_ADDR, =
SZ_16K, MX25_INT_GPIO2, 0);
> > + =A0 =A0 =A0 mxc_register_gpio("imx31-gpio", 2, MX25_GPIO3_BASE_ADDR, =
SZ_16K, MX25_INT_GPIO3, 0);
> > + =A0 =A0 =A0 mxc_register_gpio("imx31-gpio", 3, MX25_GPIO4_BASE_ADDR, =
SZ_16K, MX25_INT_GPIO4, 0);
> >
> > =A0 =A0 =A0 =A0imx_add_imx_sdma(MX25_SDMA_BASE_ADDR, MX25_INT_SDMA, &im=
x25_sdma_pdata);
> > =A0}
> >
> > diff --git a/arch/arm/mach-imx/mm-imx27.c b/arch/arm/mach-imx/mm-imx27.c
> > index 944e02d..81a7870 100644
> > --- a/arch/arm/mach-imx/mm-imx27.c
> > +++ b/arch/arm/mach-imx/mm-imx27.c
> > @@ -77,12 +77,12 @@ void __init mx27_init_irq(void)
> >
> > =A0void __init imx27_soc_init(void)
> > =A0{
> > - =A0 =A0 =A0 mxc_register_gpio(0, MX27_GPIO1_BASE_ADDR, SZ_256, MX27_I=
NT_GPIO, 0);
> > - =A0 =A0 =A0 mxc_register_gpio(1, MX27_GPIO2_BASE_ADDR, SZ_256, MX27_I=
NT_GPIO, 0);
> > - =A0 =A0 =A0 mxc_register_gpio(2, MX27_GPIO3_BASE_ADDR, SZ_256, MX27_I=
NT_GPIO, 0);
> > - =A0 =A0 =A0 mxc_register_gpio(3, MX27_GPIO4_BASE_ADDR, SZ_256, MX27_I=
NT_GPIO, 0);
> > - =A0 =A0 =A0 mxc_register_gpio(4, MX27_GPIO5_BASE_ADDR, SZ_256, MX27_I=
NT_GPIO, 0);
> > - =A0 =A0 =A0 mxc_register_gpio(5, MX27_GPIO6_BASE_ADDR, SZ_256, MX27_I=
NT_GPIO, 0);
> > + =A0 =A0 =A0 mxc_register_gpio("imx21-gpio", 0, MX27_GPIO1_BASE_ADDR, =
SZ_256, MX27_INT_GPIO, 0);
> > + =A0 =A0 =A0 mxc_register_gpio("imx21-gpio", 1, MX27_GPIO2_BASE_ADDR, =
SZ_256, MX27_INT_GPIO, 0);
> > + =A0 =A0 =A0 mxc_register_gpio("imx21-gpio", 2, MX27_GPIO3_BASE_ADDR, =
SZ_256, MX27_INT_GPIO, 0);
> > + =A0 =A0 =A0 mxc_register_gpio("imx21-gpio", 3, MX27_GPIO4_BASE_ADDR, =
SZ_256, MX27_INT_GPIO, 0);
> > + =A0 =A0 =A0 mxc_register_gpio("imx21-gpio", 4, MX27_GPIO5_BASE_ADDR, =
SZ_256, MX27_INT_GPIO, 0);
> > + =A0 =A0 =A0 mxc_register_gpio("imx21-gpio", 5, MX27_GPIO6_BASE_ADDR, =
SZ_256, MX27_INT_GPIO, 0);
> >
> > =A0 =A0 =A0 =A0imx_add_imx_dma();
> > =A0}
> >
> > diff --git a/arch/arm/mach-imx/mm-imx35.c b/arch/arm/mach-imx/mm-imx35.c
> > index da530ca..8b98205 100644
> > --- a/arch/arm/mach-imx/mm-imx35.c
> > +++ b/arch/arm/mach-imx/mm-imx35.c
> > @@ -95,9 +95,9 @@ void __init imx35_soc_init(void)
> > =A0{
> > =A0 =A0 =A0 =A0int to_version =3D mx35_revision() >> 4;
> >
> > - =A0 =A0 =A0 mxc_register_gpio(0, MX35_GPIO1_BASE_ADDR, SZ_16K, MX35_I=
NT_GPIO1, 0);
> > - =A0 =A0 =A0 mxc_register_gpio(1, MX35_GPIO2_BASE_ADDR, SZ_16K, MX35_I=
NT_GPIO2, 0);
> > - =A0 =A0 =A0 mxc_register_gpio(2, MX35_GPIO3_BASE_ADDR, SZ_16K, MX35_I=
NT_GPIO3, 0);
> > + =A0 =A0 =A0 mxc_register_gpio("imx31-gpio", 0, MX35_GPIO1_BASE_ADDR, =
SZ_16K, MX35_INT_GPIO1, 0);
> > + =A0 =A0 =A0 mxc_register_gpio("imx31-gpio", 1, MX35_GPIO2_BASE_ADDR, =
SZ_16K, MX35_INT_GPIO2, 0);
> > + =A0 =A0 =A0 mxc_register_gpio("imx31-gpio", 2, MX35_GPIO3_BASE_ADDR, =
SZ_16K, MX35_INT_GPIO3, 0);
> >
> > =A0 =A0 =A0 =A0if (to_version =3D=3D 1) {
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0strncpy(imx35_sdma_pdata.fw_name, "sdma-=
imx35-to1.bin",
> > diff --git a/arch/arm/mach-mx5/mm-mx50.c b/arch/arm/mach-mx5/mm-mx50.c
> > index 28c3f60..5c20b33 100644
> > --- a/arch/arm/mach-mx5/mm-mx50.c
> > +++ b/arch/arm/mach-mx5/mm-mx50.c
> > @@ -62,10 +62,10 @@ void __init mx50_init_irq(void)
> >
> > =A0void __init imx50_soc_init(void)
> > =A0{
> > - =A0 =A0 =A0 mxc_register_gpio(0, MX50_GPIO1_BASE_ADDR, SZ_16K, MX50_I=
NT_GPIO1_LOW, MX50_INT_GPIO1_HIGH);
> > - =A0 =A0 =A0 mxc_register_gpio(1, MX50_GPIO2_BASE_ADDR, SZ_16K, MX50_I=
NT_GPIO2_LOW, MX50_INT_GPIO2_HIGH);
> > - =A0 =A0 =A0 mxc_register_gpio(2, MX50_GPIO3_BASE_ADDR, SZ_16K, MX50_I=
NT_GPIO3_LOW, MX50_INT_GPIO3_HIGH);
> > - =A0 =A0 =A0 mxc_register_gpio(3, MX50_GPIO4_BASE_ADDR, SZ_16K, MX50_I=
NT_GPIO4_LOW, MX50_INT_GPIO4_HIGH);
> > - =A0 =A0 =A0 mxc_register_gpio(4, MX50_GPIO5_BASE_ADDR, SZ_16K, MX50_I=
NT_GPIO5_LOW, MX50_INT_GPIO5_HIGH);
> > - =A0 =A0 =A0 mxc_register_gpio(5, MX50_GPIO6_BASE_ADDR, SZ_16K, MX50_I=
NT_GPIO6_LOW, MX50_INT_GPIO6_HIGH);
> > + =A0 =A0 =A0 mxc_register_gpio("imx31-gpio", 0, MX50_GPIO1_BASE_ADDR, =
SZ_16K, MX50_INT_GPIO1_LOW, MX50_INT_GPIO1_HIGH);
> > + =A0 =A0 =A0 mxc_register_gpio("imx31-gpio", 1, MX50_GPIO2_BASE_ADDR, =
SZ_16K, MX50_INT_GPIO2_LOW, MX50_INT_GPIO2_HIGH);
> > + =A0 =A0 =A0 mxc_register_gpio("imx31-gpio", 2, MX50_GPIO3_BASE_ADDR, =
SZ_16K, MX50_INT_GPIO3_LOW, MX50_INT_GPIO3_HIGH);
> > + =A0 =A0 =A0 mxc_register_gpio("imx31-gpio", 3, MX50_GPIO4_BASE_ADDR, =
SZ_16K, MX50_INT_GPIO4_LOW, MX50_INT_GPIO4_HIGH);
> > + =A0 =A0 =A0 mxc_register_gpio("imx31-gpio", 4, MX50_GPIO5_BASE_ADDR, =
SZ_16K, MX50_INT_GPIO5_LOW, MX50_INT_GPIO5_HIGH);
> > + =A0 =A0 =A0 mxc_register_gpio("imx31-gpio", 5, MX50_GPIO6_BASE_ADDR, =
SZ_16K, MX50_INT_GPIO6_LOW, MX50_INT_GPIO6_HIGH);
> > =A0}
> >
> > diff --git a/arch/arm/mach-mx5/mm.c b/arch/arm/mach-mx5/mm.c
> > index 1b7059f..82ad5be 100644
> > --- a/arch/arm/mach-mx5/mm.c
> > +++ b/arch/arm/mach-mx5/mm.c
> > @@ -142,23 +142,23 @@ static struct sdma_platform_data imx53_sdma_pdata=
 __initdata =3D {
> >
> > =A0void __init imx51_soc_init(void)
> > =A0{
> > - =A0 =A0 =A0 mxc_register_gpio(0, MX51_GPIO1_BASE_ADDR, SZ_16K, MX51_M=
XC_INT_GPIO1_LOW, MX51_MXC_INT_GPIO1_HIGH);
> > - =A0 =A0 =A0 mxc_register_gpio(1, MX51_GPIO2_BASE_ADDR, SZ_16K, MX51_M=
XC_INT_GPIO2_LOW, MX51_MXC_INT_GPIO2_HIGH);
> > - =A0 =A0 =A0 mxc_register_gpio(2, MX51_GPIO3_BASE_ADDR, SZ_16K, MX51_M=
XC_INT_GPIO3_LOW, MX51_MXC_INT_GPIO3_HIGH);
> > - =A0 =A0 =A0 mxc_register_gpio(3, MX51_GPIO4_BASE_ADDR, SZ_16K, MX51_M=
XC_INT_GPIO4_LOW, MX51_MXC_INT_GPIO4_HIGH);
> > + =A0 =A0 =A0 mxc_register_gpio("imx31-gpio", 0, MX51_GPIO1_BASE_ADDR, =
SZ_16K, MX51_MXC_INT_GPIO1_LOW, MX51_MXC_INT_GPIO1_HIGH);
> > + =A0 =A0 =A0 mxc_register_gpio("imx31-gpio", 1, MX51_GPIO2_BASE_ADDR, =
SZ_16K, MX51_MXC_INT_GPIO2_LOW, MX51_MXC_INT_GPIO2_HIGH);
> > + =A0 =A0 =A0 mxc_register_gpio("imx31-gpio", 2, MX51_GPIO3_BASE_ADDR, =
SZ_16K, MX51_MXC_INT_GPIO3_LOW, MX51_MXC_INT_GPIO3_HIGH);
> > + =A0 =A0 =A0 mxc_register_gpio("imx31-gpio", 3, MX51_GPIO4_BASE_ADDR, =
SZ_16K, MX51_MXC_INT_GPIO4_LOW, MX51_MXC_INT_GPIO4_HIGH);
> >
> > =A0 =A0 =A0 =A0imx_add_imx_sdma(MX51_SDMA_BASE_ADDR, MX51_INT_SDMA, &im=
x51_sdma_pdata);
> > =A0}
> >
> > =A0void __init imx53_soc_init(void)
> > =A0{
> > - =A0 =A0 =A0 mxc_register_gpio(0, MX53_GPIO1_BASE_ADDR, SZ_16K, MX53_I=
NT_GPIO1_LOW, MX53_INT_GPIO1_HIGH);
> > - =A0 =A0 =A0 mxc_register_gpio(1, MX53_GPIO2_BASE_ADDR, SZ_16K, MX53_I=
NT_GPIO2_LOW, MX53_INT_GPIO2_HIGH);
> > - =A0 =A0 =A0 mxc_register_gpio(2, MX53_GPIO3_BASE_ADDR, SZ_16K, MX53_I=
NT_GPIO3_LOW, MX53_INT_GPIO3_HIGH);
> > - =A0 =A0 =A0 mxc_register_gpio(3, MX53_GPIO4_BASE_ADDR, SZ_16K, MX53_I=
NT_GPIO4_LOW, MX53_INT_GPIO4_HIGH);
> > - =A0 =A0 =A0 mxc_register_gpio(4, MX53_GPIO5_BASE_ADDR, SZ_16K, MX53_I=
NT_GPIO5_LOW, MX53_INT_GPIO5_HIGH);
> > - =A0 =A0 =A0 mxc_register_gpio(5, MX53_GPIO6_BASE_ADDR, SZ_16K, MX53_I=
NT_GPIO6_LOW, MX53_INT_GPIO6_HIGH);
> > - =A0 =A0 =A0 mxc_register_gpio(6, MX53_GPIO7_BASE_ADDR, SZ_16K, MX53_I=
NT_GPIO7_LOW, MX53_INT_GPIO7_HIGH);
> > + =A0 =A0 =A0 mxc_register_gpio("imx31-gpio", 0, MX53_GPIO1_BASE_ADDR, =
SZ_16K, MX53_INT_GPIO1_LOW, MX53_INT_GPIO1_HIGH);
> > + =A0 =A0 =A0 mxc_register_gpio("imx31-gpio", 1, MX53_GPIO2_BASE_ADDR, =
SZ_16K, MX53_INT_GPIO2_LOW, MX53_INT_GPIO2_HIGH);
> > + =A0 =A0 =A0 mxc_register_gpio("imx31-gpio", 2, MX53_GPIO3_BASE_ADDR, =
SZ_16K, MX53_INT_GPIO3_LOW, MX53_INT_GPIO3_HIGH);
> > + =A0 =A0 =A0 mxc_register_gpio("imx31-gpio", 3, MX53_GPIO4_BASE_ADDR, =
SZ_16K, MX53_INT_GPIO4_LOW, MX53_INT_GPIO4_HIGH);
> > + =A0 =A0 =A0 mxc_register_gpio("imx31-gpio", 4, MX53_GPIO5_BASE_ADDR, =
SZ_16K, MX53_INT_GPIO5_LOW, MX53_INT_GPIO5_HIGH);
> > + =A0 =A0 =A0 mxc_register_gpio("imx31-gpio", 5, MX53_GPIO6_BASE_ADDR, =
SZ_16K, MX53_INT_GPIO6_LOW, MX53_INT_GPIO6_HIGH);
> > + =A0 =A0 =A0 mxc_register_gpio("imx31-gpio", 6, MX53_GPIO7_BASE_ADDR, =
SZ_16K, MX53_INT_GPIO7_LOW, MX53_INT_GPIO7_HIGH);
> >
> > =A0 =A0 =A0 =A0imx_add_imx_sdma(MX53_SDMA_BASE_ADDR, MX53_INT_SDMA, &im=
x53_sdma_pdata);
> > =A0}
> >

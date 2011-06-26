From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: Converting i2c-omap driver to use device tree
Date: Sun, 26 Jun 2011 02:12:02 -0600
Message-ID: <20110626081202.GB24241@ponder.secretlab.ca>
References: <BANLkTin0zaE6M=0+9bq6sCvCVO_PJqYseA@mail.gmail.com>
	<BANLkTi=DmNC6BbwDU+4smFvbc+LzFLiiOA@mail.gmail.com>
	<BANLkTi==YKS854=YDGG44BRy_km31LqifQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <BANLkTi==YKS854=YDGG44BRy_km31LqifQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Manjunatha GK <manjugk-l0cyMroinI0@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org\"" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 24, 2011 at 07:08:34PM +0530, Manjunatha GK wrote:
> Hi Thomas,
> 
> On 24 June 2011 18:13, Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> 
> > Hi Manjunath,
> >
> > I will try to give some comments based on whatever little I know about
> > DT. My comments maybe wrong too, I am still learning DT.
> >
> > On 23 June 2011 19:45, Manjunatha GK <manjugk-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> > > Hi Grant,
> > > I am trying to convert i2c-omap driver to use device tree. Since omap i2c
> > > driver uses it's own mechanism to register as platform device, I have
> > > commented out i2c device registration part from board file and trying to
> > use
> > > DT data in probe function of i2c driver.
> > >
> > > I have i2c node declared under omap4-panda.dts as:
> > >
> > > +       i2c@48072000 {
> > > +               compatible = "ti,omap_i2c";
> > > +               reg = <0x48072000 0x80>;
> > > +               #address-cells = <1>;
> > > +               #size-cells = <0>;
> >
> > Shouldn't size-cells = 1 ?
> >
> > > +
> > > +               twl@48 {
> > > +                       compatible = "twl6030,4030-6030";
> > > +                       reg = < 0x48 >;
> > > +               };
> > > +       };
> > >
> > > and board file is changed as:
> > >
> > > @@ -685,6 +686,10 @@ static void __init omap4_panda_init(void)
> > >  {
> > >         int package = OMAP_PACKAGE_CBS;
> > >
> > > +#ifdef CONFIG_OF
> > > +       of_platform_prepare(NULL, NULL);
> > > +#endif /* CONFIG_OF */
> >
> > Is of_platform_prepare still required?
> >
> 
> not required. removed now.
> 
> 
> > > +
> > >         if (omap_rev() == OMAP4430_REV_ES1_0)
> > >                 package = OMAP_PACKAGE_CBL;
> > >         omap4_mux_init(board_mux, NULL, package);
> > > @@ -700,6 +705,7 @@ static void __init omap4_panda_init(void)
> > >         omap4_ehci_init();
> > >         usb_musb_init(&musb_board_data);
> > >         omap4_panda_display_init();
> > > +       of_platform_populate(NULL, NULL, NULL, NULL);
> >
> > Is it not required to provide the second parameter (matches) atleast?
> > It depends on your dts file I guess. Maybe a proper matching is not
> > happening.
> >
> yes. updated with second parameter as per entry in dts file.
> 
> >
> > >  }
> > >
> > > I have commented out device registration for I2C1 in board file:
> > >
> > > diff --git a/arch/arm/mach-omap2/board-omap4panda.c
> > > b/arch/arm/mach-omap2/board-omap4panda.c
> > > index c9d1e13..0c31f35 100644
> > > --- a/arch/arm/mach-omap2/board-omap4panda.c
> > > +++ b/arch/arm/mach-omap2/board-omap4panda.c
> > > @@ -409,7 +410,7 @@ static struct i2c_board_info __initdata
> > > panda_i2c_eeprom[] = {
> > >
> > >  static int __init omap4_panda_i2c_init(void)
> > >  {
> > > -       omap4_pmic_init("twl6030", &omap4_panda_twldata);
> > > +       //omap4_pmic_init("twl6030", &omap4_panda_twldata);
> > > @@ -685,6 +686,10 @@ static void __init omap4_panda_init(void)
> > >  {
> > >         int package = OMAP_PACKAGE_CBS;
> > >
> > > +#ifdef CONFIG_OF
> > > +       of_platform_prepare(NULL, NULL);
> > > +#endif /* CONFIG_OF */
> > > +
> > >         if (omap_rev() == OMAP4430_REV_ES1_0)
> > >                 package = OMAP_PACKAGE_CBL;
> > >         omap4_mux_init(board_mux, NULL, package);
> > > @@ -700,6 +705,7 @@ static void __init omap4_panda_init(void)
> > >         omap4_ehci_init();
> > >         usb_musb_init(&musb_board_data);
> > >         omap4_panda_display_init();
> > > +       of_platform_populate(NULL, NULL, NULL, NULL);
> > >  }
> > >
> > > and i2c-omap is modified as:
> > >
> > > +static const struct of_device_id omap_i2c_of_match[];
> > >  static int __devinit
> > >  omap_i2c_probe(struct platform_device *pdev)
> > >  {
> > > @@ -1162,6 +1169,12 @@ static int omap_i2c_resume(struct device *dev)
> > >         return 0;
> > >  }
> > >
> > > +static const struct of_device_id omap_i2c_of_match[] = {
> > > +       {.compatible = "omap_i2c", },
> > > +       {},
> > > +}
> > > +MODULE_DEVICE_TABLE(of, omap_i2c_of_match);
> > >
> > > With the above changes, i was expecting probe function to be called since
> > > device gets binded to driver. But probe will never get called.
> > >
> > > Did I miss anything with above procedure?
> >
> > What about platform_driver->driver.of_match_table? Is it populated
> > (set to omap_i2c_of_match)?
> >
> 
> Yes. This entry was missing with my changes. With of_match_table, probe is
> getting called.
> Thanks for the pointer.

Glad to hear you got it sorted out.

g.

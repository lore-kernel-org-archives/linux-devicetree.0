From: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v2 3/4] usb: chipidea: ci13xxx-imx: add "dr_mode"
 property to device tree bindings
Date: Tue, 3 Jul 2012 15:10:47 +0800
Message-ID: <20120703071046.GB3374@b20223-02.ap.freescale.net>
References: <1340891629-13145-4-git-send-email-mkl@pengutronix.de>
 <20120629014352.GA28923@b20223-02.ap.freescale.net>
 <4FED5D77.3050009@pengutronix.de>
 <20120629084509.GB28923@b20223-02.ap.freescale.net>
 <4FEDCF15.9040000@wwwdotorg.org>
 <20120630011906.GA2489@richard-laptop>
 <4FF1FEBC.3040107@wwwdotorg.org>
 <CAL411-oeVCsRxxHHWM4VEtbXBTK_Poyxtp0AK7K_4jEg8U1fJA@mail.gmail.com>
 <20120703030049.GA3374@b20223-02.ap.freescale.net>
 <20466.39184.844238.739308@ipc1.ka-ro>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20466.39184.844238.739308-VjFSrY7JcPWvSplVBqRQBQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Lothar =?iso-8859-1?Q?Wa=DFmann?= <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Cc: alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, Devicetree Discussions <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Peter Chen <hzpeterchen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Zhao <linuxzsc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 03, 2012 at 09:02:40AM +0200, Lothar Wa=DFmann wrote:
> Hi,
> =

> Richard Zhao writes:
> > On Tue, Jul 03, 2012 at 10:22:37AM +0800, Peter Chen wrote:
> > > > Hmm. I think it'd be reasonable to use dr_mode like the other bindi=
ngs,
> > > > and have the default case be decided by the ID pin when dr_mode isn=
't
> > > > specified. Having different defaults for different bindings seems p=
retty
> > > > reasonable to me.
> > > =

> > > As far as I know, there is no USB Spec says the ID value should be
> > > used at device or host mode. At USB device and host driver, there
> > > should be NO ID related things, that is to say device or host driver
> > > should not care ID is grounded or floated, as ID may be grounded
> > > at device mode, and high at host mode for different board design.
> > > ID interrupt should only be enabled when dr_mode =3D otg;
> > I don't quite understand your point. All the discussions are based
> > on otg controllers.
> > > =

> > > Board design and customized usage (user may want to use only device m=
ode
> > > for otg capable port) makes what USB role will be used
> > > at driver, so dr_mode at dts (or pdata->dr_mode at non-dt solution) c=
an make
> > > the decision for driver how USB role will be used.
> > That's the case we need the property. But for fine otg hw design, we
> > don't need the property, right?
> > =

> > And to decide whether it's otg controller or not, the driver read the
> > capability registers.
> > =

> A user may wish to restrict even a 'fine otg hw design' to be used in
> pure host or device mode. That's where the dr_mode property jumps in.
Right, it _force_ the controller to a certain mode.

Thanks
Richard
> =

> =

> Lothar Wa=DFmann
> -- =

> ___________________________________________________________
> =

> Ka-Ro electronics GmbH | Pascalstra=DFe 22 | D - 52076 Aachen
> Phone: +49 2408 1402-0 | Fax: +49 2408 1402-10
> Gesch=E4ftsf=FChrer: Matthias Kaussen
> Handelsregistereintrag: Amtsgericht Aachen, HRB 4996
> =

> www.karo-electronics.de | info-AvR2QvxeiV7DiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org
> ___________________________________________________________
> =

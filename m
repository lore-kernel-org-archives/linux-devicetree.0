From: Michael Walle <michael-QKn5cuLxLXY@public.gmane.org>
Subject: Re: [PATCH 06/14] ARM: kirkwood: convert uart0 to devicetree.
Date: Wed, 7 Mar 2012 22:47:09 +0100
Message-ID: <201203072247.10065.michael@walle.cc>
References: <cover.1331090356.git.jason@lakedaemon.net>
 <201203071831.31738.arnd@arndb.de>
 <20120307192723.GE5050@titan.lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120307192723.GE5050-u4khhh1J0LxI1Ri9qeTfzeTW4wlIGRCZ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jason <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Mittwoch 07 M=E4rz 2012, 20:27:23 schrieb Jason:
> On Wed, Mar 07, 2012 at 06:31:31PM +0000, Arnd Bergmann wrote:
> > On Wednesday 07 March 2012, Jason Cooper wrote:
> > > +       serial@f1012000 {
> > > +               compatible =3D "ns16550a";
> > > +               reg =3D <0xf1012000 0xff>;
> > > +               reg-shift =3D <2>;
> > > +               interrupts =3D <33>;
> > > +               clock-frequency =3D <200000000>;
> > > +       };
> > =

> > I just noticed that the length here should be inclusive, i.e. 0x100 not
> > 0xff. This is different from the way we define resources in Linux.
> =

> Grrr.  Now I'm getting frustrated.  I'm trying to boot without
> earlyprintk.  Evidently, something is wrong with the above, because the
> device boots all the way up (blinky lights come on), but I get no
> messages after the usual "Uncompressing Linux... done, booting the
> kernel."
> =

> Here's my most recent attempt:
> =

>         serial@f1012000 {
>                 device_type =3D "serial";
>                 compatible =3D "ns16550a";
>                 reg =3D <0xf1012000 0x100>; /*phys addr*/
>                 virt-reg =3D <0xfed12000>;  /*virt addr*/
>                 reg-shift =3D <2>;
>                 reg-io-width =3D <1>;
>                 interrupts =3D <33>;
>                 current-speed =3D <115200>;
>                 interrupt-parent =3D <&intc>;
>                 clock-frequency =3D <200000000>;
>         };
> =

> I've looked at what is done in the powerpc dt's, but, no luck.  When
> earlyprintk is enabled, I see no error messages, just:
> =

> bootconsole [earlycon0] enabled
> debug: skip boot console de-registration.
> ...
> Serial: 8250/16550 driver, 2 ports, IRQ sharing disabled
> =

> Any pointers?

dunno if that helps a lot but the following was working for me with my =

linkstation:

        serial0: serial@f1012000 {
                cell-index =3D <0>;
                device_type =3D "serial";
                compatible =3D "ns16550a";
                reg =3D <0xf1012000 0x20>;
                reg-shift =3D <2>;
                clock-frequency =3D <200000000>;
                interrupts =3D <33>;
        };

-- =

michael

From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH v3 06/18] tegra: fdt: Add LCD definitions for Tegra
Date: Tue, 31 Jul 2012 11:51:16 +0200
Message-ID: <20120731095116.GA16155@avionic-0098.adnet.avionic-design.de>
References: <1342106718-3058-1-git-send-email-sjg@chromium.org>
 <1342106718-3058-7-git-send-email-sjg@chromium.org>
 <CAPnjgZ2SbVVKxUdW1cvLf_9rAWLWeiVr-y6S_sz-Uw5_O_AyQA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0047816434103133014=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAPnjgZ2SbVVKxUdW1cvLf_9rAWLWeiVr-y6S_sz-Uw5_O_AyQA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>, Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--===============0047816434103133014==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wac7ysb48OaltWcw"
Content-Disposition: inline


--wac7ysb48OaltWcw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 31, 2012 at 10:27:23AM +0100, Simon Glass wrote:
> +Thierry
>=20
> Hi,
>=20
> On Thu, Jul 12, 2012 at 4:25 PM, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
> > Add LCD definitions and also a proposed binding for LCD displays.
> >
> > The PWM is as per what will likely be committed to linux-next soon.
> >
> > The displaymode binding comes from a proposal here:
> >
> > http://lists.freedesktop.org/archives/dri-devel/2012-July/024875.html
> >
> > The panel binding is new, and fills a need to specify the panel
> > timings and other tegra-specific information. Should a binding appear
> > that allows the pwm to handle this automatically, we can revisit
> > this.
> >
>=20
> Any comments on this binding please? The main addition from Thierry's
> one posted on LMKL is the LCD resolution selection.

There's no such thing as the panel bindings on Linux. I think nobody's
done that before, there's also no suitable software abstraction, but I
suppose that should be irrelevant for this discussion.

> > +Optional properties (rgb):
> > + - nvidia,frame-buffer: address of frame buffer (if omitted it will be
> > +               calculated)
> > +       - This may be useful to share an address between U-Boot and Lin=
ux and
> > +               avoid boot-time corruption / flicker
> > +
> > +
> > +The panel node describes the panel itself.
> > +
> > +Required properties (panel) :
> > + - nvidia,pwm : pwm to use to set display contrast (see tegra20-pwm.tx=
t)
> > + - nvidia,panel-timings: 4 cells containing required timings in ms:
> > +       * delay between panel_vdd-rise and data-rise
> > +       * delay between data-rise and backlight_vdd-rise
> > +       * delay between backlight_vdd and pwm-rise
> > +       * delay between pwm-rise and backlight_en-rise
> > +
> > +Optional GPIO properies all have (phandle, GPIO number, flags):
> > + - nvidia,backlight-enable-gpios: backlight enable GPIO
> > + - nvidia,lvds-shutdown-gpios: LVDS power shutdown GPIO
> > + - nvidia,backlight-vdd-gpios: backlight power GPIO
> > + - nvidia,panel-vdd-gpios: panel power GPIO
> > +
> > +Example:
> > +
> > +host1x {
> > +       compatible =3D "nvidia,tegra20-host1x", "simple-bus";
> > +       reg =3D <0x50000000 0x00024000>;
> > +       interrupts =3D <0 65 0x04   /* mpcore syncpt */
> > +                       0 67 0x04>; /* mpcore general */
> > +
> > +       #address-cells =3D <1>;
> > +       #size-cells =3D <1>;
> > +
> > +       ranges =3D <0x54000000 0x54000000 0x04000000>;
> > +
> > +       dc@54200000 {
> > +               compatible =3D "nvidia,tegra20-dc";
> > +               reg =3D <0x54200000 0x00040000>;
> > +               interrupts =3D <0 73 0x04>;
> > +
> > +               rgb {
> > +                       status =3D "okay";
> > +                       /* Seaboard has 1366x768 */
> > +                       clock =3D <70600000>;
> > +                       xres =3D <1366>;
> > +                       yres =3D <768>;
> > +                       left-margin =3D <58>;
> > +                       right-margin =3D <58>;
> > +                       hsync-len =3D <58>;
> > +                       lower-margin =3D <4>;
> > +                       upper-margin =3D <4>;
> > +                       vsync-len =3D <4>;
> > +                       hsync-active-high;
> > +                       nvidia,frame-buffer =3D <0x2f680000>;
> > +                       nvidia,bits-per-pixel =3D <16>;
> > +                       nvidia,panel =3D <&lcd_panel>;
> > +               };

Perhaps it would be useful to add an extra node for the mode definition,
if only to keep the data separate from that of the rgb node. I know that
there currently are no other properties, but the rgb node was supposed
to define the output or connector. If ever the same needs to be done for
any of the TVO or DSI outputs, more properties may be needed.

Furthermore the code to parse this would be more generic because you
could pass it any DT node. Of course the nvidia,-prefixed properties
wouldn't be part of that subnode because they don't define the mode as
such.

Thinking about it some more, maybe the mode information should really be
part of the panel description below.

> > +       };
> > +};
> > +
> > +lcd_panel: panel {
> > +       nvidia,pwm =3D <&pwm 2 0>;
> > +       nvidia,backlight-enable-gpios =3D <&gpio 28 0>;   /* PD4 */
> > +       nvidia,lvds-shutdown-gpios =3D <&gpio 10 0>;      /* PB2 */
> > +       nvidia,backlight-vdd-gpios =3D <&gpio 176 0>;     /* PW0 */
> > +       nvidia,panel-vdd-gpios =3D <&gpio 22 0>;          /* PC6 */
> > +       nvidia,panel-timings =3D <4 203 17 15>;
> > +};

If we can reach some kind of agreement on the power-sequencing code that
Alexandre (Cc'ed) is working on, then this can be replaced with a more
generic description. This also has the usual problem of being a non-
addressable top-level node...

Thierry

--wac7ysb48OaltWcw
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQF6qUAAoJEN0jrNd/PrOhX68QAK/qJYgRcgAzTVXUUWjZhfP4
K9XjfibWhH0R7iQVGwLcHyagkLdKpNQ9w2rAbD3lCDt/KL42ZN5jdS61U0h4lf6j
oeE7EYLCWhXSQo9mCMDpAwosm1JmQKVvbUG58m7rWtDFNQd0TBFW2ip5csp+b+YG
nb9BlWSEIa/+jVD7HRu6yaiG6rjiOQEy29VGksZr4vnPut66Vq/gJeiOJpNOPR3R
1mWZWaCBmP+1eBQkf1EDGPuPWEzLWaiyB9DRUBNNC/E6gTF0J/TdgqS/bN/pcROy
3ZzVlxIawSQTk8jjpzm82l5DJ2TVKWbBGdbCHi7AwJXM/AN1GxVuAA1Mng6jvbT6
acM3UKzjo/c58cwYp4Qzd9v0FJb24hi5THaLs34iwAN7uPqFw8ftsGDouy/Jrnx7
G2Eb/MmjPjQ+lgWpFUytEcck1VWY4IKWoKsK0ZpiM+nbH2RboP27g374dqfQ9kLa
Bm8i0HPkYKw4YX7eVgB8pVD2LyTcqHf1e6fpcmKSCA1UozTWRcAXj8pZy5hF9Twd
ATmidFZeLihWhW7QEZt15My0AWWM5q/qJXCIYPa+Fj2j2phGWQaXYlYCIC20cvxN
7pfinQWlZ+9wZSKZqmtQfZAMaaFNdQpyb5Gtx0EHvKyOsdLfY04u1HSu2h09JfUF
UNdWdpiaRnxp98KVYc5S
=w9eV
-----END PGP SIGNATURE-----

--wac7ysb48OaltWcw--

--===============0047816434103133014==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============0047816434103133014==--

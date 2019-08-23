From: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH] arm64: dts: allwinner: orange-pi-3: Enable WiFi
Date: Fri, 23 Aug 2019 13:51:19 +0200
Message-ID: <20190823115119.lsfvabrwqpijkr2k@flea>
References: <20190823094228.6540-1-megous@megous.com>
 <20190823100807.22heh2gahi7owo4e@flea>
 <CAGb2v65mDt8t2sceTzKvYP6XVHJgikXyYMc+xWxZFkTJ+LZ1fg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5020455788421868986=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAGb2v65mDt8t2sceTzKvYP6XVHJgikXyYMc+xWxZFkTJ+LZ1fg@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>, Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


--===============5020455788421868986==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ssnkgdje7jzcgsqx"
Content-Disposition: inline


--ssnkgdje7jzcgsqx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 23, 2019 at 06:10:30PM +0800, Chen-Yu Tsai wrote:
> On Fri, Aug 23, 2019 at 6:08 PM Maxime Ripard <mripard@kernel.org> wrote:
> >
> > Hi,
> >
> > On Fri, Aug 23, 2019 at 11:42:28AM +0200, megous@megous.com wrote:
> > > From: Ondrej Jirman <megous@megous.com>
> > >
> > > Orange Pi 3 has AP6256 WiFi/BT module. WiFi part of the module is called
> > > bcm43356 and can be used with the brcmfmac driver. The module is powered by
> > > the two always on regulators (not AXP805).
> > >
> > > WiFi uses a PG port with 1.8V voltage level signals. SoC needs to be
> > > configured so that it sets up an 1.8V input bias on this port. This is done
> > > by the pio driver by reading the vcc-pg-supply voltage.
> > >
> > > You'll need a fw_bcm43456c5_ag.bin firmware file and nvram.txt
> > > configuration that can be found in the Xulongs's repository for H6:
> > >
> > > https://github.com/orangepi-xunlong/OrangePiH6_external/tree/master/ap6256
> > >
> > > Mainline brcmfmac driver expects the firmware and nvram at the following
> > > paths relative to the firmware directory:
> > >
> > >   brcm/brcmfmac43456-sdio.bin
> > >   brcm/brcmfmac43456-sdio.txt
> > >
> > > Signed-off-by: Ondrej Jirman <megous@megous.com>
> > > ---
> > >
> > > Since RTC patches for H6 were merged, this can now go in too, if it looks ok.
> > >
> > > Other patches for this WiFi chip support were merged in previous cycles,
> > > so this just needs enabling in DTS now.
> > >
> > > Sorry for the links in the commit log, but this information is useful,
> > > even if the link itself goes bad. Any pointer what to google for
> > > (file names, tree name) is great for anyone searching in the future.
> >
> > I understand, but this should (also?) be in the wiki. Please add it
> > there too.
> >
> > > Please take a look.
> > >
> > > Thank you,
> > >       Ondrej
> > >
> > >  .../dts/allwinner/sun50i-h6-orangepi-3.dts    | 48 +++++++++++++++++++
> > >  1 file changed, 48 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
> > > index eda9d5f640b9..49d954369087 100644
> > > --- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
> > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
> > > @@ -56,6 +56,34 @@
> > >               regulator-max-microvolt = <5000000>;
> > >               regulator-always-on;
> > >       };
> > > +
> > > +     reg_vcc33_wifi: vcc33-wifi {
> > > +             /* Always on 3.3V regulator for WiFi and BT */
> > > +             compatible = "regulator-fixed";
> > > +             regulator-name = "vcc33-wifi";
> > > +             regulator-min-microvolt = <3300000>;
> > > +             regulator-max-microvolt = <3300000>;
> > > +             regulator-always-on;
> > > +             vin-supply = <&reg_vcc5v>;
> > > +     };
> > > +
> > > +     reg_vcc_wifi_io: vcc-wifi-io {
> > > +             /* Always on 1.8V/300mA regulator for WiFi and BT IO */
> > > +             compatible = "regulator-fixed";
> > > +             regulator-name = "vcc-wifi-io";
> > > +             regulator-min-microvolt = <1800000>;
> > > +             regulator-max-microvolt = <1800000>;
> > > +             regulator-always-on;
> > > +             vin-supply = <&reg_vcc33_wifi>;
> > > +     };
> > > +
> > > +     wifi_pwrseq: wifi_pwrseq {
>
> IIRC we shouldn't use underscores in node names. Maxime can you fix that up?

Done, thanks!
Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--ssnkgdje7jzcgsqx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXV/TNwAKCRDj7w1vZxhR
xVrNAQCa1MgrCyh7oN19ZsZE9syJ4qiyl3P8YsI1dtR48YhAWgD/QaSQYVBFbqmM
cWqnn8wDHbjoMqrBbhbYTmLG4+iStA4=
=GDJL
-----END PGP SIGNATURE-----

--ssnkgdje7jzcgsqx--


--===============5020455788421868986==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============5020455788421868986==--

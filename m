From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: How to define an I2C-to-SPI bridge device ?
Date: Thu, 9 Sep 2010 11:06:46 -0600
Message-ID: <20100909170646.GD6273@angua.secretlab.ca>
References: <1283502979.17812.22.camel@swa-m460>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1283502979.17812.22.camel@swa-m460>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: =?iso-8859-1?Q?Andr=E9?= Schwarz <andre.schwarz-P0pTl12WyEgpBod+wgzj8A@public.gmane.org>
Cc: LinuxPPC List <linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, DevTreeDiscuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 03, 2010 at 10:36:19AM +0200, Andr=E9 Schwarz wrote:
> Hi,
> =

> we're about to get new MPC8377 based hardware with various peripherals.
> There are two I2C-to-SPI bridge devices (NXP SC18IS602) and I'm not sure
> how to define a proper dts...
> =

> Of course it's an easy thing creating 2 child nodes on the CPU's I2C
> device - but how can I represent the created SPI bus ?
> =

> Is the (possibly) required driver (of_sc18is60x_spi ?) supposed to be an
> I2C slave or an SPI host driver ?

Both!  The driver would get probed from the i2c bus, and it would
create and register an spi master.  If the spi bus registration
includes a pointer to the device tree node, then the child nodes will
automatically be registered as spi_devices.

The dts is also fairly straight forward:

i2c-bus: i2c@80001000 {
	compatible =3D <blah>;
	#address-cells =3D <1>;
	#size-cells =3D <0>;

	spi-bus: spi@28{
		compatible =3D "nxp,sc18is602";
		#address-cells =3D <1>;
		#size-cells =3D <0x28>;
		reg =3D <0>;

		spi-device@0 {
			compatible =3D <blah>;
			reg =3D <0>;
		};
		spi-device@1 {
			compatible =3D <blah>;
			reg =3D <1>;
		};
		spi-device@2 {
			compatible =3D <blah>;
			reg =3D <2>;
		};
	};
};

Cheers,
g.

> =

> =

> Any help is welcome.
> =

> =

> -- =

> Mit freundlichen Gr=FC=DFen / Best regards
> =

> Andr=E9 Schwarz
> =

> ___________________________________________
> =

> MATRIX VISION GmbH
> - Entwicklung / Development -
> Talstra=DFe 16
> D-71570 Oppenweiler
> =

> Fon: ++49-07191-9432-420
> Fax: ++49-07191-9432-288
> eMail: andre.schwarz-P0pTl12WyEgpBod+wgzj8A@public.gmane.org
> web: www.matrix-vision.de
> =

> =

> MATRIX VISION GmbH, Talstrasse 16, DE-71570 Oppenweiler
> Registergericht: Amtsgericht Stuttgart, HRB 271090
> Geschaeftsfuehrer: Gerhard Thullner, Werner Armingeon, Uwe Furtner, Hans-=
Joachim Reich
> _______________________________________________
> Linuxppc-dev mailing list
> Linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/linuxppc-dev

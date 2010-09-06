From: =?ISO-8859-1?Q?Andr=E9?= Schwarz <andre.schwarz-P0pTl12WyEgpBod+wgzj8A@public.gmane.org>
Subject: Re: How to define an I2C-to-SPI bridge device ?
Date: Mon, 06 Sep 2010 16:37:52 +0200
Message-ID: <1283783872.4426.1.camel@swa-m460>
References: <1283502979.17812.22.camel@swa-m460>
	<20100903120858.GA19380@oksana.dev.rtsoft.ru>
	<4C84D334.6060008@matrix-vision.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4C84D334.6060008-P0pTl12WyEgpBod+wgzj8A@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Anton Vorontsov <cbouatmailru-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: LinuxPPC List <linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, DevTreeDiscuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Anton,

looks like I should have looked at include/spi/spi.h earlier :

/*
 * INTERFACES between SPI master-side drivers and SPI infrastructure.
 * (There's no SPI slave support for Linux yet...)
 */

...this is what I've been looking for.


thanks for your help and sorry for the noise.


Regards,
Andr=E9





On Mon, 2010-09-06 at 13:40 +0200, Andre Schwarz wrote:
> Anton,
> =

> > we're about to get new MPC8377 based hardware with various peripherals.
> >> There are two I2C-to-SPI bridge devices (NXP SC18IS602) and I'm not su=
re
> >> how to define a proper dts...
> >>
> >> Of course it's an easy thing creating 2 child nodes on the CPU's I2C
> >> device - but how can I represent the created SPI bus ?
> > Um.. the same as the other SPI buses? I.e.
> >
> > i2c-controller {  /* SOC I2C controller */
> > 	spi-controller {  /* The I2C-to-SPI bridge */
> > 		spi-device@0 {
> > 		};
> > 		spi-device@1 {
> > 		};
> > 	};
> > };
> >
> ok , thanks - looks straight forward.
> Is this any more than plain definition, i.e. will this trigger any I2C =

> or SPI device registration/linking ?
> >> Is the (possibly) required driver (of_sc18is60x_spi ?) supposed to be =
an
> >> I2C slave or an SPI host driver ?
> > It should be an I2C driver that registers an SPI master (i.e.
> > calls spi_alloc_master() and spi_register_master()).
> hmm - ok. Will have to do it manually then ...
> =

> I still wonder how to make the driver arch-generic *and* of-capable.
> Do we need a generic I2C slave driver that can be probed along with an =

> "of glue driver" or should the of-binding be part of a single device =

> driver ?
> =

> Sorry for the dumb questions - looks like I expected a little too much =

> functionality already existing.
> =

> =

> Regards,
> Andr=E9
> =





MATRIX VISION GmbH, Talstrasse 16, DE-71570 Oppenweiler
Registergericht: Amtsgericht Stuttgart, HRB 271090
Geschaeftsfuehrer: Gerhard Thullner, Werner Armingeon, Uwe Furtner, Hans-Jo=
achim Reich

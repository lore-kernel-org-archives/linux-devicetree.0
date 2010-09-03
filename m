From: =?ISO-8859-1?Q?Andr=E9?= Schwarz <andre.schwarz@matrix-vision.de>
Subject: How to define an I2C-to-SPI bridge device ?
Date: Fri, 03 Sep 2010 10:36:19 +0200
Message-ID: <1283502979.17812.22.camel@swa-m460>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
To: DevTreeDiscuss <devicetree-discuss@lists.ozlabs.org>, LinuxPPC List <linuxppc-dev@ozlabs.org>
List-Id: devicetree@vger.kernel.org

Hi,

we're about to get new MPC8377 based hardware with various peripherals.
There are two I2C-to-SPI bridge devices (NXP SC18IS602) and I'm not sure
how to define a proper dts...

Of course it's an easy thing creating 2 child nodes on the CPU's I2C
device - but how can I represent the created SPI bus ?

Is the (possibly) required driver (of_sc18is60x_spi ?) supposed to be an
I2C slave or an SPI host driver ?


Any help is welcome.


-- =

Mit freundlichen Gr=FC=DFen / Best regards

Andr=E9 Schwarz

___________________________________________

MATRIX VISION GmbH
- Entwicklung / Development -
Talstra=DFe 16
D-71570 Oppenweiler

Fon: ++49-07191-9432-420
Fax: ++49-07191-9432-288
eMail: andre.schwarz@matrix-vision.de
web: www.matrix-vision.de


MATRIX VISION GmbH, Talstrasse 16, DE-71570 Oppenweiler
Registergericht: Amtsgericht Stuttgart, HRB 271090
Geschaeftsfuehrer: Gerhard Thullner, Werner Armingeon, Uwe Furtner, Hans-Jo=
achim Reich

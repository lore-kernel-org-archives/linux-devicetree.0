From: =?ISO-8859-1?Q?Andr=E9?= Schwarz <andre.schwarz@matrix-vision.de>
Subject: Re: How to define an I2C-to-SPI bridge device ?
Date: Fri, 10 Sep 2010 10:11:33 +0200
Message-ID: <1284106293.2267.42.camel@swa-m460>
References: <1283502979.17812.22.camel@swa-m460>
	<20100903120858.GA19380@oksana.dev.rtsoft.ru>
	<4C84D334.6060008@matrix-vision.de>
	<c843f864-2a5a-4146-bd95-13c2fb91f430@email.android.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <c843f864-2a5a-4146-bd95-13c2fb91f430@email.android.com>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: LinuxPPC List <linuxppc-dev@ozlabs.org>, DevTreeDiscuss <devicetree-discuss@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

Grant, Anton,


> =

> There is no longer any need for separate of and non-of drivers for the sa=
me hardware.  Any device may have the of_node pointer in struct device set,=
 and drivers can use the pointer as an alternative to platform_data to get =
information about the hardware configuration.

> Just read the data out of the node in the driver's probe hook.

ok - will do it that way.

> =

> For i2c and (soon) spi, the core code will even register child devices fo=
r you.

excellent.



Thinking about this device raises even more questions. Since there are
several possible solutions I'd like to hear your opinions :

1.
The SC18IS602 is capable of generating interrupts which is *extremely*
useful triggering on the end of the actual SPI transaction and not the
end of I2C chip access. Since we need an IRQ_ACK over I2C (which takes
loooong with IRQ being still asserted) I'm thinking about using an edge
triggered interrupt.
Since all transactions are in-order there's no risk of missing multiple
edges ... what do you think about this ? Any known issues with edge
triggered IRQs ?


2.
chips select generations is a little tricky.
The device has up to four cs# lines with their assertion being encoded
as subaddr representing a bitfield, i.e. Subaddr 0x01 generates cs0,
0x04 asserts cs3 and 0x07 asserts cs0-2.

At first I thought about registering 4 SPI busses representing the 4 cs#
lines and hide the cs# generation from the user. This would make
multiple cs# assertions for a single write impossible which is a very
useful feature.

Exposing the desired cs# setting for the next transaction via sysfs or
libGPIO requires the user to serialize cs# config and actual SPI
read/write. I also wouldn't know how to properly present the cs# lines
from multiple chips to the user in a clear and unambiguous way.


Any suggestions ?


Regards,
Andr=E9


MATRIX VISION GmbH, Talstrasse 16, DE-71570 Oppenweiler
Registergericht: Amtsgericht Stuttgart, HRB 271090
Geschaeftsfuehrer: Gerhard Thullner, Werner Armingeon, Uwe Furtner

From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>
Subject: [PATCH v2 1/5] dts: gpio_atmel: adapt binding doc to reality
Date: Fri, 26 May 2017 21:07:03 +0200
Message-ID: <20170526190703.t5fab33peh2cmobm@taurus.defre.kleine-koenig.org>
References: <20170526185214.GB20946@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20170526185214.GB20946@lunn.ch>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Arnd Bergmann <arnd@arndb.de>
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The second cell in a gpio reference is used to pass GPIO_ACTIVE_LOW or
GPIO_ACTIVE_HIGH. The gpio device can also be used as irq controller and
a reference can contain the IRQ_TYPE_* values in the second cell.

Signed-off-by: Uwe Kleine-K=F6nig <uwe@kleine-koenig.org>
---
On Fri, May 26, 2017 at 08:52:14PM +0200, Andrew Lunn wrote:
> > +- interrupt-controller: Marks the device node as a GPIO controller.
> =

> Interrupt controller, not GPIO controller.
> =

> > +- #interrupt-cells: Should be two. The first cell is the pin number an=
d the
> > +  second cell is used to specify irq type flags:
> > +      1 =3D low-to-high edge triggered.
> > +      2 =3D high-to-low edge triggered.
> > +      4 =3D active high level-sensitive.
> > +      8 =3D active low level-sensitive.
> =

> Maybe just reference interrupts.txt?

ack for both and changed in this v2.

Thanks
Uwe

 Documentation/devicetree/bindings/gpio/gpio_atmel.txt | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio_atmel.txt b/Docume=
ntation/devicetree/bindings/gpio/gpio_atmel.txt
--- a/Documentation/devicetree/bindings/gpio/gpio_atmel.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio_atmel.txt
@@ -5,9 +5,13 @@ Required properties:
 - reg: Should contain GPIO controller registers location and length
 - interrupts: Should be the port interrupt shared by all the pins.
 - #gpio-cells: Should be two.  The first cell is the pin number and
-  the second cell is used to specify optional parameters (currently
-  unused).
+  the second cell is used to specify optional parameters to declare if the=
 GPIO
+  is active high or low. See gpio.txt.
 - gpio-controller: Marks the device node as a GPIO controller.
+- interrupt-controller: Marks the device node as an interrupt controller.
+- #interrupt-cells: Should be two. The first cell is the pin number and the
+  second cell is used to specify irq type flags, see the two cell descript=
ion
+  in interrupt-controller/interrupts.txt for details.
 =

 optional properties:
 - #gpio-lines: Number of gpio if absent 32.
@@ -21,5 +25,7 @@ Example:
 		#gpio-cells =3D <2>;
 		gpio-controller;
 		#gpio-lines =3D <19>;
+		interrupt-controller;
+		#interrupt-cells =3D <2>;
 	};
 =

-- =

2.11.0

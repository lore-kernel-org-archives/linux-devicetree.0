From: Simon Arlott <simon-A6De1vDTPLDsq35pWSNszA@public.gmane.org>
Subject: [PATCH (v2) 1/10] clocksource: Add brcm,bcm6345-timer device tree
 binding
Date: Mon, 23 Nov 2015 18:55:38 +0000
Message-ID: <5653612A.4050309@simon.arlott.org.uk>
References: <5650BFD6.5030700@simon.arlott.org.uk>
 <CAOiHx=k0Aa+qrBT1J7_cQaQRxndBmwsgSgi3x0eJOYTAy6Zq7Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOiHx=k0Aa+qrBT1J7_cQaQRxndBmwsgSgi3x0eJOYTAy6Zq7Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Miguel Gaio <miguel.gaio-HH44TBFINEIAvxtiuMwx3w@public.gmane.org>, Maxime Bizon <mbizon-MmRyKUhfbQ9GWvitb5QawA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, MIPS Mailing List <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add device tree bindings for the BCM6345/BCM6318 timers. This is requir=
ed
for the BCM6345 watchdog which needs to respond to one of the timer
interrupts.

Signed-off-by: Simon Arlott <simon-A6De1vDTPLDsq35pWSNszA@public.gmane.org>
---
On 23/11/15 15:33, Jonas Gorski wrote:
> On Sat, Nov 21, 2015 at 8:02 PM, Simon Arlott <simon-A6De1vDTPLDsq35pWSNszA@public.gmane.org> wro=
te:
>> +- compatible: should be "brcm,bcm<soc>-timer", "brcm,bcm6345-timer"
>=20
> Since bcm6318 uses a slightly different register layout than the
> earlier SoCs, I'd argue that using bcm6345-timer as a compatible for
> bcm6318 is wrong.

I've split them out into two very similar bindings.

Patches 1/4 and 2/4 are replaced with (v2) 1/10 and (v2) 2/10.

 .../bindings/timer/brcm,bcm6318-timer.txt          | 44 ++++++++++++++=
++++++
 .../bindings/timer/brcm,bcm6345-timer.txt          | 47 ++++++++++++++=
++++++++
 2 files changed, 91 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/brcm,bcm631=
8-timer.txt
 create mode 100644 Documentation/devicetree/bindings/timer/brcm,bcm634=
5-timer.txt

diff --git a/Documentation/devicetree/bindings/timer/brcm,bcm6318-timer=
=2Etxt b/Documentation/devicetree/bindings/timer/brcm,bcm6318-timer.txt
new file mode 100644
index 0000000..cf4be7e
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/brcm,bcm6318-timer.txt
@@ -0,0 +1,44 @@
+Broadcom BCM6318 Timer
+
+This block is a timer that is connected to multiple interrupts on the =
main
+interrupt controller and functions as a programmable interrupt control=
ler for
+timer events. There is a main timer interrupt for all timers.
+
+- 4 independent timers with their own interrupt, and own maskable leve=
l
+  interrupt bit in the main timer interrupt
+
+- 1 watchdog timer with an unmaskable level interrupt bit in the main =
timer
+  interrupt
+
+- Contains one enable/status word pair
+
+- No atomic set/clear operations
+
+Required properties:
+
+- compatible: should be "brcm,bcm<soc>-timer", "brcm,bcm6318-timer"
+- reg: specifies the base physical address and size of the registers, =
excluding
+  the watchdog registers
+- interrupt-controller: identifies the node as an interrupt controller
+- #interrupt-cells: specifies the number of cells needed to encode an =
interrupt
+  source, should be 1.
+- interrupt-parent: specifies the phandle to the parent interrupt cont=
roller(s)
+  this one is cascaded from
+- interrupts: specifies the interrupt line(s) in the interrupt-parent =
controller
+  node for the main timer interrupt, followed by the individual timer
+  interrupts; valid values depend on the type of parent interrupt cont=
roller
+- clocks: phandle of timer reference clock (periph)
+
+Example:
+
+timer: timer@10000040 {
+	compatible =3D "brcm,bcm63148-timer", "brcm,bcm6318-timer";
+	reg =3D <0x10000040 0x28>;
+
+	interrupt-controller;
+	#interrupt-cells =3D <1>;
+
+	interrupt-parent =3D <&periph_intc>;
+	interrupts =3D <31>, <0>, <1>, <2>, <3>;
+	clock =3D <&periph_osc>;
+};
diff --git a/Documentation/devicetree/bindings/timer/brcm,bcm6345-timer=
=2Etxt b/Documentation/devicetree/bindings/timer/brcm,bcm6345-timer.txt
new file mode 100644
index 0000000..03250dd
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/brcm,bcm6345-timer.txt
@@ -0,0 +1,47 @@
+Broadcom BCM6345 Timer
+
+This block is a timer that is connected to one interrupt on the main i=
nterrupt
+controller and functions as a programmable interrupt controller for ti=
mer
+events.
+
+- 3 independent timers with their own maskable level interrupt bit (bu=
t not
+  per CPU because there is only one parent interrupt and the timers sh=
are it)
+
+- 1 watchdog timer with an unmaskable level interrupt
+
+- Contains one enable/status word pair
+
+- No atomic set/clear operations
+
+The lack of per CPU ability of timers makes them unusable as a set of
+clockevent devices, otherwise they could be attached to the remaining
+interrupts.
+
+Required properties:
+
+- compatible: should be "brcm,bcm<soc>-timer", "brcm,bcm6345-timer"
+- reg: specifies the base physical address and size of the registers, =
excluding
+  the watchdog registers
+- interrupt-controller: identifies the node as an interrupt controller
+- #interrupt-cells: specifies the number of cells needed to encode an =
interrupt
+  source, should be 1.
+- interrupt-parent: specifies the phandle to the parent interrupt cont=
roller(s)
+  this one is cascaded from
+- interrupts: specifies the interrupt line(s) in the interrupt-parent =
controller
+  node for the timer interrupt; valid values depend on the type of par=
ent
+  interrupt controller
+- clocks: phandle of timer reference clock (periph)
+
+Example:
+
+timer: timer@10000080 {
+	compatible =3D "brcm,bcm63168-timer", "brcm,bcm6345-timer";
+	reg =3D <0x10000080 0x1c>;
+
+	interrupt-controller;
+	#interrupt-cells =3D <1>;
+
+	interrupt-parent =3D <&periph_intc>;
+	interrupts =3D <0>;
+	clock=C2=B7=3D=C2=B7<&periph_osc>;
+};
--=20
2.1.4

--=20
Simon Arlott
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdo=
g" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

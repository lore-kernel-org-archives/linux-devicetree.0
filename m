Return-Path: <jason@lakedaemon.net>
Date: Thu, 22 May 2014 07:53:05 -0400
From: Jason Cooper <jason@lakedaemon.net>
Subject: Re: [PATCH RESEND 2/2] Documentation: add Broadcom STB Level-2
 interrupt controller binding
Message-ID: <20140522115305.GK8664@titan.lakedaemon.net>
References: <1400613229-19049-1-git-send-email-f.fainelli@gmail.com>
 <1400613229-19049-3-git-send-email-f.fainelli@gmail.com>
 <20140521013027.GD8664@titan.lakedaemon.net>
 <537C0E50.4050409@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <537C0E50.4050409@gmail.com>
Content-Transfer-Encoding: quoted-printable
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: arm@kernel.org, Brian Norris <computersforpeace@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Randy Dunlap <rdunlap@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, open@lakedaemon.net, list@lakedaemon.net, DOCUMENTATION <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org
List-ID: <devicetree@vger.kernel.org>

On Tue, May 20, 2014 at 07:24:16PM -0700, Florian Fainelli wrote:
> Le 20/05/2014 18:30, Jason Cooper a =E9crit :
> >On Tue, May 20, 2014 at 12:13:49PM -0700, Florian Fainelli wrote:
> >>This patch adds the Device Tree binding document for the Broadcom
> >>Set-top-box Level 2 interrupt controller hardware.
> >>
> >>Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> >>Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> >>---
> >>  .../bindings/interrupt-controller/brcm,l2-intc.txt | 29 +++++++++++=
+++++++++++
> >>  1 file changed, 29 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/interrupt-cont=
roller/brcm,l2-intc.txt
> >>
> >>diff --git a/Documentation/devicetree/bindings/interrupt-controller/b=
rcm,l2-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/=
brcm,l2-intc.txt
> >>new file mode 100644
> >>index 000000000000..448273a30a11
> >>--- /dev/null
> >>+++ b/Documentation/devicetree/bindings/interrupt-controller/brcm,l2-=
intc.txt
> >>@@ -0,0 +1,29 @@
> >>+Broadcom Generic Level 2 Interrupt Controller
> >>+
> >>+Required properties:
> >>+
> >>+- compatible: should be "brcm,l2-intc"
> >>+- reg: specifies the base physical address and size of the registers
> >>+- interrupt-controller: identifies the node as an interrupt controll=
er
> >>+- #interrupt-cells: specifies the number of cells needed to encode a=
n
> >>+  interrupt source. Should be 1.
> >>+- interrupt-parent: specifies the phandle to the parent interrupt co=
ntroller
> >>+  this controller is cacaded from
> >>+- interrupts: specifies the interrupt line in the interrupt-parent i=
rq space
> >>+  to be used for cascading
> >>+
> >>+Optional properties:
> >>+
> >>+- brcm,irq-can-wake: If present, this means the L2 controller can be=
 used as a
> >>+  wakeup source for system suspend/resume.
> >
> >Do we need a vendor-specific property here?  I'd much prefer to see a
> >generic implementation.
>=20
> Is there an usable generic property? We came up with a custom one
> because there is not a generic one AFAICT.

Not afaict either.  It just seems like a suitably generic concept that
should have a matching generic property.  No reason to hold up the patch
though.  Getting a 'consensus' on a generic binding is sometimes an
involved process.  We can always switch over to it later.

thx,

Jason.

From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH v2 1/2] dt-bindings: arm,gic: Fix binding example for a
 virt-capable GIC
Date: Sun, 29 Jan 2017 14:51:29 -0800
Message-ID: <20170129225129.GK3133@localhost>
References: <1485186974-13678-1-git-send-email-marc.zyngier@arm.com>
 <1485186974-13678-2-git-send-email-marc.zyngier@arm.com>
 <20170127203001.qvlgzzrh5hx2pykf@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20170127203001.qvlgzzrh5hx2pykf@rob-hp-laptop>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Heiko Stuebner <heiko@sntech.de>, Tony Lindgren <tony@atomide.com>, arm@kernel.org, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Chen-Yu Tsai <wens@csie.org>, Kukjin Kim <kgene@kernel.org>, Tsahee Zidenberg <tsahee@annapurnalabs.com>, devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Simon Horman <horms@verge.net.au>, Santosh Shilimkar <ssantosh@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Sascha Hauer <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org, Antoine Tenart <antoine.tenart@free-electrons.com>, linux-kernel@vger.kernel.org, Beno?t Cousson <bcousson@baylibre.com>, Fabio Estevam <fabio.estevam@nxp.>
List-Id: devicetree@vger.kernel.org

On Fri, Jan 27, 2017 at 02:30:01PM -0600, Rob Herring wrote:
> On Mon, Jan 23, 2017 at 03:56:13PM +0000, Marc Zyngier wrote:
> > The joys of copy/paste: the example of a virtualization capable GIC
> > in the DT binding was wrong, and propagated to dozens of platforms.
> > By having a GICC region that is only 4kB (instead of 8kB), we
> > end-up not being able to access the GICC_DIR register which is on
> > the second page.
> > 
> > Oh well. Let's fix the source of the crap before tackling individual
> > offenders. While we're at it, also fix the compatibility string to
> > mention "arm,gic-400", which is the name of the actual implementation
> > of the GICv2 spec.
> 
> "While we're at it", code for should be in a separate patch. :) I 
> wouldn't really care here, but you are not fixing anything...
> 
> > 
> > Acked-by: Tony Lindgren <tony@atomide.com>
> > Acked-by: Mark Rutland <mark.rutland@arm.com>
> > Acked-by: Arnd Bergmann <arnd@arndb.de>
> > Signed-off-by: Marc Zyngier <marc.zyngier@arm.com>
> > ---
> >  Documentation/devicetree/bindings/interrupt-controller/arm,gic.txt | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/interrupt-controller/arm,gic.txt b/Documentation/devicetree/bindings/interrupt-controller/arm,gic.txt
> > index 5393e2a..a3d51ed 100644
> > --- a/Documentation/devicetree/bindings/interrupt-controller/arm,gic.txt
> > +++ b/Documentation/devicetree/bindings/interrupt-controller/arm,gic.txt
> > @@ -107,11 +107,11 @@ Required properties:
> >  Example:
> >  
> >  	interrupt-controller@2c001000 {
> > -		compatible = "arm,cortex-a15-gic";
> > +		compatible = "arm,gic-400";
> 
> Which one is correct really depends on the platform. The A15 can have an 
> internal or external (gic-400) GIC. The former string is correct for an 
> A15 with an internal GIC. One such platform is Calxeda midway.
> 
> Arguably, we should not have arm,gic-400 by itself, but have an SoC 
> specific compatible in case it was integrated in interesting ways.

Good point (and thanks for bringing it up).

Marc, based on this; want to back the above out so we can apply the rest for
now, while you battle on the compatible details? :)


-Olof

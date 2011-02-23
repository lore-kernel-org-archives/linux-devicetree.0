From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [RFC PATCH 02/10] MIPS: Octeon: Add device tree source files.
Date: Thu, 24 Feb 2011 10:49:23 +1100
Message-ID: <20110223234923.GA4932@yookeroo>
References: <1298408274-20856-1-git-send-email-ddaney@caviumnetworks.com>
	<1298408274-20856-3-git-send-email-ddaney@caviumnetworks.com>
	<20110223000759.GA26300@yookeroo>
	<4D655AB6.80400@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4D655AB6.80400-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Daney <ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Feb 23, 2011 at 11:06:30AM -0800, David Daney wrote:
> On 02/22/2011 04:07 PM, David Gibson wrote:
> >On Tue, Feb 22, 2011 at 12:57:46PM -0800, David Daney wrote:
> >>Signed-off-by: David Daney<ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
> >>---
> >>  arch/mips/cavium-octeon/.gitignore      |    2 +
> >>  arch/mips/cavium-octeon/Makefile        |   13 ++
> >>  arch/mips/cavium-octeon/octeon_3xxx.dts |  314 +++++++++++++++++++++++++++++++
> >>  arch/mips/cavium-octeon/octeon_68xx.dts |   99 ++++++++++
> >>  4 files changed, 428 insertions(+), 0 deletions(-)
> >>  create mode 100644 arch/mips/cavium-octeon/.gitignore
> >>  create mode 100644 arch/mips/cavium-octeon/octeon_3xxx.dts
> >>  create mode 100644 arch/mips/cavium-octeon/octeon_68xx.dts
> >>
> >>diff --git a/arch/mips/cavium-octeon/.gitignore b/arch/mips/cavium-octeon/.gitignore
> >>new file mode 100644
> >>index 0000000..39c9686
> >>--- /dev/null
> >>+++ b/arch/mips/cavium-octeon/.gitignore
> >>@@ -0,0 +1,2 @@
> >>+*.dtb.S
> >
> >.dtb.S?
> 
> I think I have the correct .gitignore syntax.

What I meant was, where are you generating .dtb.S files that you need
to ignore them?

> >>+  compatible = "octeon,octeon";
> >
> >There's no model number at all for this board?
> 
> 
> I think it should be:
> 
> 	compatible = "octeon,octeon-3860";

That looks better.

Also, the part before the comma is generally the vendor, so I would
have expected cavium,XXX throughout rather than octeon,XXX.

[snip]
> >So, names or compatible values with "wildcards" like 3xxx should be
> >avoided.  Instead, use the specific model number of this device, then
> >future devices can claim compatibility with the earlier one.
> >
> >But, in addition the generic names convention means that the node name
> >should be "interrupt-controller" rather than something model specific.
> 
> Let's try:
> 
> ciu: interrupt-controller@1070000000000 {
>       compatible = "octeon,octeon-3860-ciu";

That looks better.

[snip]
> >>+      device_type = "network";
> >>+      model = "mgmt";
> >>+      reg =<0x10700 0x00100000 0x0 0x100>, /* MIX */
> >>+<0x11800 0xE0000000 0x0 0x300>, /* AGL */
> >>+<0x11800 0xE0000400 0x0 0x400>, /* AGL_SHARED  */
> >>+<0x11800 0xE0002000 0x0 0x8>;   /* AGL_PRT_CTL */
> >>+      unit-number =<0>;
> >
> >What is this 'unit-number' property for?
> 
> The AGL_SHARED register bank is shared among all the octeon-5230-mii
> devices.  the 'unit-number' indicates the bit-field index that this
> device should use within those registers.

Ok.  'cell-index' is the normal property name for this sort of
purpose.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

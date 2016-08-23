From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] ARM: dts: blanche: add DU support
Date: Tue, 23 Aug 2016 09:24:49 +0200
Message-ID: <20160823072449.GG14998@verge.net.au>
References: <5383928.8UnDsUpmkz@wasted.cogentembedded.com>
 <1783132.r9t2y3QUUq@wasted.cogentembedded.com>
 <20160822074111.GE28034@verge.net.au>
 <de79981f-9aff-5491-c97b-48542b860af2@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <de79981f-9aff-5491-c97b-48542b860af2@cogentembedded.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux@arm.linux.org.uk, magnus.damm@gmail.com, linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, Aug 22, 2016 at 01:34:12PM +0300, Sergei Shtylyov wrote:
> Hello.
> 
> On 8/22/2016 10:41 AM, Simon Horman wrote:
> 
> >>Define  the  Blanche board dependent part of the DU device node.
> >>Add the device nodes for the  Analog Devices ADV7511W  HDMI transmitter
> >>(connected to DU0) and ADV7123 video DAC (connected to DU1).  Add the
> >>necessary subnodes to interconnect DU, HDMI/VDAC devices, and HDMI/VGA
> >>connectors.
> >>
> >>Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> >>
> >>---
> >>This patch is against the 'renesas-devel-20160817-v4.8-rc2' of Simon Horman's
> >>'renesas.git' repo plus the general purpose switches patch and the SDHI0 patch
> >>posted earlier.
> >>
> >> arch/arm/boot/dts/r8a7792-blanche.dts |  125 ++++++++++++++++++++++++++++++++++
> >> 1 file changed, 125 insertions(+)
> >>
> >>Index: renesas/arch/arm/boot/dts/r8a7792-blanche.dts
> >>===================================================================
> >>--- renesas.orig/arch/arm/boot/dts/r8a7792-blanche.dts
> >>+++ renesas/arch/arm/boot/dts/r8a7792-blanche.dts
> >
> >...
> >
> >>@@ -186,3 +251,63 @@
> >> 	cd-gpios = <&gpio11 11 GPIO_ACTIVE_LOW>;
> >> 	status = "okay";
> >> };
> >>+
> >>+&i2c1 {
> >>+	status = "okay";
> >>+	clock-frequency = <400000>;
> >
> >Is it intentional that there are no pinctrl properties here?
> 
>    Yes, as I commented in r8a7792.dtsi, all I2C pins are not multiplexed.

Thanks for satisfying my curiosity.
I have queued this up.

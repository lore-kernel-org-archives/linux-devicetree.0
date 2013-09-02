From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 1/4] ARM: shmobile: r8a7778: add Ether DT support
Date: Mon, 02 Sep 2013 16:18:41 +0200
Message-ID: <1738124.5rApJWhXUN@avalon>
References: <201309010311.05466.sergei.shtylyov@cogentembedded.com> <1643070.uIkONXsrBj@avalon> <52249B16.8010409@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <52249B16.8010409@cogentembedded.com>
Sender: linux-sh-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: horms@verge.net.au, linux-sh@vger.kernel.org, rob.herring@calxeda.com, pawel.moll@arm.com, mark.rutland@arm.com, swarren@wwwdotorg.org, ian.campbell@citrix.com, devicetree@vger.kernel.org, magnus.damm@gmail.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Monday 02 September 2013 18:05:10 Sergei Shtylyov wrote:
> On 09/02/2013 05:14 PM, Laurent Pinchart wrote:
> >> Define the generic R8A777x part of the Ether device node.
> >> 
> >> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> >> 
> >> ---
> >> 
> >>   arch/arm/boot/dts/r8a7778.dtsi |   11 +++++++++++
> >>   1 file changed, 11 insertions(+)
> >> 
> >> Index: renesas/arch/arm/boot/dts/r8a7778.dtsi
> >> ===================================================================
> >> --- renesas.orig/arch/arm/boot/dts/r8a7778.dtsi
> >> +++ renesas/arch/arm/boot/dts/r8a7778.dtsi
> >> @@ -98,4 +98,15 @@
> >> 
> >>   		reg = <0xfffc000 0x118>;
> >>   		#gpio-range-cells = <3>;
> >>   	
> >>   	};
> >> 
> >> +
> >> +	ether: ethernet@fde00000 {
> >> +		device_type = "network";
> > 
> > Documentation/devicetree/bindings/net/sh_eth.txt from "[PATCH 2/2] sh_eth:
> > add device tree support" doesn't document this property, should you
> > update it ?
>     It's a standard property but completely optional for non-OF systems.
> I've not seen anybody document it but I should grep for it...

Documentation/devicetree/booting-without-of.txt mentions it, as well as a 
couple of other DT bindings document, but there's no clear documentation of 
what device_type should be for network device, and whether the property is 
mandatory or optional. Clarifying the documentation would be great.

-- 
Regards,

Laurent Pinchart


From: Ralph Sennhauser <ralph.sennhauser-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/1] ARM: dts: armada-xp-linksys-mamba: use wan instead
 of internet for DSA port
Date: Wed, 5 Apr 2017 17:22:24 +0200
Message-ID: <20170405172224.38c1f9fb@gmail.com>
References: <20170405052847.326-1-ralph.sennhauser@gmail.com>
        <20170405142824.GB13449@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170405142824.GB13449-g2DYL2Zd6BY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 5 Apr 2017 16:28:24 +0200
Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org> wrote:

> On Wed, Apr 05, 2017 at 07:28:46AM +0200, Ralph Sennhauser wrote:
> > The LEDs for the "wan" port are already labeled "mamba:amber:wan"
> > resp. "mamba:white:wan". So besides being an outlier with regard to
> > the rest of the product line (see table below) changing the label
> > fixes an internal inconsistency as well.
> > 
> > This will be visible in user space. Given commit cb4f71c42988 ("ARM:
> > dts: armada-38x: change order of ethernet DT nodes on Armada 38x")
> > it's expected to happen anyway. Commit 499400c9ac20 ("ARM: dts:
> > armada-xp-linksys-mamba: Utilize new DSA binding") switches to the
> > new bindings, use this opportunity to do it now rather than later.
> > 
> > |-----------------------------------------------------------------|
> > | Labels used for the case and those used for the DSA ports       |
> > |-----------------------------------------------------------------|
> > | case labels	| armada-385-linksys-*	|
> > armada-xp-linksys-mamba |
> > |---------------|-----------------------|-------------------------|
> > | internet	| wan			|
> > internet		  | | 1		|
> > lan1			| lan1			  | |
> > 2		| lan2			|
> > lan2			  | | 3		|
> > lan3			| lan3			  | |
> > 4		| lan4			|
> > lan4			  |
> > |-----------------------------------------------------------------|  
> 
> Hi Ralph
> 
> I always encourage people to use the case labels as interface names.
> So if i was going to make a change, it would be wan->internet for the 
> armada-385-linksys-*.

Glad Imre used lan1 instead of 1 ;) 

The reverse I have appended to this mail so people know what it would
look like.

In fact "internet" label on the case is uppercase, would this matter
for you for new bindings, or would you still use the lowercase version?
It's not relevant here, just wondering.

> 
> > I underestimated the urge of people to make all the same before.
> > While I do not particularly like this sort of change I see it
> > coming anyway. So this patch is meant to make it a deliberate
> > decision so it no longer is an item lurking in the shadows. Whether
> > this patch gets taken or rejected my goal is reached.  
> 
> I would say, this is now too late. Changing an interface name will
> break configuration scripts. We are stuck with it.
> 

If it weren't for commit cb4f71c42988 that would have been obvious for
me as well.

Thanks
Ralph



The inverse (following trough all the way) would look the following,
same changes applies to Rango which is not yet supported by vanilla
kernel.

diff --git a/arch/arm/boot/dts/armada-385-linksys-caiman.dts b/arch/arm/boot/dts/armada-385-linksys-caiman.dts
index a1b6e68..3efceda 100644
--- a/arch/arm/boot/dts/armada-385-linksys-caiman.dts
+++ b/arch/arm/boot/dts/armada-385-linksys-caiman.dts
@@ -53,13 +53,13 @@
 				#address-cells = <1>;
 				#size-cells = <0>;
 
-					wan_amber@0 {
-						label = "caiman:amber:wan";
+					internet_amber@0 {
+						label = "caiman:amber:internet";
 						reg = <0x0>;
 					};
 
-					wan_white@1 {
-						label = "caiman:white:wan";
+					internet_white@1 {
+						label = "caiman:white:internet";
 						reg = <0x1>;
 					};
 
diff --git a/arch/arm/boot/dts/armada-385-linksys-cobra.dts b/arch/arm/boot/dts/armada-385-linksys-cobra.dts
index a1a75af..4f2e7f6 100644
--- a/arch/arm/boot/dts/armada-385-linksys-cobra.dts
+++ b/arch/arm/boot/dts/armada-385-linksys-cobra.dts
@@ -53,13 +53,13 @@
 				#address-cells = <1>;
 				#size-cells = <0>;
 
-					wan_amber@0 {
-						label = "cobra:amber:wan";
+					internet_amber@0 {
+						label = "cobra:amber:internet";
 						reg = <0x0>;
 					};
 
-					wan_white@1 {
-						label = "cobra:white:wan";
+					internet_white@1 {
+						label = "cobra:white:internet";
 						reg = <0x1>;
 					};
 
diff --git a/arch/arm/boot/dts/armada-385-linksys-shelby.dts b/arch/arm/boot/dts/armada-385-linksys-shelby.dts
index c7a8ddd..a7b47f7 100644
--- a/arch/arm/boot/dts/armada-385-linksys-shelby.dts
+++ b/arch/arm/boot/dts/armada-385-linksys-shelby.dts
@@ -53,13 +53,13 @@
 				#address-cells = <1>;
 				#size-cells = <0>;
 
-					wan_amber@0 {
-						label = "shelby:amber:wan";
+					internet_amber@0 {
+						label = "shelby:amber:internet";
 						reg = <0x0>;
 					};
 
-					wan_white@1 {
-						label = "shelby:white:wan";
+					internet_white@1 {
+						label = "shelby:white:internet";
 						reg = <0x1>;
 					};
 
diff --git a/arch/arm/boot/dts/armada-385-linksys.dtsi b/arch/arm/boot/dts/armada-385-linksys.dtsi
index aa0d225..8460066 100644
--- a/arch/arm/boot/dts/armada-385-linksys.dtsi
+++ b/arch/arm/boot/dts/armada-385-linksys.dtsi
@@ -145,7 +145,7 @@
 
 						port@4 {
 							reg = <4>;
-							label = "wan";
+							label = "internet";
 						};
 
 						port@5 {
@@ -360,7 +360,7 @@
 
 			port@4 {
 				reg = <4>;
-				label = "wan";
+				label = "internet";
 			};
 
 			port@5 {
diff --git a/arch/arm/boot/dts/armada-xp-linksys-mamba.dts b/arch/arm/boot/dts/armada-xp-linksys-mamba.dts
index 9efcf59..ed2fe8f 100644
--- a/arch/arm/boot/dts/armada-xp-linksys-mamba.dts
+++ b/arch/arm/boot/dts/armada-xp-linksys-mamba.dts
@@ -140,13 +140,13 @@
 					compatible = "ti,tlc59116";
 					reg = <0x68>;
 
-					wan_amber@0 {
-						label = "mamba:amber:wan";
+					internet_amber@0 {
+						label = "mamba:amber:internet";
 						reg = <0x0>;
 					};
 
-					wan_white@1 {
-						label = "mamba:white:wan";
+					internet_white@1 {
+						label = "mamba:white:internet";
 						reg = <0x1>;
 					};
 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

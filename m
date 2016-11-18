From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 09/13] ARM: dts: armada-375: Fixup soc DT warning
Date: Fri, 18 Nov 2016 10:38:32 +0100
Message-ID: <877f81b013.fsf@free-electrons.com>
References: <20161117230830.31047-1-gregory.clement@free-electrons.com>
        <20161117230830.31047-10-gregory.clement@free-electrons.com>
        <20161118095455.00bfe007@free-electrons.com>
        <87d1htb1qr.fsf@free-electrons.com>
        <20161118101248.784eff2b@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161118101248.784eff2b-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> (Thomas Petazzoni's
        message of "Fri, 18 Nov 2016 10:12:48 +0100")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Thomas,
 
 On ven., nov. 18 2016, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:

> Hello,
>
> On Fri, 18 Nov 2016 10:01:32 +0100, Gregory CLEMENT wrote:
>
>> >> +	soc@f00100000000 {  
>> >
>> > Where is this value coming from? Why does the soc node needs to have a  
>> 
>> It cames from the dts files.
>
> Where?

--- a/arch/arm/boot/dts/armada-375-db.dts
+++ b/arch/arm/boot/dts/armada-375-db.dts
@@ -63,7 +63,11 @@
 		reg = <0x00000000 0x40000000>; /* 1 GB */
 	};
 
-	soc {
+	/* The following unit address is composed of the target
+	 * value (bit [40-47]), attributes value (bits [32-39],
+	 * and the address value in the window memory: [0-31].
+	 */
+	soc@f00100000000 {
 		ranges = <MBUS_ID(0xf0, 0x01) 0 0xf1000000 0x100000

just here ---------^

 			  MBUS_ID(0x01, 0x1d) 0 0xfff00000 0x100000
 			  MBUS_ID(0x09, 0x09) 0 0xf1100000 0x10000




>
>> > unit address? It doesn't have a 'reg' property if I remember
>> > correctly.  
>> 
>> But it has a range property.
>
> And? There are multiple ranges, and you randomly took the first one for
> the unit address of the soc node?

Not randomly I followed the same rules that for the regs mentioned in
the ePAPR paragraph 2.2.1.1:

"The unit-address should match the first address specified in the reg
property of the node."

>
> You realize that the ranges property is a list of ranges, and they
> could be in any order? Why would you pick the base address of one of
> the ranges rather than any of the others?

It is the same for the regs so as explained I followed the same rules.

>
> I believe there is simply no unit address for the soc {} node. There is
> definitely one for the internal-regs {} node, but not for the soc {}
> node.

It is not the interpretation of the DTC:

"Warning (unit_address_vs_reg): Node /soc has a reg or ranges property,
but no unit name"

Gregory

>
> Best regards,
>
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com

-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

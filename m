From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 04/14] ARM: dts: armada-375: Fixup bootrom DT warning
Date: Thu, 10 Nov 2016 10:36:47 +0100
Message-ID: <87wpgbekwg.fsf@free-electrons.com>
References: <20161110001000.10619-1-gregory.clement@free-electrons.com>
        <20161110001000.10619-5-gregory.clement@free-electrons.com>
        <20161110092221.0219490b@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161110092221.0219490b-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> (Thomas Petazzoni's
        message of "Thu, 10 Nov 2016 09:22:21 +0100")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Thomas,
 
 On jeu., nov. 10 2016, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:

> Hello,
>
> On Thu, 10 Nov 2016 01:09:50 +0100, Gregory CLEMENT wrote:
>
>> -		bootrom {
>> +		bootrom@0 {
>>  			compatible = "marvell,bootrom";
>>  			reg = <MBUS_ID(0x01, 0x1d) 0 0x100000>;
>
> I am still not sure whether this "0" unit address is correct compared
> to the reg property being passed.

I chose to use the adress register inside the window memory.

>
> A good example of why I'm worried is the sa-sram case:
>
> +		crypto_sram0: sa-sram0@0 {
>  			compatible = "mmio-sram";
>  			reg = <MBUS_ID(0x09, 0x09) 0 0x800>;
>
> +		crypto_sram1: sa-sram1@0 {
>  			compatible = "mmio-sram";
>  			reg = <MBUS_ID(0x09, 0x05) 0 0x800>;
>
> The node names should be just "sram" without a number. Indeed for UARTs
> for example, you use uart@XYZ, uart@ABC and not uart0@XYZ and
> uart1@ABC. But then, if you do that, with your scheme, you end up with
> both nodes named sa-sram@0.
>
> Which clearly shows that the way you set this unit-address is not
> correct: those two devices are mapped at completely different
> locations, but you end up with an identical unit address.
>
> I have no idea what is the rule for setting the unit address in this
> case, but I'm pretty sure the rule you've chosen is not good.

I don't know if there is an existing rules for this case. But I see your
concern. What I propose then is to expose the memory windows ID by
adding the target and the attributes like this:

		crypto_sram0: sa-sram@09_09_0 {
 			compatible = "mmio-sram";
  			reg = <MBUS_ID(0x09, 0x09) 0 0x800>;


		crypto_sram1: sa-sram@09_05_0 {
  			compatible = "mmio-sram";
  			reg = <MBUS_ID(0x09, 0x05) 0 0x800>;

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

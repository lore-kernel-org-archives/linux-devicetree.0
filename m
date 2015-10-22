From: Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH] regulator, dt: add dt support for tps6502x regulator
Date: Thu, 22 Oct 2015 06:51:49 +0200
Message-ID: <56286B65.1010209@denx.de>
References: <1445236033-27747-1-git-send-email-hs@denx.de>
 <20151021121925.GC8232@sirena.org.uk> <56278AA3.3060109@denx.de>
 <20151021161732.GO32054@sirena.org.uk>
Reply-To: hs-ynQEQJNshbs@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151021161732.GO32054-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello Mark,

Am 21.10.2015 um 18:17 schrieb Mark Brown:
> On Wed, Oct 21, 2015 at 02:52:51PM +0200, Heiko Schocher wrote:
>> Am 21.10.2015 um 14:19 schrieb Mark Brown:
>>> On Mon, Oct 19, 2015 at 08:27:13AM +0200, Heiko Schocher wrote:
>
>>> If this file is needed there is something broken, if this file is not
>>> needed then it is just noise since everything in it needs to be
>>> overridden by users anyway.  Either way please remove it.
>
>> Uh, I thought to do it like:
>
>> arch/arm/boot/dts/tps65217.dtsi
>
>> but, okay, removed.
>
> That too is broken and should be removed :(

Ok, I have a board which uses this regulator ... can you give me a hint,
how to remove it correctly?

I would do:

move from arch/arm/boot/dts/tps65217.dtsi into board dts

&tps {
+	compatible = "ti,tps65217";
	[...]

and the reg and "regulator-compatible" into the corresponding
nodes ...

                 dcdc1_reg: regulator@0 {
+                        reg = <0>;
+                        regulator-compatible = "dcdc1";

Thanks!

bye,
Heiko
-- 
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

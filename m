From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: Re: [PATCH 07/12] Documentation: dt: imx: add MSCM documentation
Date: Wed, 03 Dec 2014 18:49:13 +0100
Message-ID: <b1d6e3afefac65c6424040c08689b750@agner.ch>
References: <1417565531-4507-1-git-send-email-stefan@agner.ch>
 <1417565531-4507-8-git-send-email-stefan@agner.ch>
 <57320597.hlx9GuXmaF@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <57320597.hlx9GuXmaF@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2014-12-03 11:52, Arnd Bergmann wrote:
> On Wednesday 03 December 2014 01:12:06 Stefan Agner wrote:
>> +Freescale Vybrid Miscellaneous System Control Module
>> +
>> +The MSCM IP contains Access Control and TrustZone Security hardware,
>> +CPU Configuration registers and Interrupt Router control.
>> +
>> +Required properties:
>> +- compatible : "fsl,vf610-mscm"
>> +- reg : the register range of the MSCM module
>> +
>> +Example:
>> +       mscm: mscm@40001000 {
>> +               compatible = "fsl,vf610-mscm";
>> +               reg = <0x40001000 0x1000>;
>> +       };
> 
> This sounds like one of those generic system controller devices.
> Should this be marked as syscon an accessed through
> syscon_regmap_lookup_by_phandle()?
> 
> If you only eve have one driver touching these registers, that
> won't be necessary of course.
> 

So far, in upstream code the module is not used at all (other than in
U-Boot setting up the interrupt router in a static manner). I think it
is not that "miscellaneous" as it sounds, it mainly controls and
provides information regarding the dual-core stuff, for instance provide
interrupt flags for the CPU-to-CPU interrupts or exports CPU information
(beside the interrupt routing thing). I don't know (yet) if and how we
want export support for that interrupt. We would certainly need it to
support some message based framework (Freescale used it for their
out-of-tree MCC (multi-core communication) stuff, probably we would need
it to implement rpmsg support...).

--
Stefan

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

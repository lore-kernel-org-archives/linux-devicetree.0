From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: Re: [PATCH RESEND v3 0/3] irqchip: vf610-mscm: add support for MSCM
 interrupt router
Date: Mon, 26 Jan 2015 12:55:07 +0100
Message-ID: <36990c90fa3d2ee0849227f31cbafb54@agner.ch>
References: <1421309046-22452-1-git-send-email-stefan@agner.ch>
 <alpine.DEB.2.11.1501261115300.5526@nanos>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.11.1501261115300.5526@nanos>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, marc.zyngier-5wv7dgnIgG8@public.gmane.org
Cc: jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2015-01-26 11:16, Thomas Gleixner wrote:
> On Thu, 15 Jan 2015, Stefan Agner wrote:
> 
>> Splitted out version of the MSCM driver. My first driver based on the
>> routeable domain support and was part of the Vybrid Cortex-M4 support
>> patchset.
>>
>> So far the MSCM interrupt router was initialized by the boot loader
>> and configured all interrupts for the Cortex-A5 CPU. There are two
>> use cases where a proper driver is necessary:
>> - To run Linux on the Cortex-M4. When the kernel is running on the
>>   non-preconfigured CPU, the interrupt router need to be configured
>>   properly.
>> - To support deeper sleep modes: LPSTOP clears the interrupt router
>>   configuration, hence a driver needs to restore the configuration
>>   on resume.
>> I created a seperate patchset for that driver which hopefully makes
>> it easier to get it into mergeable state.
>>
>> Since I identified some registers likely to be used by other drivers
>> (e.g. CPU ID or the CPU Generate Interrupt Register) I also added
>> the "syscon" compatible string to make the registers available for
>> other drivers in case needed.
>>
>> This resend version of this patchset is rebased on v3.19-rc4.
> 
> Has the discussion with Marc on the original V3 set been resolved?

There was no answer to the original v3 patch. The comments of Marc was
back in the v2 set, and has been resolved in v3. However, no Ack from
Marc so far.

 
> What about the DT bindings? I'm relucant to pick that up w/o acks from
> the DT folks.

The bindings are straight forward interrupt-controller bindings, since
it uses the hierarchic irq domain stuff. The only uncommon thing is that
I also added "syscon" as compatible, since the module has functionality
which might be required by other drivers (e.g. register to generate
CPU2CPU interrupt or processor personality information).

--
Stefan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

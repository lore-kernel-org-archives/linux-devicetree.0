From: "H. Peter Anvin" <hpa-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [sodaville] [PATCH 10/15] x86/ioapic: Add OF bindings for	IO-APIC
Date: Wed, 12 Jan 2011 09:19:53 -0800
Message-ID: <4D2DE2B9.2000607@linux.intel.com>
References: <1292600033-12271-1-git-send-email-bigeasy@linutronix.de>	<1292600033-12271-11-git-send-email-bigeasy@linutronix.de>	<20110111235353.GG2131@angua.secretlab.ca>
	<20110112170707.GA6907@www.tglx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110112170707.GA6907-Hfxr4Dq0UpYb1SvskN2V4Q@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: sodaville-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 01/12/2011 09:07 AM, Sebastian Andrzej Siewior wrote:
>>
>> I'm confused here.  Are there multiple ioapic's described by a single
>> device tree node?
> 
> Yes, the CE4100 has two IO-APICs. It looks like the first one is
> responsible for the "legacy devices" (like RTC) and the second one is
> used for the "extra devices" like SPI controller, USB, ... The UART
> however is not on the first IO-APIC but on the second.
> 
> Those two IO-APICs are not cascaded. The device tree contains the line
> number of device to the io apic. The kernel computes then interrupt
> number based on gsi_base + line_number where gsi_base is incremented by
> the number of entries[0]. This interrupt number (gsi_base + line) is then
> sent via apic bus to lapic which reports it as the active interrupt
> source.
> 

That's normal multiple IOAPIC behavior (and multiple IOAPICs is a common
thing), but why use the same device tree node for both?

	-hpa

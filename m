From: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] arm: document "mach-virt" platform.
Date: Thu, 30 Jan 2014 17:33:50 +0000
Message-ID: <52EA8CFE.7020404@arm.com>
References: <1391098262-15944-1-git-send-email-ian.campbell@citrix.com> <201401301828.59294.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201401301828.59294.arnd-r2nGTMty4D4@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Stefano Stabellini <stefano.stabellini-mvvWK6WmYclDPfheJLI6IQ@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 30/01/14 17:28, Arnd Bergmann wrote:
> On Thursday 30 January 2014, Ian Campbell wrote:
>> mach-virt has existed for a while but it is not written down what it actually
>> consists of. Although it seems a bit unusual to document a binding for an
>> entire platform since mach-virt is entirely virtual it is helpful to have
>> something to refer to in the absence of a single concrete implementation.
>>
>> I've done my best to capture the requirements based on the git log and my
>> memory/understanding.
>>
>> While here remove the xenvm dts example, the Xen tools will now build a
>> suitable mach-virt compatible dts when launching the guest.
> 
> It might be worth noting in the changeset comment that the 'compatible'
> string is actually no longer needed on newer kernels: All the members
> of the machine descriptor are now the defaults (we should remove the
> virt_init() function as well), and the fallback machine descriptor should
> work just fine if any other string gets passed.

I will ack the patch that removes the mach-virt directory altogether!

	M.
-- 
Jazz is not dead. It just smells funny...
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

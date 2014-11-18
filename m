From: Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5.5] of/fdt: export fdt blob as /sys/firmware/fdt
Date: Tue, 18 Nov 2014 17:11:26 -0600
Message-ID: <CABGGiswNc1jHWiCraKmEVWRn-aMndt8AfYA3GtmaDBVpZBd+aA@mail.gmail.com>
References: <1415984735-32388-1-git-send-email-ard.biesheuvel@linaro.org>
 <20141118165145.4F6A8C40966@trevor.secretlab.ca> <20141118172545.GC14323@leverpostej>
 <20141118221103.4ECB3C40966@trevor.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141118221103.4ECB3C40966-WNowdnHR2B42iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "geoff.levand-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <geoff.levand-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 18, 2014 at 4:11 PM, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Tue, 18 Nov 2014 17:25:45 +0000
> , Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
>  wrote:
>> On Tue, Nov 18, 2014 at 04:51:45PM +0000, Grant Likely wrote:
>> > On Fri, 14 Nov 2014 18:05:35 +0100
>> > , Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> >  wrote:
>> > > Create a new /sys entry '/sys/firmware/fdt' to export the FDT blob
>> > > that was passed to the kernel by the bootloader. This allows userland
>> > > applications such as kexec to access the raw binary.

[...]

>> > * It also helps with exposing the reserved map to userspace, but kexec
>> >   has done without that feature for years, and it is in the process of
>> >   being deprecated in favour of /reserved-memory anyway.
>>
>> This is the first I'd heard of the reserve map being deprecated, and
>> we're going to have DTs with reserved map entries for a long time going
>> forwards.
>
> Deprecated, not removed or disabled. It will still work pretty much
> forever, but users should be encouraged to move to the reserve-memory
> tree.

I thought you had said reserve map was still the right way for memory
the kernel should never touch.

>> Can't we expose the header fields under something like
>> /sys/firmware/devicetree/dtb-header/, parallel to the usual
>> /sys/firmware/devicetree/base for nodes?
>
> We could do that too.
>
> Honestly though, I'm just unsure of what the best thing to do is. If you
> and a few others tell me that, "no, exporting the raw dtb is the right
> thing to do", then I'll be okay, merge the patch and sleep properly.

I always sleep better when others can take the blame.

What happens when we rev the dtb format? Is the ABI the blob or the
format of the blob?

I lean towards we should add this. This is providing what is "in the
firmware" while /proc/devicetree provides the live tree state
including overlays.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

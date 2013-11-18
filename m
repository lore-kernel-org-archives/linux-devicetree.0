From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: ACPI vs DT at runtime
Date: Mon, 18 Nov 2013 15:29:58 -0800
Message-ID: <CAOesGMh373ZsLzoGHJm+xV3uFVjh2CBSA8SXY4PA+VxL3a5W1w@mail.gmail.com>
References: <CAOesGMjKeRb=fFJM0MabDihbEiCGM4EqW9D5i_6-RFxTnpB4Qw@mail.gmail.com>
	<20131118232536.GF1567@rocoto.smurfnet.nu>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131118232536.GF1567-GZEopFhza0F985/tl1ce8aaDwS/vmuI7@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Leif Lindholm <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hej,

On Mon, Nov 18, 2013 at 3:25 PM, Leif Lindholm <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> Hi Olof,
>
> Just in case this thread fails to reach its predicted triple-digits, I
> would like to revisit something you mentioned in this original email
> and then didn't expand on.
>
> On Thu, Nov 14, 2013 at 05:44:10PM -0800, Olof Johansson wrote:
>> The more I start to see early UEFI/ACPI code, the more I am certain
>> that we want none of that crap in the kernel. It's making things
>> considerably messier, while we're already very busy trying to convert
>> everything over and enable DT -- we'll be preempting that effort just
>> to add even more boilerplate everywhere and total progress will be
>> hurt.
>>
>> The server guys really want UEFI for their boot protocols,
>> installation managers, etc, etc. That's fine, let them do that, but
>> that doesn't mean we need to bring the same APIs all the way into the
>> kernel.
>
> There is zero dependency on ACPI in the UEFI support code, or indeed in
> UEFI itself. Both runtime services support and stub loader have been
> designed hardware-description agnostic.
>
> Are you saying that we should not support the kernel interfaces to UEFI
> on ARM*, or are you simply mentioning it in passing because it is the
> bit responsible for populating the pointer to the ACPI tables?

Good question. UEFI and ACPI usually gets grouped together when they
really are separate (even though ACPI _without_ UEFI is highly
unlikely).

So, to clarify: What I meant with the above is that UEFI as a
bootloader is fine as far as I am concerned. I'm also in general ok
with the introduction of efivars that you're doing, etc.


-Olof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

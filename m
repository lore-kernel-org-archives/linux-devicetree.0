From: John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC][PATCH] misc: Introduce reboot_reason driver
Date: Tue, 8 Dec 2015 16:34:58 -0800
Message-ID: <CALAqxLUSrpGZxLkFGhPqK2ZNjkPuO3WON3cj2HNx-QaJpttUPA@mail.gmail.com>
References: <1449610162-30543-1-git-send-email-john.stultz@linaro.org>
	<CAL_JsqKMsG79TiB7nAOd8rB5m3VqwJYdQU0xiwvzvaqMyCk1BQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqKMsG79TiB7nAOd8rB5m3VqwJYdQU0xiwvzvaqMyCk1BQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Vinay Simha BN <simhavcs-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>, Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Android Kernel Team <kernel-team-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Dec 8, 2015 at 2:26 PM, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Tue, Dec 8, 2015 at 3:29 PM, John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>> This patch adds a basic driver to allow for commands like
>> "reboot bootloader" and "reboot recovery" to communicate this
>> reboot-reason to the bootloader.
>>
>> This is commonly done on Android devices, in order to reboot
>> the device into fastboot or recovery mode. It also supports
>> custom OEM specific commands, via "reboot oem-<value>".
>
> What are some examples of OEM specific commands?

Actually, I don't know. That bit was preserved from the 3.4 based
logic in a vendor tree.

I can drop it for now if you'd rather.


>> This driver pulls the phys memory address from DT as well as
>> the magic reason values that are written to the address for
>> each mode.
>
> Starting with what does the h/w look like, this is typically
> implemented with some sort of persistent register(s) either in the SOC
> or PMIC. So I think persistent memory/registers is what we need to
> describe in DT. Perhaps this could be tied into pstore (an overkill
> for a single register, but useful if you already have pstore support
> for persistent memory)?

Hrm. Yea. I'm hesitant to tie it into pstore, but that's partly due to
not wanting the bootloader to have to parse the pstore area (ideally
the bootloader doesn't touch it).

To me having the bootloader reserve a page of memory and having the
kernel map and write that reserved page makes the most sense to me.
It then being special memory mapped registers or just a reserved page
can be somewhat equivalent.

But maybe I'm being naive?

> The 2nd part is which register to use and the
> mapping of values to reboot reason. Do these vary within SOC families?
> If not, then we should just hardcode them in the reboot drivers which
> are already vendor specific.

I'm not aware of differences between SOC families for the values,
though the addresses might change.

> Also, while trying to standardize the values for reboot reason
> probably won't work short term, we should define something so people
> will start using it.

Ack. Though if the values are mostly custom/magic, is having them
defined in the DT problematic? Or do you just want  macros for
something like something like
   reason,bootloader = <GENERIC_REASON_BOOTLOADER>; ?

> We also should consider any implications with
> PSCI.

Sorry. I'm ignorant here. What would those implications possibly be?

thanks
-john
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

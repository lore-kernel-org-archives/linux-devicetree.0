From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 0/8] firmware: arm_scpi: add support for legacy SCPI
 protocol
Date: Tue, 8 Nov 2016 15:11:07 +0000
Message-ID: <28decdc3-6b86-924f-d3c1-9873a8cfce77@arm.com>
References: <1478148731-11712-1-git-send-email-sudeep.holla@arm.com>
 <20161108145118.GR1041@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161108145118.GR1041-l+eeeJia6m9URfEZ8mYm6t73F7V6hmMc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 08/11/16 14:51, Russell King - ARM Linux wrote:
> On Wed, Nov 02, 2016 at 10:52:03PM -0600, Sudeep Holla wrote:
>> This is minor rework of the series[1] from Neil Armstrong's to support
>> legacy SCPI protocol to make DT bindings more generic and move out all
>> the platform specific bindings out of the generic binding document.
>
> Is this what would be in my HBI0282B Juno?
>

No, it's one on the AmLogic Meson GXBB platform. Juno never supported
that except that old firmware use it internally. By that I mean some
version of trusted firmware used legacy SCPI but they are generally
bundled together in fip, so you should not see any issue with upgrade.

> (Note: I only have the original firmware on the board, as the Linaro
> firmware drops are completely broken for it.)
>

I am currently trying to run Linaro 16.10 release, I don't see any issue
except network boot from UEFI which is known and reported.

I will go through your logs in detail and try to replicate your issue.
I assume you have tried replacing the entry contents of the uSD with the
release. I will start with that now.

-- 
Regards,
Sudeep
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

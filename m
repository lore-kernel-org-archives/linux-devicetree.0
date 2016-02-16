From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v3 7/7] arm64: dts: r8a7795: Add CA53 L2 cache-controller
 node
Date: Tue, 16 Feb 2016 09:46:11 +0000
Message-ID: <56C2EFE3.6010900@arm.com>
References: <1455568715-20880-1-git-send-email-geert+renesas@glider.be>
 <1455568715-20880-8-git-send-email-geert+renesas@glider.be>
 <56C2C534.30704@de.bosch.com>
 <CAMuHMdX=Kgb-i+QpP=yNO2e6nw7sXuCutXPoK0U9NwK-OyANFA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMuHMdX=Kgb-i+QpP=yNO2e6nw7sXuCutXPoK0U9NwK-OyANFA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Dirk Behme <dirk.behme-V5te9oGctAVWk0Htik3J/w@public.gmane.org>
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 16/02/16 07:12, Geert Uytterhoeven wrote:
> Hi Dirk,
>
> On Tue, Feb 16, 2016 at 7:44 AM, Dirk Behme <dirk.behme-V5te9oGctAVWk0Htik3J/w@public.gmane.org> wrote:

[...]

>>
>> As we don't have any CA53 in the device tree yet, and it was rejected to add
>> it, I'd think that we don't want these unused entries at the moment.
>
> This is a preparatory step for adding the SYSC PM Domains.
>
>> I'd propose to add the CA53 entries, first. And then add their L2 cache
>> entries.
>>
>> Based on the outcome of the discussion for the CA57 we have to see if we
>> want to add the unused cache-unified and cache-level, then, too.
>
> These are specified by ePAPR, as I said before.
> Remember, DT describes the hardware, not what Linux (or any other OS) is
> using.
>

I completely agree and I mentioned the same in the other email.

-- 
Regards,
Sudeep
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

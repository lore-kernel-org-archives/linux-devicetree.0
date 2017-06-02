From: Anup Patel <anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v5 04/11] arm64: dts: Initial DTS files for Broadcom
 Stingray SOC
Date: Fri, 2 Jun 2017 12:02:25 +0530
Message-ID: <CAALAos-YQdr3dwjMDj-upSQMQbE6EHO8aXjjwTdCuTEgM+CR0g@mail.gmail.com>
References: <1495790704-2438-1-git-send-email-anup.patel@broadcom.com>
 <1495790704-2438-5-git-send-email-anup.patel@broadcom.com> <abeca9ac-487c-b6dc-1397-4134b0442909@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <abeca9ac-487c-b6dc-1397-4134b0442909-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Oza Pawandeep <oza.oza-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Srinath Mannam <srinath.mannam-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Pramod Kumar <pramod.kumar-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Sandeep Tripathy <sandeep.tripathy-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Device Tree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux ARM Kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, BCM Kernel Feedback <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>Scott
List-Id: devicetree@vger.kernel.org

On Fri, Jun 2, 2017 at 11:07 AM, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
>
> On 05/26/2017 02:24 AM, Anup Patel wrote:
>> The Broadcom Stingray SoC is a new member in Broadcom iProc
>> SoC family.
>>
>> This patch adds initial DTS files for Broadcom Stingray SoC
>> and two of its reference boards (bcm958742k and bcm958742t).
>>
>> We have lot of reference boards and large number of devices
>> in Broadcom Stingray SoC so eventually we will have quite
>> a few DTS files for Stingray. To tackle, we have added a
>> separate directory for Stingray DTS files.
>
> So I was going to apply this, but...
>
>
>> +     scr {
>> +             compatible = "simple-bus";
>> +             #address-cells = <1>;
>> +             #size-cells = <1>;
>> +             ranges = <0x0 0x0 0x61000000 0x05000000>;
>
> So you corrected the ranges property here...
>
>> +
>> +             gic: interrupt-controller@63c00000 {
>
> but you kept the original unit address here, which does not match the
> reg property, could you fix that through your entire submission?

Thanks for catching. I quickly update this and send revised patchset.

Regards,
Anup
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

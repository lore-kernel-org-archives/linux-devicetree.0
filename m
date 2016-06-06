From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v2 2/4] Documentation: Add documentation for APM X-Gene
 SoC PMU DTS binding
Date: Mon, 6 Jun 2016 18:29:45 +0100
Message-ID: <20160606172945.GE23505@leverpostej>
References: <1460510547-17611-1-git-send-email-ttnguyen@apm.com>
 <1460510547-17611-3-git-send-email-ttnguyen@apm.com>
 <20160418170009.GA15338@rob-hp-laptop>
 <CACgAJHyBbO_LXwtfNVK1f=dY3v1Jfxwxq1dw98EZ0aYdhjPpAg@mail.gmail.com>
 <20160420113121.GE2514@arm.com>
 <20160502205648.GA7374@rob-hp-laptop>
 <CACgAJHyT31DuVNoyRQZVKjv=zM5Fc-EY0gy=y=pHHrBTT+1Xow@mail.gmail.com>
 <20160531165630.GE4254@leverpostej>
 <CACgAJHwtb0hNs0JWOrpyF=_fRVvUi2QG4q7qohgCw4SjxqtX6A@mail.gmail.com>
 <CACgAJHxMCa2Hp_A8YnHmmVrHGd3yLhFs2k33MN6OHRUmZ7Y_Wg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACgAJHxMCa2Hp_A8YnHmmVrHGd3yLhFs2k33MN6OHRUmZ7Y_Wg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tai Tri Nguyen <ttnguyen-qTEPVZfXA3Y@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, catalin.marinas-5wv7dgnIgG8@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, patches <patches-qTEPVZfXA3Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, May 31, 2016 at 06:25:56PM -0700, Tai Tri Nguyen wrote:
> Hi Mark,

[...]

> I'm facing a problem after removing the index for MCU and MC sub-nodes.
> The MCUs and MCs aren't always enabled depending on how DRAM DIMMs are
> installed on the system.
> I still need a way to associate the MCU with its indicator bit in the
> enable mask retrieved from CSR.

Ah, I see.

Can you elaborate on how the indicator bits are laid out? From the
example binding, I see multiple nodes with the same index property, so
I'm a little confused.

I guess that there's a CSR per class of node (e.g. all MCBs in one CSR
register)? Or do several nodes share the same bit?

Is there a single CSR register? Are there several? Is that bit index
used in other registers?

> For MC and MCB nodes only, can I introduce an "enable-mask" field?
> For example:
> "
> pmucmcb@7e710000 {
>         compatible = "apm,xgene-pmu-mcb";
>         reg = <0x0 0x7e710000 0x0 0x1000>;
>         enable-mask = <0x00000001>;
> };
> 
> pmucmcb@7e730000 {
>         compatible = "apm,xgene-pmu-mcb";
>         reg = <0x0 0x7e730000 0x0 0x1000>;
>         enable-mask = <0x00000002>;
> };
> "
> Or can you please give a suggestion how I can fix it?

Assuming it's always a single bit, a *-bit-index property may be fine,
and probably preferable.

I'm a little confused, so I'd like to understand how it's used.

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: punnaiah choudary kalluri <punnaia-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v6 1/3] nand: pl353: Add basic driver for arm pl353 smc
 nand interface
Date: Wed, 29 Apr 2015 08:07:14 +0530
Message-ID: <CAGnW=BZcr_7JH9VH8jqQx_dvZkDc9PDCWi6KJEQd2ahF3GWatA@mail.gmail.com>
References: <1428941550-4620-1-git-send-email-punnaia@xilinx.com>
	<858a607d-7c5a-4066-aa79-ab14c456b8e5@BN1BFFO11FD046.protection.gbl>
	<20150428153813.GC11721@bshelton-desktop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150428153813.GC11721@bshelton-desktop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Shelton <ben.shelton-acOepvfBmUk@public.gmane.org>
Cc: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, "michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org" <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org" <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, "ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org" <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "artem.bityutskiy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org" <artem.bityutskiy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "jussi.kivilinna-X3B1VOXEql0@public.gmane.org" <jussi.kivilinna-X3B1VOXEql0@public.gmane.org>, Alexandre Courbot <acourbot-DDmLM1+adcphl2p70BpVqQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 28, 2015 at 9:08 PM, Ben Shelton <ben.shelton-acOepvfBmUk@public.gmane.org> wrote:
> Hi Punnaiah,
>
> On 04/13, Punnaiah Choudary Kalluri wrote:
>> Add driver for arm pl353 static memory controller nand interface with
>> HW ECC support. This controller is used in xilinx zynq soc for interfacing
>> the nand flash memory.
>>
>> Signed-off-by: Punnaiah Choudary Kalluri <punnaia-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
>
> [...]
>
>> +
>> +static int pl353_nand_init_timing(struct device *dev, int mode)
>> +{
>> +     const struct nand_sdr_timings *time;
>> +     u32 t_rc, t_wc, t_rea, t_wp, t_clr, t_ar, t_rr;
>> +     ulong clkrate;
>> +
>> +     time = onfi_async_timing_mode_to_sdr_timings(mode);
>> +     if (IS_ERR(time))
>> +             return PTR_ERR(time);
>> +
>> +     clkrate = pl353_smc_get_clkrate(dev);
>> +     t_rc  = get_cyc_from_ns(clkrate, time->tRC_min / 1000);
>> +     t_wc  = get_cyc_from_ns(clkrate, time->tWC_min / 1000);
>> +     t_rea = get_cyc_from_ns(clkrate, time->tREA_max / 1000);
>> +     t_wp  = get_cyc_from_ns(clkrate, time->tWP_min / 1000);
>> +     t_clr = get_cyc_from_ns(clkrate, time->tCLR_min / 1000);
>> +     t_ar  = get_cyc_from_ns(clkrate, time->tAR_min / 1000);
>> +     t_rr  = get_cyc_from_ns(clkrate, time->tRR_min / 1000);
>
> I tested this patch set in conjunction with your PL353 SMC patch set.
>
> Our first stage bootloader sets the SMC memclk rate to 166.6 MHz, which leads
> this code to calculate a t_rc and t_wc of 17 cycles for ONFI mode 0.  As I
> mentioned in my response to your SMC patch, this overflows the 4-bit-wide
> register fields in the SMC that hold these values.

The better way is fixing the frequency to correct value to avoid the
overflow conditions.
Even as per ONFI spec, the maximum cycle time for SDR mode is 20 ns and DDR mode
is 10 ns. As you pointed i will update the smc driver with required
boundary checks for the lower
and upper limits.

>
> Could we somehow set it up so the NAND and SMC drivers work together to adjust
> the memclk rate, if necessary, to achieve the desired timings?  Or is there a
> better way to handle this?

Let me check on this. I didn't see the option to control the clock
rate at module level, otherwise
probably we can have DT entry and configure the required frequency
during the probe time.

Regards,
Punnaiah
>
>> +
>> +     pl353_smc_set_cycles(dev, t_rc, t_wc, t_rea, t_wp, t_clr, t_ar, t_rr);
>> +
>> +     return 0;
>> +}
>
> Thanks,
> Ben
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

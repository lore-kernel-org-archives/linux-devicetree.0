From: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
Subject: Re: [PATCH v10 4/5] edac: Add APM X-Gene SoC EDAC driver
Date: Fri, 22 May 2015 11:28:44 -0700
Message-ID: <CAPw-ZTmaRQj740Z58Asrch3decmXA89EN9MdKg-WvWp8ftqB6w@mail.gmail.com>
References: <1431991481-25684-1-git-send-email-lho@apm.com>
	<4456746.y9FVaqRogk@wuerfel>
	<20150522084625.GE23022@pd.tnic>
	<2082687.grA49DxWyE@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2082687.grA49DxWyE@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>, Doug Thompson <dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Jon Masters <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "patches-qTEPVZfXA3Y@public.gmane.org" <patches-qTEPVZfXA3Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

>> > > +static int edac_mc_idx;
>> > > +static int edac_mc_active_mask;
>> > > +static int edac_mc_registered_mask;
>> > > +static DEFINE_MUTEX(xgene_edac_mc_lock);
>> >
>> > It would also be best to avoid global variables, but it seems that at
>> > least the edac_mc_idx is needed to work with the EDAC subsystem.
>> > Maybe Boris has an idea for how to avoid it.
>>
>> Right, so AFAICT this is used in
>>
>>         edac_mc_alloc(edac_mc_idx++
>>
>> and basically we're supplying the memory controller numbers in the order
>> we're calling xgene_edac_mc_add(). Perhaps we need to make the memory
>> controller numbering explicit with DT...
>
> I see now that the number is also used in xgene_edac_mc_is_active()
> as an index for the MCBADDRMR register, which seems very fragile,
> as it relies on the DT nodes getting seen in the same order by the
> driver that the hardware blocks are used in.
>
> Better add an explicit DT property for the index that is defined
> to be the same as MCBADDRMR bits, e.g.
>
>                        edacmc@7e800000 {
>                              compatible = "apm,xgene-edac-mc";
>                              reg = <0x0 0x7e800000 0x0 0x1000>;
>                               memory-controller = <0>;
>                        };
>
> or use a reference to the normal memory controller DT node
> outside of the EDAC, and put a number in that one.
>
> Is there a strict 1:1 relation between the DIMM slot numbering
> on the board and the memory controller number within the EDAC
> registers?

Yes... The status active bit position is strictly tie to an
controller. Like the suggestion with memory-controller property.

-Loc
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

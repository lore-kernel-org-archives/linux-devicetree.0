From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: DT include files
Date: Mon, 13 Jan 2014 09:48:43 -0700
Message-ID: <52D418EB.1040605@wwwdotorg.org>
References: <20140102202108.GF19720@quad.lixom.net> <20140103023211.GA25079@S2101-09.ap.freescale.net> <CAOesGMheei8YgzfRp9pmQ0rT9zhJ2_hF56j5Y+jLSy5TadPZ-g@mail.gmail.com> <20140103030455.GB25079@S2101-09.ap.freescale.net> <CAOesGMihX-pLva-aBCHJ6TYfsN57MzRWiYFTnfKCXOKeja0uUg@mail.gmail.com> <20140104011056.GA3282@S2101-09.ap.freescale.net> <20140110024124.GA6844@S2101-09.ap.freescale.net> <CAOesGMh3HBCYut2hfub3svrJT5JJzoWq8mU=VU0grZbg-JqqbA@mail.gmail.com> <52CFF57D.8060808@samsung.com> <CAL_JsqKHr6v+6kNXrAdnzH0gpoFCPAjPSnX8iBDgRSMh9JgxvA@mail.gmail.com> <20140110170319.GC20094@book.gsilab.sittig.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140110170319.GC20094-kDjWylLy9wD0K7fsECOQyeGNnDKD8DIp@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 01/10/2014 10:03 AM, Gerhard Sittig wrote:
> On Fri, Jan 10, 2014 at 09:30 -0600, Rob Herring wrote:
>>
>> As for *.h vs. *.dtsi naming, if the include is only pre-processor
>> defines, then I think using .h is the right way. Otherwise, if there
>> is any dts syntax, then .dtsi is the right name. It looks to me like
>> this style has been followed in both the imx and s3c64xx cases.
>>
>> On a side note, I'm not really a fan of this pattern:
>>
>> #define FOO1 1 2 3
>>
>> #define BAR FOO1 FOO2 FOO3
>>
>> While it definitely simplifies the dts files, it would never be used
>> in C and obfuscates what the actual property size is. Reading a dts
>> file, I would naturally assume the define was a single value while in
>> fact it could expand to a very large property size.
> 
> For more complex yet tedious repetitive cases like GPIO banks and
> pins I've seen #define directives which introduce "functions"
> (macros with parameters).  They appear to be rather useful, can
> reflect very well the essence of the information, don't
> necessarily pretend to be single values, but still may hide how
> many cells they expand to.  For example:
> 
>   arch/arm/boot/dts/tegra30-cardhu.dtsi:
>     interrupts = <TEGRA_GPIO(L, 0) IRQ_TYPE_LEVEL_HIGH>;

I'm not sure I entirely understand your point, but for the record, both
TEGRA_GPIO() and IRQ_TYPE_LEVEL_HIGH expand to a single cell, as I would
expect (almost?) any DT macro to do.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

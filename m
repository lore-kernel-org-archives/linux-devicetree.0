From: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 09/11] clk: lpc32xx: add common clock framework driver
Date: Fri, 20 Nov 2015 20:07:46 +0200
Message-ID: <564F6172.3090509@mleia.com>
References: <1447981511-29653-1-git-send-email-vz@mleia.com> <1447981511-29653-10-git-send-email-vz@mleia.com> <3762298.NKYXldtldq@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3762298.NKYXldtldq@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Roland Stigge <stigge-uj/7R2tJ6VmzQB+pC5nmwQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 20.11.2015 16:04, Arnd Bergmann wrote:
> On Friday 20 November 2015 03:05:09 Vladimir Zapolskiy wrote:
>> +
>> +struct clk_proto_t {
>> +       const char *name;
>> +       const u8 parents[LPC32XX_CLK_PARENTS_MAX];
>> +       u8 num_parents;
>> +       unsigned long flags;
>> +};
>> +
>> +#define CLK_PREFIX(LITERAL)            LPC32XX_CLK_ ## LITERAL
>> +#define NUMARGS(...)   (sizeof((int[]){__VA_ARGS__})/sizeof(int))
>> +
>> +#define LPC32XX_CLK_DEFINE(_idx, _name, _flags, ...)           \
>> +       [CLK_PREFIX(_idx)] = {                                  \
>> +               .name = #_name,                                 \
>> +               .flags = _flags,                                \
>> +               .parents = { __VA_ARGS__ },                     \
>> +               .num_parents = NUMARGS(__VA_ARGS__),            \
>> +        }
>> +
> 
> Try to not outsmart yourself with the macros. It's better to avoid
> string concatenation so it's possible to grep for uses of some
> constant.
> 
> I would probably not use a macro at all here and just open-code the
> entire table. If you ensure that '0' is not a valid parent, then
> you can leave out the .num_parents field and just look for the
> zero-termination.

Macros are here for simplicity, code size reduction and to avoid some
stupid mistakes like different number of .parents and .num_parents.

I believe macro unwrapping in this code will add another 1000 LoC and
will result in quite unreadable and less maintainable code.

--
Best wishes,
Vladimir
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

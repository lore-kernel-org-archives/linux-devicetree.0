From: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH RFC v1 1/3] clk: Add function to parse an arbitrary clocks
 list property
Date: Mon, 24 Feb 2014 11:43:27 +0100
Message-ID: <530B224F.6010104@samsung.com>
References: <1392829124-25705-1-git-send-email-s.nawrocki@samsung.com>
 <1392829124-25705-2-git-send-email-s.nawrocki@samsung.com>
 <20140224004335.22529.74369@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <20140224004335.22529.74369@quantum>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 24/02/14 01:43, Mike Turquette wrote:
[...]
>> > +/**
>> > + * of_clk_get_list_entry() - Parse and lookup a clock referenced by a device node
>> > + * @np: pointer to clock consumer node
>> > + * @list_name: name of the clock list property
>> > + * @index: index to the clock list
>> > + *
>> > + * This function parses the @list_name property and together with @index
>> > + * value indicating an entry of the list uses it to look up the struct clk
>> > + * from the registered list of clock providers.
>> > + */
>> > +struct clk *of_clk_get_list_entry(struct device_node *np,
>> > +                                 const char *list_name, int index)
>
> Bikeshed alert: how about of_clk_get_by_property or of_clk_get_by_prop?

That sounds better to me, thanks for the suggestion.
For the next iteration I'm going to use of_clk_get_by_property() .

Regards,
Sylwester

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

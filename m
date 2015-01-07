From: Ganapatrao Kulkarni <gpkulkarni-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH v3 4/4] arm64:numa: adding numa support for arm64 platforms.
Date: Wed, 7 Jan 2015 12:39:46 +0530
Message-ID: <CAFpQJXVFbpgNUCSF9qPCR28FNXZQ46RpFezX9+QSB0nFRzaz5Q@mail.gmail.com>
References: <1420011208-7051-1-git-send-email-ganapatrao.kulkarni@caviumnetworks.com>
	<1849719.f6Z6RhZjTc@wuerfel>
	<CAFpQJXVQnRY9wZRk-83bQLw0m=41ZxH2v-YZCHdF0fvC8LS_Tw@mail.gmail.com>
	<2425557.4DHPZVafv4@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2425557.4DHPZVafv4@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Shannon Zhao <zhaoshenglong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Ganapatrao Kulkarni <ganapatrao.kulkarni-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Leif Lindholm <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Roy Franz <roy.franz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, msalter-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Steve Capper <steve.capper-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Hanjun Guo <hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, jchandra-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Al Stone <al.stone-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 7, 2015 at 1:29 AM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Tuesday 06 January 2015 14:55:53 Ganapatrao Kulkarni wrote:
>> On Sat, Jan 3, 2015 at 2:40 AM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
>> >> +int dt_get_cpu_node_id(int cpu)
>> >> +{
>> >> +     struct device_node *dn = NULL;
>> >> +
>> >> +     while ((dn = of_find_node_by_type(dn, "cpu"))) {
>> >> +             const u32 *cell;
>> >> +             u64 hwid;
>> >> +
>> >> +             /*
>> >> +              * A cpu node with missing "reg" property is
>> >> +              * considered invalid to build a cpu_logical_map
>> >> +              * entry.
>> >> +              */
>> >> +             cell = of_get_property(dn, "reg", NULL);
>> >> +             if (!cell) {
>> >> +                     pr_err("%s: missing reg property\n", dn->full_name);
>> >> +                     return default_nid;
>> >> +             }
>> >> +             hwid = of_read_number(cell, of_n_addr_cells(dn));
>> >> +
>> >> +             if (cpu_logical_map(cpu) == hwid)
>> >> +             return of_node_to_nid_single(dn);
>> >> +     }
>> >> +     return NUMA_NO_NODE;
>> >> +}
>> >> +EXPORT_SYMBOL(dt_get_cpu_node_id);
>> >
>> > Maybe just expose a function to the device node for a CPU ID here, and
>> > expect callers to use of_node_to_nid?
>> shall i make this wrapper function in dt_numa.c, which will use
>> functions _of_node_to_nid and  _of_cpu_to_node(cpu)
>
> Yes, I guess that would work.
>
>> And,  this function can be a weak function in numa.c which returns 0.
>
> No, please don't use weak functions. You can either use IS_ENABLED()
> tricks to remove function calls at compile-time, or in the header
> file provide an inline function as an alternative to the extern
> declaration, based on a configuration symbol.
ok
>
>         Arnd
thanks
ganaapat
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

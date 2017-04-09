From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH V3 2/3] mtd: add core code reading DT specified part
 probes
Date: Sun, 9 Apr 2017 15:28:21 +0200
Message-ID: <20170409152821.585eb8a4@bbrezillon>
References: <20170331114016.26858-1-zajec5@gmail.com>
        <20170331114016.26858-2-zajec5@gmail.com>
        <20170409130406.564802a4@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170409130406.564802a4@bbrezillon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, 9 Apr 2017 13:04:06 +0200
Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:

> static char **mtd_alloc_part_type_table(int nentries)

Oops, s/char **/const char **/

> {
> 	return kzalloc((nentries + 1) * sizeof(*res), GFP_KERNEL);
> }
> 
> static void mtd_free_part_type_table(const char * const *table)
> {
> 	kfree(table);
> }

I realize this might not be suitable for all kind of part-probes
definitions. Some might need to dynamically allocate each string and
expect the core to free them in mtd_free_part_type_table() (the one I
have in mind is the cmdline part-probes parser). Others already have
the strings statically defined or allocated and maintained somewhere
else (this is the case with DT which provides direct access to string
definitions), which means the core shouldn't free them.

I see 3 solutions to this problem:

1/ go back to your initial solution with DT specific functions, and
   wait until someone decides to implement another way to define
   part-probes (cmdline or ACPI) before considering a more complex
   solution
2/ always allocate strings dynamically and let
   mtd_free_part_type_table() free them. This implies using kstrdup() on
   strings returned by of_property_read_string_array()
3/ use something smarter to let the part-probes table creator free it,
   for example, by using something like:

	struct mtd_part_probes {
		const char * const *types;
		void (*free)(const char * const *types);
	}

#3 is overkill IMO. I'm fine with #1 and #2, pick the one you prefer.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

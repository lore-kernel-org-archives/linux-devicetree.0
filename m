From: "jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC 0/1] Device Tree Schema Source format proposal
Date: Fri, 18 Oct 2013 12:49:40 -0400
Message-ID: <CAKON4OzxWNRNi+nb-2u+B7V1F2nh=3QGV2XpppMtYEPHY-haLw@mail.gmail.com>
References: <9610740.2oBMxfeRkE@amdc1227>
	<526158F3.4060104@baylibre.com>
	<CAKON4OzqFtp8YKNvAxBnEwjTL1NS28OZW3AoVdCmu=+q9XWXog@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKON4OzqFtp8YKNvAxBnEwjTL1NS28OZW3AoVdCmu=+q9XWXog-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Benoit Cousson <bcousson-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, fparent-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "Chaiken, Alison" <Alison_Chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, ARM Linux Mailing List <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 18, 2013 at 12:35 PM, jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org <jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Long ago when I first started talking about schemas the main thing I
> had envisioned was a single schema for all of Linux.  You should be
> able to take every dts file in the kernel and validate it against this
> single schema.  This global schema would become the mechanism to
> control how the various dts files evolve.
>
> In this vision there would be a schema file for uarts. And another one
> for spi. Another one for gpio, etc. These file would document all
> possible attributes for these nodes. Lot of comments in these files
> relative to the schema content.  The subsystem maintainers would
> control this file which would then enable them to control the
> proliferation of attributes.  No more things like num-cs, spi-num-cs,
> cselects, ncs - all meaning the same thing, number of chip selects.
> Higher level schema files would then describe how these subsystem
> schemas can be combined.
>
> As a side effect these files now make it much easier to define the
> device tree syntax for new hardware. There is a single file to read to
> find out the attributes is use for this class of subsystem device.  So
> any new DTS would have to validate against this global scheme before
> being accepted.  If you need new attributes you will have to talk to
> subsystem maintainer into adding them to the schema file before your
> code will be accepted.

The subsystem schema files would contain all possible agreed to
attributes even if some of those attributes were vendor specific.  So
there might be an entry for amd,fancy-attribute and then intel comes
along an implements a similar feature.  When Intel submitted their
intel,fancy-attribute the subsystem the maintainer would then
intervene and create a generic fancy-attribute.

This implies that schema should allow for attributes marked legacy. In
this case amd,fancy-attribute would be marked legacy when the generic
form was created.

Legacy attributes should produce warnings during validation.


>
> So in general this scheme is a fair loose specification primarily
> aimed at helping people reuse existing attributes instead of creating
> new ones.  These subsystem schemas will be closely aligned with helper
> libraries provided by the subsystem.  The more commonality we find,
> the more code that can be refactored into helper libraries.
>
> Also, having this loose schema framework doesn't preclude having more
> than one schema. For example TI might want to provide a much tighter
> schema that is only useful for validating Omap device trees.
>
> One way to look at this is to envision two types of schemas. The
> global Linux schema is a horizontal schema whose goal is to achieve as
> much cross platform compatibility as possible. The TI Omap schema is a
> vertical schema whose goal is to do as much error checking as
> possible. Both of these schemas can be developed using the same schema
> processor.
>
> --
> Jon Smirl
> jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org



-- 
Jon Smirl
jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 01/23] fdt: Add functions to query a node's #address- and #size-cells
Date: Fri, 22 Aug 2014 21:03:49 -0600
Message-ID: <CAPnjgZ06b3UeeXra5STLht15jU00yAKCwM+UYuqc=50Th9Jd_g@mail.gmail.com>
References: <1408346196-30419-1-git-send-email-thierry.reding@gmail.com>
	<1408346196-30419-2-git-send-email-thierry.reding@gmail.com>
	<CAPnjgZ2OjqZNDp8F6rXKDHBNaiBywTN1V4JP0ZoHfESF4Y9p=w@mail.gmail.com>
	<20140819105955.GA19515@ulmo>
	<CAPnjgZ09_ADtfzowAzirdwfCG9xF1fEX8Ak8j0VWoyhACJdzKQ@mail.gmail.com>
	<20140819130620.GA1586@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140819130620.GA1586@ulmo>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Albert Aribaud <albert.u.boot-LhW3hqR2+23R7s880joybQ@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Devicetree Discuss <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Thierry,

On 19 August 2014 07:06, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Tue, Aug 19, 2014 at 06:52:22AM -0600, Simon Glass wrote:
>> Hi Theirry,
>>
>>
>> On 19 August 2014 04:59, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>
>> > On Mon, Aug 18, 2014 at 11:52:36AM -0600, Simon Glass wrote:
>> > > Hi Thierry,
>> > >
>> > > On 18 August 2014 01:16, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> > wrote:
>> > > > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> > > >
>> > > > Given a device tree node, the fdt_n_addr_cells() function will walk up
>> > > > the device tree and search for an #address-cells property. It returns
>> > > > the number of cells required by the device tree node to represent an
>> > > > address.
>> > > >
>> > > > Similarly the fdt_n_size_cells() function returns the number of cells
>> > > > required by the given device tree node to represent a size. It achieves
>> > > > that by walking up the device tree in seach for a #size-cells property.
>> > > >
>> > > > If no #address-cells or #size-cells property can be found, both of the
>> > > > functions return 1.
>> > > >
>> > > > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> > > > ---
>> > > >  include/libfdt.h    | 28 ++++++++++++++++++++++++++++
>> > > >  lib/libfdt/fdt_ro.c | 36 ++++++++++++++++++++++++++++++++++++
>> > > >  2 files changed, 64 insertions(+)
>> > > >
>> > > > diff --git a/include/libfdt.h b/include/libfdt.h
>> > > > index a1ef1e15df3d..e7f991b388cf 100644
>> > > > --- a/include/libfdt.h
>> > > > +++ b/include/libfdt.h
>> > > > @@ -1638,4 +1638,32 @@ int fdt_find_regions(const void *fdt, char *
>> > const inc[], int inc_count,
>> > > >                      struct fdt_region region[], int max_regions,
>> > > >                      char *path, int path_len, int add_string_tab);
>> > > >
>> > > > +/**
>> > > > + * fdt_n_addr_cells() - find the number of address cells required by
>> > a node
>> > > > + *
>> > > > + * Looks up the #address-cells property of the node to examine. If
>> > that has
>> > > > + * no such property, walks up the device tree until it finds one in
>> > one of
>> > > > + * the device's parents. If no #address-cells property is found, it is
>> > > > + * assumed to be 1.
>> > > > + *
>> > > > + * @param fdt          FDT blob
>> > > > + * @param node         node to examine
>> > > > + * @return number of address cells
>> > > > + */
>> > > > +int fdt_n_addr_cells(const void *fdt, int node);
>> > >
>> > > There is a new fdt_address_cells() recently that looks suitable.
>> > >
>> > > > +
>> > > > +/**
>> > > > + * fdt_n_size_cells() - find the number of size cells required by a
>> > node
>> > >
>> > > Also fdt_size_cells().
>> >
>> > Neither of those seem to walk up the tree, so inheriting #address-cells
>> > or #size-cells from a parent will not work.
>> >
>> > According to the comments in the code they're also supposed to return
>> > the number of cells represented by a bus, not a device (which might
>> > explain why it doesn't walk up the tree).
>> >
>> > I also can't reuse them to implement these fdt_n_addr_cells() and
>> > fdt_n_size_cells() functions because they don't return an accurate error
>> > if the #address-cells and #size-cells are not found, therefore it's
>> > impossible to decide when to climb further up the tree.
>> >
>>
>> OK but I have one more question. I thought that dtc gave a warning when you
>> don't explicitly specify these values in the parent node?
>
> It doesn't explicitly warn about the properties being absent. Rather it
> will fallback to the default (#address-cells = <2>, #size-cells = <1> in
> the version that I have) and warn if those don't match what's expected.
>
> Interestingly as opposed to what the Linux kernel does, DTC doesn't seem
> to climb further up the tree if it can't find the properties in a device
> tree node. Instead, it seems to always use the default values instead.
>
> Adding the devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org mailing list. Maybe somebody there
> can help iron out this inconsistency. ePAPR explicitly says that both
> "... #address-cells and #size-cells properties are not inherited from
> ancestors in the device tree. They shall be explicitly defined." (see
> 2.3.5 "#address-cells and #size-cells").

That's my understanding too. So should we drop this patch?

Regards,
Simon
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

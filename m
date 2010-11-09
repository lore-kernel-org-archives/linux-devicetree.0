From: Greg KH <gregkh-l3A5Bk7waGM@public.gmane.org>
Subject: Re: of_match_table on non-DT builds
Date: Tue, 9 Nov 2010 08:07:55 -0800
Message-ID: <20101109160755.GA7870@suse.de>
References: <4CD9684E.7080606@gmail.com>
	<AANLkTi=11Jok3eujFwvji8ON1urcdeebCkJZgNrF=em5@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <AANLkTi=11Jok3eujFwvji8ON1urcdeebCkJZgNrF=em5-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Nov 09, 2010 at 09:01:17AM -0700, Grant Likely wrote:
> On Tue, Nov 9, 2010 at 8:27 AM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > Grant,
> >
> > With the of_match_table pointer only enabled with CONFIG_OF in struct
> > device_driver, all drivers will have to have #ifdefs around their
> > of_match_table if you want to build them for non-devicetree platforms. This
> > is just the tip of the iceberg as all probe related OF calls have to be
> > ifdef'ed. Is this the intention?
> 
> Not really, and I'm not entirely sure about the best way to handle
> this.  I might handle the of_match_table pointer using a macro so that
> the #ifdefs can be dropped in each individual device driver
> definition, or I might ask Greg to drop the #ifdefs around
> of_match_table in struct device_driver, but I don't really want to
> increase the size of struct device_driver for non-devicetree users.

That's ok, it's not that big of a deal to drop the #ifdef, especially if
it makes the .c files more "sane".

I'll work on merging the dma stuff in 'struct device' to a single
pointer, to get the space back, so you should be fine.

thanks,

greg k-h

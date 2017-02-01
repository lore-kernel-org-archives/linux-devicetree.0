From: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Subject: Re: [PATCH V7 3/4] drm/bridge: Add driver for GE B850v3 LVDS/DP++
 Bridge
Date: Wed, 1 Feb 2017 12:35:36 +0100
Message-ID: <20170201113536.dig22kidlw6mjoz5@phenom.ffwll.local>
References: <b84ac3b8-3626-3eb2-7293-0affb58b7752@codeaurora.org>
 <64ff-5891bf80-f-117f65c0@159002012>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <64ff-5891bf80-f-117f65c0@159002012>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Senna Tschudin <peter.senna-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Cc: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org, martin.donnelly-JJi787mZWgc@public.gmane.org, mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, peter.senna-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Peter Senna Tschudin <peter.senna-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, tiwai-IBi9RG/b67k@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, martyn.welch-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org, rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, daniel.vetter-/w4YWyX8dFk@public.gmane.org, jslaby-AlSwsSmVLrQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, dri-
List-Id: devicetree@vger.kernel.org

On Wed, Feb 01, 2017 at 10:58:43AM +0000, Peter Senna Tschudin wrote:
> Hi Archit,
> 
> On 01 February, 2017 10:44 CET, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
> 
> >
> >
> > On 01/30/2017 10:35 PM, Jani Nikula wrote:
> > > On Sat, 28 Jan 2017, Peter Senna Tschudin <peter.senna-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org> wrote:
> > >> On Thu, Jan 05, 2017 at 01:18:47PM +0530, Archit Taneja wrote:
> > >> Hi Archit,
> > >>
> > >> Thank you for the comments!
> > >>
> > >> [...]
> > >>>> +	total_size = (block[EDID_EXT_BLOCK_CNT] + 1) * EDID_LENGTH;
> > >>>> +	if (total_size > EDID_LENGTH) {
> > >>>> +		kfree(block);
> > >>>> +		block = kmalloc(total_size, GFP_KERNEL);
> > >>>> +		if (!block)
> > >>>> +			return NULL;
> > >>>> +
> > >>>> +		/* Yes, read the entire buffer, and do not skip the first
> > >>>> +		 * EDID_LENGTH bytes.
> > >>>> +		 */
> > >>>
> > >>> Is this the reason why you aren't using drm_do_get_edid()?
> 
> > >>
> > >> Yes, for some hw specific reason, it is necessary to read the entire
> > >> EDID buffer starting from 0, not block by block.
> > >
> > > Hrmh, I'm planning on moving the edid override and firmware edid
> > > mechanisms at the drm_do_get_edid() level to be able to truly and
> > > transparently use a different edid. Currently, they're only used for
> > > modes, really, and lead to some info retrieved from overrides, some from
> > > the real edid. This kind of hacks will bypass the override/firmware edid
> > > mechanisms then too. :(
> >
> > It seems like there is a HW issue which prevents them from reading EDID
> > from an offset. So, I'm not sure if it is a hack or a HW limitation.
> 
> >
> > One way around this would be to hide the HW requirement in the
> > get_edid_block func pointer passed to drm_do_get_edid(). This
> > would, however, result in more i2c reads (equal to # of extension
> > blocks) than what the patch currently does.
> >
> > Peter, if you think doing extra EDID reads isn't too costly on your
> > platform, you could consider using drm_do_get_edid(). If not, I guess
> > you'll miss out on the additional functionality Jani is going to add
> 
> > in the future.
> 
> My concern is that for almost one year now, every time I fix something
> one or two new requests are made. I'm happy to fix the driver, but I
> want a list of the changes that are required to get it upstream, before
> I make more changes. Can we agree on exactly what is preventing this
> driver to get upstream? Then I'll fix it.

I think addressing this edid reading question post-merge is perfectly
fine. Aside, want to keep maintaing your stuff as part of the drm-misc
group, with the drivers-in-misc experiment?
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

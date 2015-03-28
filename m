From: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
Subject: Re: [PATCH] of: base: improve of_get_next_child() kernel-doc
Date: Sat, 28 Mar 2015 23:29:39 +0300
Message-ID: <20150328202939.GA12479@tarshish>
References: <360c70ee4131ea8048b193bfff359360bb854fe3.1426766621.git.baruch@tkos.co.il>
 <CAL_JsqKvEYC9NUB2ZNgAgr7KrimT9ZmvGdxjJhNE+5uF9n+nkQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqKvEYC9NUB2ZNgAgr7KrimT9ZmvGdxjJhNE+5uF9n+nkQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

On Tue, Mar 24, 2015 at 11:45:16PM -0500, Rob Herring wrote:
> On Thu, Mar 19, 2015 at 7:03 AM, Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org> wrote:
> > Add two new facts to of_get_next_child() documentation:
> >
> >    * of_get_next_child() returns NULL when there is not next child
> >
> >    * of_get_next_child() decrements the refcount of prev
> >
> > Signed-off-by: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
> 
> Applied. Thanks.

Thanks. Which tree is this patch going through? I don't see it in current 
-next (next-20150327).

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org - tel: +972.2.679.5364, http://www.tkos.co.il -
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

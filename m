From: David VomLehn <dvomlehn-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
Subject: Re: [sodaville] [RFC] [PATCH V2] Adding DTB to architecture
	independent vmlinux
Date: Mon, 1 Nov 2010 18:27:44 -0700
Message-ID: <20101102012744.GA11109@dvomlehn-lnx2.corp.sa.net>
References: <4CC6E491.7060304@gmail.com>
	<20101027110937.GD7822@angua.secretlab.ca>
	<4CC860EF.6060503@linux.intel.com> <4CC8C423.9050600@gmail.com>
	<20101028005754.GA27386@dvomlehn-lnx2.corp.sa.net>
	<4CC99441.4030307@linux.intel.com> <4CC9A66B.6070408@linutronix.de>
	<4CC9A705.3080806@linux.intel.com>
	<20101028180053.GC25771@dvomlehn-lnx2.corp.sa.net>
	<AANLkTinYiTDsN+c_vgnK4OjmjpTzLHyyA8FqjPSaFm5h@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <AANLkTinYiTDsN+c_vgnK4OjmjpTzLHyyA8FqjPSaFm5h-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
Cc: sodaville-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, "H. Peter Anvin" <hpa-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Nov 01, 2010 at 12:15:07AM -0400, Grant Likely wrote:
> On Thu, Oct 28, 2010 at 2:00 PM, David VomLehn <dvomlehn-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org> wrote:
> > On Thu, Oct 28, 2010 at 09:38:29AM -0700, H. Peter Anvin wrote:
> >> On 10/28/2010 9:35 AM, Sebastian Andrzej Siewior wrote:
> >>> H. Peter Anvin wrote:
> >>>> How big are these blobs in the typical case? Padding to the page size
> >>> You usually pad the dtb by 1kib (-p 1024 in dtc). Converting all dtbs=
 in
> >>> powerpc's tree leads to:
> >>> 991545 / 130 =3D 7627 bytes average.
> >>>
> >>
> >> So expanding to a page is a lot of memory, but it's pretty important to
> >> jettison unused DTBs.
> >>
> >> =A0 =A0 =A0 -hpa
> >
> > IIRC, the slab allocator will simply use the buddy allocator when alloc=
ating
> > close to or above the page size. So, this will use 8192 bytes whether
> > you use what I had proposed or you dynamically allocate space and copy =
it
> > from the .init section.
> >
> > If memory usage is not an issue, it would be nice to avoid the copy. An=
other
> > possible consideration is image size. If you don't do the rounding, you=
'll
> > have a smaller boot image. Not really sure how to weigh these and wheth=
er there
> > are other considerations.
> =

> The choice to copy could be made a Kconfig option, but I doubt it is
> warranted.  A one time copy of one or two pages at boot is pretty
> speedy.  I'll let someone with benchmarks results prove me otherwise.
> =

> g.

It wouldn't surprise me if the time to copy weren't made up in one place or=
 another
by the smaller size. I'm happy with .init and a memcpy(). :-)
-- =

David VL

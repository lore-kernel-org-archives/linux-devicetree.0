From: Greg KH <gregkh-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH] dt: add a match table pointer to struct device
Date: Fri, 25 Feb 2011 10:44:28 -0800
Message-ID: <20110225184428.GA2280@suse.de>
References: <20110223025233.25131.47193.stgit@localhost6.localdomain6>
	<AANLkTikauP8+PgFyicdSQzJ19ZvqpV=3ZnRTjSvY78qc@mail.gmail.com>
	<20110225163547.GC8523@suse.de>
	<AANLkTik1fzJw11mKSVu4B2yrGZAju59uNmHjjGSgVcGY@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <AANLkTik1fzJw11mKSVu4B2yrGZAju59uNmHjjGSgVcGY-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Feb 25, 2011 at 10:34:05AM -0700, Grant Likely wrote:
> On Fri, Feb 25, 2011 at 9:35 AM, Greg KH <gregkh-l3A5Bk7waGM@public.gmane.org> wrote:
> > On Fri, Feb 25, 2011 at 08:46:52AM -0700, Grant Likely wrote:
> >> Greg, any thoughts on this change? =A0I'd like to take it via my tree =
so
> >> I can finally dump the last vestiges of of_platform_bus_type.
> >
> > Sorry, I didn't realize you just wanted my review, and not me to take it
> > directly.
> =

> Heh, I wasn't very clear about that.  Oops,
> =

> > If you want to take it, that's great, no objection from me, feel free to
> > add:
> > =A0 =A0 =A0 =A0Acked-by: Greg Kroah-Hartman <gregkh-l3A5Bk7waGM@public.gmane.org>
> > to it.
> =

> Thanks.  Yes I definitely want to take it because I've got a pile of
> patches that depend on it.
> =

> > What about the other patch you sent me, do you want me to take that, or
> > will you?
> =

> Which one is that?  The relaxation of .name checking on of_serial?
> Yes, you can take that one, but hold off for the moment.  Looking at
> it now I realize that I forgot to cc some folks that should ack it, so
> I'm going to repost.

Oops, I just took it :(

thanks,

greg k-h

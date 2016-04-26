From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 15/41] Documentation: dt: mfd: fix spelling mistakes
Date: Tue, 26 Apr 2016 14:49:54 +0100
Message-ID: <20160426134954.GA4892@dell>
References: <1461543878-3639-1-git-send-email-eric@engestrom.ch>
 <1461543878-3639-16-git-send-email-eric@engestrom.ch>
 <20160425135017.GA8656@rob-hp-laptop>
 <20160425165830.GP2713@dell>
 <CAL_JsqJC1epdP_RBm4fSz2ouYPy40NuFzfj6M1qB0rxV7H4S=Q@mail.gmail.com>
 <20160426063516.GQ2713@dell>
 <CAL_JsqLn7cZqqWzOT97QPaMyiPsTJRsp=_oNRDAjWtPo5fvngw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqLn7cZqqWzOT97QPaMyiPsTJRsp=_oNRDAjWtPo5fvngw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Eric Engestrom <eric-op+oiCINJLTt9jDmeYuA0g@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 26 Apr 2016, Rob Herring wrote:

> On Tue, Apr 26, 2016 at 1:35 AM, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wro=
te:
> > On Mon, 25 Apr 2016, Rob Herring wrote:
> >
> >> On Mon, Apr 25, 2016 at 11:58 AM, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>=
 wrote:
> >> > On Mon, 25 Apr 2016, Rob Herring wrote:
> >> >
> >> >> On Mon, Apr 25, 2016 at 01:24:12AM +0100, Eric Engestrom wrote:
> >> >> > Signed-off-by: Eric Engestrom <eric-op+oiCINJLTt9jDmeYuA0g@public.gmane.org>
> >> >>
> >> >> Applied, thanks.
> >> >
> >> > I'd prefer to continue taking these if you don't mind Rob.  It'd=
 limit
> >> > on the amount of immutable branch pull requests I have to send/h=
andle.
> >>
> >> Why? Do you really expect to have a dependency here?
> >
> > Because the file is in ".*/mfd/.*", which normally goes through the=
 MFD
> > tree.
> >
> > $ git log --committer=3D"Rob Herring" --oneline -- Documentation/de=
vicetree/bindings/mfd/ | wc -l
> > 6
> > $ git log --committer=3D"Lee Jones" --oneline -- Documentation/devi=
cetree/bindings/mfd/ | wc -l
> > 99
>=20
> That is because most changes are coupled with drivers. For changes
> that are standalone without any dependency, they go thru my tree. If
> we're getting any merge conflicts beyond which Linus can/wants to fix=
,
> then there is a problem because bindings shouldn't be changing that
> much.

That's certainly the first I've heard about it.  It makes far less
sense for changes pertaining to a single directory to go in via 2
separate trees.  IMO that's asking for trouble.

> Eventually, I think we need to merge all the bindings thru a single
> tree. Otherwise, we'll never move toward moving bindings out of the
> kernel (unless we just sync from the kernel tree to a standalone
> repo).

Once (if they ever) move out from the kernel tree, then I agree with
you, they should be dealt with as completely separate entities and be
merged though different trees, but until then we need to make a
decision; either you take them all or I take them all.  I thought we
were doing the latter already.=20

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

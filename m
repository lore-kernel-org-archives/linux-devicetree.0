From: Paul Kocialkowski <paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v5 02/22] fixup! v4l2-ctrls: add
 v4l2_ctrl_request_hdl_find/put/ctrl_find functions
Date: Tue, 10 Jul 2018 10:13:48 +0200
Message-ID: <5adf8a6aa70fd6f7f4326ccb068b66d6221d8d8b.camel@bootlin.com>
References: <20180710080114.31469-1-paul.kocialkowski@bootlin.com>
	 <20180710080114.31469-3-paul.kocialkowski@bootlin.com>
	 <CAMuHMdVgJuK5G0+szV0BAWDBybxWV0iDWE5kZKuTdgNiGjpnEg@mail.gmail.com>
Reply-To: paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-heIn3Rp8HIJ7p2FH40+U"
Return-path: <linux-sunxi+bncBCOO3QWNR4KRB3OVSHNAKGQEIMRURZY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CAMuHMdVgJuK5G0+szV0BAWDBybxWV0iDWE5kZKuTdgNiGjpnEg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Linux Media Mailing List <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:OPEN
 FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, marco.franchi-3arQi8VN3Tc@public.gmane.org, icenowy-h8G6r0blFSE@public.gmane.org, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, keiichiw-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, smitha.t-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, tom.saeger-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Laurent Pinchart <laurent.pinch>
List-Id: devicetree@vger.kernel.org


--=-heIn3Rp8HIJ7p2FH40+U
Content-Type: text/plain; charset="UTF-8"

Hi,

On Tue, 2018-07-10 at 10:07 +0200, Geert Uytterhoeven wrote:
> On Tue, Jul 10, 2018 at 10:02 AM Paul Kocialkowski
> <paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> wrote:
> > [PATCH v5 02/22] fixup! v4l2-ctrls: add v4l2_ctrl_request_hdl_find/put/ctrl_find functions
> 
> git rebase -i ;-)

Although I should have mentionned it (and did not), this is totally
intentional! The first patch (from Hans Verkuil) requires said fixup to
work properly. I didn't want to squash that change into the commit to
make the diff obvious.

Ultimately, this framework patch is not really part of the series but is
one of its underlying requirements, that should be merged separately (as
part of the requests API series).

I hope this clears up some of the confusion about this patch :)

Cheers!

> Gr{oetje,eeting}s,
> 
>                         Geert
> 
-- 
Paul Kocialkowski, Bootlin (formerly Free Electrons)
Embedded Linux and kernel engineering
https://bootlin.com
--=-heIn3Rp8HIJ7p2FH40+U--

From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 0/5] Mailbox: Provide support STi based platforms
Date: Fri, 16 Oct 2015 08:14:19 +0100
Message-ID: <20151016071419.GC31804@x1>
References: <1444050140-24733-1-git-send-email-lee.jones@linaro.org>
 <CAJe_ZhcBwSxOAwssztipQtYzG8mPQ4Wmu+=h47gT3vc4gv7mJg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAJe_ZhcBwSxOAwssztipQtYzG8mPQ4Wmu+=h47gT3vc4gv7mJg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 16 Oct 2015, Jassi Brar wrote:

> On 5 October 2015 at 18:32, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> > Hi Jassi,
> >
> > This should be it.  Exciting times!
> >
> > ST's platforms currently support a maximum of 5 Mailboxes, one for
> > each of the supported co-processors situated on the platform.  Each
> > Mailbox is divided up into 4 instances which consist of 32 channels=
=2E
> > Messages are passed between the application and co-processors using
> > shared memory areas.
> >
> > Also included in the set is an example Client which should be gener=
ic
> > enough to use as a testing environment for all Mailbox IPs which us=
e
> > shared memory or the API to pass messages.  With small changes, it
> > should also be able to test more extravagant implementations.
> >
> > v3 -> v4:
> >  - More protection in MBOX_BASE() MACRO
> >  - Remove unused tx-only marker
> >
> Are you sure about the tx-only marker? :)
>=20
> Since it is also a DT property, I think we should have it removed
> before we apply the patchset. Lets get it done today.

Wow!  I can't even explain that.  It's gone from my local repo!

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

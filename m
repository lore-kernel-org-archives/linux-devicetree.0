From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCHv9 2/4] mailbox: Introduce framework for mailbox
Date: Fri, 1 Aug 2014 09:17:00 +0100
Message-ID: <20140801081700.GM9030@lee--X1>
References: <1406055250-29159-1-git-send-email-jaswinder.singh@linaro.org>
 <1406055374-29275-1-git-send-email-jaswinder.singh@linaro.org>
 <20140723085411.GG23210@lee--X1>
 <CAJe_ZhfaLqgKb3oK-m5Rpae5+zeAEk9-DLFOovq4qjBgg64b-w@mail.gmail.com>
 <20140723152649.GJ23210@lee--X1>
 <CAJe_ZhcOXyGO49sZUXnqCk9wm7WvQ01b76k7Wqxxi1S3qisDPA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAJe_ZhcOXyGO49sZUXnqCk9wm7WvQ01b76k7Wqxxi1S3qisDPA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ks.giri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <ks.giri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Courtney Cavin <courtney.cavin-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>, Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Craig McGeachie <slapdau-/E1597aS9LT0CCvOHzKKcA@public.gmane.org>, LeyFoon Tan <lftan.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Loic Pallardy <loic.pallardy-qxv4g6HH51o@public.gmane.org>, "Anna, Suman" <s-anna-l0cyMroinI0@public.gmane.org>, Ashwin Chaugule <ashwin.chaugule-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Bjorn Andersson <bjorn-UYDU3/A3LUY@public.gmane.org>, Patch Tracking <patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Tetsuya Takinishi <t.takinishi-+CUm20s59erQFUHtdCDX3A@public.gmane.org>, Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mollie Wu <mollie.wu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Andy Green <andy.green-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 31 Jul 2014, Jassi Brar wrote:

> On 23 July 2014 20:56, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> > On Wed, 23 Jul 2014, Jassi Brar wrote:
>=20
> >> >> +     if (chan->txdone_method =3D=3D (TXDONE_BY_POLL | TXDONE_B=
Y_ACK))
> >> >> +             chan->txdone_method =3D TXDONE_BY_POLL;
> >> >
> >> > Unless you're leaving it there for clarity, you can drop the
> >> > "TXDONE_BY_POLL |" from if().
> >> >
> >> We need to check for both.
> >
> > What I'm trying to get at is; if it's already TXDONE_BY_POLL, there=
 is no
> > need to set it to TXDONE_BY_POLL.
> >
> In mbox_request_channel() we added the ACK flag, if POLL was set and
> now we need to revert that in mbox_free_channel().

Okay, I see what you're doing.  Thanks for the clarification.

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

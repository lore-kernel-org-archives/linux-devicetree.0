From: Antoine =?iso-8859-1?Q?T=E9nart?=
	<antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH RESEND 2/5] pinctrl: berlin: add a pinctrl driver for
 Marvell Berlin SoCs
Date: Tue, 22 Apr 2014 17:56:02 +0200
Message-ID: <20140422155602.GA19762@kwain>
References: <1397135274-10764-1-git-send-email-antoine.tenart@free-electrons.com>
 <1397135274-10764-3-git-send-email-antoine.tenart@free-electrons.com>
 <5347AFF4.3050607@gmail.com>
 <20140411123737.GA5903@kwain>
 <5347EF8A.8040600@gmail.com>
 <CACRpkdb1eijF-4e=KyhS=9S868NALdyJJaNnzjUubXnapWEeMg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdb1eijF-4e=KyhS=9S868NALdyJJaNnzjUubXnapWEeMg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, zmxu-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, Jisheng Zhang <jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Linus,

On Tue, Apr 22, 2014 at 02:52:10PM +0200, Linus Walleij wrote:
> On Fri, Apr 11, 2014 at 3:35 PM, Sebastian Hesselbarth
> <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > On 04/11/2014 02:37 PM, Antoine T=E9nart wrote:
> >> On Fri, Apr 11, 2014 at 11:03:48AM +0200, Sebastian Hesselbarth wr=
ote:
> >>> On 04/10/2014 03:07 PM, Antoine T=E9nart wrote:
>=20
> >>> Having said that, the above assumes that each function is unique
> >>> but IIRC the idea of the function table was to group pins/groups
> >>> with the same function, e.g. function "gpio", groups 1,7,25,...
> >>
> >> Most of the functions you can use on the Berlin they will be uniqu=
e and
> >> would
> >> only be used in one group, except for the 'gpio' one.
> >
> > Yeah, I had a similar discussion about it back then for mvebu. IIRC=
, the
> > correct answer is: Have a list of functions with groups assigned to=
 it
> > no matter if there is only one group per function (or 40 per functi=
on as
> > it will be for gpio).
> >
> > Maybe Linus can give an update on how to deal with it?
>=20
> Have you considered implementing pinmux_ops
> .gpio_request_enable(), .gpio_set_direction() and
> .gpio_disable_free() instead of defining groups for each
> and every GPIO?

The function 'gpio' can be found on different groups. But the Berlin pi=
n muxing
does not allow to configure a pin individually. It is then not possible=
 to mux
GPIO pins individually. For example the 'gpio' function of group 'GSM2'=
 on the
BG2Q will mux GPIOs 17 *and* 18.

Groups does not have more than a single 'gpio' function.

Since the gpio_request_enable() comment says 'Implement this only if yo=
u can mux
every pin individually as GPIO', I did not considered implementing thes=
e
functions.

Antoine

--=20
Antoine T=E9nart, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

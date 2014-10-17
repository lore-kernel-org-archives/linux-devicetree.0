From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [RFC v3 PATCH 1/5] of: Add standard property for poweroff capability
Date: Fri, 17 Oct 2014 08:06:16 +0200
Message-ID: <8037374.M9KdRGnRWV@phil>
References: <1413268273-15151-1-git-send-email-romain.perier@gmail.com> <20141015140337.GI27755@sirena.org.uk> <CABgxDoKen1Ub1ptG85-oMhUcRkX7tsZ6o51OJcOX2jZkZi0JGg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CABgxDoKen1Ub1ptG85-oMhUcRkX7tsZ6o51OJcOX2jZkZi0JGg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: PERIER Romain <romain.perier@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Grant Likely <grant.likely@linaro.org>, devicetree <devicetree@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, robh <robh@kernel.org>, mark.rutland@arm.com
List-Id: devicetree@vger.kernel.org

Hi Romain,

Am Freitag, 17. Oktober 2014, 08:01:31 schrieb PERIER Romain:
> Hi all,
>=20
> I am just curious but where do you plan to merge this serie ? in
> git://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git ?

The single dts patch will be going into my dts branch and the rest will=
 go=20
through Mark's regulator tree. As Mark said, he'll try to apply these a=
gain=20
once 3.18-rc1 is released and if it still doesn't apply then, he'll pro=
bably=20
ask you to rebase them onto the regulator tree [which will at the time =
include=20
everything that is in -rc1].


Heiko



> 2014-10-15 16:03 GMT+02:00 Mark Brown <broonie@kernel.org>:
> > On Wed, Oct 15, 2014 at 03:56:03PM +0200, Heiko St=FCbner wrote:
> >> Am Mittwoch, 15. Oktober 2014, 15:42:45 schrieb Mark Brown:
> >> > I guess I should apply these (except the DTS update) since the f=
irst
> >> > user that's being added is a regulator driver?
> >>=20
> >> I'd think so.
> >> In any case, I'll take the "ARM: dts: ..." patch if you take the o=
thers.
> >=20
> > Sounds like a plan.  I just tried applying and got some conflicts b=
ut
> > I'm guessing that this is due to changes that are landing in the me=
rge
> > window so I'll try again once -rc1 is out.

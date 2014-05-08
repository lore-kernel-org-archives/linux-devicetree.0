From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/9] ARM: STi: DT: STiH416: 416 DT Entry for clockgen
 A0/1/10/11/12
Date: Thu, 8 May 2014 09:03:44 +0100
Message-ID: <20140508080344.GE5307@lee--X1>
References: <1399305223-18703-1-git-send-email-gabriel.fernandez@linaro.org>
 <1399305223-18703-2-git-send-email-gabriel.fernandez@linaro.org>
 <20140506071843.GD5206@lee--X1>
 <CAG374jD+msPPbPtFS+ji=8jS9+D-YHu31k7zzzC7Ty7jw9n7jQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAG374jD+msPPbPtFS+ji=8jS9+D-YHu31k7zzzC7Ty7jw9n7jQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gabriel Fernandez <gabriel.fernandez-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Gabriel FERNANDEZ <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>, Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pankaj Dev <pankaj.dev-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> >> Patch adds DT entries for clockgen A0/1/10/11/12
> >>
> >> Signed-off-by: Pankaj Dev <pankaj.dev-qxv4g6HH51o@public.gmane.org>
> >> Signed-off-by: Gabriel Fernandez <gabriel.fernandez-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> >> ---
> >>  arch/arm/boot/dts/stih416-clks.h     |  15 ++
> >
> > This should live in include/dt-bindings/clk
> >
> include/dt-bindings/clk or  include/dt-bindings/clock ?

I have no idea what the difference between the two are.  I guess you
are in a better position to answer that.  My point was just that the
includes should be in the include directory, rather than being held
locally in the 'dts' directory.

> >>  arch/arm/boot/dts/stih416-clock.dtsi | 477 ++++++++++++++++++++++=
++++++++++++
> >>  arch/arm/boot/dts/stih416.dtsi       |  10 +-
> >>  3 files changed, 497 insertions(+), 5 deletions(-)
> >>  create mode 100644 arch/arm/boot/dts/stih416-clks.h

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

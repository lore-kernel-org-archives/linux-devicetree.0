From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [STLinux Kernel] [PATCH 3/4] clk: Provide always-on clock support
Date: Mon, 2 Mar 2015 08:16:06 +0000
Message-ID: <20150302081606.GC31325@x1>
References: <1425071674-16995-1-git-send-email-lee.jones@linaro.org>
 <1425071674-16995-4-git-send-email-lee.jones@linaro.org>
 <54F173B7.9030305@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <54F173B7.9030305-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, 28 Feb 2015, Maxime Coquelin wrote:

> Hi Lee,
>=20
> On 02/27/2015 10:14 PM, Lee Jones wrote:
> >Lots of platforms contain clocks which if turned off would prove fat=
al.
> >The only way to recover from these catastrophic failures is to resta=
rt
> >the board(s).  Now, when a clock is registered with the framework it=
 is
> >compared against a list of provided always-on clock names which must=
 be
> >kept ungated.  If it matches, we enable the existing CLK_IGNORE_UNUS=
ED
> >flag, which will prevent the common clk framework from attempting to
> >gate it during the clk_disable_unused() procedure.
>=20
> Please correct me if I'm wrong, but your patch does not fix the
> issue you had initially.
> Let's take an example:
> A clock is critical for the system, and should never be gated, so
> you add the CLK_IGNORE_UNUSED
> flag so that it is not disabled by clk_disable_unused() procedure.
> The same clock is also used by other IPs, for example spi 0 instance.
> When starting a spi transfer, clk_enable() is called on this clock,
> so its usecount becomes 1.
> Once transfer done, clk_disable() is called, usecount becomes 0 and
> the clock gets disabled: system freeze.

You're right.  I also need to extend clk_core_disable() to take notice
of CLK_IGNORE_UNUSED.

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

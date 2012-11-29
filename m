From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH V4 Resend 1/3] mfd: stmpe: Get rid of irq_invert_polarity
Date: Thu, 29 Nov 2012 09:20:01 +0000
Message-ID: <20121129092001.GS2013@gmail.com>
References: <d1f012d7bb2835f696fc100073f2eb16d9f6204d.1354128258.git.viresh.kumar@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <d1f012d7bb2835f696fc100073f2eb16d9f6204d.1354128258.git.viresh.kumar@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: sameo@linux.intel.com, grant.likely@secretlab.ca, rabin.vincent@stericsson.com, shiraz.hashim@st.com, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, spear-devel@list.st.com, linus.walleij@linaro.org
List-Id: devicetree@vger.kernel.org

On Thu, 29 Nov 2012, Viresh Kumar wrote:

> Since the very first patch, stmpe core driver is using irq_invert_pol=
arity as
> part of platform data. But, nobody is actually using it in kernel til=
l now.
>=20
> Also, this is not something part of hardware specs, but is included t=
o cater
> some board mistakes or quirks.
>=20
> So, better get rid of it. This is earlier discussed here:
>=20
> https://lkml.org/lkml/2012/11/27/636
>=20
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

Glad to see the back of it:

Acked-by: Lee Jones <lee.jones@linaro.org>

--=20
Lee Jones
Linaro ST-Ericsson Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog

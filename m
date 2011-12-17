From: Richard Zhao <richard.zhao@linaro.org>
Subject: Re: [PATCH V2 1/4] cpufreq: add arm soc generic cpufreq driver
Date: Sat, 17 Dec 2011 15:57:34 +0800
Message-ID: <20111217075732.GB2010@richard-laptop>
References: <1324031462-24961-1-git-send-email-richard.zhao@linaro.org>
 <1324031462-24961-2-git-send-email-richard.zhao@linaro.org>
 <201112161226.04092.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <201112161226.04092.heiko@sntech.de>
Sender: cpufreq-owner@vger.kernel.org
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org, cpufreq@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux@arm.linux.org.uk, mark.langsdorf@calxeda.com, patches@linaro.org, eric.miao@linaro.org, kernel@pengutronix.de, davej@redhat.com, linaro-dev@lists.linaro.org, shawn.guo@linaro.org
List-Id: devicetree@vger.kernel.org

On Fri, Dec 16, 2011 at 12:26:03PM +0100, Heiko St=FCbner wrote:
> Am Freitag, 16. Dezember 2011, 11:30:59 schrieb Richard Zhao:
> > It support single core and multi-core ARM SoCs. But it assume
> > all cores share the same frequency and voltage.
> >=20
> > Signed-off-by: Richard Zhao <richard.zhao@linaro.org>
> > ---
> >  drivers/cpufreq/Kconfig.arm   |    8 ++
> >  drivers/cpufreq/Makefile      |    1 +
> >  drivers/cpufreq/arm-cpufreq.c |  269
> > +++++++++++++++++++++++++++++++++++++++++ 3 files changed, 278
> > insertions(+), 0 deletions(-)
> >  create mode 100644 drivers/cpufreq/arm-cpufreq.c
>=20
> looks quite cool, but should also provide a description of the device=
tree=20
> bindings (i.e. like the rest in Documentation/devicetree/bindings/...=
) for=20
> future reference.
Yes, Thanks for your remind.
>=20
> Heiko
>=20

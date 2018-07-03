From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 1/1] ARM: dts: imx6ull: add operating points
Date: Tue, 3 Jul 2018 14:34:38 +0800
Message-ID: <20180703063436.GI4348@dragon>
References: <20180629145221.10393-1-sebastien.szymanski@armadeus.com>
 <20180702045205.fdh4dwwhwyfftptl@vireshk-i7>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180702045205.fdh4dwwhwyfftptl@vireshk-i7>
Sender: linux-kernel-owner@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: =?iso-8859-1?Q?S=E9bastien?= Szymanski <sebastien.szymanski@armadeus.com>, linux-arm-kernel@lists.infradead.org, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, NXP Linux Team <linux-imx@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, "Rafael J . Wysocki" <rjw@rjwysocki.net>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 02, 2018 at 10:22:05AM +0530, Viresh Kumar wrote:
> On 29-06-18, 16:52, Sébastien Szymanski wrote:
> > i.MX6ULL has different operating ranges than i.MX6UL so add the
> > operating points for the i.MX6ULL and removed them form board device
> 
> s/removed/remove/
> s/form/from/

I fixed them up and applied the patch.

Shawn

> 
> > trees. A 25mV offset is added to the minimum allowed values like for the
> > i.MX6UL.
> > The valid frequencies are now selected by the cpufreq driver according
> > to ratings stored in fuses since commit 0aa9abd4c212 ("cpufreq: imx6q:
> > check speed grades for i.MX6ULL")
> > 
> > Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>

From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 1/7] regulator/mfd: Support ROHM BD71847 power
 management IC
Date: Fri, 21 Sep 2018 11:02:41 -0700
Message-ID: <20180921180241.GA4358@dell>
References: <cover.1536912922.git.matti.vaittinen@fi.rohmeurope.com>
 <3996792a07fea45d94d4d712ed05527199cc4ac0.1536912922.git.matti.vaittinen@fi.rohmeurope.com>
 <20180921172959.GG20825@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180921172959.GG20825@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, robh+dt@kernel.org, mark.rutland@arm.com, lgirdwood@gmail.com, sboyd@kernel.org, mazziesaccount@gmail.com, heikki.haikola@fi.rohmeurope.com, mikko.mutanen@fi.rohmeurope.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, 21 Sep 2018, Mark Brown wrote:

> On Fri, Sep 14, 2018 at 11:27:46AM +0300, Matti Vaittinen wrote:
> > BD71847 is reduced version of BD71837. DVS bucks 3 and 4 are
> > removed as is LDO7. Voltage ranges of some regulators are
> > expanded.
> > 
> > Add initial support for BD71847 with BD71837 driver.
> > 
> > Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> > ---
> >  drivers/mfd/rohm-bd718x7.c            |   70 +--
> >  drivers/regulator/bd71837-regulator.c | 1055 +++++++++++++++++++++++----------
> >  include/linux/mfd/rohm-bd718x7.h      |  271 ++++-----
> >  3 files changed, 879 insertions(+), 517 deletions(-)
> 
> This looks OK to me - Lee, the patch is almost entirely a regulator one,
> are you OK with me applying it?

The diff in rohm-bd718x7.h does not look significant.

You can apply it so long as you provide me with a PR in order to avoid
any potential merge conflicts.  Especially as Linus is out for this
release.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog

Return-Path: <vkoul@kernel.org>
Date: Thu, 28 Jun 2018 18:29:58 +0530
From: Vinod <vkoul@kernel.org>
Subject: Re: [PATCH v4 2/6] power: reset: qcom-pon: Add Qcom PON driver
Message-ID: <20180628125958.GU22377@vkoul-mobl>
References: <20180627115301.21330-1-vkoul@kernel.org>
 <20180627115301.21330-3-vkoul@kernel.org>
 <20180628115905.mbmjxxtl2i4ldf3w@earth.universe>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180628115905.mbmjxxtl2i4ldf3w@earth.universe>
To: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Cc: linux-input@vger.kernel.org, linux-pm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi Sebastian,

On 28-06-18, 13:59, Sebastian Reichel wrote:
> On Wed, Jun 27, 2018 at 05:22:57PM +0530, Vinod Koul wrote:
> > Add support Qualcomm PM8xxx PON which is responsible for reboot
> > mode support.
> > 
> > Co-developed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > ---
> >  drivers/power/reset/Kconfig    |  8 ++++
> >  drivers/power/reset/Makefile   |  1 +
> >  drivers/power/reset/qcom-pon.c | 91 ++++++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 100 insertions(+)
> >  create mode 100644 drivers/power/reset/qcom-pon.c
> > 
> > diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
> > index df58fc878b3e..1572b2d3ad3d 100644
> > --- a/drivers/power/reset/Kconfig
> > +++ b/drivers/power/reset/Kconfig
> > @@ -104,6 +104,14 @@ config POWER_RESET_MSM
> >  	help
> >  	  Power off and restart support for Qualcomm boards.
> >  
> > +config POWER_RESET_QCOM_PON
> > +	bool "Qualcomm power-on driver"
> 
> tristate?

Hmmm I dont think there is a reason for this not being a module, though
looking at reset driver, bunch of them seem to be inbuilt only.

Bjorn, do you think we can be module or only inbuilt?

> 
> Otherwise driver looks fine to me.

Thanks

-- 
~Vinod

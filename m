From: Manivannan Sadhasivam <manivannan.sadhasivam-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/3] clk: owl: add clock driver for Actions S900 SoC
Date: Fri, 3 Nov 2017 00:11:23 +0530
Message-ID: <20171102184123.GA15014@linaro.org>
References: <1509479663-8985-1-git-send-email-manivannan.sadhasivam@linaro.org>
 <1509479663-8985-3-git-send-email-manivannan.sadhasivam@linaro.org>
 <20171102000246.rcermsfe7rycrmk3@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171102000246.rcermsfe7rycrmk3@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, afaerber-l3A5Bk7waGM@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, amit.kucheria-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, liuwei-/sSyCTpAT0ql5r2w9Jh5Rg@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Nov 01, 2017 at 07:02:46PM -0500, Rob Herring wrote:
> On Wed, Nov 01, 2017 at 01:24:22AM +0530, Manivannan Sadhasivam wrote:
> > This patch adds clock driver for Actions Semi OWL
> > series S900 SoC.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > ---
> >  MAINTAINERS                                    |   5 +
> >  drivers/clk/Makefile                           |   1 +
> >  drivers/clk/owl/Makefile                       |   2 +
> >  drivers/clk/owl/clk-factor.c                   | 270 ++++++++++++
> >  drivers/clk/owl/clk-pll.c                      | 346 +++++++++++++++
> >  drivers/clk/owl/clk-s900.c                     | 587 +++++++++++++++++++++++++
> >  drivers/clk/owl/clk.c                          | 318 ++++++++++++++
> >  drivers/clk/owl/clk.h                          | 301 +++++++++++++
> 
> >  include/dt-bindings/clock/actions,s900-clock.h | 141 ++++++
> 
> This belongs in the DT binding patch.
>
Ack. Will add it in next revision.

Thanks,
Mani 
> >  9 files changed, 1971 insertions(+)
> >  create mode 100644 drivers/clk/owl/Makefile
> >  create mode 100644 drivers/clk/owl/clk-factor.c
> >  create mode 100644 drivers/clk/owl/clk-pll.c
> >  create mode 100644 drivers/clk/owl/clk-s900.c
> >  create mode 100644 drivers/clk/owl/clk.c
> >  create mode 100644 drivers/clk/owl/clk.h
> >  create mode 100644 include/dt-bindings/clock/actions,s900-clock.h
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

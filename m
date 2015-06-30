From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: Re: [PATCH v5 1/7] extcon: arizona: Simplify pdata symantics for
	micd_dbtime
Date: Tue, 30 Jun 2015 11:51:49 +0100
Message-ID: <20150630105149.GK6321@opensource.wolfsonmicro.com>
References: <1434731014-19980-1-git-send-email-ckeepax@opensource.wolfsonmicro.com> <1434731014-19980-2-git-send-email-ckeepax@opensource.wolfsonmicro.com> <CAGTfZH3BvPz82j-JQhLDYAp=VcKSy9jtsTPhe53PfioPq684Fw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAGTfZH3BvPz82j-JQhLDYAp=VcKSy9jtsTPhe53PfioPq684Fw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: cw00.choi@samsung.com
Cc: Lee Jones <lee.jones@linaro.org>, "myungjoo.ham@samsung.com" <myungjoo.ham@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

On Sun, Jun 21, 2015 at 11:17:56PM +0900, Chanwoo Choi wrote:
> Hi Charles,
> 
> Looks good go me. But you need the review from MFD maintainer
> before appling it.
> 
> Thanks,
> Chanwoo Choi
> 
> On Sat, Jun 20, 2015 at 1:23 AM, Charles Keepax
> <ckeepax@opensource.wolfsonmicro.com> wrote:
> > Currently micd_dbtime can be set to 0 for default, 1 for 4 measurements,
> > or a greater than 16-bit value for 2 measurements. This patch simplifies
> > the symantics to 2 for 2 measurements, 4 for 4 measurements and any
> > other value for the default.
> >
> > I am not super keen on changing the symantics of the pdata at this stage
> > in the drivers life, but acceptance of the DT binding for this field has
> > been made conditional on this happening.
> >
> > Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
> > ---
> > diff --git a/include/linux/mfd/arizona/pdata.h b/include/linux/mfd/arizona/pdata.h
> > index aa5c48b..bd68355 100644
> > --- a/include/linux/mfd/arizona/pdata.h
> > +++ b/include/linux/mfd/arizona/pdata.h
> > @@ -53,6 +53,9 @@
> >
> >  #define ARIZONA_MAX_PDM_SPK 2
> >
> > +#define ARIZONA_MICD_DBTIME_TWO_READINGS 2
> > +#define ARIZONA_MICD_DBTIME_FOUR_READINGS 4
> > +

I am gonna respin and move these into the extcon driver itself,
should allow us to get the patch merged and their use in the
pdata header is probably minimal.

Thanks,
Charles

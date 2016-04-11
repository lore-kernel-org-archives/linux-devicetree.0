From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [RESEND PATCH v3 2/2] mfd: lm3533: Support initialization from
 Device Tree
Date: Mon, 11 Apr 2016 06:40:19 -0700
Message-ID: <20160411134019.GM391@tuxbot>
References: <1459405677-15696-1-git-send-email-bjorn.andersson@linaro.org>
 <1459405677-15696-2-git-send-email-bjorn.andersson@linaro.org>
 <20160411123009.GV8094@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160411123009.GV8094@x1>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@sonymobile.com>
List-Id: devicetree@vger.kernel.org

On Mon 11 Apr 05:30 PDT 2016, Lee Jones wrote:

> On Wed, 30 Mar 2016, Bjorn Andersson wrote:
> 
> > From: Bjorn Andersson <bjorn.andersson@sonymobile.com>
> > 
> > Implement Device Tree parsing functions to support initialization of the
> > lm3533 drivers.
> > 
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> > Changes since v2:
> > - Drop vendor prefix of vendor properties
> > - Specify unit of various properties
> > - Fix reference paths
> > 
> > Changes since v1:
> > - Added unit to boost-freq and als-resistance (as the frequency now comes with
> >   a unit specifier I changed it to be expressed in kHz)
> > 
> >  drivers/mfd/lm3533-core.c | 264 ++++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 264 insertions(+)
> > 
> > diff --git a/drivers/mfd/lm3533-core.c b/drivers/mfd/lm3533-core.c
> > index 5abcbb2e8849..dbf26d86fe85 100644
> > --- a/drivers/mfd/lm3533-core.c
> > +++ b/drivers/mfd/lm3533-core.c
> > @@ -18,6 +18,7 @@
> >  #include <linux/gpio.h>
> >  #include <linux/i2c.h>
> >  #include <linux/mfd/core.h>
> > +#include <linux/of_gpio.h>
> >  #include <linux/regmap.h>
> >  #include <linux/seq_file.h>
> >  #include <linux/slab.h>
> > @@ -25,6 +26,7 @@
> >  
> >  #include <linux/mfd/lm3533.h>
> >  
> > +#define LM3533_DEFAULT_BRIGHTNESS	200
> 
> The MFD doesn't care about child specifics.  These needs to go into
> the child driver.
> 

OK, sounds reasonable. Thanks for your feedback!

Regards,
Bjorn

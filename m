From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 1/5] regulator: s5m8767: Add symbols for hard-coded
 DVS_RAMP register
Date: Tue, 17 Dec 2013 15:06:33 +0100
Message-ID: <1387289193.13191.9.camel@AMDC1943>
References: <1387286601-21646-1-git-send-email-k.kozlowski@samsung.com>
 <1387286601-21646-2-git-send-email-k.kozlowski@samsung.com>
 <20131217135153.GI19810@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-reply-to: <20131217135153.GI19810@lee--X1>
Sender: linux-doc-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Rob Landley <rob@landley.net>, Sangbeom Kim <sbkim73@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Grant Likely <grant.likely@linaro.org>, Sachin Kamat <sachin.kamat@linaro.org>, Thomas Abraham <thomas.abraham@linaro.org>, Amit Daniel Kachhap <amit.daniel@samsung.com>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: devicetree@vger.kernel.org

On Tue, 2013-12-17 at 13:51 +0000, Lee Jones wrote:
> > Add symbols for hard-coded values of BUCK_RAMP field in DVS_RAMP
> > register. This simplifies a little the code as register update is called
> > only once.
> > 
> > Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> > Cc: Kyungmin Park <kyungmin.park@samsung.com>
> > Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> > ---
> >  drivers/regulator/s5m8767.c         |   22 ++++++++++------------
> >  include/linux/mfd/samsung/s5m8767.h |   15 +++++++++++++++
> >  2 files changed, 25 insertions(+), 12 deletions(-)
> 
> <snip>
> 
> > diff --git a/include/linux/mfd/samsung/s5m8767.h b/include/linux/mfd/samsung/s5m8767.h
> > index 9198377ee859..2ab0b0f03641 100644
> > --- a/include/linux/mfd/samsung/s5m8767.h
> > +++ b/include/linux/mfd/samsung/s5m8767.h
> > @@ -186,4 +186,19 @@ enum s5m8767_regulators {
> >  #define S5M8767_ENCTRL_SHIFT		6
> >  #define S5M8767_ENCTRL_MASK		(0x3 << S5M8767_ENCTRL_SHIFT)
> >  
> > +/*
> > + * Values for BUCK_RAMP field in DVS_RAMP register, matching raw values
> > + * in mV/us.
> > + */
> > +enum s5m8767_dvs_buck_ramp_values {
> > +	S5M8767_DVS_BUCK_RAMP_5		= 0x4,
> > +	S5M8767_DVS_BUCK_RAMP_10	= 0x9,
> > +	S5M8767_DVS_BUCK_RAMP_12_5	= 0xb,
> > +	S5M8767_DVS_BUCK_RAMP_25	= 0xd,
> > +	S5M8767_DVS_BUCK_RAMP_50	= 0xe,
> > +	S5M8767_DVS_BUCK_RAMP_100	= 0xf,
> > +};
> 
> Why do these have to be enums?

There is no special need. I chose enum because it is a kind of
enumeration of all valid values for BUCK_RAMP field (valid according to
datasheet). If you prefer #define then I'll change it.


Best regards,
Krzysztof



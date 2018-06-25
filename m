Return-Path: <vkoul@kernel.org>
Date: Mon, 25 Jun 2018 11:44:17 +0530
From: Vinod <vkoul@kernel.org>
Subject: Re: [PATCH v2 4/5] input: pm8941-pwrkey: Abstract register offsets
 and event code
Message-ID: <20180625061417.GB2404@vkoul-mobl>
References: <20180625050938.4700-1-vkoul@kernel.org>
 <20180625050938.4700-5-vkoul@kernel.org>
 <20180625061152.GB1376@tuxbook-pro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180625061152.GB1376@tuxbook-pro>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-input@vger.kernel.org, linux-pm@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 24-06-18, 23:11, Bjorn Andersson wrote:

> >  struct pm8941_pwrkey {
> >  	struct device *dev;
> > @@ -52,6 +57,9 @@ struct pm8941_pwrkey {
> >  
> >  	unsigned int revision;
> >  	struct notifier_block reboot_notifier;
> > +
> > +	unsigned int code;
> 
> I still would like this to be a u32, as you pass it by reference to a
> function taking a u32.

somehow missed this one, will update and send v3 with your ACK

> Apart from that, this looks good and you have my:
> 
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
-- 
~Vinod

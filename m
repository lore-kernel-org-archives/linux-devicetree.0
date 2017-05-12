From: Leo Yan <leo.yan@linaro.org>
Subject: Re: [PATCH v9 7/9] coresight: add support for CPU debug module
Date: Fri, 12 May 2017 08:10:11 +0800
Message-ID: <20170512001010.GA13845@leoy-ThinkPad-T440>
References: <1494298202-6739-1-git-send-email-leo.yan@linaro.org>
 <1494298202-6739-8-git-send-email-leo.yan@linaro.org>
 <20170511171232.GA21765@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170511171232.GA21765@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Wei Xu <xuwei5@hisilicon.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, Mike Leach <mike.leach@linaro.org>, Sudeep Holla <sudeep.holla@arm.com>
List-Id: devicetree@vger.kernel.org

On Thu, May 11, 2017 at 11:12:32AM -0600, Mathieu Poirier wrote:

[...]

> > +static int debug_probe(struct amba_device *adev, const struct amba_id *id)
> > +{
> > +	void __iomem *base;
> > +	struct device *dev = &adev->dev;
> > +	struct debug_drvdata *drvdata;
> > +	struct resource *res = &adev->res;
> > +	struct device_node *np = adev->dev.of_node;
> > +	int ret;
> > +
> > +	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
> > +	if (!drvdata)
> > +		return -ENOMEM;
> > +
> > +	drvdata->cpu = np ? of_coresight_get_cpu(np) : 0;
> > +	if (per_cpu(debug_drvdata, drvdata->cpu)) {
> > +		dev_err(dev, "CPU%d drvdata has been initialized, "
> 
> s/"has been"/"has already been"
> 
> That way it really look like an error message.

Will fix.

> Also debug_probe() uses dev_xyz() but everywhere else in the driver it is
> pr_xyz() - any specific reason for that?  I suggest moving to dev_xyz().

Some logs are shared for all device instances, so I think should use
pr_xyz(); will spin a new version to change other places to use
dev_xyz() if the logs are for specific device instance.

> Otherwise things look good.

[...]

Thanks,
Leo Yan

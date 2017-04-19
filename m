From: Leo Yan <leo.yan@linaro.org>
Subject: Re: [PATCH v6 6/8] coresight: add support for CPU debug module
Date: Wed, 19 Apr 2017 22:28:12 +0800
Message-ID: <20170419142812.GA16160@leoy-linaro>
References: <1491485461-22800-1-git-send-email-leo.yan@linaro.org>
 <1491485461-22800-7-git-send-email-leo.yan@linaro.org>
 <5c5cb6f8-1dcb-8a9d-1605-c006656005eb@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5c5cb6f8-1dcb-8a9d-1605-c006656005eb@arm.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Suzuki K Poulose <Suzuki.Poulose@arm.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Wei Xu <xuwei5@hisilicon.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, Mike Leach <mike.leach@linaro.org>, Sudeep Holla <sudeep.holla@arm.com>
List-Id: devicetree@vger.kernel.org

Hi Suzuki,

On Wed, Apr 19, 2017 at 02:23:04PM +0100, Suzuki K Poulose wrote:
> Hi Leo,
> 
> This version looks good to me. I have two minor comments below.

Thanks for reviewing. Will take the suggestions. Just check a bit for
last comment.

[...]

> >+static int debug_probe(struct amba_device *adev, const struct amba_id *id)
> >+{
> >+	void __iomem *base;
> >+	struct device *dev = &adev->dev;
> >+	struct debug_drvdata *drvdata;
> >+	struct resource *res = &adev->res;
> >+	struct device_node *np = adev->dev.of_node;
> >+	int ret;
> >+
> >+	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
> >+	if (!drvdata)
> >+		return -ENOMEM;
> >+
> >+	drvdata->cpu = np ? of_coresight_get_cpu(np) : 0;
> >+	if (per_cpu(debug_drvdata, drvdata->cpu)) {
> >+		dev_err(dev, "CPU%d drvdata has been initialized\n",
> >+			drvdata->cpu);
> 
> May be we could warn about a possible issue in the DT ?

So can I understand the suggestion is to add warning in function
of_coresight_get_cpu() when cannot find CPU number, and here directly
bail out?

Thanks,
Leo Yan

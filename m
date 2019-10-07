From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v4 2/5] soc: qcom: smd-rpm: Create RPM interconnect proxy
 child device
Date: Sun, 6 Oct 2019 22:28:55 -0700
Message-ID: <20191007052855.GE2999@tuxbook-pro>
References: <20190613151323.10850-1-georgi.djakov@linaro.org>
 <20190613151323.10850-3-georgi.djakov@linaro.org>
 <20191007020152.GA16902@onstation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191007020152.GA16902@onstation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Masney <masneyb@onstation.org>
Cc: Georgi Djakov <georgi.djakov@linaro.org>, robh+dt@kernel.org, agross@kernel.org, vkoul@kernel.org, evgreen@chromium.org, daidavid1@codeaurora.org, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sun 06 Oct 19:01 PDT 2019, Brian Masney wrote:

> On Thu, Jun 13, 2019 at 06:13:20PM +0300, Georgi Djakov wrote:
> > Register a platform device to handle the communication of bus bandwidth
> > requests with the remote processor. The interconnect proxy device is part
> > of this remote processor (RPM) hardware. Let's create a icc-smd-rpm proxy
> > child device to represent the bus throughput functionality that is provided
> > by the RPM.
> > 
> > Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
> 
> Reviewed-by: Brian Masney <masneyb@onstation.org>
> Tested-by: Brian Masney <masneyb@onstation.org> # msm8974
> 
> I think this patch may have fell through the cracks since I don't see
> it in linux-next. The qcs404 patches in this series were merged.
> 

Yes, I was expecting Georgi to pick the entire series through his tree,
but see now that I didn't actually ask Georgi to do so. Sorry about
that.

I picked the this and the dts patch last week, so if it's not in
linux-next yet it should show up in the next one.

Thanks,
Bjorn

> Brian
> 
> > ---
> > 
> > v4:
> > - Return error if platform_device_register_data() fails
> > - Remove platform_set_drvdata() on the child device.
> > 
> > v3:
> > - New patch.
> > 
> >  drivers/soc/qcom/smd-rpm.c | 17 ++++++++++++++++-
> >  1 file changed, 16 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/soc/qcom/smd-rpm.c b/drivers/soc/qcom/smd-rpm.c
> > index fa9dd12b5e39..34cdd638a6c1 100644
> > --- a/drivers/soc/qcom/smd-rpm.c
> > +++ b/drivers/soc/qcom/smd-rpm.c
> > @@ -19,12 +19,14 @@
> >  /**
> >   * struct qcom_smd_rpm - state of the rpm device driver
> >   * @rpm_channel:	reference to the smd channel
> > + * @icc:		interconnect proxy device
> >   * @ack:		completion for acks
> >   * @lock:		mutual exclusion around the send/complete pair
> >   * @ack_status:		result of the rpm request
> >   */
> >  struct qcom_smd_rpm {
> >  	struct rpmsg_endpoint *rpm_channel;
> > +	struct platform_device *icc;
> >  	struct device *dev;
> >  
> >  	struct completion ack;
> > @@ -193,6 +195,7 @@ static int qcom_smd_rpm_callback(struct rpmsg_device *rpdev,
> >  static int qcom_smd_rpm_probe(struct rpmsg_device *rpdev)
> >  {
> >  	struct qcom_smd_rpm *rpm;
> > +	int ret;
> >  
> >  	rpm = devm_kzalloc(&rpdev->dev, sizeof(*rpm), GFP_KERNEL);
> >  	if (!rpm)
> > @@ -205,11 +208,23 @@ static int qcom_smd_rpm_probe(struct rpmsg_device *rpdev)
> >  	rpm->rpm_channel = rpdev->ept;
> >  	dev_set_drvdata(&rpdev->dev, rpm);
> >  
> > -	return of_platform_populate(rpdev->dev.of_node, NULL, NULL, &rpdev->dev);
> > +	rpm->icc = platform_device_register_data(&rpdev->dev, "icc_smd_rpm", -1,
> > +						 NULL, 0);
> > +	if (IS_ERR(rpm->icc))
> > +		return PTR_ERR(rpm->icc);
> > +
> > +	ret = of_platform_populate(rpdev->dev.of_node, NULL, NULL, &rpdev->dev);
> > +	if (ret)
> > +		platform_device_unregister(rpm->icc);
> > +
> > +	return ret;
> >  }
> >  
> >  static void qcom_smd_rpm_remove(struct rpmsg_device *rpdev)
> >  {
> > +	struct qcom_smd_rpm *rpm = dev_get_drvdata(&rpdev->dev);
> > +
> > +	platform_device_unregister(rpm->icc);
> >  	of_platform_depopulate(&rpdev->dev);
> >  }
> >  

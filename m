From: Arun Kumar Neelakantam <aneela@codeaurora.org>
Subject: Re: [PATCH 2/3] soc: qcom: Add AOSS QMP communication driver
Date: Thu, 3 Jan 2019 23:18:39 +0530
Message-ID: <49070dc1-2201-1ea7-b9b6-f98663e2cfd2@codeaurora.org>
References: <20181112080557.22698-1-bjorn.andersson@linaro.org>
 <20181112080557.22698-3-bjorn.andersson@linaro.org>
 <ce0d4d55-464c-1502-9dc1-b3a495c86aee@codeaurora.org>
 <20181226202830.GE9704@minitux>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181226202830.GE9704@minitux>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


On 12/27/2018 1:58 AM, Bjorn Andersson wrote:
> On Tue 20 Nov 04:22 PST 2018, Arun Kumar Neelakantam wrote:
>
> Thanks for the review Arun.
>
>> On 11/12/2018 1:35 PM, Bjorn Andersson wrote:
> [..]
>>> +int qmp_send(struct qmp *qmp, const void *data, size_t len)
>>> +{
>>> +	int ret;
>>> +
>>> +	if (WARN_ON(len + sizeof(u32) > qmp->size)) {
>>> +		dev_err(qmp->dev, "message too long\n");
>>> +		return -EINVAL;
>>> +	}
>>> +
>>> +	if (WARN_ON(len % sizeof(u32))) {
>>> +		dev_err(qmp->dev, "message not 32-bit aligned\n");
>>> +		return -EINVAL;
>>> +	}
>>> +
>>> +	mutex_lock(&qmp->tx_lock);
>>> +
>>> +	if (!qmp_message_empty(qmp)) {
>>> +		dev_err(qmp->dev, "mailbox left busy\n");
>>> +		ret = -EINVAL;
>> should it be -EBUSY ?
> That makes more sense.
>
>> And qmp_messge_empty will be done either by remote if it process the data
>> else by this driver in TIMEOUT case, so does we need this check for every TX
>> ? I think we can just reset to Zero once in open time.
> Didn't think about that, should we really make the QMP link ready again
> when we get a timeout? Can we expect that the firmware of the remote
> side is ready to serve future messages?
>
>
> Should we keep this check and remove the writel() below?
I prefer we can just remove this check and keep writel() below same as 
down stream.
>
>>> +		goto out_unlock;
>>> +	}
>>> +
>>> +	/* The message RAM only implements 32-bit accesses */
>>> +	__iowrite32_copy(qmp->msgram + qmp->offset + sizeof(u32),
>>> +			 data, len / sizeof(u32));
>>> +	writel(len, qmp->msgram + qmp->offset);
>>> +	qmp_kick(qmp);
>>> +
>>> +	ret = wait_event_interruptible_timeout(qmp->event,
>>> +					       qmp_message_empty(qmp), HZ);
>>> +	if (!ret) {
>>> +		dev_err(qmp->dev, "ucore did not ack channel\n");
>>> +		ret = -ETIMEDOUT;
>>> +
>>> +		writel(0, qmp->msgram + qmp->offset);
>>> +	} else {
>>> +		ret = 0;
>>> +	}
>>> +
>>> +out_unlock:
>>> +	mutex_unlock(&qmp->tx_lock);
>>> +
>>> +	return ret;
>>> +}
> Regards,
> Bjorn

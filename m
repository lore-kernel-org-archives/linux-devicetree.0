From: Suman Anna <s-anna@ti.com>
Subject: Re: [PATCH v3 2/3] remoteproc/keystone: Add a remoteproc driver for
 Keystone 2 DSPs
Date: Mon, 26 Jun 2017 15:20:55 -0500
Message-ID: <1f8d65fc-0acc-499e-a98e-953dce60750f@ti.com>
References: <20170613234513.7624-1-s-anna@ti.com>
 <20170613234513.7624-3-s-anna@ti.com> <20170625201545.GA26155@builder>
 <1ccd9273-0fde-4241-6d99-1d03be2f5b57@ti.com>
 <20170626200608.GG18666@tuxbook>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170626200608.GG18666@tuxbook>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Mark Rutland <mark.rutland@arm.com>, Grygorii Strashko <grygorii.strashko@ti.com>, devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, "Andrew F.
 Davis" <afd@ti.com>, Rob Herring <robh+dt@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>, linux-arm-kernel@lists.infradead.org, Sam Nelson <sam.nelson@ti.com>
List-Id: devicetree@vger.kernel.org

On 06/26/2017 03:06 PM, Bjorn Andersson wrote:
> On Mon 26 Jun 08:54 PDT 2017, Suman Anna wrote:
> 
>> Hi Bjorn,
>>
>> On 06/25/2017 03:15 PM, Bjorn Andersson wrote:
>>> On Tue 13 Jun 16:45 PDT 2017, Suman Anna wrote:
>>>
>>>> +static int keystone_rproc_start(struct rproc *rproc)
>>>> +{
>>>> +	struct keystone_rproc *ksproc = rproc->priv;
>>>> +	int ret;
>>>> +
>>>> +	INIT_WORK(&ksproc->workqueue, handle_event);
>>>> +
>>>> +	ret = request_irq(ksproc->irq_ring, keystone_rproc_vring_interrupt, 0,
>>>> +			  dev_name(ksproc->dev), ksproc);
>>>> +	if (ret) {
>>>> +		dev_err(ksproc->dev, "failed to enable vring interrupt, ret = %d\n",
>>>> +			ret);
>>>> +		goto out;
>>>> +	}
>>>> +
>>>> +	ret = request_irq(ksproc->irq_fault, keystone_rproc_exception_interrupt,
>>>> +			  0, dev_name(ksproc->dev), ksproc);
>>>> +	if (ret) {
>>>> +		dev_err(ksproc->dev, "failed to enable exception interrupt, ret = %d\n",
>>>> +			ret);
>>>> +		goto free_vring_irq;
>>>> +	}
>>>
>>> I do prefer that your request any resources during probe() and
>>> potentially enable/disable them here. If below concern about using a
>>> GPIO driver is cleared already I'll take it as is though.
>>>
>>> [..]
>>>> +static void keystone_rproc_kick(struct rproc *rproc, int vqid)
>>>> +{
>>>> +	struct keystone_rproc *ksproc = rproc->priv;
>>>> +
>>>> +	if (WARN_ON(ksproc->kick_gpio < 0))
>>>> +		return;
>>>> +
>>>> +	gpio_set_value(ksproc->kick_gpio, 1);
>>>> +}
>>>> +
>>>
>>> This doesn't sound like a gpio-controller and the GPIO maintainer did
>>> reject an attempt by me to use the GPIO framework to abstract a similar
>>> thing. Do you already have this driver upstream or have you clarified
>>> with the maintainer that the GPIO framework is an acceptable abstraction
>>> for this?
>>
>> Yeah, this has been upstream since quite some time. See commit
>> 2134cb997f2f ("gpio: syscon: reuse for keystone 2 socs").
>>
> 
> Okay, sounds good. I have merged the series.
> 
> 
> I still would like to have resources allocated at probe() time, so I
> would appreciate a follow up patch moving the request_irq()s to probe,
> per above comment (but we can take that after v4.13).

OK thanks. This is a common theme across all the remoteproc drivers
supporting rpmsg, and I definitely need to disable them in probe since
the boot or the virtio/rpmsg devices are not guaranteed to be present in
the probe.

regards
Suman

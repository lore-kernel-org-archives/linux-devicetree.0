From: Hong jinkun <jinkun.hong@rock-chips.com>
Subject: Re: [PATCH v7 1/3] power-domain: add power domain drivers for Rockchip
 platform
Date: Wed, 29 Oct 2014 09:00:09 +0800
Message-ID: <54503C19.9060607@rock-chips.com>
References: <1414135761-3406-1-git-send-email-jinkun.hong@rock-chips.com> <1414135761-3406-2-git-send-email-jinkun.hong@rock-chips.com> <20141024164431.GE19933@dtor-ws> <20141027233904.GD7594@dtor-ws>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20141027233904.GD7594@dtor-ws>
Sender: linux-doc-owner@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org, Russell King <linux@arm.linux.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, dianders@chromium.org, Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org, Ulf Hansson <ulf.hansson@linaro.org>, Jack Dai <jack.dai@rock-chips.com>
List-Id: devicetree@vger.kernel.org


=E5=9C=A8 2014/10/28 7:39, Dmitry Torokhov =E5=86=99=E9=81=93:
> On Fri, Oct 24, 2014 at 09:44:31AM -0700, Dmitry Torokhov wrote:
>> Hi Jinkun,
>>
>> On Fri, Oct 24, 2014 at 12:29:19AM -0700, jinkun.hong wrote:
>>> +static int rockchip_pd_power(struct rockchip_domain *pd, bool powe=
r_on)
>>> +{
>>> +	int ret =3D 0;
>>> +	struct rockchip_dev_entry *de;
>>> +
>>> +	mutex_lock(&pd->dev_lock);
>>> +	/* no clk, set power domain will fail */
>>> +	if (list_empty(&pd->dev_list)) {
>>> +		pr_err("%s: no devices in %s power domain\n", __func__,
>>> +			pd->base.name);
>>> +		goto out;
>>> +	}
>>> +
>>> +	list_for_each_entry(de, &pd->dev_list, node) {
>>> +		pm_clk_resume(de->dev);
>>> +	}
>>> +
>>> +	ret =3D rockchip_pmu_set_power_domain(pd, power_on);
>>> +
>>> +	list_for_each_entry(de, &pd->dev_list, node) {
>>> +		pm_clk_suspend(de->dev);
>>> +	}
>>> +out:
>>> +	mutex_unlock(&pd->dev_lock);
>>> +	return ret;
>>> +}
>> For my education, could you please tell me why we need to enable all
>> clocks of all devices in a power domain when we are talking to the P=
MU
>> and then turn them immediately off?
Sorry for late reply.RK3288 reset circuit are first asynchronous reset=20
and then sync revoked.
All reset revocation actions are needed to synchronize the clocks.
If there is no clock open, power_up reset will cause the corresponding=20
reset can not be undone, there will be risks.
>> Would not we want to enable clocks
>> in start()) callbacks, like Ulf mentioned?
Can you tell me which one patch it. Thank you!
> Jinkun, any update on this question?
>
> Thanks.
>



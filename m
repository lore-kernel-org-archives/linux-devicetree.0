From: Hong jinkun <jinkun.hong@rock-chips.com>
Subject: Re: [PATCH v4 1/3] power-domain: add power domain drivers for Rockchip
 platform
Date: Wed, 22 Oct 2014 11:40:48 +0800
Message-ID: <54472740.2000006@rock-chips.com>
References: <1413795824-3453-1-git-send-email-jinkun.hong@rock-chips.com>	<1413795824-3453-2-git-send-email-jinkun.hong@rock-chips.com> <7hppdme8d6.fsf@deeprootsystems.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=gbk;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <7hppdme8d6.fsf@deeprootsystems.com>
Sender: linux-doc-owner@vger.kernel.org
To: Kevin Hilman <khilman@kernel.org>
Cc: linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org, Russell King <linux@arm.linux.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, dianders@chromium.org, Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org, Ulf Hansson <ulf.hansson@linaro.org>, Jack Dai <jack.dai@rock-chips.com>
List-Id: devicetree@vger.kernel.org


=D4=DA 2014/10/21 5:31, Kevin Hilman =D0=B4=B5=C0:
> "jinkun.hong" <jinkun.hong@rock-chips.com> writes:
>
>> From: "jinkun.hong" <jinkun.hong@rock-chips.com>
>>
>> Add power domain drivers based on generic power domain for Rockchip =
platform,
>> and support RK3288.
>>
>> Signed-off-by: Jack Dai <jack.dai@rock-chips.com>
>> Signed-off-by: jinkun.hong <jinkun.hong@rock-chips.com>
> [...]
>
>> +static int rockchip_pmu_set_idle_request(struct rockchip_domain *pd=
,
>> +					 bool idle)
>> +{
>> +	u32 idle_mask =3D BIT(pd->idle_shift);
>> +	u32 idle_target =3D idle << (pd->idle_shift);
>> +	u32 ack_mask =3D BIT(pd->ack_shift);
>> +	u32 ack_target =3D idle << (pd->ack_shift);
>> +	unsigned int mask =3D BIT(pd->req_shift);
>> +	unsigned int val;
>> +	unsigned long flags;
>> +
>> +	spin_lock_irqsave(&pd->idle_lock, flags);
>> +	val =3D (idle) ? mask : 0;
>> +	regmap_update_bits(pd->regmap_pmu, REQ_OFFSET, mask, val);
>> +	dsb();
> A summary of the locking and barriers here (or in changelog) would be
> helpful for reviewers to verify you're protecting what you need to
> protect.
>
>> +	do {
>> +		regmap_read(pd->regmap_pmu, ACK_OFFSET, &val);
>> +	} while ((val & ack_mask) !=3D ack_target);
>> +
>> +	do {
>> +		regmap_read(pd->regmap_pmu, IDLE_OFFSET, &val);
>> +	} while ((val & idle_mask) !=3D idle_target);
>> +
>> +	spin_unlock_irqrestore(&pd->idle_lock, flags);
> These IRQ-disabled while loops look like opportunities to lockup the
> system.  Maybe add a timeout or a maximum number of tries?
Ok,I will add a timeout in new version.
>> +	return 0;
>> +}
> Kevin
>
>
>
Thank you for your review.


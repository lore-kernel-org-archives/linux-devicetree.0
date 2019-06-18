From: Nisha Kumari <nishakumari@codeaurora.org>
Subject: Re: [PATCH 4/4] regulator: adding interrupt handling in labibb
 regulator
Date: Tue, 18 Jun 2019 11:53:57 +0530
Message-ID: <8294996d-84ee-dff2-7369-00c17348a09c@codeaurora.org>
References: <1560337252-27193-1-git-send-email-nishakumari@codeaurora.org>
 <1560337252-27193-5-git-send-email-nishakumari@codeaurora.org>
 <20190613172738.GO5316@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190613172738.GO5316@sirena.org.uk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: bjorn.andersson@linaro.org, robh+dt@kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, agross@kernel.org, lgirdwood@gmail.com, mark.rutland@arm.com, david.brown@linaro.org, linux-kernel@vger.kernel.org, kgunda@codeaurora.org, rnayak@codeaurora.org
List-Id: devicetree@vger.kernel.org


On 6/13/2019 10:57 PM, Mark Brown wrote:
> On Wed, Jun 12, 2019 at 04:30:52PM +0530, Nisha Kumari wrote:
>
>> +static void labibb_sc_err_recovery_work(void *_labibb)
>> +{
>> +	int ret;
>> +	struct qcom_labibb *labibb = (struct qcom_labibb *)_labibb;
>> +
>> +	labibb->ibb_vreg.vreg_enabled = 0;
>> +	labibb->lab_vreg.vreg_enabled = 0;
>> +
>> +	ret = qcom_ibb_regulator_enable(labibb->lab_vreg.rdev);
> The driver should *never* enable the regulator itself, it should only do
> this if the core told it to.
Ok, I will change it
>
>> +	/*
>> +	 * The SC(short circuit) fault would trigger PBS(Portable Batch
>> +	 * System) to disable regulators for protection. This would
>> +	 * cause the SC_DETECT status being cleared so that it's not
>> +	 * able to get the SC fault status.
>> +	 * Check if LAB/IBB regulators are enabled in the driver but
>> +	 * disabled in hardware, this means a SC fault had happened
>> +	 * and SCP handling is completed by PBS.
>> +	 */
> Let the core worry about this, the driver should just report the problem
> to the core like all other devices do (and this driver doesn't...).

Ok


Thanks,

Nisha

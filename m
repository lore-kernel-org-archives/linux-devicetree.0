From: Lina Iyer <ilina@codeaurora.org>
Subject: Re: [PATCH RESEND RFC 2/4] drivers: pinctrl: qcom: add wakeup gpio
 map for sdm845
Date: Wed, 1 Aug 2018 14:04:05 -0600
Message-ID: <20180801200405.GB6422@codeaurora.org>
References: <20180801020021.9782-1-ilina@codeaurora.org>
 <20180801020021.9782-3-ilina@codeaurora.org>
 <8636vyxyub.wl-marc.zyngier@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <8636vyxyub.wl-marc.zyngier@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: swboyd@chromium.org, evgreen@chromium.org, linus.walleij@linaro.org, bjorn.andersson@linaro.org, rplsssn@codeaurora.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, rnayak@codeaurora.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Aug 01 2018 at 02:42 -0600, Marc Zyngier wrote:
>On Wed, 01 Aug 2018 03:00:19 +0100,
>Lina Iyer <ilina@codeaurora.org> wrote:
>>
>> Add GPIO to PDC pin map for the SDM845 SoC.
>>
>> Signed-off-by: Lina Iyer <ilina@codeaurora.org>
>> ---
>>  drivers/pinctrl/qcom/pinctrl-sdm845.c | 76 +++++++++++++++++++++++++++
>>  1 file changed, 76 insertions(+)
>>
>> diff --git a/drivers/pinctrl/qcom/pinctrl-sdm845.c b/drivers/pinctrl/qcom/pinctrl-sdm845.c
>> index 2ab7a8885757..e93660922dc2 100644
>> --- a/drivers/pinctrl/qcom/pinctrl-sdm845.c
>> +++ b/drivers/pinctrl/qcom/pinctrl-sdm845.c
>> @@ -1277,6 +1277,80 @@ static const struct msm_pingroup sdm845_groups[] = {
>>  	UFS_RESET(ufs_reset, 0x99f000),
>>  };
>>
>> +static struct msm_pinctrl_pdc_map sdm845_wakeup_gpios[] = {
>
>[huge array]
>
>> +};
>
>Why isn't that array part of the DT? I'd expect other SoCs to
>eventually use a similar mechanism, no?
>
I agree and it should be.

One place I am thinking is to add it to the DT definition of PDC
controller as a data argument -

	tlmm: pinctrl@000000{
	[...]
		interrupts-extended = <&pdc 30 IRQ_TYPE_LEVEL_HIGH 1>,
                      <&pdc 31 IRQ_TYPE_LEVEL_HIGH 3>,
		      <&pdc 32 IRQ_TYPE_LEVEL_HIGH 5>,
						   ^
						   |--- Provide the GPIO
						   for the PDC pin here.
	};

	pdc: interrupt-controller@b220000 {
		compatible = "qcom,sdm845-pdc";
		reg = <0xb220000 0x30000>;
		qcom,pdc-ranges = <0 512 94>, <94 641 15>, <115 662 7>;
		#interrupt-cells = <3>; <-------- Increase this from 2 ?
		interrupt-parent = <&intc>;
		interrupt-controller;
	};

Would that be acceptable?

Thanks,
Lina

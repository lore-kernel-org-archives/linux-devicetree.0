From: cang@codeaurora.org
Subject: Re: [PATCH v6 1/3] phy: Update PHY power control sequence
Date: Thu, 14 Jun 2018 09:14:30 +0800
Message-ID: <c891f513544f26eec480ebe91f257617@codeaurora.org>
References: <20180529043751.10580-1-cang@codeaurora.org>
 <20180529043751.10580-2-cang@codeaurora.org>
 <261d2697-ed21-1562-0e6b-f9858108f2b4@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <261d2697-ed21-1562-0e6b-f9858108f2b4@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Vivek Gautam <vivek.gautam@codeaurora.org>
Cc: subhashj@codeaurora.org, asutoshd@codeaurora.org, mgautam@codeaurora.org, kishon@ti.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 2018-06-12 19:34, Vivek Gautam wrote:
> Hi Can,
> 
> 
> On 5/29/2018 10:07 AM, Can Guo wrote:
>> All PHYs should be powered on before register configuration starts. 
>> And
>> only PCIe PHYs need an extra power control before deasserts reset 
>> state.
>> 
>> Signed-off-by: Can Guo <cang@codeaurora.org>
>> ---
>>   drivers/phy/qualcomm/phy-qcom-qmp.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>> 
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c 
>> b/drivers/phy/qualcomm/phy-qcom-qmp.c
>> index 97ef942..f779b0f 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-qmp.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
>> @@ -982,6 +982,8 @@ static int qcom_qmp_phy_com_init(struct qcom_qmp 
>> *qmp)
>>   	if (cfg->has_phy_com_ctrl)
>>   		qphy_setbits(serdes, cfg->regs[QPHY_COM_POWER_DOWN_CONTROL],
>>   			     SW_PWRDN);
>> +	else
>> +		qphy_setbits(pcs, QPHY_POWER_DOWN_CONTROL, cfg->pwrdn_ctrl);
> 
> No definition of 'pcs' in this function. You are doing that in the 
> second patch.
> But, we should add this definition here.
> 
> Also instead of having the change like this:
> 
> +	struct qmp_phy *qphy = qmp->phys[0];
>  	void __iomem *serdes = qmp->serdes;
> +	void __iomem *pcs = qphy->pcs;
> 
> Let's pass 'struct qmp_phy' to qcom_qmp_phy_com_init(), and then get
> 'struct qcom_qmp' and 'void __iomem *pcs' from that.
> 
> So,
> 
> -static int qcom_qmp_phy_com_init(struct qcom_qmp *qmp)
> +static int qcom_qmp_phy_com_init(struct qmp_phy *qphy)
>  {
> +       struct qcom_qmp *qmp = qphy->qmp;
>         const struct qmp_phy_cfg *cfg = qmp->cfg;
>         void __iomem *serdes = qmp->serdes;
>         void __iomem *dp_com = qmp->dp_com;
> +       void __iomem *pcs = qphy->pcs;
> 
> and
> 
> -       ret = qcom_qmp_phy_com_init(qmp);
> +       ret = qcom_qmp_phy_com_init(qphy);
> 
> That looks cleaner than extracting from the 0th phys.
> 
> BRs
> Vivek

Sure Vivek

>>     	if (cfg->has_phy_dp_com_ctrl) {
>>   		qphy_setbits(dp_com, QPHY_V3_DP_COM_POWER_DOWN_CTRL,
>> @@ -1127,7 +1129,8 @@ static int qcom_qmp_phy_init(struct phy *phy)
>>   	 * Pull out PHY from POWER DOWN state.
>>   	 * This is active low enable signal to power-down PHY.
>>   	 */
>> -	qphy_setbits(pcs, QPHY_POWER_DOWN_CONTROL, cfg->pwrdn_ctrl);
>> +	if (cfg->type == PHY_TYPE_PCIE)
>> +		qphy_setbits(pcs, QPHY_POWER_DOWN_CONTROL, cfg->pwrdn_ctrl);
>>     	if (cfg->has_pwrdn_delay)
>>   		usleep_range(cfg->pwrdn_delay_min, cfg->pwrdn_delay_max);

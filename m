From: cang@codeaurora.org
Subject: Re: [PATCH v6 1/3] phy: Update PHY power control sequence
Date: Tue, 12 Jun 2018 08:27:34 +0800
Message-ID: <7b5f62c60cc3a2c3b9d7c4e99dcde01b@codeaurora.org>
References: <20180529043751.10580-1-cang@codeaurora.org>
 <20180529043751.10580-2-cang@codeaurora.org>
 <9954c362-c144-9e5f-8b06-687c856ed25a@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <9954c362-c144-9e5f-8b06-687c856ed25a@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Manu Gautam <mgautam@codeaurora.org>
Cc: subhashj@codeaurora.org, asutoshd@codeaurora.org, vivek.gautam@codeaurora.org, kishon@ti.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 2018-06-08 14:45, Manu Gautam wrote:
> Hi,
> 
> On 5/29/2018 10:07 AM, Can Guo wrote:
>> All PHYs should be powered on before register configuration starts. 
>> And
>> only PCIe PHYs need an extra power control before deasserts reset 
>> state.
>> 
>> Signed-off-by: Can Guo <cang@codeaurora.org>
>> ---
>>  drivers/phy/qualcomm/phy-qcom-qmp.c | 5 ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
>> 
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c 
>> b/drivers/phy/qualcomm/phy-qcom-qmp.c
>> index 97ef942..f779b0f 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-qmp.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
>> @@ -982,6 +982,8 @@ static int qcom_qmp_phy_com_init(struct qcom_qmp 
>> *qmp)
>>  	if (cfg->has_phy_com_ctrl)
>>  		qphy_setbits(serdes, cfg->regs[QPHY_COM_POWER_DOWN_CONTROL],
>>  			     SW_PWRDN);
>> +	else
>> +		qphy_setbits(pcs, QPHY_POWER_DOWN_CONTROL, cfg->pwrdn_ctrl);
> 
> We should power-up PHYs after following dp_com_ctrl programming which
> powers-off USB-DP combo PHY when it brings DP_COM block out of reset 
> reset.
> 
> 

Sure Manu

>> 
>>  	if (cfg->has_phy_dp_com_ctrl) {
>>  		qphy_setbits(dp_com, QPHY_V3_DP_COM_POWER_DOWN_CTRL,
>> @@ -1127,7 +1129,8 @@ static int qcom_qmp_phy_init(struct phy *phy)
>>  	 * Pull out PHY from POWER DOWN state.
>>  	 * This is active low enable signal to power-down PHY.
>>  	 */
>> -	qphy_setbits(pcs, QPHY_POWER_DOWN_CONTROL, cfg->pwrdn_ctrl);
>> +	if (cfg->type == PHY_TYPE_PCIE)
>> +		qphy_setbits(pcs, QPHY_POWER_DOWN_CONTROL, cfg->pwrdn_ctrl);
>> 
>>  	if (cfg->has_pwrdn_delay)
>>  		usleep_range(cfg->pwrdn_delay_min, cfg->pwrdn_delay_max);

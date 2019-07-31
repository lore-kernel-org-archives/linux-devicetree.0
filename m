From: Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
Subject: Re: [PATCH v3 02/14] mbox: qcom: add APCS child device for QCS404
Date: Wed, 31 Jul 2019 16:10:59 +0200
Message-ID: <5111bc6e-4155-e99e-71b2-1aac3610b71e@linaro.org>
References: <20190625164733.11091-1-jorge.ramirez-ortiz@linaro.org>
 <20190625164733.11091-3-jorge.ramirez-ortiz@linaro.org>
 <20190711144424.GD7234@tuxbook-pro>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190711144424.GD7234@tuxbook-pro>
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
Cc: mark.rutland@arm.com, heiko@sntech.de, mturquette@baylibre.com, will.deacon@arm.com, david.brown@linaro.org, linux-clk@vger.kernel.org, jassisinghbrar@gmail.com, sibis@codeaurora.org, jagan@amarulasolutions.com, devicetree@vger.kernel.org, niklas.cassel@linaro.org, arnd@arndb.de, linux-arm-msm@vger.kernel.org, olof@lixom.net, robh+dt@kernel.org, horms+renesas@verge.net.au, linux-arm-kernel@lists.infradead.org, sboyd@kernel.org, linux-kernel@vger.kernel.org, amit.kucheria@linaro.org, vkoul@kernel.org, khasim.mohammed@linaro.org, enric.balletbo@collabora.com, georgi.djakov@linaro.org
List-Id: devicetree@vger.kernel.org

On 7/11/19 16:44, Bjorn Andersson wrote:
> On Tue 25 Jun 09:47 PDT 2019, Jorge Ramirez-Ortiz wrote:
> 
>> There is clock controller functionality in the APCS hardware block of
>> qcs404 devices similar to msm8916.
>>
>> Co-developed-by: Niklas Cassel <niklas.cassel@linaro.org>
>> Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
>> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
>> ---
>>  drivers/mailbox/qcom-apcs-ipc-mailbox.c | 18 ++++++++++--------
>>  1 file changed, 10 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
>> index 705e17a5479c..a05dc3aabac7 100644
>> --- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
>> +++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
>> @@ -89,16 +89,18 @@ static int qcom_apcs_ipc_probe(struct platform_device *pdev)
>>  		return ret;
>>  	}
>>  
>> -	if (of_device_is_compatible(np, "qcom,msm8916-apcs-kpss-global")) {
>> -		apcs->clk = platform_device_register_data(&pdev->dev,
>> -							  "qcom-apcs-msm8916-clk",
>> -							  -1, NULL, 0);
>> -		if (IS_ERR(apcs->clk))
>> -			dev_err(&pdev->dev, "failed to register APCS clk\n");
>> -	}
>> -
>>  	platform_set_drvdata(pdev, apcs);
>>  
>> +	if (!of_device_is_compatible(np, "qcom,msm8916-apcs-kpss-global") &&
>> +	    !of_device_is_compatible(np, "qcom,qcs404-apcs-apps-global"))
> 
> If the remainder of the function was a long snippet I think this would
> motivate the somewhat unusual early return. But I think it would be
> cleaner to just add to the existing conditional.

sure can do that. I dont agree (I wouldnt have bothered otherwise :))
but will do

> 
> Regards,
> Bjorn
> 
>> +		return 0;
>> +
>> +	apcs->clk = platform_device_register_data(&pdev->dev,
>> +						  "qcom-apcs-msm8916-clk",
>> +						  -1, NULL, 0);
>> +	if (IS_ERR(apcs->clk))
>> +		dev_err(&pdev->dev, "failed to register APCS clk\n");
>> +
>>  	return 0;
>>  }
>>  
>> -- 
>> 2.21.0
>>
> 

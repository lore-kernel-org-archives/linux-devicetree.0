From: Vaibhav Hiremath <vaibhav.hiremath@linaro.org>
Subject: Re: [PATCH-v2 5/5] mfd: 88pm800: Add support for clk subdevice
Date: Tue, 25 Aug 2015 14:01:02 +0530
Message-ID: <55DC27C6.3020500@linaro.org>
References: <1440442594-3102-1-git-send-email-vaibhav.hiremath@linaro.org>
 <1440442594-3102-7-git-send-email-vaibhav.hiremath@linaro.org>
 <55DBFC40.3010603@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <55DBFC40.3010603@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, mturquette@baylibre.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, lee.jones@linaro.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On Tuesday 25 August 2015 10:55 AM, Krzysztof Kozlowski wrote:
> On 25.08.2015 03:56, Vaibhav Hiremath wrote:
>> This patch adds mfd_cell/clk-subdevice for 88PM800 MFD
>> (and family of devices).
>>
>> Signed-off-by: Vaibhav Hiremath <vaibhav.hiremath@linaro.org>
>> ---
>>   drivers/mfd/88pm800.c | 25 +++++++++++++++++++++++++
>>   1 file changed, 25 insertions(+)
>>
>> diff --git a/drivers/mfd/88pm800.c b/drivers/mfd/88pm800.c
>> index c4e097d..a928eed 100644
>> --- a/drivers/mfd/88pm800.c
>> +++ b/drivers/mfd/88pm800.c
>> @@ -173,6 +173,14 @@ static const struct mfd_cell regulator_devs[] = {
>>   	},
>>   };
>>
>> +static struct mfd_cell clk_devs[] = {
>> +	{
>> +		.name = "88pm80x-clk",
>> +		.of_compatible = "marvell,88pm800-clk",
>> +		.id = -1,
>
> The "-1" here stands for PLATFORM_DEVID_NONE?
>

Yes,

But it is rarely used in the kernel. so was reluctant to use and
decided to follow existing implementation.

Thanks,
Vaibhav

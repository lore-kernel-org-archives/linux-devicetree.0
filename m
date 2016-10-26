From: Thor Thayer <tthayer@opensource.altera.com>
Subject: Re: [PATCH 3/4] mfd: altr-a10sr: Add Arria10 SR Monitor
Date: Wed, 26 Oct 2016 10:18:32 -0500
Message-ID: <f85a537e-716f-cc40-a47a-0f2345526fef@opensource.altera.com>
References: <1476394329-31696-1-git-send-email-tthayer@opensource.altera.com>
 <1476394329-31696-4-git-send-email-tthayer@opensource.altera.com>
 <20161026125233.GL11267@dell>
Reply-To: tthayer@opensource.altera.com
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20161026125233.GL11267@dell>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Lee Jones <lee.jones@linaro.org>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, inux@armlinux.org.uk, robh+dt@kernel.org, geert@linux-m68k.org, dinguyen@opensource.altera.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org



On 10/26/2016 07:52 AM, Lee Jones wrote:
> On Thu, 13 Oct 2016, tthayer@opensource.altera.com wrote:
>
>> From: Thor Thayer <tthayer@opensource.altera.com>
>>
>> Add the Altera Arria10 DevKit System Resource Monitor functionality
>> to the MFD device.
>>
>> Signed-off-by: Thor Thayer <tthayer@opensource.altera.com>
>> ---
>>  drivers/mfd/altera-a10sr.c |    4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/mfd/altera-a10sr.c b/drivers/mfd/altera-a10sr.c
>> index 06e1f7f..0942d7d 100644
>> --- a/drivers/mfd/altera-a10sr.c
>> +++ b/drivers/mfd/altera-a10sr.c
>> @@ -33,6 +33,10 @@
>>  		.name = "altr_a10sr_gpio",
>>  		.of_compatible = "altr,a10sr-gpio",
>>  	},
>> +	{
>> +		.name = "altr_a10sr_mon",
>> +		.of_compatible = "altr,a10sr-mon",
>
> "-monitor" would be better in my opinion.
>

OK. I'm flexible and it is clearer. I'll make the changes and resubmit.
Thanks for reviewing!

>> +	},
>>  };
>>
>>  static bool altr_a10sr_reg_readable(struct device *dev, unsigned int reg)
>

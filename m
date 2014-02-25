From: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
Subject: Re: [RESEND][PATCH v4] gpio: davinci: reuse for keystone soc
Date: Tue, 25 Feb 2014 13:52:36 +0200
Message-ID: <530C8404.3020302@ti.com>
References: <52FBB6BC.2060801@ti.com>
	<1392307125-27927-1-git-send-email-grygorii.strashko@ti.com>
	<53076032.5080202@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
In-Reply-To: <53076032.5080202-l0cyMroinI0@public.gmane.org>
List-Unsubscribe: <http://linux.davincidsp.com/mailman/options/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=unsubscribe>
List-Archive: <http://linux.davincidsp.com/pipermail/davinci-linux-open-source>
List-Post: <mailto:davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
List-Help: <mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=help>
List-Subscribe: <http://linux.davincidsp.com/mailman/listinfo/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=subscribe>
Sender: <davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
Errors-To: davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org
To: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Linus,

On 02/21/2014 04:18 PM, Santosh Shilimkar wrote:
> On Thursday 13 February 2014 10:58 AM, Grygorii Strashko wrote:
>> The similar GPIO HW block is used by keystone SoCs as
>> in Davinci SoCs.
>> Hence, reuse Davinci GPIO driver for Keystone taking into
>> account that Keystone contains ARM GIC IRQ controller which
>> is implemented using IRQ Chip.
>>
>> Documentation:
>> 	http://www.ti.com/lit/ug/sprugv1/sprugv1.pdf
>>
>> Acked-by: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
>> Acked-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> Signed-off-by: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
>> ---
>> - rebased on top of git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
>>    branch: devel
>>    top commit: ef70bbe gpio: make gpiod_direction_output take a logical value
>>
> Can you please pick this one ? Its rebased as per your suggestion.

I've just rechecked this patch and it's applied without conflicts
on top of your "devel" branch.

Pls, inform me if I need to do anything else for you
in order to have this patch applied.

[...]

>> @@ -554,7 +585,8 @@ done:
>>   
>>   #if IS_ENABLED(CONFIG_OF)
>>   static const struct of_device_id davinci_gpio_ids[] = {
>> -	{ .compatible = "ti,dm6441-gpio", },
>> +	{ .compatible = "ti,keystone-gpio", keystone_gpio_get_irq_chip},
>> +	{ .compatible = "ti,dm6441-gpio", davinci_gpio_get_irq_chip},
>>   	{ /* sentinel */ },
>>   };
>>   MODULE_DEVICE_TABLE(of, davinci_gpio_ids);
>>
> 
Regards,
-grygorii

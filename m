From: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: keystone: add cell's information to i2c nodes
Date: Tue, 8 Apr 2014 12:07:17 +0300
Message-ID: <5343BC45.5090205@ti.com>
References: <1396884272-8307-1-git-send-email-grygorii.strashko@ti.com> <5342E575.60308@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5342E575.60308-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
Cc: ivan.khoronzhuk-hExfYMNmJl/Cnp4W7fqMDg@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 04/07/2014 08:50 PM, Santosh Shilimkar wrote:
> On Monday 07 April 2014 11:24 AM, Grygorii Strashko wrote:
>> I2C nodes should always have #address-cells and #size-cells defined.
>> Hence, ensure that all i2cX nodes have #address-cells and #size-cells
>> properties defined.
>>
>> Signed-off-by: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
>> ---
> Right. BTW, have you seen some issue without this patch ?
> Just curious what prompted you to create this patch and whether
> it needs to be sent as fix during rc's.

I think, it can wait for next. Without this patch warnings will
be produced in case of adding child node to the bus in DT:
Warning (avoid_default_addr_size): Relying on default #address-cells value for /soc/i2c@2530800/pca@20
Warning (avoid_default_addr_size): Relying on default #size-cells value for /soc/i2c@2530800/pca@20

I'll updated patch description and resend.

Regards,
-grygorii
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

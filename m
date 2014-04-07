From: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: keystone: add cell's information to i2c nodes
Date: Mon, 7 Apr 2014 13:50:45 -0400
Message-ID: <5342E575.60308@ti.com>
References: <1396884272-8307-1-git-send-email-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1396884272-8307-1-git-send-email-grygorii.strashko-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
Cc: ivan.khoronzhuk-hExfYMNmJl/Cnp4W7fqMDg@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Monday 07 April 2014 11:24 AM, Grygorii Strashko wrote:
> I2C nodes should always have #address-cells and #size-cells defined.
> Hence, ensure that all i2cX nodes have #address-cells and #size-cells
> properties defined.
> 
> Signed-off-by: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
> ---
Right. BTW, have you seen some issue without this patch ?
Just curious what prompted you to create this patch and whether
it needs to be sent as fix during rc's.

Regards,
Santosh
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

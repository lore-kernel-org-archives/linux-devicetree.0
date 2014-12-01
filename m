From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: Re: [PATCH v2 1/3] power: reset: read priority from device tree
Date: Mon, 01 Dec 2014 18:29:43 +0100
Message-ID: <ea4f7a2bfdb9bea45cab9418c211083b@agner.ch>
References: <1417453389-1588-1-git-send-email-stefan@agner.ch>
 <1417453389-1588-2-git-send-email-stefan@agner.ch>
 <CAL85gmBq30pWxP0buKbM8so6QqsJq2YojiSK1EWtMPsH_7foeg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL85gmBq30pWxP0buKbM8so6QqsJq2YojiSK1EWtMPsH_7foeg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Feng Kan <fkan-qTEPVZfXA3Y@public.gmane.org>
Cc: shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Dmitry Eremin-Solenikov <dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2014-12-01 18:15, Feng Kan wrote:
> On Mon, Dec 1, 2014 at 9:03 AM, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org> wrote:
>> This patch adds an optional property which allows to specify the
>> reset source priority. This priority is used by the kernel restart
>> handler call chain to sort out the proper reset/restart method.
>> Depending on the power design of a board or other machine/board
>> specific peculiarity, it is not possible to pick a generic priority.
>>
>> Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
>> ---
>>  Documentation/devicetree/bindings/power/reset/syscon-reboot.txt | 3 +++
>>  drivers/power/reset/syscon-reboot.c                             | 5 ++++-
>>  2 files changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/power/reset/syscon-reboot.txt b/Documentation/devicetree/bindings/power/reset/syscon-reboot.txt
>> index 1190631..ee41d9c 100644
>> --- a/Documentation/devicetree/bindings/power/reset/syscon-reboot.txt
>> +++ b/Documentation/devicetree/bindings/power/reset/syscon-reboot.txt
>> @@ -11,6 +11,9 @@ Required properties:
>>  - offset: offset in the register map for the reboot register (in bytes)
>>  - mask: the reset value written to the reboot register (32 bit access)
>>
>> +Optional properties:
>> +- priority: define the priority of the reset (0-255, defaults to 128)
>> +
>>  Default will be little endian mode, 32 bit access only.
>>
>>  Examples:
>> diff --git a/drivers/power/reset/syscon-reboot.c b/drivers/power/reset/syscon-reboot.c
>> index 815b901..3060d6b 100644
>> --- a/drivers/power/reset/syscon-reboot.c
>> +++ b/drivers/power/reset/syscon-reboot.c
>> @@ -67,8 +67,11 @@ static int syscon_reboot_probe(struct platform_device *pdev)
>>         if (of_property_read_u32(pdev->dev.of_node, "mask", &ctx->mask))
>>                 return -EINVAL;
>>
>> -       ctx->restart_handler.notifier_call = syscon_restart_handle;
>>         ctx->restart_handler.priority = 128;
>> +       of_property_read_u32(pdev->dev.of_node, "priority",
>> +                            &ctx->restart_handler.priority);
> 
> What is this for?

What do you mean? The moved line "ctx->restart_handler.notifier_call =
syscon_restart_handle;"? When one reads the diff, it looks like that
line was moved, in fact I tried to keep the of_property_read function
calls together. But I had to move the assignation of the default
priority in front of restart_handler.priority. That's what is the
outcome...

--
Stefan

>> +
>> +       ctx->restart_handler.notifier_call = syscon_restart_handle;
>>         err = register_restart_handler(&ctx->restart_handler);
>>         if (err)
>>                 dev_err(dev, "can't register restart notifier (err=%d)\n", err);
>> --
>> 2.1.3
>>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

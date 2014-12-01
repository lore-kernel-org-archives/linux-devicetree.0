From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: Re: [PATCH v2 1/3] power: reset: read priority from device tree
Date: Mon, 01 Dec 2014 23:18:47 +0100
Message-ID: <3916ca2867ced70e16903d6d44aaae8f@agner.ch>
References: <1417453389-1588-1-git-send-email-stefan@agner.ch>
 <1417453389-1588-2-git-send-email-stefan@agner.ch>
 <CAL85gmBq30pWxP0buKbM8so6QqsJq2YojiSK1EWtMPsH_7foeg@mail.gmail.com>
 <ea4f7a2bfdb9bea45cab9418c211083b@agner.ch>
 <CAL85gmBNE7oDbE+LX+V=AFJO61Ta0Gekoq6sDb8TkEnoPsNFVA@mail.gmail.com>
 <20141201174215.GB24692@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141201174215.GB24692-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Feng Kan <fkan-qTEPVZfXA3Y@public.gmane.org>, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Dmitry Eremin-Solenikov <dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2014-12-01 18:42, Guenter Roeck wrote:
> On Mon, Dec 01, 2014 at 09:38:09AM -0800, Feng Kan wrote:
>> On Mon, Dec 1, 2014 at 9:29 AM, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org> wrote:
>> > On 2014-12-01 18:15, Feng Kan wrote:
>> >> On Mon, Dec 1, 2014 at 9:03 AM, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org> wrote:
>> >>> This patch adds an optional property which allows to specify the
>> >>> reset source priority. This priority is used by the kernel restart
>> >>> handler call chain to sort out the proper reset/restart method.
>> >>> Depending on the power design of a board or other machine/board
>> >>> specific peculiarity, it is not possible to pick a generic priority.
>> >>>
>> >>> Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
>> >>> ---
>> >>>  Documentation/devicetree/bindings/power/reset/syscon-reboot.txt | 3 +++
>> >>>  drivers/power/reset/syscon-reboot.c                             | 5 ++++-
>> >>>  2 files changed, 7 insertions(+), 1 deletion(-)
>> >>>
>> >>> diff --git a/Documentation/devicetree/bindings/power/reset/syscon-reboot.txt b/Documentation/devicetree/bindings/power/reset/syscon-reboot.txt
>> >>> index 1190631..ee41d9c 100644
>> >>> --- a/Documentation/devicetree/bindings/power/reset/syscon-reboot.txt
>> >>> +++ b/Documentation/devicetree/bindings/power/reset/syscon-reboot.txt
>> >>> @@ -11,6 +11,9 @@ Required properties:
>> >>>  - offset: offset in the register map for the reboot register (in bytes)
>> >>>  - mask: the reset value written to the reboot register (32 bit access)
>> >>>
>> >>> +Optional properties:
>> >>> +- priority: define the priority of the reset (0-255, defaults to 128)
>> >>> +
>> >>>  Default will be little endian mode, 32 bit access only.
>> >>>
>> >>>  Examples:
>> >>> diff --git a/drivers/power/reset/syscon-reboot.c b/drivers/power/reset/syscon-reboot.c
>> >>> index 815b901..3060d6b 100644
>> >>> --- a/drivers/power/reset/syscon-reboot.c
>> >>> +++ b/drivers/power/reset/syscon-reboot.c
>> >>> @@ -67,8 +67,11 @@ static int syscon_reboot_probe(struct platform_device *pdev)
>> >>>         if (of_property_read_u32(pdev->dev.of_node, "mask", &ctx->mask))
>> >>>                 return -EINVAL;
>> >>>
>> >>> -       ctx->restart_handler.notifier_call = syscon_restart_handle;
>> >>>         ctx->restart_handler.priority = 128;
>> >>> +       of_property_read_u32(pdev->dev.of_node, "priority",
>> >>> +                            &ctx->restart_handler.priority);
>> >>
>> >> What is this for?
>> >
>> > What do you mean? The moved line "ctx->restart_handler.notifier_call =
>> > syscon_restart_handle;"? When one reads the diff, it looks like that
>> > line was moved, in fact I tried to keep the of_property_read function
>> > calls together. But I had to move the assignation of the default
>> > priority in front of restart_handler.priority. That's what is the
>> > outcome...
>>
>> I believe Guenter explained above already. Actually this help to solve one of
>> my problem. Thanks.
> 
> Since Mark doesn't seem to be happy with the idea of making the priority
> dt-configurable, the alternative might be to just set a higher priority for
> syscon triggered resets, as suggested by Stefan. Not as flexible, but it
> should be ok for most use cases.
> 

I read the other branch of this thread too, but IMHO, this would be the
best solution for now. It's a one line change and does the job. After
all, we have that priority for a reason, it doesn't makes sense having
all of them at a common default. As mentioned in an other reply, I think
it is especially reasonable to configure the syscon-reboot driver a bit
higher, since this driver is more likely to be used for a dedicated
reboot feature provided by the SoC, which usually is the preferred one.
If it happens one day that a SoC ends up with conflicting priorities or
other priority odds, we can add the DT support then...

What do you think, can I go with that for now? (Guenter, Feng, Mark...?)

--
Stefan

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

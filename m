From: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Subject: Re: [PATCH v1 2/2] drm/tinydrm: add driver for ST7735R panels
Date: Fri, 8 Dec 2017 15:25:09 -0600
Message-ID: <63ca5df1-3908-fcba-9391-ce9ef035086f@lechnology.com>
References: <1511924469-11448-1-git-send-email-david@lechnology.com>
 <1511924469-11448-3-git-send-email-david@lechnology.com>
 <455f5c7a-9f3c-c019-9418-94f0c2015afd@tronnes.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <455f5c7a-9f3c-c019-9418-94f0c2015afd-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: limor-6aDhHjTmHzzR7s880joybQ@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 12/06/2017 12:27 PM, Noralf Trønnes wrote:
> 
> Den 29.11.2017 04.01, skrev David Lechner:
>> This adds a new driver for Sitronix ST7735R display panels.
>>
>> This has been tested using an Adafruit 1.8" TFT.
>>
>> Signed-off-by: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
>> ---
>>   MAINTAINERS                       |   6 +
>>   drivers/gpu/drm/tinydrm/Kconfig   |  10 ++
>>   drivers/gpu/drm/tinydrm/Makefile  |   1 +
>>   drivers/gpu/drm/tinydrm/st7735r.c | 237 
>> ++++++++++++++++++++++++++++++++++++++
>>   4 files changed, 254 insertions(+)
>>   create mode 100644 drivers/gpu/drm/tinydrm/st7735r.c
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index a174632..9c7707e 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -4462,6 +4462,12 @@ S:    Maintained
>>   F:    drivers/gpu/drm/tinydrm/st7586.c
>>   F:    Documentation/devicetree/bindings/display/st7586.txt
>> +DRM DRIVER FOR SITRONIX ST7735R PANELS
>> +M:    David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
> 
> I know we haven't done this in the other tinydrm drivers, but I think
> we should start adding which tree the development is happening in:
> 
> T:    git git://anongit.freedesktop.org/drm/drm-misc

This is inherited, just like L:, so get_maintainers.pl --scm returns git 
git://anongit.freedesktop.org/drm/drm-misc already. So there doesn't 
seem to be a need to add this line.

> 
>> +S:    Maintained
>> +F:    drivers/gpu/drm/tinydrm/st7735r.c
>> +F:    Documentation/devicetree/bindings/display/st7735r.txt

<snip>

>> +}
>> +
>> +static void st7735r_pipe_disable(struct drm_simple_display_pipe *pipe)
>> +{
>> +    struct tinydrm_device *tdev = pipe_to_tinydrm(pipe);
>> +    struct mipi_dbi *mipi = mipi_dbi_from_tinydrm(tdev);
>> +
> 
> Please use mipi_dbi_pipe_disable() here.
> 
>> +    DRM_DEBUG_KMS("\n");
>> +
>> +    if (!mipi->enabled)
>> +        return;
>> +
>> +    tinydrm_disable_backlight(mipi->backlight);
>> +
>> +    mipi_dbi_command(mipi, MIPI_DCS_SET_DISPLAY_OFF);
> 
> You turn off the panel, have you checked what it looks like if you don't
> turn off backlight (which is optional in this driver)?
> 
> On the displays I have tried this on, all pixels turn white when they're
> not driven, letting backlight through, giving an all white display.
> That's why I have that blanking code in mipi_dbi_pipe_disable() when we
> don't have backlight control and the reason I don't turn off the panel.
> The power savings of not driving the panel is negligible AFAICR.
> 
> If you don't need DISPLAY_OFF, you can just use mipi_dbi_pipe_disable()
> directly as the callback.
> 

I tested this and you are right, it causes the panel to go white when a 
backlight is not specified, so I will just use mipi_dbi_pipe_disable().
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

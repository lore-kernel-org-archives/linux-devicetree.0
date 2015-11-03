From: "Kim, Milo" <milo.kim-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH RESEND 00/16] Support TI LMU devices
Date: Tue, 3 Nov 2015 15:52:08 +0900
Message-ID: <56385998.5080006@ti.com>
References: <1446441875-1256-1-git-send-email-milo.kim@ti.com>
 <20151102085924.GP4058@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151102085924.GP4058@x1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Lee,

On 11/2/2015 5:59 PM, Lee Jones wrote:
>>   drivers/video/backlight/Kconfig                    |  62 ++
>> >  drivers/video/backlight/Makefile                   |   7 +
>> >  drivers/video/backlight/lm3532_bl.c                | 183 +++++
>> >  drivers/video/backlight/lm3631_bl.c                | 129 ++++
>> >  drivers/video/backlight/lm3632_bl.c                | 125 ++++
>> >  drivers/video/backlight/lm3633_bl.c                | 210 ++++++
>> >  drivers/video/backlight/lm3695_bl.c                |  91 +++
>> >  drivers/video/backlight/lm3697_bl.c                | 187 +++++
>> >  drivers/video/backlight/ti-lmu-backlight.c         | 429 ++++++++++++
>> >  drivers/video/backlight/ti-lmu-backlight.h         | 152 +++++
> How different are all of these drivers?
>
> Can you create one driver that supports them all instead?
>

Thanks for your suggestion.

'ti-lmu-backlight' is the common part of lmxxxx_bl drivers. And each 
lmxxx_bl has its own operation functions by using ti_lmu_bl_ops.
I've tried to make consolidated driver but it contained too much device 
specific code in one file. So I prefer simple drivers structure - 
'common part' and 'device specific operations'.
It would be appreciated if you could introduce better idea.

Best regards,
Milo
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

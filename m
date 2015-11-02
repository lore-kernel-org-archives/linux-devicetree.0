From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH RESEND 14/16] hwmon: add TI LMU hardware fault monitoring
 driver
Date: Mon, 2 Nov 2015 06:27:35 -0800
Message-ID: <563772D7.4030807@roeck-us.net>
References: <1446441875-1256-1-git-send-email-milo.kim@ti.com>
 <1446441875-1256-15-git-send-email-milo.kim@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1446441875-1256-15-git-send-email-milo.kim-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Milo Kim <milo.kim-l0cyMroinI0@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Jean Delvare <jdelvare-IBi9RG/b67k@public.gmane.org>, lm-sensors-GZX6beZjE8VD60Wz+7aTrA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 11/01/2015 09:24 PM, Milo Kim wrote:
> LM3633 and LM3697 are TI LMU MFD device.
> Those device have hardware monitoring feature which detects opened or
> shorted circuit case.
>
Sure, but it only makes sense if you provide standard hwmon attributes
which can be interpreted by the "sensors" command. Which is not the case
here. You neither have a standard device type (light is not handled by hwmon),
nor standard attributes, nor do the attributes return standard values.

I think there may be a basic misunderstanding. hwmon is not intended
to monitor a specific chip on the board. Its scope is to monitor the
system (such as temperature, voltages, or current).

In your case, it might be better to attach the attributes to the mfd device.

Thanks,
Guenter

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

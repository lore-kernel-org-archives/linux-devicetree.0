From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH 1/2] hwmon: (max6650) Allow fan shutdown and initial rpm
 target
Date: Thu, 8 Sep 2016 21:18:07 -0700
Message-ID: <3712d00f-589e-f264-4df0-4ab6e7dc61a1@roeck-us.net>
References: <1471334034-14894-1-git-send-email-mike.looijmans@topic.nl>
 <c47e4482-a8e0-6a38-cccb-062b667587ac@roeck-us.net>
 <57B6A8BF.2080508@topic.nl>
 <1472026407-3448-1-git-send-email-mike.looijmans@topic.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1472026407-3448-1-git-send-email-mike.looijmans-Oq418RWZeHk@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Looijmans <mike.looijmans-Oq418RWZeHk@public.gmane.org>, linux-hwmon-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 08/24/2016 01:13 AM, Mike Looijmans wrote:
> The fan can be stopped by writing "3" to pwm1_enable in sysfs.
>
> Add devicetree property for early initialization of the fan controller
> to prevent overheating, for example when resetting the board while the
> fan was completely turned off.
>
> Also improve error reporting, I2C failures were ignored while writing
> new values.
>
> Signed-off-by: Mike Looijmans <mike.looijmans-Oq418RWZeHk@public.gmane.org>


Applied to hwmon-next.

Thanks,
Guenter


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

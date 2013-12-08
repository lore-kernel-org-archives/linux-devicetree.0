From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [lm-sensors] [PATCH 1/1] hwmon/adt7411: Add devicetree bindings
Date: Sun, 08 Dec 2013 12:32:15 -0800
Message-ID: <52A4D74F.7010701@roeck-us.net>
References: <1386532718-13586-1-git-send-email-bgamari.foss@gmail.com> <1386532718-13586-2-git-send-email-bgamari.foss@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1386532718-13586-2-git-send-email-bgamari.foss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Gamari <bgamari.foss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lm-sensors-GZX6beZjE8VD60Wz+7aTrA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 12/08/2013 11:58 AM, Ben Gamari wrote:
> There isn't reallly any configuration necessary so the bindings are
> consequently quite simple.
>
> Signed-off-by: Ben Gamari <bgamari.foss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---

i2c devices don't require explicit bindings unless driver specific bindings are needed.
Please see Documentation/devicetree/bindings/i2c/trivial-devices.txt for details.
You might want to consider adding the device into the trivial-devices.txt file instead.

Guenter

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

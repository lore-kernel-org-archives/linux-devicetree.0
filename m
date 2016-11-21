From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 0/8] firmware: arm_scpi: add support for legacy SCPI
 protocol
Date: Mon, 21 Nov 2016 15:12:38 +0000
Message-ID: <0af5ded0-8ea9-2b11-e70e-dc33b9111905@arm.com>
References: <1478148731-11712-1-git-send-email-sudeep.holla@arm.com>
 <20161108145118.GR1041@n2100.armlinux.org.uk>
 <28decdc3-6b86-924f-d3c1-9873a8cfce77@arm.com>
 <20161108154038.GS1041@n2100.armlinux.org.uk>
 <20161108160625.GU1041@n2100.armlinux.org.uk>
 <fb4348a8-197c-2219-ff01-8716e2a0b955@arm.com>
 <20161108174622.GW1041@n2100.armlinux.org.uk>
 <CAD0U-hK982V+kUArjVSG7pTs5CLpNsgJaC5t8aPg8XuoiMRU0A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAD0U-hK982V+kUArjVSG7pTs5CLpNsgJaC5t8aPg8XuoiMRU0A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ryan Harkin <ryan.harkin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Philippe Robin <Philippe.Robin-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 21/11/16 15:04, Ryan Harkin wrote:

[...]

> Switching to u-boot won't solve any thermal sensor calibration problems.
>

Indeed. The board Russell had was one of those early ones which was not
calibrated properly. He is now able to use the 16.10 release after
calibration.

-- 
Regards,
Sudeep
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

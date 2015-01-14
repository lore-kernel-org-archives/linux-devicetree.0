From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v3] ARM: dts: add bcm2835-pwm bindings
Date: Wed, 14 Jan 2015 10:06:08 -0700
Message-ID: <54B6A200.4040209@wwwdotorg.org>
References: <1421227134-8590-1-git-send-email-bart.tanghe@thomasmore.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1421227134-8590-1-git-send-email-bart.tanghe-2dq7lIxLGp5qkBXjtECzWg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bart Tanghe <bart.tanghe-2dq7lIxLGp5qkBXjtECzWg@public.gmane.org>, lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 01/14/2015 02:18 AM, Bart Tanghe wrote:
> To probe the bcm2835-pwm driver properly, this dts bindings has to be added
> to the bcm2835 dtsi file.
> In expectation of a bcm2835 clock driver, I've added fixed-clock clock binding.
> ---
> Changes in v3:
>   - node added by reg value

The pwm node still seems to be in the wrong place. Sorting by reg value, 
it should be after i2c@20205000 and before sdhci@7e300000, as I 
mentioned before.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

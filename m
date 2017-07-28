From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] ARM: dts: bcm283x: Move the BCM2837 DT contents from
 arm64 to arm.
Date: Fri, 28 Jul 2017 16:55:06 -0700
Message-ID: <18c414ac-c58e-bf99-1d04-8fed2c4a0300@gmail.com>
References: <20170726200156.30161-1-eric@anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170726200156.30161-1-eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 07/26/2017 01:01 PM, Eric Anholt wrote:
> BCM2837 is somewhat unusual in that we build its DT on both arm32 and
> arm64.  Most devices are being run in arm32 mode.
> 
> Having the body of the DT for 2837 separate from 2835/6 has been a
> source of pain, as we often need to make changes that span both
> directories simultaneously (for example, the thermal changes for 4.13,
> or anything that changes the name of a node referenced by '&' from
> board files).  Other changes are made more complicated than they need
> to be, such as the SDHOST enabling, because we have to split a single
> logical change into a 283[56] half and a 2837 half.
> 
> To fix this, make the stub board include file live in arm64 instead of
> arm32, and keep all of BCM283x's contents in arm32.  From here on, our
> changes to DT contents can be submitted through a single tree.
> 
> Signed-off-by: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>

Applied to devicetree/next (arm64), thanks Eric!

-- 
Florian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

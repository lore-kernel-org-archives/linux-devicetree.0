From: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v6 2/5] ARM: davinci: da8xx: Add CFGCHIP syscon platform
 declaration.
Date: Wed, 26 Oct 2016 15:28:23 +0530
Message-ID: <20722288-9567-16d7-c591-5872ef8d8b9e@ti.com>
References: <1477451211-31979-1-git-send-email-david@lechnology.com>
 <1477451211-31979-3-git-send-email-david@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1477451211-31979-3-git-send-email-david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Axel Haslam <ahaslam-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wednesday 26 October 2016 08:36 AM, David Lechner wrote:
> The CFGCHIP registers are used by a number of devices, so using a syscon
> device to share them. The first consumer of this will by the phy-da8xx-usb

"will be the .." 

Also, in subject line, "platform device" instead of "platform 
declaration". Also lose the period at at the end of subject line

> driver.
> 
> Signed-off-by: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>

Applied to v4.10/soc. Here is the final commit text.

---
ARM: davinci: da8xx: Add CFGCHIP syscon platform device

The CFGCHIP registers are used by a number of devices, so use a syscon
device to share them. The first consumer of this will by the phy-da8xx-usb
driver.

Add the syscon device and register it.

Signed-off-by: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
[nsekhar-l0cyMroinI0@public.gmane.org: minor commit message fixes]
Signed-off-by: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
---

Thanks,
Sekhar
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

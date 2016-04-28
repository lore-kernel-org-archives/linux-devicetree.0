From: Alexey Brodkin <Alexey.Brodkin-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 2/2] ARC: [axs10x] Specify reserved memory for frame
 buffer
Date: Thu, 28 Apr 2016 14:38:18 +0000
Message-ID: <1461854287.3673.50.camel@synopsys.com>
References: <1461767701-12208-1-git-send-email-abrodkin@synopsys.com>
	 <1461767701-12208-3-git-send-email-abrodkin@synopsys.com>
	 <572190F3.3020709@synopsys.com> <1461851171.3673.30.camel@synopsys.com>
	 <57221693.50401@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-7"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <57221693.50401-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Content-Language: en-US
Content-ID: <F74F07A8709EE74DA042D6BC2E076308-z7JfP6tgrtVBCHUSTMH8dZqQE7yCjDx5@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vineet Gupta <Vineet.Gupta1-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Cc: "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Vineet,

On Thu, 2016-04-28 at 19:26 +-0530, Vineet Gupta wrote:
+AD4- On Thursday 28 April 2016 07:16 PM, Alexey Brodkin wrote:
+AD4- +AD4- 
+AD4- +AD4- +AD4- 
+AD4- +AD4- +AD4- +AD4- 
+AD4- +AD4- +AD4- +AD4- Note that the IOC start alignment needs to follow
+AD4- +AD4- +AD4- +AD4- max(4k, size). What will be maximum size of frame buffer - 16M always +ACE-
+AD4- +AD4- What do you mean by that?
+AD4- For HS38, we intend to bypass the frame buffer traffic from IOC port. So the frame
+AD4- buffer start needs to be inside the IOC aperture base address. That value can't be
+AD4- arbitrary - it is atleast 4K aligned value and further also needs to be aligned to
+AD4- the size of aperture. So if the size is 16M it needs to be 16M aligned etc...

The point is we want to put frame buffer memory OUTSIDE IOC aperture.
So we allocate FB memory in the very end of DDR which is far away from IOC.

And in that case IOC alignment issues are out of the question here.

-Alexey--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

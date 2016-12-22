From: Moritz Fischer <moritz.fischer.private-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM64: zynqmp: Fix i2c node's compatible string
Date: Thu, 22 Dec 2016 08:26:04 -0800
Message-ID: <CAJYdmeMA74LjDLe=E9KkBWZK+-bxjhLQ4JWk7r8Atwmytx3T5g@mail.gmail.com>
References: <1482385788-7187-1-git-send-email-moritz.fischer@ettus.com> <d1e69302-8367-7c57-ecd7-f72861c3a49e@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <d1e69302-8367-7c57-ecd7-f72861c3a49e-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Moritz Fischer <mdf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, U-Boot List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Michal,

On Wed, Dec 21, 2016 at 11:35 PM, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> wrote:

> compatible = "cdns,i2c-r1p14", "cdns,i2c-r1p10";

I keep getting that wrong .. .damn ... :) Will resubmit.

> The same of course for u-boot where also p14 should be added to the driver.

Yeah, I realized that part after submitting...

Thanks
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

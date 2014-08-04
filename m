From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: CCI-400 driver  ARM V8 support
Date: Mon, 4 Aug 2014 15:33:32 +0100
Message-ID: <20140804143332.GF3197@leverpostej>
References: <4737A960563B524DA805CA602BE04B30799875DBE8@SC-VEXCH2.marvell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4737A960563B524DA805CA602BE04B30799875DBE8-r8ILAu4/owtq65YQV0AP9hL4W9x8LtSr@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Xiaoguang Chen <chenxg-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Cc: "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "robh+dt-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <robh+dt-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Mon, Aug 04, 2014 at 08:03:18AM +0100, Xiaoguang Chen wrote:
> 
> Hi, Grant, Rob
> I'm checking arm cci-400 driver on mainline, and found it only
> supports ARM v7, but no ARM V8 support.
> Do you have plan to support it? or it is under development?

The arm64 port doesn't do any coherency management within the kernel
(this must be done by the firmware or bootloader), so the CCI-400 driver
would be limited to a performance monitoring role.

As far as I am aware, no one is actively working on factoring out the
32-bit dependencies such that the CCI-400 PMU code can be used on arm64.

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

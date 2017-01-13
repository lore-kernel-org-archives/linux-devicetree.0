From: Amelie DELAUNAY <amelie.delaunay-qxv4g6HH51o@public.gmane.org>
Subject: RE: [PATCHv5 3/8] rtc: add STM32 RTC driver
Date: Fri, 13 Jan 2017 08:47:37 +0000
Message-ID: <be3a19059b2e4e0a9bfb8d0c3292dac4@SFHDAG3NODE2.st.com>
References: <1484142403-11556-1-git-send-email-amelie.delaunay@st.com>
 <20170113003840.u6uxt7u4qsit3oqt@piout.net>
Reply-To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <rtc-linux+bncBC2IT2GSZUDRBNVI4LBQKGQE3NR2EGA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170113003840.u6uxt7u4qsit3oqt-m++hUPXGwpdeoWH0uzbU5w@public.gmane.org>
Content-Language: en-US
List-Post: <https://groups.google.com/group/rtc-linux/post>, <mailto:rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:rtc-linux+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/rtc-linux
List-Subscribe: <https://groups.google.com/group/rtc-linux/subscribe>, <mailto:rtc-linux+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+712029733259+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/rtc-linux/subscribe>
To: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre TORGUE <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, "rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Gabriel FERNANDEZ <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Alexandre,

> This didn't apply cleanly, please check rtc-next. I don't think I made any mistake
> as the issue was only in Kconfig. You probably based your patches on 4.9
> instead of 4.10-rc1.
Sorry for this inconvenience. You're right, my patches were based on 4.9 to be tested on stm32f4 family.
No mistake found in your conflict resolution in Kconfig.

I'm going to send a new patch to fix warnings introduced by my driver on rtc-next.

Regards,
Amelie

> -----Original Message-----
> From: Alexandre Belloni [mailto:alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org]
> Sent: vendredi 13 janvier 2017 01:39
> To: Amelie DELAUNAY <amelie.delaunay-qxv4g6HH51o@public.gmane.org>
> Cc: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>; Rob Herring
> <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>; Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>; Maxime
> Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>; Alexandre TORGUE
> <alexandre.torgue-qxv4g6HH51o@public.gmane.org>; Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>; rtc-
> linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-arm-
> kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org; linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Gabriel FERNANDEZ
> <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>
> Subject: Re: [PATCHv5 3/8] rtc: add STM32 RTC driver
> 
> On 11/01/2017 at 14:46:43 +0100, Amelie Delaunay wrote :
> > This patch adds support for the STM32 RTC.
> >
> > Signed-off-by: Amelie Delaunay <amelie.delaunay-qxv4g6HH51o@public.gmane.org>
> > ---
> >  drivers/rtc/Kconfig     |  11 +
> >  drivers/rtc/Makefile    |   1 +
> >  drivers/rtc/rtc-stm32.c | 727
> > ++++++++++++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 739 insertions(+)
> >  create mode 100644 drivers/rtc/rtc-stm32.c
> >
> 
> This didn't apply cleanly, please check rtc-next. I don't think I made any mistake
> as the issue was only in Kconfig. You probably based your patches on 4.9
> instead of 4.10-rc1.
> 
> 
> --
> Alexandre Belloni, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com

-- 
You received this message because you are subscribed to "rtc-linux".
Membership options at http://groups.google.com/group/rtc-linux .
Please read http://groups.google.com/group/rtc-linux/web/checklist
before submitting a driver.
--- 
You received this message because you are subscribed to the Google Groups "rtc-linux" group.
To unsubscribe from this group and stop receiving emails from it, send an email to rtc-linux+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

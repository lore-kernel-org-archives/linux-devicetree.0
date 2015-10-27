From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: Re: [PATCH 04/19] rtc: isl12057: enable support for the standard
 "wakeup-source" property
Date: Tue, 27 Oct 2015 23:53:15 +0100
Message-ID: <20151027225315.GJ22331@piout.net>
References: <1445422216-29375-1-git-send-email-sudeep.holla@arm.com>
 <1445422216-29375-5-git-send-email-sudeep.holla@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1445422216-29375-5-git-send-email-sudeep.holla@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>, rtc-linux@googlegroups.com
List-Id: devicetree@vger.kernel.org

On 21/10/2015 at 11:10:01 +0100, Sudeep Holla wrote :
> Though the isl12057 rtc driver should and will continue to support the
> legacy "isil,irq2-can-wakeup-machine" property to enable RTC as the
> wakeup source, we need to add support for the new standard property
> "wakeup-source".
> 
> This patch adds support for "wakeup-source" property in addition to the
> existing "isil,irq2-can-wakeup-machine" property.
> 
> Cc: Alessandro Zummo <a.zummo@towertech.it>
> Cc: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> Cc: rtc-linux@googlegroups.com
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> ---
>  drivers/rtc/rtc-isl12057.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

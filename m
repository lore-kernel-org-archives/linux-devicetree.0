From: Neelesh Gupta <neelegup-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2] rtc/tpo: Driver to support rtc and wakeup on PowerNV
 platform
Date: Mon, 06 Oct 2014 10:55:10 +0530
Message-ID: <543227B6.7010707@linux.vnet.ibm.com>
References: <20140930101448.9310.32342.stgit@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140930101448.9310.32342.stgit-bi+AKbBUZKY6gyzm1THtWbp2dZbC/Bob@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org
Cc: benh-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


On 09/30/2014 03:46 PM, Neelesh Gupta wrote:
> The patch implements the OPAL rtc driver that binds with the rtc
> driver subsystem. The driver uses the platform device infrastructure
> to probe the rtc device and register it to rtc class framework. The
> 'wakeup' is supported depending upon the property 'has-tpo' present
> in the OF node. It provides a way to load the generic rtc driver in
> in the absence of an OPAL driver.
>
> The patch also moves the existing OPAL rtc get/set time interfaces to the
> new driver and exposes the necessary OPAL calls using EXPORT_SYMBOL_GPL.
>
> Test results:
> -------------
> Host:
> [root@tul163p1 ~]# ls -l /sys/class/rtc/
> total 0
> lrwxrwxrwx 1 root root 0 Sep 30 04:58 rtc0 -> ../../devices/opal-rtc/rtc/rtc0
> [root@tul163p1 ~]# cat /sys/devices/opal-rtc/rtc/rtc0/time
> 10:01:51
> [root@tul163p1 ~]# cat /sys/devices/opal-rtc/rtc/rtc0/time
> 10:02:07
> [root@tul163p1 ~]# echo `date '+%s' -d '+ 3 minutes'` > /sys/class/rtc/rtc0/wakealarm
> [root@tul163p1 ~]# cat /sys/class/rtc/rtc0/wakealarm
> 1412071532
> [root@tul163p1 ~]#
>
> FSP:
> $ smgr mfgState
> standby
> $ smgr mfgState
> ipling
> $
>
> Signed-off-by: Neelesh Gupta <neelegup-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
> ---
>
> Changes in v2
> =============
> - Added Documentation/devicetree/bindings/rtc/rtc-opal.txt
> - Explicitly turn off RTC_UIE mode by setting 'rtc->uie_unsupported'
>
> Dependency
> ==========
> This patch depends upon the below patch posted on 'linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org'
> [PATCH 1/4] powerpc/powernv: Add OPAL check token call
> Signed-off-by: Michael Neuling <mikey-/owAOxkjmzZAfugRpC6u6w@public.gmane.org>
>
>   Documentation/devicetree/bindings/rtc/rtc-opal.txt |   16 +
>   arch/powerpc/include/asm/opal.h                    |    7 -
>   arch/powerpc/kernel/time.c                         |    1
>   arch/powerpc/platforms/powernv/opal-async.c        |    3
>   arch/powerpc/platforms/powernv/opal-rtc.c          |   63 +----
>   arch/powerpc/platforms/powernv/opal-wrappers.S     |    2
>   arch/powerpc/platforms/powernv/opal.c              |    6
>   arch/powerpc/platforms/powernv/setup.c             |    2
>   drivers/rtc/Kconfig                                |   11 +
>   drivers/rtc/Makefile                               |    1
>   drivers/rtc/rtc-opal.c                             |  261 ++++++++++++++++++++
>   11 files changed, 325 insertions(+), 48 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/rtc/rtc-opal.txt
>   create mode 100644 drivers/rtc/rtc-opal.c

Hi Alessandro,

The patch depends upon few things in powerpc tree so could you please 
Ack the
patch so that we can take it through the powerpc tree?

Thanks,
- Neelesh

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

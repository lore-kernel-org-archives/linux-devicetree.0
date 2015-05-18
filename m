From: raghu MG <raghumag-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: (unknown)
Date: Tue, 19 May 2015 01:30:56 +0530
Message-ID: <CAG1O52W-JFd_ygtGyMPSjcR-FZ95+Nd8C38Ygjp7_YmZq4iNag@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Subject: 
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,
This mail is regarding Linux smp boot on ARMADA-XP MV2860
.

CPU-1 doesnt boot/go through the boot sequence & it fails to come
online & dumps this message

CPU1:failed to come online .

The CPU-1 boot register is programmed with physical address of
-->armada_xp_secondary_startup function & then cpu-0 deasserts the CPU-1.

I am using armada-xp-gp.dts with armada-xp-mv78260.dts included in it.

Any help would be appreciated.
Regards
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

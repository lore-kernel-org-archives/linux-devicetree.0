From: Chris Packham <Chris.Packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
Subject: Using CONFIG_ARM_APPENDED_DTB with multiple device trees
Date: Tue, 20 Oct 2015 03:27:15 +0000
Message-ID: <fce90e91fe3c452b80bcd2113f267003@svr-chch-ex1.atlnz.lc>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

We currently have several boards based around the 88f6281 (kirkwood) ARM 
CPU.

The boards all share a kernel image (currently 3.16 based but we're in 
the process of moving to 4.3). We use the machine id (and some other 
eeprom type information) to distinguish the boards.

We'd like to move to a device tree based model but we're restricted in 
that updating the bootloaders to a DT-aware u-boot is impractical. 
CONFIG_ARM_APPENDED_DTB allows us to append a device tree but we still 
need to account for the differences between the boards.

Is it possible to append several device trees and have the correct one 
selected based on mach-id? One alternative would be to have a lowest 
common denominator device tree and platform_data style initializations 
for the rest (which would kind of defeat the purpose of having a device 
tree). Or we could have a superset device tree with the nodes disabled 
and install fixups to enable them based on mach-id. Has anyone faced a 
similar situation?

Thanks,
Chris
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: Yann Droneaud <ydroneaud-RlY5vtjFyJ3QT0dZR+AlfA@public.gmane.org>
Subject: Device Tree Blob (DTB) licence
Date: Tue, 05 May 2015 12:05:15 +0200
Message-ID: <1430820315.19516.26.camel@opteya.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: ydroneaud-RlY5vtjFyJ3QT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

I believe Device Tree Blob (.dtb file) built from kernel's Device Tree 
Sources (.dts, which #include .dtsi, which #include .h) using Device 
Tree Compiler (dtc) are covered by GNU General Public Licence v2 
(GPLv2), but cannot find any reference.

As most .dtsi in arch/arm/boot/dts/ are covered by GPLv2, and,
as most .h in include/dt-bindings/ are also covered by GPLv2,
the source code is likely covered by GPLv2.

Then this source code is translated in a different language (flattened 
device tree), so the resulting translation is also likely covered by 
GPLv2.

So, when I'm proposed to download a .dtb file from a random vendor,
can I require to get the associated source code ?

Anyway, for a .dtb file generated from kernel sources, it's rather 
painful to look after all .dts, .dtsi, .h, to find what kind of 
licences are applicables, as some are covered by BSD, dual licensed 
(any combination of X11, MIT, BSD, GPLv2).

Regards.

-- 
Yann Droneaud
OPTEYA


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

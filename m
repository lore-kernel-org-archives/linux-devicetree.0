From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2] scripts/dtc: dt_to_config - example 5: complex kernel
 config
Date: Fri, 10 Jun 2016 16:09:51 -0700
Message-ID: <575B48BF.3040004@gmail.com>
References: <575B46CE.6080903@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <575B46CE.6080903-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org
List-Id: devicetree@vger.kernel.org

Example 5 -- a driver with complex config

A driver that requires multiple configuration options.

Node /spi3, driver mach-smartq.c, extracted from the full report.

Driver arch/arm/mach-s3c64xx/mach-smartq.c requires both
CONFIG_SAMSUNG_ATAGS and CONFIG_MACH_SMARTQ.

$ scripts/dtc/dt_to_config \
   --config ${KBUILD_OUTPUT}/.config \
   --config-format \
   arch/arm/boot/dts/armada-xp-lenovo-ix4-300d.dts


# -dDc-----n--F : /spi3 : spi-gpio : arch/arm/mach-s3c64xx/mach-smartq.c : CONFIG_SAMSUNG_ATAGS && CONFIG_MACH_SMARTQ : n, n
# CONFIG_SAMSUNG_ATAGS is not set
# CONFIG_SAMSUNG_ATAGS=y
# CONFIG_MACH_SMARTQ is not set
# CONFIG_MACH_SMARTQ=y

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

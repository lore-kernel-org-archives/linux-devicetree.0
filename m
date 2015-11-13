From: Mason <slash.tmp-GANU6spQydw@public.gmane.org>
Subject: Conditionals in dtsi files
Date: Fri, 13 Nov 2015 10:33:50 +0100
Message-ID: <5645AE7E.4090003@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, DT <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello,

I'm wondering how much C preprocessor syntax one can use in DT files.

Suppose I have 2 board DTS (both including common.dtsi)

board_A.dts (1-core), board_B.dts (2-core)

Can I have in common.dtsi something along these lines:

	cpus {
		enable-method = "foo,bar";
		#address-cells = <1>;
		#size-cells = <0>;

		cpu0: cpu@0 {
			compatible = "arm,cortex-a9";
			device_type = "cpu";
			reg = <0>;
		};

#if CORE_COUNT > 1
		cpu1: cpu@1 {
			compatible = "arm,cortex-a9";
			device_type = "cpu";
			reg = <1>;
		};
#endif
	};


board_A.dts would have
#define CORE_COUNT 1
#include "common.dtsi"

board_B.dts would have
#define CORE_COUNT 2
#include "common.dtsi"

Regards.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

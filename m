From: Vineet Gupta <Vineet.Gupta1-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: Re: Allocation of frame buffer at a specific memory range or address
Date: Sat, 16 Apr 2016 11:37:20 +0530
Message-ID: <5711D698.4030606@synopsys.com>
References: <1460735338.3248.21.camel@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1460735338.3248.21.camel-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexey Brodkin <Alexey.Brodkin-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Cc: "daniel-/w4YWyX8dFk@public.gmane.org" <daniel-/w4YWyX8dFk@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "airlied-cv59FeDIM0c@public.gmane.org" <airlied-cv59FeDIM0c@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Friday 15 April 2016 09:18 PM, Alexey Brodkin wrote:

> And now the question is how to force DRM subsystem or just that driver
> to use whatever predefined (say via device tree) location in memory
> for data buffer allocation.

It seems this is pretty easy to do with DT reserved-memory binding.

You need to partition memory into @memory and @reserved-memory.
Later can be subdivided into more granular regions and your driver can refer to
one of the regions.

Something like below (untested)

+	memory {
+		device_type = "memory";
+		reg = <0x0 0x80000000 0x0 0xA0000000>;
+		#address-cells = <2>;
+		#size-cells = <2>;
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+		/* This memory bypasses IOC port */
+		fb_reserved@A0000000 {
+			reg = <0x0 0xA0000000 0x0 0xAF000000>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			/* no-map;   */
+		};
+	};
+
+
+	fb0: video@12300000 {
+		memory-region = <&fb_reserved>;
+		/* ... */
+	};

This might also need a DT helper in ARC mm init code.

+	early_init_fdt_scan_reserved_mem();

HTH,
-Vineet
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

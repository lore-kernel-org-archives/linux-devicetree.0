From: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: amba uarts - arm type uarts fifo size provided by device tree
Date: Wed, 18 Feb 2015 13:53:11 -0500
Message-ID: <1424285593-2886-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jorge.ramirez-ortiz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

[PATCH 1/2] Documentation: bindings: add optional fifo size property
[PATCH 2/2] drivers/tty: pl011: read fifo size from OF if present


These patches aim at resolving an issue present on some of the amba pl011
uarts.  

Some of these arm type uarts have their fifo sizes not defined in terms of the
amba_rev register. 

Those uarts should be able to declare their fifo sizes using the optional
property "fifo-size" in the device tree. This device tree setting shall take
precedence over any other values. 


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

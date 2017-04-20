From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v2 0/3] Add R8A7743/SK-RZG1M PFC support
Date: Thu, 20 Apr 2017 21:51:32 +0300
Message-ID: <20170420185132.258111787__21872.9275548414$1492714547$gmane$org@cogentembedded.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello.

   Here's the set of 3 patches against Simon Horman's 'renesas.git' repo,
'renesas-devel-20170420-v4.11-rc7' tag.  We're adding the R8A7743 PFC node
and then describing the pins for SCIF0 and Ether devices declared earlier.
These patches depend on the R8A7743 PFC suport in order to work properly.

[1/3] ARM: dts: r8a7743: add PFC support
[2/3] ARM: dts: sk-rzg1m: add SCIF0 pins
[3/3] ARM: dts: sk-rzg1m: add Ether pins

WBR, Sergei
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

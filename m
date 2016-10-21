From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v4 0/7] Add R8A7743/SK-RZG1M board support
Date: Fri, 21 Oct 2016 23:39:14 +0300
Message-ID: <2719479.geOc9vqcRS@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello.

   Here's the set of 8 patches against Simon Horman's 'renesas.git' repo's
'renesas-devel-20161021-v4.9-rc1' tag. I'm adding the device tree support for
the R8A7743-based SK-RZG1M board. The SoC is close to R8A7791 and the board
seems identical to the R8A7791/Porter board. The device tree patches depend on
the R8A7743 CPG/MSSR driver series just posted in order to compile and work.
Already merged patches from this series won't be re-posted.

[1/7] ARM: dts: r8a7743: initial SoC device tree
[2/7] ARM: dts: r8a7743: add SYS-DMAC support
[3/7] ARM: dts: r8a7743: add [H]SCIF{A|B} support
[4/7] ARM: dts: r8a7743: add Ether support
[5/7] ARM: dts: r8a7743: add IRQC support
[6/7] ARM: dts: sk-rzg1m: initial device tree
[7/7] ARM: dts: sk-rzg1m: add Ether support

WBR, Sergei

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

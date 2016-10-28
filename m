From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 0/11] Add R8A7745/SK-RZG1E board support
Date: Sat, 29 Oct 2016 01:04:56 +0300
Message-ID: <4121805.SRTmqJtRfv@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello.

   Here's the set of 11 patches against Simon Horman's 'renesas.git' repo's
'renesas-devel-20161027-v4.9-rc2' tag plus the R8A7743/SK-RZG1M patch series.
I'm adding the device tree support for the R8A7745-based SK-RZG1E board.
The SoC is close to R8A7794 and the board seems identical to the R8A7794/SILK
board. The device tree patches depend on the R8A7745 CPG/MSSR driver series
just posted in order to compile and work.

[01/12] ARM: shmobile: r8a7745: add power domain index macros
[02/12] soc: renesas: rcar-sysc: add R8A7745 support
[03/12] ARM: shmobile: r8a7745: basic SoC support
[04/12] ARM: dts: r8a7745: initial SoC device tree
[05/12] ARM: dts: r8a7745: add SYS-DMAC support
[06/12] ARM: dts: r8a7745: add [H]SCIF{A|B} support
[07/12] ARM: dts: r8a7745: add Ether support
[08/12] ARM: dts: r8a7745: add IRQC support
[09/12] ARM: shmobile: document SK-RZG1M board
[10/12] ARM: dts: sk-rzg1e: initial device tree
[11/12] ARM: dts: sk-rzg1e: add Ether support

WBR, Sergei

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

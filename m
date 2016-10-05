From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 0/3] Renesas R8A7743 CPG/MSSR clock support
Date: Wed, 05 Oct 2016 23:50:32 +0300
Message-ID: <19700058.YBgRO3SXUI@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello.

   Here's the set of 3 patches against the 'clk-next' branch of CLK group's
'linux.git' repo. The R8A7743 SoC support will be posted separately later --
this series depend on the Kconfig variable introduced there, however, the DTs
in that series will depend on the patch #2 of this series...

[1/3] clk: renesas: cpg-mssr: add common R-Car Gen2 support
[2/3] ARM: shmobile: r8a7743: add CPG clock index macros
[3/3] clk: renesas: cpg-mssr: add R8A7743 support

MBR, Sergei

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

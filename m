From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 0/2] Renesas R8A7797 CPG/MSSR clock support
Date: Wed, 23 Aug 2017 15:52:27 +0300
Message-ID: <20170823125227.387729191__20687.2275718071$1503493071$gmane$org@cogentembedded.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Simon Horman <horms+renesas@verge.net.au>
List-Id: devicetree@vger.kernel.org

Hello.

   Here's the set of 2 patches against the 'clk-next' branch of CLK group's
'linux.git' repo. As the DT patches in the R8A7797/Eagle board support series
depend on the patch #1 of this series, it might make sense to merge this patch
to the 'renesas.git' repo as well...

[1/2] clk: renesas: add R8A7797 CPG core clock definitions
[2/2] clk: renesas: cpg-mssr: add R8A7797 support

MBR, Sergei

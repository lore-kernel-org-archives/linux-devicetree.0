Return-Path: <SRS0=qoK5=SH=vger.kernel.org=devicetree-owner@kernel.org>
Received: from www3345.sakura.ne.jp ([49.212.235.55]:45961 "EHLO
        www3345.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726594AbfDEGUQ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 5 Apr 2019 02:20:16 -0400
From: Cao Van Dong <cv-dong@jinso.co.jp>
Subject: [PATCH 0/4] Add CMT support for R-Car H3/M3-N/E3
Date: Fri,  5 Apr 2019 14:44:05 +0900
Message-Id: <1554443049-25127-1-git-send-email-cv-dong@jinso.co.jp>
Sender: devicetree-owner@vger.kernel.org
To: broonie@kernel.org, geert+renesas@glider.be, horms+renesas@verge.net.au, devicetree@vger.kernel.org
Cc: yoshihiro.shimoda.uh@renesas.com, kuninori.morimoto.gx@renesas.com, linux-renesas-soc@vger.kernel.org, h-inayoshi@jinso.co.jp, nv-dung@jinso.co.jp, na-hoan@jinso.co.jp
List-ID: <devicetree@vger.kernel.org>

This series adds CMT{0|1|2|3} device nodes for r8a7795/r8a77965/r8a77990 SoCs.
Based on the renesas-drivers-2019-04-02-v5.1-rc3 tag of renesas-drivers tree.

Cao Van Dong (4):
  arm64: dts: renesas: r8a7795: Add CMT device nodes
  arm64: dts: renesas: r8a77965: Add CMT device nodes
  arm64: dts: renesas: r8a77990: Add CMT device nodes
  dt-bindings: timer: renesas, cmt: Document r8a779{5|65|90} CMT support

 .../devicetree/bindings/timer/renesas,cmt.txt      |  6 ++
 arch/arm64/boot/dts/renesas/r8a7795.dtsi           | 70 ++++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a77965.dtsi          | 70 ++++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a77990.dtsi          | 70 ++++++++++++++++++++++
 4 files changed, 216 insertions(+)

-- 
2.7.4

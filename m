Return-Path: <SRS0=TQXC=2M=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78715C2D0D4
	for <linux-devicetree@archiver.kernel.org>; Sun, 22 Dec 2019 11:39:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2F1B52084D
	for <linux-devicetree@archiver.kernel.org>; Sun, 22 Dec 2019 11:39:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="di9FHAs5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726564AbfLVLjb (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 22 Dec 2019 06:39:31 -0500
Received: from mail-wr1-f51.google.com ([209.85.221.51]:37849 "EHLO
        mail-wr1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725977AbfLVLjb (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 22 Dec 2019 06:39:31 -0500
Received: by mail-wr1-f51.google.com with SMTP id w15so1105115wru.4;
        Sun, 22 Dec 2019 03:39:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=K4EV9LQr7C6yTs3Fg9ZnG84rPZ8sfg9BMuCtDKXasyI=;
        b=di9FHAs5XQF7Coi1Wfh8V2/E8Ar9ARKpGj0r1cdG0uBRxswONw2UUAaSUDvGuXGz2d
         +qMCVBIAfDn1vL3ZUCIZmKwhk/3nYeIdGJeGRXPyTw+PMuuKm9YTYy3zjQzNCSKb8bR9
         Mw8vEL6izbPJFsZdfJ75qOofvgUupEgflD/isczRL1HTeVkK9kbpDbQ1bX0kuYwy61Hb
         SssemeeyZ6hm9qy7vcP9ZKkTw9WX6sgMZWTQrGn70f4IZvfOi6H87mI2Un0g8/WEhiZl
         G2Dhb06pDqXxacoKQ7/qeNpOkP8m2N6ygD+rxX0ggZHsTRJAoY3L5fli3YLhJTXp4/7F
         chRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K4EV9LQr7C6yTs3Fg9ZnG84rPZ8sfg9BMuCtDKXasyI=;
        b=nPLkzNnUpv5kMvbWh60zXhoq2+RbyNdjrcQSt8FWMhI7O7Zd+KL3vGD2pcUzb8aHWt
         7O8e85jDFDTQX52lyLXfC+PBGzuoNZcU+epLk4u+N/VJ7SnVrHoMmnF6jdRbn8z2VG1F
         sW58Tl6qfoaOaySvQsSDDNNj715SAntPHQYXZo+q73VIeB2g2phQUHWgJMEttH+vOIU0
         CcGssp9OMpTiiJunlbQSLk+gfiN/0/uLhz5X719N67/QHhY0TWZSUxXexz2jHXw2yK7F
         TU81vYbmBhRpaNu2leuuv92CZK7PWtCIw1tIUiSu/wzsiJbAluAzfVJP+cfDG+hCZ0y4
         cFuQ==
X-Gm-Message-State: APjAAAWbLlxokyNcMnDvoRwdmSDXcGuMimZ4geu84zTv95SxfpHjEzmp
        8YNFzxcCK7FDSssMUGYNAJ0=
X-Google-Smtp-Source: APXvYqztp5oRsf5UPMhV1v0cPTp/NMfdxxNHFyfN6BJxR1VQ00JWEOphJEqIKUTHF0rGQbQ6a/hm5w==
X-Received: by 2002:adf:f606:: with SMTP id t6mr24188680wrp.85.1577014765974;
        Sun, 22 Dec 2019 03:39:25 -0800 (PST)
Received: from localhost (p2E5BEF3F.dip0.t-ipconnect.de. [46.91.239.63])
        by smtp.gmail.com with ESMTPSA id c17sm16772978wrr.87.2019.12.22.03.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2019 03:39:24 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 1/6] dt-bindings: memory-controller: Convert Tegra124 EMC to json-schema
Date:   Sun, 22 Dec 2019 12:39:16 +0100
Message-Id: <20191222113921.1469372-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191222113921.1469372-1-thierry.reding@gmail.com>
References: <20191222113921.1469372-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Convert the device tree bindings for the Tegra124 EMC controller to the
DT schema format using json-schema. While at it, clean up the binding a
little bit by removing any mention of how RAM code and clock frequency
are represented in unit-addresses (which they aren't) and by adding the
EMC clock without which the EMC controller can't change the frequency at
which the external memory is clocked. While this is technically an ABI
break (the clock was not required before), this should be fine because
there isn't much that the EMC driver can do without access to the EMC
clock.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../nvidia,tegra124-emc.txt                   | 374 -------------
 .../nvidia,tegra124-emc.yaml                  | 528 ++++++++++++++++++
 2 files changed, 528 insertions(+), 374 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.txt
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.yaml

diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.txt b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.txt
deleted file mode 100644
index ba0bc3f12419..000000000000
--- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.txt
+++ /dev/null
@@ -1,374 +0,0 @@
-NVIDIA Tegra124 SoC EMC (external memory controller)
-====================================================
-
-Required properties :
-- compatible : Should be "nvidia,tegra124-emc".
-- reg : physical base address and length of the controller's registers.
-- nvidia,memory-controller : phandle of the MC driver.
-
-The node should contain a "emc-timings" subnode for each supported RAM type
-(see field RAM_CODE in register PMC_STRAPPING_OPT_A), with its unit address
-being its RAM_CODE.
-
-Required properties for "emc-timings" nodes :
-- nvidia,ram-code : Should contain the value of RAM_CODE this timing set is
-used for.
-
-Each "emc-timings" node should contain a "timing" subnode for every supported
-EMC clock rate. The "timing" subnodes should have the clock rate in Hz as
-their unit address.
-
-Required properties for "timing" nodes :
-- clock-frequency : Should contain the memory clock rate in Hz.
-- The following properties contain EMC timing characterization values
-(specified in the board documentation) :
-  - nvidia,emc-auto-cal-config : EMC_AUTO_CAL_CONFIG
-  - nvidia,emc-auto-cal-config2 : EMC_AUTO_CAL_CONFIG2
-  - nvidia,emc-auto-cal-config3 : EMC_AUTO_CAL_CONFIG3
-  - nvidia,emc-auto-cal-interval : EMC_AUTO_CAL_INTERVAL
-  - nvidia,emc-bgbias-ctl0 : EMC_BGBIAS_CTL0
-  - nvidia,emc-cfg : EMC_CFG
-  - nvidia,emc-cfg-2 : EMC_CFG_2
-  - nvidia,emc-ctt-term-ctrl : EMC_CTT_TERM_CTRL
-  - nvidia,emc-mode-1 : Mode Register 1
-  - nvidia,emc-mode-2 : Mode Register 2
-  - nvidia,emc-mode-4 : Mode Register 4
-  - nvidia,emc-mode-reset : Mode Register 0
-  - nvidia,emc-mrs-wait-cnt : EMC_MRS_WAIT_CNT
-  - nvidia,emc-sel-dpd-ctrl : EMC_SEL_DPD_CTRL
-  - nvidia,emc-xm2dqspadctrl2 : EMC_XM2DQSPADCTRL2
-  - nvidia,emc-zcal-cnt-long : EMC_ZCAL_WAIT_CNT after clock change
-  - nvidia,emc-zcal-interval : EMC_ZCAL_INTERVAL
-- nvidia,emc-configuration : EMC timing characterization data. These are the
-registers (see section "15.6.2 EMC Registers" in the TRM) whose values need to
-be specified, according to the board documentation:
-
-	EMC_RC
-	EMC_RFC
-	EMC_RFC_SLR
-	EMC_RAS
-	EMC_RP
-	EMC_R2W
-	EMC_W2R
-	EMC_R2P
-	EMC_W2P
-	EMC_RD_RCD
-	EMC_WR_RCD
-	EMC_RRD
-	EMC_REXT
-	EMC_WEXT
-	EMC_WDV
-	EMC_WDV_MASK
-	EMC_QUSE
-	EMC_QUSE_WIDTH
-	EMC_IBDLY
-	EMC_EINPUT
-	EMC_EINPUT_DURATION
-	EMC_PUTERM_EXTRA
-	EMC_PUTERM_WIDTH
-	EMC_PUTERM_ADJ
-	EMC_CDB_CNTL_1
-	EMC_CDB_CNTL_2
-	EMC_CDB_CNTL_3
-	EMC_QRST
-	EMC_QSAFE
-	EMC_RDV
-	EMC_RDV_MASK
-	EMC_REFRESH
-	EMC_BURST_REFRESH_NUM
-	EMC_PRE_REFRESH_REQ_CNT
-	EMC_PDEX2WR
-	EMC_PDEX2RD
-	EMC_PCHG2PDEN
-	EMC_ACT2PDEN
-	EMC_AR2PDEN
-	EMC_RW2PDEN
-	EMC_TXSR
-	EMC_TXSRDLL
-	EMC_TCKE
-	EMC_TCKESR
-	EMC_TPD
-	EMC_TFAW
-	EMC_TRPAB
-	EMC_TCLKSTABLE
-	EMC_TCLKSTOP
-	EMC_TREFBW
-	EMC_FBIO_CFG6
-	EMC_ODT_WRITE
-	EMC_ODT_READ
-	EMC_FBIO_CFG5
-	EMC_CFG_DIG_DLL
-	EMC_CFG_DIG_DLL_PERIOD
-	EMC_DLL_XFORM_DQS0
-	EMC_DLL_XFORM_DQS1
-	EMC_DLL_XFORM_DQS2
-	EMC_DLL_XFORM_DQS3
-	EMC_DLL_XFORM_DQS4
-	EMC_DLL_XFORM_DQS5
-	EMC_DLL_XFORM_DQS6
-	EMC_DLL_XFORM_DQS7
-	EMC_DLL_XFORM_DQS8
-	EMC_DLL_XFORM_DQS9
-	EMC_DLL_XFORM_DQS10
-	EMC_DLL_XFORM_DQS11
-	EMC_DLL_XFORM_DQS12
-	EMC_DLL_XFORM_DQS13
-	EMC_DLL_XFORM_DQS14
-	EMC_DLL_XFORM_DQS15
-	EMC_DLL_XFORM_QUSE0
-	EMC_DLL_XFORM_QUSE1
-	EMC_DLL_XFORM_QUSE2
-	EMC_DLL_XFORM_QUSE3
-	EMC_DLL_XFORM_QUSE4
-	EMC_DLL_XFORM_QUSE5
-	EMC_DLL_XFORM_QUSE6
-	EMC_DLL_XFORM_QUSE7
-	EMC_DLL_XFORM_ADDR0
-	EMC_DLL_XFORM_ADDR1
-	EMC_DLL_XFORM_ADDR2
-	EMC_DLL_XFORM_ADDR3
-	EMC_DLL_XFORM_ADDR4
-	EMC_DLL_XFORM_ADDR5
-	EMC_DLL_XFORM_QUSE8
-	EMC_DLL_XFORM_QUSE9
-	EMC_DLL_XFORM_QUSE10
-	EMC_DLL_XFORM_QUSE11
-	EMC_DLL_XFORM_QUSE12
-	EMC_DLL_XFORM_QUSE13
-	EMC_DLL_XFORM_QUSE14
-	EMC_DLL_XFORM_QUSE15
-	EMC_DLI_TRIM_TXDQS0
-	EMC_DLI_TRIM_TXDQS1
-	EMC_DLI_TRIM_TXDQS2
-	EMC_DLI_TRIM_TXDQS3
-	EMC_DLI_TRIM_TXDQS4
-	EMC_DLI_TRIM_TXDQS5
-	EMC_DLI_TRIM_TXDQS6
-	EMC_DLI_TRIM_TXDQS7
-	EMC_DLI_TRIM_TXDQS8
-	EMC_DLI_TRIM_TXDQS9
-	EMC_DLI_TRIM_TXDQS10
-	EMC_DLI_TRIM_TXDQS11
-	EMC_DLI_TRIM_TXDQS12
-	EMC_DLI_TRIM_TXDQS13
-	EMC_DLI_TRIM_TXDQS14
-	EMC_DLI_TRIM_TXDQS15
-	EMC_DLL_XFORM_DQ0
-	EMC_DLL_XFORM_DQ1
-	EMC_DLL_XFORM_DQ2
-	EMC_DLL_XFORM_DQ3
-	EMC_DLL_XFORM_DQ4
-	EMC_DLL_XFORM_DQ5
-	EMC_DLL_XFORM_DQ6
-	EMC_DLL_XFORM_DQ7
-	EMC_XM2CMDPADCTRL
-	EMC_XM2CMDPADCTRL4
-	EMC_XM2CMDPADCTRL5
-	EMC_XM2DQPADCTRL2
-	EMC_XM2DQPADCTRL3
-	EMC_XM2CLKPADCTRL
-	EMC_XM2CLKPADCTRL2
-	EMC_XM2COMPPADCTRL
-	EMC_XM2VTTGENPADCTRL
-	EMC_XM2VTTGENPADCTRL2
-	EMC_XM2VTTGENPADCTRL3
-	EMC_XM2DQSPADCTRL3
-	EMC_XM2DQSPADCTRL4
-	EMC_XM2DQSPADCTRL5
-	EMC_XM2DQSPADCTRL6
-	EMC_DSR_VTTGEN_DRV
-	EMC_TXDSRVTTGEN
-	EMC_FBIO_SPARE
-	EMC_ZCAL_WAIT_CNT
-	EMC_MRS_WAIT_CNT2
-	EMC_CTT
-	EMC_CTT_DURATION
-	EMC_CFG_PIPE
-	EMC_DYN_SELF_REF_CONTROL
-	EMC_QPOP
-
-Example SoC include file:
-
-/ {
-	emc@7001b000 {
-		compatible = "nvidia,tegra124-emc";
-		reg = <0x0 0x7001b000 0x0 0x1000>;
-
-		nvidia,memory-controller = <&mc>;
-	};
-};
-
-Example board file:
-
-/ {
-	emc@7001b000 {
-		emc-timings-3 {
-			nvidia,ram-code = <3>;
-
-			timing-12750000 {
-				clock-frequency = <12750000>;
-
-				nvidia,emc-zcal-cnt-long = <0x00000042>;
-				nvidia,emc-auto-cal-interval = <0x001fffff>;
-				nvidia,emc-ctt-term-ctrl = <0x00000802>;
-				nvidia,emc-cfg = <0x73240000>;
-				nvidia,emc-cfg-2 = <0x000008c5>;
-				nvidia,emc-sel-dpd-ctrl = <0x00040128>;
-				nvidia,emc-bgbias-ctl0 = <0x00000008>;
-				nvidia,emc-auto-cal-config = <0xa1430000>;
-				nvidia,emc-auto-cal-config2 = <0x00000000>;
-				nvidia,emc-auto-cal-config3 = <0x00000000>;
-				nvidia,emc-mode-reset = <0x80001221>;
-				nvidia,emc-mode-1 = <0x80100003>;
-				nvidia,emc-mode-2 = <0x80200008>;
-				nvidia,emc-mode-4 = <0x00000000>;
-
-				nvidia,emc-configuration = <
-					0x00000000 /* EMC_RC */
-					0x00000003 /* EMC_RFC */
-					0x00000000 /* EMC_RFC_SLR */
-					0x00000000 /* EMC_RAS */
-					0x00000000 /* EMC_RP */
-					0x00000004 /* EMC_R2W */
-					0x0000000a /* EMC_W2R */
-					0x00000003 /* EMC_R2P */
-					0x0000000b /* EMC_W2P */
-					0x00000000 /* EMC_RD_RCD */
-					0x00000000 /* EMC_WR_RCD */
-					0x00000003 /* EMC_RRD */
-					0x00000003 /* EMC_REXT */
-					0x00000000 /* EMC_WEXT */
-					0x00000006 /* EMC_WDV */
-					0x00000006 /* EMC_WDV_MASK */
-					0x00000006 /* EMC_QUSE */
-					0x00000002 /* EMC_QUSE_WIDTH */
-					0x00000000 /* EMC_IBDLY */
-					0x00000005 /* EMC_EINPUT */
-					0x00000005 /* EMC_EINPUT_DURATION */
-					0x00010000 /* EMC_PUTERM_EXTRA */
-					0x00000003 /* EMC_PUTERM_WIDTH */
-					0x00000000 /* EMC_PUTERM_ADJ */
-					0x00000000 /* EMC_CDB_CNTL_1 */
-					0x00000000 /* EMC_CDB_CNTL_2 */
-					0x00000000 /* EMC_CDB_CNTL_3 */
-					0x00000004 /* EMC_QRST */
-					0x0000000c /* EMC_QSAFE */
-					0x0000000d /* EMC_RDV */
-					0x0000000f /* EMC_RDV_MASK */
-					0x00000060 /* EMC_REFRESH */
-					0x00000000 /* EMC_BURST_REFRESH_NUM */
-					0x00000018 /* EMC_PRE_REFRESH_REQ_CNT */
-					0x00000002 /* EMC_PDEX2WR */
-					0x00000002 /* EMC_PDEX2RD */
-					0x00000001 /* EMC_PCHG2PDEN */
-					0x00000000 /* EMC_ACT2PDEN */
-					0x00000007 /* EMC_AR2PDEN */
-					0x0000000f /* EMC_RW2PDEN */
-					0x00000005 /* EMC_TXSR */
-					0x00000005 /* EMC_TXSRDLL */
-					0x00000004 /* EMC_TCKE */
-					0x00000005 /* EMC_TCKESR */
-					0x00000004 /* EMC_TPD */
-					0x00000000 /* EMC_TFAW */
-					0x00000000 /* EMC_TRPAB */
-					0x00000005 /* EMC_TCLKSTABLE */
-					0x00000005 /* EMC_TCLKSTOP */
-					0x00000064 /* EMC_TREFBW */
-					0x00000000 /* EMC_FBIO_CFG6 */
-					0x00000000 /* EMC_ODT_WRITE */
-					0x00000000 /* EMC_ODT_READ */
-					0x106aa298 /* EMC_FBIO_CFG5 */
-					0x002c00a0 /* EMC_CFG_DIG_DLL */
-					0x00008000 /* EMC_CFG_DIG_DLL_PERIOD */
-					0x00064000 /* EMC_DLL_XFORM_DQS0 */
-					0x00064000 /* EMC_DLL_XFORM_DQS1 */
-					0x00064000 /* EMC_DLL_XFORM_DQS2 */
-					0x00064000 /* EMC_DLL_XFORM_DQS3 */
-					0x00064000 /* EMC_DLL_XFORM_DQS4 */
-					0x00064000 /* EMC_DLL_XFORM_DQS5 */
-					0x00064000 /* EMC_DLL_XFORM_DQS6 */
-					0x00064000 /* EMC_DLL_XFORM_DQS7 */
-					0x00064000 /* EMC_DLL_XFORM_DQS8 */
-					0x00064000 /* EMC_DLL_XFORM_DQS9 */
-					0x00064000 /* EMC_DLL_XFORM_DQS10 */
-					0x00064000 /* EMC_DLL_XFORM_DQS11 */
-					0x00064000 /* EMC_DLL_XFORM_DQS12 */
-					0x00064000 /* EMC_DLL_XFORM_DQS13 */
-					0x00064000 /* EMC_DLL_XFORM_DQS14 */
-					0x00064000 /* EMC_DLL_XFORM_DQS15 */
-					0x00000000 /* EMC_DLL_XFORM_QUSE0 */
-					0x00000000 /* EMC_DLL_XFORM_QUSE1 */
-					0x00000000 /* EMC_DLL_XFORM_QUSE2 */
-					0x00000000 /* EMC_DLL_XFORM_QUSE3 */
-					0x00000000 /* EMC_DLL_XFORM_QUSE4 */
-					0x00000000 /* EMC_DLL_XFORM_QUSE5 */
-					0x00000000 /* EMC_DLL_XFORM_QUSE6 */
-					0x00000000 /* EMC_DLL_XFORM_QUSE7 */
-					0x00000000 /* EMC_DLL_XFORM_ADDR0 */
-					0x00000000 /* EMC_DLL_XFORM_ADDR1 */
-					0x00000000 /* EMC_DLL_XFORM_ADDR2 */
-					0x00000000 /* EMC_DLL_XFORM_ADDR3 */
-					0x00000000 /* EMC_DLL_XFORM_ADDR4 */
-					0x00000000 /* EMC_DLL_XFORM_ADDR5 */
-					0x00000000 /* EMC_DLL_XFORM_QUSE8 */
-					0x00000000 /* EMC_DLL_XFORM_QUSE9 */
-					0x00000000 /* EMC_DLL_XFORM_QUSE10 */
-					0x00000000 /* EMC_DLL_XFORM_QUSE11 */
-					0x00000000 /* EMC_DLL_XFORM_QUSE12 */
-					0x00000000 /* EMC_DLL_XFORM_QUSE13 */
-					0x00000000 /* EMC_DLL_XFORM_QUSE14 */
-					0x00000000 /* EMC_DLL_XFORM_QUSE15 */
-					0x00000000 /* EMC_DLI_TRIM_TXDQS0 */
-					0x00000000 /* EMC_DLI_TRIM_TXDQS1 */
-					0x00000000 /* EMC_DLI_TRIM_TXDQS2 */
-					0x00000000 /* EMC_DLI_TRIM_TXDQS3 */
-					0x00000000 /* EMC_DLI_TRIM_TXDQS4 */
-					0x00000000 /* EMC_DLI_TRIM_TXDQS5 */
-					0x00000000 /* EMC_DLI_TRIM_TXDQS6 */
-					0x00000000 /* EMC_DLI_TRIM_TXDQS7 */
-					0x00000000 /* EMC_DLI_TRIM_TXDQS8 */
-					0x00000000 /* EMC_DLI_TRIM_TXDQS9 */
-					0x00000000 /* EMC_DLI_TRIM_TXDQS10 */
-					0x00000000 /* EMC_DLI_TRIM_TXDQS11 */
-					0x00000000 /* EMC_DLI_TRIM_TXDQS12 */
-					0x00000000 /* EMC_DLI_TRIM_TXDQS13 */
-					0x00000000 /* EMC_DLI_TRIM_TXDQS14 */
-					0x00000000 /* EMC_DLI_TRIM_TXDQS15 */
-					0x000fc000 /* EMC_DLL_XFORM_DQ0 */
-					0x000fc000 /* EMC_DLL_XFORM_DQ1 */
-					0x000fc000 /* EMC_DLL_XFORM_DQ2 */
-					0x000fc000 /* EMC_DLL_XFORM_DQ3 */
-					0x0000fc00 /* EMC_DLL_XFORM_DQ4 */
-					0x0000fc00 /* EMC_DLL_XFORM_DQ5 */
-					0x0000fc00 /* EMC_DLL_XFORM_DQ6 */
-					0x0000fc00 /* EMC_DLL_XFORM_DQ7 */
-					0x10000280 /* EMC_XM2CMDPADCTRL */
-					0x00000000 /* EMC_XM2CMDPADCTRL4 */
-					0x00111111 /* EMC_XM2CMDPADCTRL5 */
-					0x00000000 /* EMC_XM2DQPADCTRL2 */
-					0x00000000 /* EMC_XM2DQPADCTRL3 */
-					0x77ffc081 /* EMC_XM2CLKPADCTRL */
-					0x00000e0e /* EMC_XM2CLKPADCTRL2 */
-					0x81f1f108 /* EMC_XM2COMPPADCTRL */
-					0x07070004 /* EMC_XM2VTTGENPADCTRL */
-					0x0000003f /* EMC_XM2VTTGENPADCTRL2 */
-					0x016eeeee /* EMC_XM2VTTGENPADCTRL3 */
-					0x51451400 /* EMC_XM2DQSPADCTRL3 */
-					0x00514514 /* EMC_XM2DQSPADCTRL4 */
-					0x00514514 /* EMC_XM2DQSPADCTRL5 */
-					0x51451400 /* EMC_XM2DQSPADCTRL6 */
-					0x0000003f /* EMC_DSR_VTTGEN_DRV */
-					0x00000007 /* EMC_TXDSRVTTGEN */
-					0x00000000 /* EMC_FBIO_SPARE */
-					0x00000042 /* EMC_ZCAL_WAIT_CNT */
-					0x000e000e /* EMC_MRS_WAIT_CNT2 */
-					0x00000000 /* EMC_CTT */
-					0x00000003 /* EMC_CTT_DURATION */
-					0x0000f2f3 /* EMC_CFG_PIPE */
-					0x800001c5 /* EMC_DYN_SELF_REF_CONTROL */
-					0x0000000a /* EMC_QPOP */
-				>;
-			};
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.yaml
new file mode 100644
index 000000000000..dd1843489ad1
--- /dev/null
+++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.yaml
@@ -0,0 +1,528 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/memory-controllers/nvidia,tegra124-emc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra124 SoC External Memory Controller
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+description: |
+  The EMC interfaces with the off-chip SDRAM to service the request stream
+  sent from the memory controller.
+
+properties:
+  compatible:
+    const: nvidia,tegra124-emc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: external memory clock
+
+  clock-names:
+    items:
+      - const: emc
+
+  nvidia,memory-controller:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      phandle of the memory controller node
+
+patternProperties:
+  "^emc-timings-[0-9]+$":
+    type: object
+    properties:
+      nvidia,ram-code:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          value of the RAM_CODE field in the PMC_STRAPPING_OPT_A register that
+          this timing set is used for
+
+    patternProperties:
+      "^timing-[0-9]+$":
+        type: object
+        properties:
+          clock-frequency:
+            description:
+              external memory clock rate in Hz
+            minimum: 1000000
+            maximum: 1000000000
+
+          nvidia,emc-auto-cal-config:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            description:
+              value of the EMC_AUTO_CAL_CONFIG register for this set of
+              timings
+
+          nvidia,emc-auto-cal-config2:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            description:
+              value of the EMC_AUTO_CAL_CONFIG2 register for this set of
+              timings
+
+          nvidia,emc-auto-cal-config3:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            description:
+              value of the EMC_AUTO_CAL_CONFIG3 register for this set of
+              timings
+
+          nvidia,emc-auto-cal-interval:
+            allOf:
+              - $ref: /schemas/types.yaml#/definitions/uint32
+            description:
+              pad calibration interval in microseconds
+            minimum: 0
+            maximum: 2097151
+
+          nvidia,emc-bgbias-ctl0:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            description:
+              value of the EMC_BGBIAS_CTL0 register for this set of timings
+
+          nvidia,emc-cfg:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            description:
+              value of the EMC_CFG register for this set of timings
+
+          nvidia,emc-cfg-2:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            description:
+              value of the EMC_CFG_2 register for this set of timings
+
+          nvidia,emc-ctt-term-ctrl:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            description:
+              value of the EMC_CTT_TERM_CTRL register for this set of timings
+
+          nvidia,emc-mode-1:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            description:
+              value of the EMC_MRW register for this set of timings
+
+          nvidia,emc-mode-2:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            description:
+              value of the EMC_MRW2 register for this set of timings
+
+          nvidia,emc-mode-4:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            description:
+              value of the EMC_MRW4 register for this set of timings
+
+          nvidia,emc-mode-reset:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            description:
+              reset value of the EMC_MRS register for this set of timings
+
+          nvidia,emc-mrs-wait-cnt:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            description:
+              value of the EMR_MRS_WAIT_CNT register for this set of timings
+
+          nvidia,emc-sel-dpd-ctrl:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            description:
+              value of the EMC_SEL_DPD_CTRL register for this set of timings
+
+          nvidia,emc-xm2dqspadctrl2:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            description:
+              value of the EMC_XM2DQSPADCTRL2 register for this set of timings
+
+          nvidia,emc-zcal-cnt-long:
+            allOf:
+              - $ref: /schemas/types.yaml#/definitions/uint32
+            description:
+              number of EMC clocks to wait before issuing any commands after
+              clock change
+            minimum: 0
+            maximum: 1023
+
+          nvidia,emc-zcal-interval:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            description:
+              value of the EMC_ZCAL_INTERVAL register for this set of timings
+
+          nvidia,emc-configuration:
+            allOf:
+              - $ref: /schemas/types.yaml#/definitions/uint32-array
+            description:
+              EMC timing characterization data. These are the registers (see
+              section "15.6.2 EMC Registers" in the TRM) whose values need to
+              be specified, according to the board documentation.
+            items:
+              - description: EMC_RC
+              - description: EMC_RFC
+              - description: EMC_RFC_SLR
+              - description: EMC_RAS
+              - description: EMC_RP
+              - description: EMC_R2W
+              - description: EMC_W2R
+              - description: EMC_R2P
+              - description: EMC_W2P
+              - description: EMC_RD_RCD
+              - description: EMC_WR_RCD
+              - description: EMC_RRD
+              - description: EMC_REXT
+              - description: EMC_WEXT
+              - description: EMC_WDV
+              - description: EMC_WDV_MASK
+              - description: EMC_QUSE
+              - description: EMC_QUSE_WIDTH
+              - description: EMC_IBDLY
+              - description: EMC_EINPUT
+              - description: EMC_EINPUT_DURATION
+              - description: EMC_PUTERM_EXTRA
+              - description: EMC_PUTERM_WIDTH
+              - description: EMC_PUTERM_ADJ
+              - description: EMC_CDB_CNTL_1
+              - description: EMC_CDB_CNTL_2
+              - description: EMC_CDB_CNTL_3
+              - description: EMC_QRST
+              - description: EMC_QSAFE
+              - description: EMC_RDV
+              - description: EMC_RDV_MASK
+              - description: EMC_REFRESH
+              - description: EMC_BURST_REFRESH_NUM
+              - description: EMC_PRE_REFRESH_REQ_CNT
+              - description: EMC_PDEX2WR
+              - description: EMC_PDEX2RD
+              - description: EMC_PCHG2PDEN
+              - description: EMC_ACT2PDEN
+              - description: EMC_AR2PDEN
+              - description: EMC_RW2PDEN
+              - description: EMC_TXSR
+              - description: EMC_TXSRDLL
+              - description: EMC_TCKE
+              - description: EMC_TCKESR
+              - description: EMC_TPD
+              - description: EMC_TFAW
+              - description: EMC_TRPAB
+              - description: EMC_TCLKSTABLE
+              - description: EMC_TCLKSTOP
+              - description: EMC_TREFBW
+              - description: EMC_FBIO_CFG6
+              - description: EMC_ODT_WRITE
+              - description: EMC_ODT_READ
+              - description: EMC_FBIO_CFG5
+              - description: EMC_CFG_DIG_DLL
+              - description: EMC_CFG_DIG_DLL_PERIOD
+              - description: EMC_DLL_XFORM_DQS0
+              - description: EMC_DLL_XFORM_DQS1
+              - description: EMC_DLL_XFORM_DQS2
+              - description: EMC_DLL_XFORM_DQS3
+              - description: EMC_DLL_XFORM_DQS4
+              - description: EMC_DLL_XFORM_DQS5
+              - description: EMC_DLL_XFORM_DQS6
+              - description: EMC_DLL_XFORM_DQS7
+              - description: EMC_DLL_XFORM_DQS8
+              - description: EMC_DLL_XFORM_DQS9
+              - description: EMC_DLL_XFORM_DQS10
+              - description: EMC_DLL_XFORM_DQS11
+              - description: EMC_DLL_XFORM_DQS12
+              - description: EMC_DLL_XFORM_DQS13
+              - description: EMC_DLL_XFORM_DQS14
+              - description: EMC_DLL_XFORM_DQS15
+              - description: EMC_DLL_XFORM_QUSE0
+              - description: EMC_DLL_XFORM_QUSE1
+              - description: EMC_DLL_XFORM_QUSE2
+              - description: EMC_DLL_XFORM_QUSE3
+              - description: EMC_DLL_XFORM_QUSE4
+              - description: EMC_DLL_XFORM_QUSE5
+              - description: EMC_DLL_XFORM_QUSE6
+              - description: EMC_DLL_XFORM_QUSE7
+              - description: EMC_DLL_XFORM_ADDR0
+              - description: EMC_DLL_XFORM_ADDR1
+              - description: EMC_DLL_XFORM_ADDR2
+              - description: EMC_DLL_XFORM_ADDR3
+              - description: EMC_DLL_XFORM_ADDR4
+              - description: EMC_DLL_XFORM_ADDR5
+              - description: EMC_DLL_XFORM_QUSE8
+              - description: EMC_DLL_XFORM_QUSE9
+              - description: EMC_DLL_XFORM_QUSE10
+              - description: EMC_DLL_XFORM_QUSE11
+              - description: EMC_DLL_XFORM_QUSE12
+              - description: EMC_DLL_XFORM_QUSE13
+              - description: EMC_DLL_XFORM_QUSE14
+              - description: EMC_DLL_XFORM_QUSE15
+              - description: EMC_DLI_TRIM_TXDQS0
+              - description: EMC_DLI_TRIM_TXDQS1
+              - description: EMC_DLI_TRIM_TXDQS2
+              - description: EMC_DLI_TRIM_TXDQS3
+              - description: EMC_DLI_TRIM_TXDQS4
+              - description: EMC_DLI_TRIM_TXDQS5
+              - description: EMC_DLI_TRIM_TXDQS6
+              - description: EMC_DLI_TRIM_TXDQS7
+              - description: EMC_DLI_TRIM_TXDQS8
+              - description: EMC_DLI_TRIM_TXDQS9
+              - description: EMC_DLI_TRIM_TXDQS10
+              - description: EMC_DLI_TRIM_TXDQS11
+              - description: EMC_DLI_TRIM_TXDQS12
+              - description: EMC_DLI_TRIM_TXDQS13
+              - description: EMC_DLI_TRIM_TXDQS14
+              - description: EMC_DLI_TRIM_TXDQS15
+              - description: EMC_DLL_XFORM_DQ0
+              - description: EMC_DLL_XFORM_DQ1
+              - description: EMC_DLL_XFORM_DQ2
+              - description: EMC_DLL_XFORM_DQ3
+              - description: EMC_DLL_XFORM_DQ4
+              - description: EMC_DLL_XFORM_DQ5
+              - description: EMC_DLL_XFORM_DQ6
+              - description: EMC_DLL_XFORM_DQ7
+              - description: EMC_XM2CMDPADCTRL
+              - description: EMC_XM2CMDPADCTRL4
+              - description: EMC_XM2CMDPADCTRL5
+              - description: EMC_XM2DQPADCTRL2
+              - description: EMC_XM2DQPADCTRL3
+              - description: EMC_XM2CLKPADCTRL
+              - description: EMC_XM2CLKPADCTRL2
+              - description: EMC_XM2COMPPADCTRL
+              - description: EMC_XM2VTTGENPADCTRL
+              - description: EMC_XM2VTTGENPADCTRL2
+              - description: EMC_XM2VTTGENPADCTRL3
+              - description: EMC_XM2DQSPADCTRL3
+              - description: EMC_XM2DQSPADCTRL4
+              - description: EMC_XM2DQSPADCTRL5
+              - description: EMC_XM2DQSPADCTRL6
+              - description: EMC_DSR_VTTGEN_DRV
+              - description: EMC_TXDSRVTTGEN
+              - description: EMC_FBIO_SPARE
+              - description: EMC_ZCAL_WAIT_CNT
+              - description: EMC_MRS_WAIT_CNT2
+              - description: EMC_CTT
+              - description: EMC_CTT_DURATION
+              - description: EMC_CFG_PIPE
+              - description: EMC_DYN_SELF_REF_CONTROL
+              - description: EMC_QPOP
+
+        required:
+          - clock-frequency
+          - nvidia,emc-auto-cal-config
+          - nvidia,emc-auto-cal-config2
+          - nvidia,emc-auto-cal-config3
+          - nvidia,emc-auto-cal-interval
+          - nvidia,emc-bgbias-ctl0
+          - nvidia,emc-cfg
+          - nvidia,emc-cfg-2
+          - nvidia,emc-ctt-term-ctrl
+          - nvidia,emc-mode-1
+          - nvidia,emc-mode-2
+          - nvidia,emc-mode-4
+          - nvidia,emc-mode-reset
+          - nvidia,emc-mrs-wait-cnt
+          - nvidia,emc-sel-dpd-ctrl
+          - nvidia,emc-xm2dqspadctrl2
+          - nvidia,emc-zcal-cnt-long
+          - nvidia,emc-zcal-interval
+          - nvidia,emc-configuration
+
+        additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - nvidia,memory-controller
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/tegra124-car.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    mc: memory-controller@70019000 {
+        compatible = "nvidia,tegra124-mc";
+        reg = <0x0 0x70019000 0x0 0x1000>;
+        clocks = <&tegra_car TEGRA124_CLK_MC>;
+        clock-names = "mc";
+
+        interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>;
+
+        #iommu-cells = <1>;
+    };
+
+    external-memory-controller@7001b000 {
+        compatible = "nvidia,tegra124-emc";
+        reg = <0x0 0x7001b000 0x0 0x1000>;
+        clocks = <&car TEGRA124_CLK_EMC>;
+        clock-names = "emc";
+
+        nvidia,memory-controller = <&mc>;
+
+        emc-timings-0 {
+            nvidia,ram-code = <3>;
+
+            timing-0 {
+                clock-frequency = <12750000>;
+
+                nvidia,emc-zcal-cnt-long = <0x00000042>;
+                nvidia,emc-auto-cal-interval = <0x001fffff>;
+                nvidia,emc-ctt-term-ctrl = <0x00000802>;
+                nvidia,emc-cfg = <0x73240000>;
+                nvidia,emc-cfg-2 = <0x000008c5>;
+                nvidia,emc-sel-dpd-ctrl = <0x00040128>;
+                nvidia,emc-bgbias-ctl0 = <0x00000008>;
+                nvidia,emc-auto-cal-config = <0xa1430000>;
+                nvidia,emc-auto-cal-config2 = <0x00000000>;
+                nvidia,emc-auto-cal-config3 = <0x00000000>;
+                nvidia,emc-mode-reset = <0x80001221>;
+                nvidia,emc-mode-1 = <0x80100003>;
+                nvidia,emc-mode-2 = <0x80200008>;
+                nvidia,emc-mode-4 = <0x00000000>;
+
+                nvidia,emc-configuration = <
+                    0x00000000 /* EMC_RC */
+                    0x00000003 /* EMC_RFC */
+                    0x00000000 /* EMC_RFC_SLR */
+                    0x00000000 /* EMC_RAS */
+                    0x00000000 /* EMC_RP */
+                    0x00000004 /* EMC_R2W */
+                    0x0000000a /* EMC_W2R */
+                    0x00000003 /* EMC_R2P */
+                    0x0000000b /* EMC_W2P */
+                    0x00000000 /* EMC_RD_RCD */
+                    0x00000000 /* EMC_WR_RCD */
+                    0x00000003 /* EMC_RRD */
+                    0x00000003 /* EMC_REXT */
+                    0x00000000 /* EMC_WEXT */
+                    0x00000006 /* EMC_WDV */
+                    0x00000006 /* EMC_WDV_MASK */
+                    0x00000006 /* EMC_QUSE */
+                    0x00000002 /* EMC_QUSE_WIDTH */
+                    0x00000000 /* EMC_IBDLY */
+                    0x00000005 /* EMC_EINPUT */
+                    0x00000005 /* EMC_EINPUT_DURATION */
+                    0x00010000 /* EMC_PUTERM_EXTRA */
+                    0x00000003 /* EMC_PUTERM_WIDTH */
+                    0x00000000 /* EMC_PUTERM_ADJ */
+                    0x00000000 /* EMC_CDB_CNTL_1 */
+                    0x00000000 /* EMC_CDB_CNTL_2 */
+                    0x00000000 /* EMC_CDB_CNTL_3 */
+                    0x00000004 /* EMC_QRST */
+                    0x0000000c /* EMC_QSAFE */
+                    0x0000000d /* EMC_RDV */
+                    0x0000000f /* EMC_RDV_MASK */
+                    0x00000060 /* EMC_REFRESH */
+                    0x00000000 /* EMC_BURST_REFRESH_NUM */
+                    0x00000018 /* EMC_PRE_REFRESH_REQ_CNT */
+                    0x00000002 /* EMC_PDEX2WR */
+                    0x00000002 /* EMC_PDEX2RD */
+                    0x00000001 /* EMC_PCHG2PDEN */
+                    0x00000000 /* EMC_ACT2PDEN */
+                    0x00000007 /* EMC_AR2PDEN */
+                    0x0000000f /* EMC_RW2PDEN */
+                    0x00000005 /* EMC_TXSR */
+                    0x00000005 /* EMC_TXSRDLL */
+                    0x00000004 /* EMC_TCKE */
+                    0x00000005 /* EMC_TCKESR */
+                    0x00000004 /* EMC_TPD */
+                    0x00000000 /* EMC_TFAW */
+                    0x00000000 /* EMC_TRPAB */
+                    0x00000005 /* EMC_TCLKSTABLE */
+                    0x00000005 /* EMC_TCLKSTOP */
+                    0x00000064 /* EMC_TREFBW */
+                    0x00000000 /* EMC_FBIO_CFG6 */
+                    0x00000000 /* EMC_ODT_WRITE */
+                    0x00000000 /* EMC_ODT_READ */
+                    0x106aa298 /* EMC_FBIO_CFG5 */
+                    0x002c00a0 /* EMC_CFG_DIG_DLL */
+                    0x00008000 /* EMC_CFG_DIG_DLL_PERIOD */
+                    0x00064000 /* EMC_DLL_XFORM_DQS0 */
+                    0x00064000 /* EMC_DLL_XFORM_DQS1 */
+                    0x00064000 /* EMC_DLL_XFORM_DQS2 */
+                    0x00064000 /* EMC_DLL_XFORM_DQS3 */
+                    0x00064000 /* EMC_DLL_XFORM_DQS4 */
+                    0x00064000 /* EMC_DLL_XFORM_DQS5 */
+                    0x00064000 /* EMC_DLL_XFORM_DQS6 */
+                    0x00064000 /* EMC_DLL_XFORM_DQS7 */
+                    0x00064000 /* EMC_DLL_XFORM_DQS8 */
+                    0x00064000 /* EMC_DLL_XFORM_DQS9 */
+                    0x00064000 /* EMC_DLL_XFORM_DQS10 */
+                    0x00064000 /* EMC_DLL_XFORM_DQS11 */
+                    0x00064000 /* EMC_DLL_XFORM_DQS12 */
+                    0x00064000 /* EMC_DLL_XFORM_DQS13 */
+                    0x00064000 /* EMC_DLL_XFORM_DQS14 */
+                    0x00064000 /* EMC_DLL_XFORM_DQS15 */
+                    0x00000000 /* EMC_DLL_XFORM_QUSE0 */
+                    0x00000000 /* EMC_DLL_XFORM_QUSE1 */
+                    0x00000000 /* EMC_DLL_XFORM_QUSE2 */
+                    0x00000000 /* EMC_DLL_XFORM_QUSE3 */
+                    0x00000000 /* EMC_DLL_XFORM_QUSE4 */
+                    0x00000000 /* EMC_DLL_XFORM_QUSE5 */
+                    0x00000000 /* EMC_DLL_XFORM_QUSE6 */
+                    0x00000000 /* EMC_DLL_XFORM_QUSE7 */
+                    0x00000000 /* EMC_DLL_XFORM_ADDR0 */
+                    0x00000000 /* EMC_DLL_XFORM_ADDR1 */
+                    0x00000000 /* EMC_DLL_XFORM_ADDR2 */
+                    0x00000000 /* EMC_DLL_XFORM_ADDR3 */
+                    0x00000000 /* EMC_DLL_XFORM_ADDR4 */
+                    0x00000000 /* EMC_DLL_XFORM_ADDR5 */
+                    0x00000000 /* EMC_DLL_XFORM_QUSE8 */
+                    0x00000000 /* EMC_DLL_XFORM_QUSE9 */
+                    0x00000000 /* EMC_DLL_XFORM_QUSE10 */
+                    0x00000000 /* EMC_DLL_XFORM_QUSE11 */
+                    0x00000000 /* EMC_DLL_XFORM_QUSE12 */
+                    0x00000000 /* EMC_DLL_XFORM_QUSE13 */
+                    0x00000000 /* EMC_DLL_XFORM_QUSE14 */
+                    0x00000000 /* EMC_DLL_XFORM_QUSE15 */
+                    0x00000000 /* EMC_DLI_TRIM_TXDQS0 */
+                    0x00000000 /* EMC_DLI_TRIM_TXDQS1 */
+                    0x00000000 /* EMC_DLI_TRIM_TXDQS2 */
+                    0x00000000 /* EMC_DLI_TRIM_TXDQS3 */
+                    0x00000000 /* EMC_DLI_TRIM_TXDQS4 */
+                    0x00000000 /* EMC_DLI_TRIM_TXDQS5 */
+                    0x00000000 /* EMC_DLI_TRIM_TXDQS6 */
+                    0x00000000 /* EMC_DLI_TRIM_TXDQS7 */
+                    0x00000000 /* EMC_DLI_TRIM_TXDQS8 */
+                    0x00000000 /* EMC_DLI_TRIM_TXDQS9 */
+                    0x00000000 /* EMC_DLI_TRIM_TXDQS10 */
+                    0x00000000 /* EMC_DLI_TRIM_TXDQS11 */
+                    0x00000000 /* EMC_DLI_TRIM_TXDQS12 */
+                    0x00000000 /* EMC_DLI_TRIM_TXDQS13 */
+                    0x00000000 /* EMC_DLI_TRIM_TXDQS14 */
+                    0x00000000 /* EMC_DLI_TRIM_TXDQS15 */
+                    0x000fc000 /* EMC_DLL_XFORM_DQ0 */
+                    0x000fc000 /* EMC_DLL_XFORM_DQ1 */
+                    0x000fc000 /* EMC_DLL_XFORM_DQ2 */
+                    0x000fc000 /* EMC_DLL_XFORM_DQ3 */
+                    0x0000fc00 /* EMC_DLL_XFORM_DQ4 */
+                    0x0000fc00 /* EMC_DLL_XFORM_DQ5 */
+                    0x0000fc00 /* EMC_DLL_XFORM_DQ6 */
+                    0x0000fc00 /* EMC_DLL_XFORM_DQ7 */
+                    0x10000280 /* EMC_XM2CMDPADCTRL */
+                    0x00000000 /* EMC_XM2CMDPADCTRL4 */
+                    0x00111111 /* EMC_XM2CMDPADCTRL5 */
+                    0x00000000 /* EMC_XM2DQPADCTRL2 */
+                    0x00000000 /* EMC_XM2DQPADCTRL3 */
+                    0x77ffc081 /* EMC_XM2CLKPADCTRL */
+                    0x00000e0e /* EMC_XM2CLKPADCTRL2 */
+                    0x81f1f108 /* EMC_XM2COMPPADCTRL */
+                    0x07070004 /* EMC_XM2VTTGENPADCTRL */
+                    0x0000003f /* EMC_XM2VTTGENPADCTRL2 */
+                    0x016eeeee /* EMC_XM2VTTGENPADCTRL3 */
+                    0x51451400 /* EMC_XM2DQSPADCTRL3 */
+                    0x00514514 /* EMC_XM2DQSPADCTRL4 */
+                    0x00514514 /* EMC_XM2DQSPADCTRL5 */
+                    0x51451400 /* EMC_XM2DQSPADCTRL6 */
+                    0x0000003f /* EMC_DSR_VTTGEN_DRV */
+                    0x00000007 /* EMC_TXDSRVTTGEN */
+                    0x00000000 /* EMC_FBIO_SPARE */
+                    0x00000042 /* EMC_ZCAL_WAIT_CNT */
+                    0x000e000e /* EMC_MRS_WAIT_CNT2 */
+                    0x00000000 /* EMC_CTT */
+                    0x00000003 /* EMC_CTT_DURATION */
+                    0x0000f2f3 /* EMC_CFG_PIPE */
+                    0x800001c5 /* EMC_DYN_SELF_REF_CONTROL */
+                    0x0000000a /* EMC_QPOP */
+                >;
+            };
+        };
+    };
-- 
2.24.1


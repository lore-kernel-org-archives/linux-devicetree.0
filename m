Return-Path: <SRS0=ND8X=23=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0BB6C33C8C
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Jan 2020 18:17:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B35152072C
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Jan 2020 18:17:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726643AbgAFSRf (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 6 Jan 2020 13:17:35 -0500
Received: from asavdk4.altibox.net ([109.247.116.15]:54852 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726640AbgAFSRf (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 6 Jan 2020 13:17:35 -0500
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id 8248F8051C;
        Mon,  6 Jan 2020 19:17:32 +0100 (CET)
Date:   Mon, 6 Jan 2020 19:17:31 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     dri-devel@lists.freedesktop.org,
        Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
Cc:     Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
        devicetree@vger.kernel.org
Subject: dt-bindings: fix warnings in xinpeng,xpp055c272.yaml
Message-ID: <20200106181731.GA24294@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8 a=NXpJzYs8AAAA:8 a=VwQbUJbxAAAA:8
        a=i8DPN7MwQ2D8WwEsYkQA:9 a=1B2umpmUSmRfsa1z:21 a=al_32F_5cpsT22RA:21
        a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22 a=cwV61pgf2j4Cq8VD9hE_:22
        a=AjGcO6oz07-iQ99wixmX:22
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The reg property in the example caused following warnings:

xinpeng,xpp055c272.example.dts:20.17-27: Warning (reg_format): /example-0/dsi@ff450000/panel@0:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)

xinpeng,xpp055c272.example.dt.yaml: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
xinpeng,xpp055c272.example.dt.yaml: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
xinpeng,xpp055c272.example.dt.yaml: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
xinpeng,xpp055c272.example.dts:18.21-24.15: Warning (avoid_default_addr_size): /example-0/dsi@ff450000/panel@0: Relying on default #address-cells value
xinpeng,xpp055c272.example.dts:18.21-24.15: Warning (avoid_default_addr_size): /example-0/dsi@ff450000/panel@0: Relying on default #size-cells value

Added #address-cells and #size-cells to silence the warning.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
---

I forgot to push this fixed while applying the patch.

	Sam

 .../devicetree/bindings/display/panel/xinpeng,xpp055c272.yaml   | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/xinpeng,xpp055c272.yaml b/Documentation/devicetree/bindings/display/panel/xinpeng,xpp055c272.yaml
index 378cf9e2549d..186e5e1c8fa3 100644
--- a/Documentation/devicetree/bindings/display/panel/xinpeng,xpp055c272.yaml
+++ b/Documentation/devicetree/bindings/display/panel/xinpeng,xpp055c272.yaml
@@ -35,6 +35,8 @@ additionalProperties: false
 examples:
   - |
     dsi@ff450000 {
+        #address-cells = <1>;
+        #size-cells = <0>;
         panel@0 {
             compatible = "xinpeng,xpp055c272";
             reg = <0>;
-- 
2.20.1


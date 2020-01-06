Return-Path: <SRS0=ND8X=23=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97B48C33C8C
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Jan 2020 19:07:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7406B2072E
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Jan 2020 19:07:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726612AbgAFTHO (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 6 Jan 2020 14:07:14 -0500
Received: from vegas.theobroma-systems.com ([144.76.126.164]:46202 "EHLO
        mail.theobroma-systems.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726569AbgAFTHO (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 6 Jan 2020 14:07:14 -0500
X-Greylist: delayed 1753 seconds by postgrey-1.27 at vger.kernel.org; Mon, 06 Jan 2020 14:07:13 EST
Received: from ip5f5a5f74.dynamic.kabel-deutschland.de ([95.90.95.116]:43212 helo=diego.localnet)
        by mail.theobroma-systems.com with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
        (Exim 4.80)
        (envelope-from <heiko.stuebner@theobroma-systems.com>)
        id 1ioXGE-0003bU-DQ; Mon, 06 Jan 2020 19:37:54 +0100
From:   Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     dri-devel@lists.freedesktop.org,
        Maxime Ripard <mripard@kernel.org>,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: Re: dt-bindings: fix warnings in xinpeng,xpp055c272.yaml
Date:   Mon, 06 Jan 2020 19:37:53 +0100
Message-ID: <8557333.WPpiFS3LZB@diego>
Organization: Theobroma Systems
In-Reply-To: <20200106181731.GA24294@ravnborg.org>
References: <20200106181731.GA24294@ravnborg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Am Montag, 6. Januar 2020, 19:17:31 CET schrieb Sam Ravnborg:
> The reg property in the example caused following warnings:
> 
> xinpeng,xpp055c272.example.dts:20.17-27: Warning (reg_format): /example-0/dsi@ff450000/panel@0:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
> 
> xinpeng,xpp055c272.example.dt.yaml: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
> xinpeng,xpp055c272.example.dt.yaml: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
> xinpeng,xpp055c272.example.dt.yaml: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
> xinpeng,xpp055c272.example.dts:18.21-24.15: Warning (avoid_default_addr_size): /example-0/dsi@ff450000/panel@0: Relying on default #address-cells value
> xinpeng,xpp055c272.example.dts:18.21-24.15: Warning (avoid_default_addr_size): /example-0/dsi@ff450000/panel@0: Relying on default #size-cells value
> 
> Added #address-cells and #size-cells to silence the warning.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org

Reviewed-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>




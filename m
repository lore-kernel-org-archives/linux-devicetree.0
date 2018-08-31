Return-Path: <SRS0=WyUm=LO=vger.kernel.org=devicetree-owner@kernel.org>
Received: from lelv0143.ext.ti.com ([198.47.23.248]:46058 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727286AbeHaTXN (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 31 Aug 2018 15:23:13 -0400
From: Tero Kristo <t-kristo@ti.com>
Subject: [PATCH 0/3] ARM: dts: am3/am4/dra7 clkctrl data conversion
Date: Fri, 31 Aug 2018 18:14:48 +0300
Message-ID: <1535728491-25321-1-git-send-email-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: tony@atomide.com, linux-omap@vger.kernel.org
Cc: devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi,

This series converts the clkctrl data on am3/am4/dra7 to be split
based on the clockdomain boundaries, instead of current CM node
split.

This series depends on the omap2 change [1] and the clock driver
changes [2].

-Tero

[1] https://marc.info/?l=linux-omap&m=153572772121288&w=2
[2] https://marc.info/?l=linux-clk&m=153572807021413&w=2


--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

Return-Path: <SRS0=+8o7=MR=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-wr1-f66.google.com ([209.85.221.66]:42841 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727701AbeJETol (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 5 Oct 2018 15:44:41 -0400
Received: by mail-wr1-f66.google.com with SMTP id g15-v6so10797644wru.9
        for <devicetree@vger.kernel.org>; Fri, 05 Oct 2018 05:46:06 -0700 (PDT)
Date: Fri, 5 Oct 2018 14:45:19 +0200
From: Oliver Graute <oliver.graute@gmail.com>
Subject: Can't set MX6UL_PAD_LCD_DATA10 register with devicetree
Message-ID: <20181005124519.GA7699@graute-opti>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: devicetree-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de
List-ID: <devicetree@vger.kernel.org>

Hello list,

I try to set the following PAD in my imx6ul devicetree (derived from
imx6ul-14x14-evk.dts)

MX6UL_PAD_LCD_DATA10__GPIO3_IO15 0x100b0

but after kernel compiling and booting the register value is not
changed. A readout with devmem2 show me the wrong value.

devmem2 0x020E03CC
/dev/mem opened.
Memory mapped at address 0x76fc4000.
Read at address  0x020E03CC (0x76fc43cc): 0x000010B0

Setting the register manually with devmem2 just works fine.

/usr/bin/devmem2 0x020E03CC w 0x000100B0

other PADs like MX6UL_PAD_GPIO1_IO07__ENET1_MDC I could configure via
the imx6ul devicetree.

ideas what I'm doing wrong here?

Best Regards,

Oliver

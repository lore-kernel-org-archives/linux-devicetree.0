Return-Path: <SRS0=WWXW=5F=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA705C4332D
	for <linux-devicetree@archiver.kernel.org>; Fri, 20 Mar 2020 16:12:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id ADB2820739
	for <linux-devicetree@archiver.kernel.org>; Fri, 20 Mar 2020 16:12:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727317AbgCTQMQ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 20 Mar 2020 12:12:16 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:52523 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727093AbgCTQMQ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 20 Mar 2020 12:12:16 -0400
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1M1qbm-1jHW6v0RyK-002Jc0 for <devicetree@vger.kernel.org>; Fri, 20 Mar
 2020 17:12:13 +0100
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id DDFD965034C
        for <devicetree@vger.kernel.org>; Fri, 20 Mar 2020 16:12:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id tY3ciaA_hv9A for <devicetree@vger.kernel.org>;
        Fri, 20 Mar 2020 17:12:12 +0100 (CET)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
        by mail.cetitecgmbh.com (Postfix) with ESMTPS id 6F37964DC51
        for <devicetree@vger.kernel.org>; Fri, 20 Mar 2020 17:12:12 +0100 (CET)
Received: from pflmari.corp.cetitec.com (10.8.5.41) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 20 Mar 2020 17:12:12 +0100
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id 37E03804FB; Fri, 20 Mar 2020 17:11:40 +0100 (CET)
Date:   Fri, 20 Mar 2020 17:11:40 +0100
From:   Alex Riesen <alexander.riesen@cetitec.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
CC:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        <devel@driverdev.osuosl.org>, <linux-media@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>
Subject: [PATCH v3 00/11] media: adv748x: add support for HDMI audio
Message-ID: <cover.1584720678.git.alexander.riesen@cetitec.com>
Mail-Followup-To: Alex Riesen <alexander.riesen@cetitec.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        devel@driverdev.osuosl.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-Originating-IP: [10.8.5.41]
X-ClientProxiedBy: PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) To
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99)
X-EsetResult: clean, is OK
X-EsetId: 37303A290D7F536A6D7662
X-Provags-ID: V03:K1:VUcJOP8Hzi6LWFADpkqtel4Kdo/bT7XQBYlOeJTp/fUWJuo4Xrp
 M9AW0SwENh+x2nrc7p79yf9cDI7NzoN2BpFMdSC8O8wIwY63Vx20XJzDe27EKo45VrA3GKM
 O/fjbfvrzGMCtg6Y/KXJk83bzAdv0uGxpcpH8hoHYu8GmJzKNZFbmzp8Vv42nAJU/Syp+Wl
 ssTRqT+SBMhE+c6wC+X7w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:6pY3ZvNyAnM=:Ul9J5UM6TOC52QY2YjGUdo
 nb9NkpsIhiVlWi95SXhKlUtRreH3GMre3tyVNDmIe+pl3us05+xgc8nLsyzY0GdqZNu/MiwZK
 QpDr5ZuoFLnSnjVinjMAZqx1vs5o04KFHH9kXece118CljsFSUsaBS6fdfZdDaXiwuY4jCalC
 Fdt4P7G7ynONKi2D9JJrBCjQ7CZYU/uYodzJ7ZthCBxLRxOBu+kf3sHIKX4g4N1YwnZXdCmO+
 bMLAgnAhgRTiVrmC2R9SourowS7h2qVSQC777PLdAMULVpLpjUGiFxyaplcRntFhNF3aK0Fs1
 gcIr5WBMdAMARz37yD6LBWmHgy54aI+5X9FphcXA9fvXJexK4iav8pksfCb8Qzf6srfiXszgV
 fEk//QG1CxUWFNzUvjuzRZBjmZ6KNurB9L+ZXv2+pZv1/ht9977pLfFS4JzyDMW8Pr3gDYWDz
 JJwIJwGW0cUqJejIm0FbyBEd0+2dOfc148It3htawLk1PIWapcvFwp5Ys67mbRq043AUYx5ay
 C/GE8ZvQceRwxKSbQDQrl2idV+SqCxoCWcEgdLDZ14bxbChkTOIzq3uRelL120w7a7DHX4vFW
 rzJN47F5JWYH6gxKKUlX/GCfjUMQCl5r9sw6zQwtBsYF/rQpPKTQNNaHT+FqsTi68XtqVV+sa
 VGTeF+fIQpZ1g0Jh4vf9cAzcl82BQWygB6et2HAlzbAuybRxTVp5cOdHNT0an6WChFH2oBdyQ
 TJEUv54H04r/udpsYILlCFmOdEa/X5z4bWJvocimK8t0gRqlSt9tmnPo2Om8/m4AU51NlrYu+
 guuL2O/IU//EKMMEdbzOv3xm+faFy36TYJkmMqhOQFf7JC+ynY6btF4vRu4J4xjxLhr6YI+
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This adds minimal support for accessing the HDMI audio provided through the
I2S port available on ADV7481 and ADV7482 decoder devices by ADI.
The port carries audio signal from the decoded HDMI stream.

Currently, the driver only supports I2S in TDM, 8 channels a 24bit at 48kHz.
Furthermore, only left-justified, 8 slots, 32bit/slot TDM, at 256fs has been
ever tried.

An ADV7482 on the Renesas Salvator-X ES1.1 (R8A77950 SoC) was used during
development of this code.

Changes since v2:
  - prepare/enable the clock when it is used, as it seems nothing else does
    this otherwise

  - give the clock a unique name to ensure it can be registered if there are
    multiple adv748x devices in the system

  - remove optionality note from clock cell description to ensure the device
    description matches the real device (the line is always present, even
    if not used)

Changes since v1:
  - Add ssi4_ctrl pin group to the sound pins. The pins are responsible for
    SCK4 (sample clock) WS4 and (word boundary input), and are required for
    SSI audio input over I2S.
    Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>

  - Removed the audio clock C from the list of clocks of adv748x,
    it is exactly the other way around.
    Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>

  - Add an instance of (currently) fixed rate I2S master clock (MCLK),
    connected to the audio_clk_c line of the R-Car SoC.
    Explicitly declare the device a clock producer and add it to the
    list of clocks used by the audio system of the Salvator-X board.
    Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>

  - The implementation of DAI driver has been moved in a separate file
    and modified to activate audio decoding and I2S streaming using
    snd_soc_dai_... interfaces. This allows the driver to be used with
    just ALSA interfaces.

  - The ioctls for selecting audio output and muting have been removed,
    as not applicable.
    Suggested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
    I have left implementation of the QUERYCAP in, as it seems to be required
    by v4l-ctl to support loading of EDID for this node. And setting the EDID
    is one feature I desperately need: there are devices which plainly refuse
    to talk to the sink if it does not provide EDID they like.

  - A device tree configuration without audio port will disable the audio code
    altogether, supporting integrations where the port is not connected.

  - The patches have been re-arranged, starting with the generic changes and
    changes not related to audio directly. Those will be probably sent as a
    separate series later.

  - The whole series has been rebased on top of v5.6-rc6

Alex Riesen (11):
  media: adv748x: fix end-of-line terminators in diagnostic statements
  media: adv748x: include everything adv748x.h needs into the file
  media: adv748x: reduce amount of code for bitwise modifications of
    device registers
  media: adv748x: add definitions for audio output related registers
  media: adv748x: add support for HDMI audio
  media: adv748x: prepare/enable mclk when the audio is used
  media: adv748x: only activate DAI if it is described in device tree
  dt-bindings: adv748x: add information about serial audio interface
    (I2S/TDM)
  arm64: dts: renesas: salvator: add a connection from adv748x codec
    (HDMI input) to the R-Car SoC
  media: adv748x: add support for log_status ioctl
  media: adv748x: allow the HDMI sub-device to accept EDID

 .../devicetree/bindings/media/i2c/adv748x.txt |  16 +-
 .../boot/dts/renesas/r8a77950-salvator-x.dts  |   3 +-
 .../boot/dts/renesas/salvator-common.dtsi     |  47 ++-
 drivers/media/i2c/adv748x/Makefile            |   3 +-
 drivers/media/i2c/adv748x/adv748x-afe.c       |   6 +-
 drivers/media/i2c/adv748x/adv748x-core.c      |  60 ++--
 drivers/media/i2c/adv748x/adv748x-csi2.c      |   8 +-
 drivers/media/i2c/adv748x/adv748x-dai.c       | 282 ++++++++++++++++++
 drivers/media/i2c/adv748x/adv748x-hdmi.c      | 212 ++++++++++++-
 drivers/media/i2c/adv748x/adv748x.h           |  67 ++++-
 10 files changed, 662 insertions(+), 42 deletions(-)
 create mode 100644 drivers/media/i2c/adv748x/adv748x-dai.c

-- 
2.25.1.25.g9ecbe7eb18


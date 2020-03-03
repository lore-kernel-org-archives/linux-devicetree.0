Return-Path: <SRS0=BDx3=4U=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67B9DC3F2CD
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Mar 2020 01:10:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3AAFB2465E
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Mar 2020 01:10:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=massaru-org.20150623.gappssmtp.com header.i=@massaru-org.20150623.gappssmtp.com header.b="gKwZ2lFG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726773AbgCCBKJ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 2 Mar 2020 20:10:09 -0500
Received: from mail-qv1-f67.google.com ([209.85.219.67]:43065 "EHLO
        mail-qv1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726752AbgCCBKJ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 2 Mar 2020 20:10:09 -0500
Received: by mail-qv1-f67.google.com with SMTP id eb12so922827qvb.10
        for <devicetree@vger.kernel.org>; Mon, 02 Mar 2020 17:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=massaru-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=ndSx0yYjW12GRk/K7y0BYkAX4pUPocXZVNfkp1r7ykA=;
        b=gKwZ2lFGzrSsqzay3qVPt2twsaPJsLGkoSMLHZGoHKi4fvuqZm/Ye8VHqUXpGRUpTY
         hAtYh5y016lUnlTRB+jF/7BqGjyiXisXgV4DEo40CHjFZLBppG0OZR3EPgUw/rtb/LWk
         0XEatx3PtU18p3EwLkx+Nfp3jKYlHPGQXvp7Y44fjllEEDKO2G+rWJS89rrAbWtOPRFm
         D4nG1LaOmatBNgECBjAUTgYjbYwn5EZ6SI19mCCK8Oh53E1HkSE5uwxzpLuMQKRH8FMt
         fv1x/SeW9FrKrfb1KxLa5NAgUoZA/8p7BzezdeeCVLWfxVqLbenOJMUflK49p7Dg+l9W
         up7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=ndSx0yYjW12GRk/K7y0BYkAX4pUPocXZVNfkp1r7ykA=;
        b=RouH8jlA4LBXhgKb66p1dixx/QaYYPwarAW6+4b+yV4W7u0bBeu8CncNbv+eWkZsvI
         1vzNhylutHXRDEBOE3198el6IzLGBp73aJqcLd4Z+PHn8yG56pMQ9r16vsAoarbL8IeM
         YTtSsgB0P0A9KAdgHUZpJgmNx60Bj4fNskeFgbaQcH1RxCwtptVAAnSpeWx3fY3TxJGi
         6l5zi86X/xcrIPo27zNneb7P4ZQRl6UCT61xBMopIzotg5ZNj6EOXXPEnIguImZkuFjW
         Rwg+jZQK9Uj++7bJ18rNnkwiCjCL+fzzbYvJ9xZjg/zgl6tvPIQXunLbYqkwR+w2jF5V
         SMKQ==
X-Gm-Message-State: ANhLgQ2iBFXJe4cEcJE/XeZlAhp4u2g+RIa3cSNugB48ri76XSuE1x/Y
        Z1yONnzxYPs4yKVbdUmuZrrxTBWeYgDjV1aj
X-Google-Smtp-Source: ADFU+vtusM/VO7C4WS4aES/v36gj03RnGS2eDbYMBa3Wkvdx73qQlRC8chappFK+J8rnKqyuojVSMA==
X-Received: by 2002:a05:6214:1633:: with SMTP id e19mr2073120qvw.104.1583197807440;
        Mon, 02 Mar 2020 17:10:07 -0800 (PST)
Received: from bbking.lan ([2804:14c:4a5:36c::cd2])
        by smtp.gmail.com with ESMTPSA id s25sm6420725qtk.8.2020.03.02.17.10.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2020 17:10:06 -0800 (PST)
Message-ID: <84b8e4059194facc4cc8abd8e445d7a7df113c1f.camel@massaru.org>
Subject: Re: [PATCH v5] arm64: dts: imx8mq-phanbell: Add gpio-fan/thermal
 support
From:   Vitor Massaru Iha <vitor@massaru.org>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Marco Franchi <marco.franchi@nxp.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        lkcamp@lists.libreplanetbr.org
Date:   Mon, 02 Mar 2020 22:10:03 -0300
In-Reply-To: <CAOMZO5AmAqToKeDz=GZ0f44P6qAP2OGPHzUiD-xV+hr1W1_BRg@mail.gmail.com>
References: <20200303005244.13893-1-vitor@massaru.org>
         <CAOMZO5AmAqToKeDz=GZ0f44P6qAP2OGPHzUiD-xV+hr1W1_BRg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.5 (3.32.5-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Fabio,

On Mon, 2020-03-02 at 21:59 -0300, Fabio Estevam wrote:
> Hi Vitor,
> 
> On Mon, Mar 2, 2020 at 9:52 PM Vitor Massaru Iha <vitor@massaru.org>
> wrote:
> 
> >         pinctrl_i2c1: i2c1grp {
> >                 fsl,pins = <
> >                         MX8MQ_IOMUXC_I2C1_SCL_I2C1_SCL             
> >      0x4000007f
> > @@ -374,3 +437,4 @@
> >                 >;
> >         };
> >  };
> > +
> 
> Unneeded blank line added here.

Sorry about that.

> 
> With that line removed you can add:
> 
> Reviewed-by: Fabio Estevam <festevam@gmail.com>
> 
> Thanks


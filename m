Return-Path: <SRS0=BDx3=4U=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93E4CC3F2D1
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Mar 2020 00:39:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5B9CA24677
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Mar 2020 00:39:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=massaru-org.20150623.gappssmtp.com header.i=@massaru-org.20150623.gappssmtp.com header.b="W0p5qP9q"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726755AbgCCAjN (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 2 Mar 2020 19:39:13 -0500
Received: from mail-qt1-f195.google.com ([209.85.160.195]:43151 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726752AbgCCAjN (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 2 Mar 2020 19:39:13 -0500
Received: by mail-qt1-f195.google.com with SMTP id v22so1546560qtp.10
        for <devicetree@vger.kernel.org>; Mon, 02 Mar 2020 16:39:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=massaru-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=vmXMiyHRd+s4le5oCNXMH07H08dpqiYbcUYjQsqlz/Q=;
        b=W0p5qP9qAFgt34ZcsbZ6TF4Q1bne3M/D8Aa83WUxZ+2iFLPjefkCe+q+rwtj+f66EB
         UdPGtukSArhxSzcg5/GdzWSnKUgShDTIuDCXBb1Z9wB15HTeAweazI8ABIxV1fYbeGOP
         P1qs//RLwLc6zcxngxgDQhng/SnoOcDZzZDQsbd6pQDhA87YI7AQ4pyrqAYj9iWIdgbl
         Djkq0k9+uDMPvWB2vMnuvZfrNR/2Py/hARBArvmo8ezqQTFMRyVm0wV5voCgiwZ7D8Lb
         FWL4AJRTnUBEEQRD0+GT523b6M9PUlxQx2d8FdJYJbIuNETyQ6JEbludCFfIxuEzql9F
         jphg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=vmXMiyHRd+s4le5oCNXMH07H08dpqiYbcUYjQsqlz/Q=;
        b=kDpo7IVkzk/xcJTbK+F3KsOCMuq49VWkRAxOXO8nxtaiW8cGBR2J14MMMCcJ1nzFFP
         h3T16IujLRRAfjkE6VGPljE145tWGE13ZEWQk2eLxUEX0tkNr2e0Dy8OH84yWOW3NukS
         5YwyZxPxLFaUe73qy+h4zME6cAGAnCwuhyB32YPkW34md+Z76wCk0lsuorXq/lZ2zsiH
         uRlTLXvQsExEPqpARXZ0RBrTTYfZ2TUXfsBtA7IoB8UtAB+G2mko6x8IeqkqTdqXTkDU
         7IPVOg0/rcwgbqGG6ACpH4Abm3WLzjWCcTK5JSzcRAKdA3nr6dXDAVQ8c/AHqIfeWN8S
         YdOw==
X-Gm-Message-State: ANhLgQ14WQPkCZRlMbCGf9MkzDP8CMc8z35vQDImK4JWKBnBwFPqQfCn
        2zZ0CL6q+E2zVx06MHzZf/3ZOg==
X-Google-Smtp-Source: ADFU+vvkNzyybiWgvsCcNIeVyNrG//8gjsWTZ5452Pk1YJwHUxv+KGOZmjX25lOGoraowFO3ewRcUw==
X-Received: by 2002:ac8:7511:: with SMTP id u17mr2119926qtq.316.1583195952253;
        Mon, 02 Mar 2020 16:39:12 -0800 (PST)
Received: from bbking.lan ([2804:14c:4a5:36c::cd2])
        by smtp.gmail.com with ESMTPSA id r20sm149057qtk.58.2020.03.02.16.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2020 16:39:11 -0800 (PST)
Message-ID: <bf48bd19e7687fb0f0a4784c0d4941810190f3c4.camel@massaru.org>
Subject: Re: [PATCH v3] arm64: dts: imx8mq-phanbell: Add gpio-fan/thermal
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
Date:   Mon, 02 Mar 2020 21:39:05 -0300
In-Reply-To: <CAOMZO5BqvmRpTbq-gGgnKC2gFTRxS0mK0=W3tBSfZKQ-MUXMzA@mail.gmail.com>
References: <20200302213557.11128-1-vitor@massaru.org>
         <CAOMZO5BqvmRpTbq-gGgnKC2gFTRxS0mK0=W3tBSfZKQ-MUXMzA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.5 (3.32.5-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Fabio,

On Mon, 2020-03-02 at 19:46 -0300, Fabio Estevam wrote:
> Hi Vitor,
> 
> On Mon, Mar 2, 2020 at 6:36 PM Vitor Massaru Iha <vitor@massaru.org>
> wrote:
> 
> > +&cpu_thermal {
> 
> You missed to place cpu_thermal prior to i2c1 to keep the nodes
> sorted.

Sorry my bad, I'll fix it.


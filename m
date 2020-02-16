Return-Path: <SRS0=AK1n=4E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6C1AC2BA83
	for <linux-devicetree@archiver.kernel.org>; Sun, 16 Feb 2020 12:26:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9FFA42086A
	for <linux-devicetree@archiver.kernel.org>; Sun, 16 Feb 2020 12:26:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=massaru-org.20150623.gappssmtp.com header.i=@massaru-org.20150623.gappssmtp.com header.b="I00CfkrK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728043AbgBPM0L (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 16 Feb 2020 07:26:11 -0500
Received: from mail-qv1-f67.google.com ([209.85.219.67]:44438 "EHLO
        mail-qv1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728009AbgBPM0K (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 16 Feb 2020 07:26:10 -0500
Received: by mail-qv1-f67.google.com with SMTP id n8so6391180qvg.11
        for <devicetree@vger.kernel.org>; Sun, 16 Feb 2020 04:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=massaru-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VT1MCH4MKCO4J3DHnKFfEi79z1Rcq0/doyUc8eW1WIg=;
        b=I00CfkrKUYn4kwX92cS4aOemYsVO0HeOkBlsnww/ARt0TyMdfV704tvXZVmr3y135v
         7B7maPUxqjxk+NHzmqU66HaLmGnu+AXFTYRCRj45wg4EP6XkbcY38Oc5FVMyW4l3qXzA
         IfU/ip8psn47Zfilc8NstPx42Upvfo/Js4+kT6liQSnLJU0xU+rlYrmuG/9mLtGtuS0z
         xGF4IGVo+iQ1rYzKzgXKkeZ7W4vU07B8Xqs4IjtXSIB8sfMthR4J7LYBjh4UI1UA6Llq
         8h3OBLZNTMoualUfMGR4K8xQF4T0pePBDInffZ60+bHGE+GpfDb8VX6vpgF0wMxifs2C
         r6yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VT1MCH4MKCO4J3DHnKFfEi79z1Rcq0/doyUc8eW1WIg=;
        b=ozjlP4lA22/pmFT08lx0XdrwyeVDVcOnP7n4dwp+yl0Uj7xedbwVRX4/1i4zxAsI8n
         AoNhbTB1y/KnqaCTLe4ggS9zwdVw4Y0e9XLMI/TLMMxCCD4y2nGDybE3i2z5/OU0uzCi
         XMCENUVT+BqXmfhC1k4quaXpk0J6ZMz9eyPq0knnc/mm/imDi92CRSSkqnudiruFUUbS
         AFQiMX81CV5g4gwBWc0/TtKfFBzW8ONUfGdKgxXOa8pgjDrkUMDgPe3lEYxpMg2DBsN0
         /DLwiKTgHEGQg6yy49kZTJY2aw4THQxZFb7r1xoGUkQkNoUlOfuu5nFwxWVKCnKVwzsH
         VorQ==
X-Gm-Message-State: APjAAAUnJFXxw2RUOSa1krvYRmMaH2oGxY4jWbYOqyUQNSm7tjM1uOV9
        8f2G1fAMBi/2kzsVsJBPPFwysw==
X-Google-Smtp-Source: APXvYqwsIZcqP8uoonoK8c9iwZkXabkXrwTYXi6aH0V8kn6Aef+nS0HXqu2sxB1kxJx6l9vufQT11g==
X-Received: by 2002:a05:6214:1750:: with SMTP id dc16mr9131678qvb.47.1581855969601;
        Sun, 16 Feb 2020 04:26:09 -0800 (PST)
Received: from localhost.localdomain ([179.159.237.245])
        by smtp.gmail.com with ESMTPSA id r6sm7011857qtm.63.2020.02.16.04.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2020 04:26:09 -0800 (PST)
From:   Vitor Massaru Iha <vitor@massaru.org>
To:     robh+dt@kernel.org
Cc:     mark.rutland@arm.com, devicetree@vger.kernel.org,
        festevam@gmail.com, s.hauer@pengutronix.de,
        linux-kernel@vger.kernel.org,
        Alifer Moraes <alifer.wsdm@gmail.com>, marco.franchi@nxp.com,
        shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: imx8mq-phanbell: Add support for ethernet
Date:   Sun, 16 Feb 2020 09:26:03 -0300
Message-Id: <20200216122603.8164-1-vitor@massaru.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200211134828.138-1-alifer.wsdm@gmail.com>
References: <20200211134828.138-1-alifer.wsdm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Tested on Coral Dev board.

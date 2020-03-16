Return-Path: <SRS0=Nmyu=5B=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C339FC0044D
	for <linux-devicetree@archiver.kernel.org>; Mon, 16 Mar 2020 16:36:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9606220663
	for <linux-devicetree@archiver.kernel.org>; Mon, 16 Mar 2020 16:36:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="oDcg/c24"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732128AbgCPQgq (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 16 Mar 2020 12:36:46 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:43720 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732109AbgCPQgq (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 16 Mar 2020 12:36:46 -0400
Received: by mail-pg1-f196.google.com with SMTP id u12so10040730pgb.10
        for <devicetree@vger.kernel.org>; Mon, 16 Mar 2020 09:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=KkJ9BnhYk/HajXNXxuOjIzsUkQMklV19EP7QhHmBLp8=;
        b=oDcg/c24mMcUeBjQQMh9AiJP4ybO1A/zCQx7APejdiexTnF3qsz0/mkn/oFKSttXua
         sHRSR4mMQOUu4IhbLUuO2O6qGclfBFOIg6oSNByxaLEeqB5dgK4nkHTaB+JnrVM1GPUw
         Byymm05q0BmS2JLAMtCyLpqexNAb31NQBgv5m+MCNadcyxthMcIN0ixrCwm8QTH98Vis
         048ZkMr7v6qbsLpYNEsbDINHIOXmN7/0UMBA+tBrIvDTbiwAeC72BLI5YH3/NwRQkWIC
         /vkLGDn3JcvphZXiRUsNwS48aJEA4wF9IcFK19cGkQAX6reB8HvYfuSC6OalZp0/kiI2
         HVUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=KkJ9BnhYk/HajXNXxuOjIzsUkQMklV19EP7QhHmBLp8=;
        b=rPWbPQscax1vNsUomM1+Z2nYJmxx+TB3ytqMvmwt1tSu2BMc8vXN31GirfXq9ewjUO
         jyEdA3WYjeh728KBoxzVom5XTBxUezSWwlkMLfhJoN+M182D8N9XqZdCyllUafr38DxF
         wGjbImE/RNQqRkiwtke1e0aHAXx09g1H7Hvc6dQH5/GKsqWf0hy9Mo34bzjZRkGdJ0TR
         q+UlC9d6fzCGjb/JqU4Smbt/L8kxuBUK/yLhg94S7mUeBtCWJj/Llk/ICN3pI2LFq/ax
         omldSRAajVSVCPA82OOsJcetn56RZiI0M+YkV710P2wVm7Yz6+LTe0YVIbvjmbpLngLa
         lvow==
X-Gm-Message-State: ANhLgQ3H8rEvI9KXYAYOSVxXEjerbmgtl3SLpLXNg4QbkY/lhdKl8UPW
        +T/yjAbk2+I42BVU5Y0lsWEr2d0ZpPs=
X-Google-Smtp-Source: ADFU+vsnDU0kNyNu7bXSOxb3qeKHSd2QhwQJDm7Wj7JSzaOFa60zGw8tmrmt6d6868XiIqOT9Y1DIA==
X-Received: by 2002:a65:5a8a:: with SMTP id c10mr678539pgt.315.1584376604453;
        Mon, 16 Mar 2020 09:36:44 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:dcc4:2a10:1b38:3edc])
        by smtp.gmail.com with ESMTPSA id h198sm411587pfe.76.2020.03.16.09.36.43
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Mar 2020 09:36:43 -0700 (PDT)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Christian Hewitt <christianshewitt@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Christian Hewitt <christianshewitt@gmail.com>,
        Andreas =?utf-8?Q?F?= =?utf-8?Q?=C3=A4rber?= <afaerber@suse.de>,
        =?utf-8?Q?Jer=C3=B4me?= Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH v7 3/3] arm64: dts: meson: add support for the SmartLabs SML-5442TW
In-Reply-To: <1583987886-6288-4-git-send-email-christianshewitt@gmail.com>
References: <1583987886-6288-1-git-send-email-christianshewitt@gmail.com> <1583987886-6288-4-git-send-email-christianshewitt@gmail.com>
Date:   Mon, 16 Mar 2020 09:36:43 -0700
Message-ID: <7ha74gw92c.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Christian Hewitt <christianshewitt@gmail.com> writes:

> The SmartLabs SML-5442TW is broadly similar to the P231 reference design
> but with the following differences:

Can you can create a P231 .dtsi that can be shared between the two?

I'd really like to keep all of these designs that are based on Amlogic
ref designs using shared .dtsi whereever possible.

Kevin

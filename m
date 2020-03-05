Return-Path: <SRS0=vtql=4W=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB5F4C3F2D1
	for <linux-devicetree@archiver.kernel.org>; Thu,  5 Mar 2020 13:26:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 84DC9208C3
	for <linux-devicetree@archiver.kernel.org>; Thu,  5 Mar 2020 13:26:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="a697x9Hi"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726184AbgCEN0H (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 5 Mar 2020 08:26:07 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:35772 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725912AbgCEN0H (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 5 Mar 2020 08:26:07 -0500
Received: by mail-wm1-f67.google.com with SMTP id m3so5740140wmi.0
        for <devicetree@vger.kernel.org>; Thu, 05 Mar 2020 05:26:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:organization:mime-version
         :content-transfer-encoding;
        bh=NzJlwBLu2PMXJhvFCCamBP6u57AQ/SuSFKrWPDuWILQ=;
        b=a697x9HiNkVQHItHTfxnttcSwWbaOhPz9ubP9b7NU9x/EP2Y2QUzX3zhaQVac6U4OL
         nteXZTLu5Z+SoZQm73w7R7oMIW9uuBa8Z1p5uqOE+RWUmjk0Px932a3MQMZAacBtTB8p
         AgWpqtFPPbqkbHLv9n9Xxsl4md9xcvfa0sPGg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:organization
         :mime-version:content-transfer-encoding;
        bh=NzJlwBLu2PMXJhvFCCamBP6u57AQ/SuSFKrWPDuWILQ=;
        b=bs14l6ADiximTbliEpB3KrbY0LKozFr6+BN/76LgAMTDoII7EVBxjYK3PiOFT7bvyz
         UktOVU1N3jCZ/NP+o4zzoVxVFHnOS1GpPvveGNLFH1lOScZln0ItxZJ6eOZOuKLwXIBO
         NqEsedQjdENMbnGfQRrI1fR0XHhMFtY3dpNhHhoGaRhGBKXMnQWRU/H/ymhzVaJckVam
         nRAHDi4GF/WGrJPqZv9UrvwCCgt4sz7z0UIfKRQGq/2tEvwVucCHHAjckdeqSB132fKL
         l5LMmFydJccDhXNpZdZlvPDNx5brajUI++DGoQbPIMt8vXgyPIwBJH4Q8paVeO8srRT7
         cXxw==
X-Gm-Message-State: ANhLgQ1sSaFYC6x2asav6jYYcUJG2MeFxIt7N9KY9qgUpoeNt1vHouGC
        NbuyqAh0FvHaICovhq9Mpc8Xww==
X-Google-Smtp-Source: ADFU+vu/gQ9srOP39BIyg7ghYVlTbTb3qRklu4tSmUPv6SYBuqzYJ8pXCVAKp9igdxtEx8MyKa6QPQ==
X-Received: by 2002:a1c:a4c4:: with SMTP id n187mr9982366wme.10.1583414764858;
        Thu, 05 Mar 2020 05:26:04 -0800 (PST)
Received: from ub1910 ([213.48.11.149])
        by smtp.gmail.com with ESMTPSA id j20sm9477139wmj.46.2020.03.05.05.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2020 05:26:04 -0800 (PST)
Date:   Thu, 5 Mar 2020 13:22:32 +0000
From:   Paul Barker <pbarker@konsulko.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        "Uwe =?UTF-8?B?S2xlaW5lLUs=?= =?UTF-8?B?w7ZuaWc=?=" 
        <u.kleine-koenig@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>
Cc:     linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Inverted PWM output on iMX6
Message-ID: <20200305132232.1aced378@ub1910>
Organization: Konsulko Group
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi folks,

I recently ran into an issue using the pwm-fan driver with an inverted
PWM output on iMX6.

The fan is defined in the device tree as follows:

	fan0: pwm-fan {
		compatible = "pwm-fan";
		pwms = <&pwm2 0 25000 PWM_POLARITY_INVERTED>;
		...
	}

In pwm_imx27_probe() the support for a third `flags` argument in a pwm
reference is enabled:

	imx->chip.of_xlate = of_pwm_xlate_with_flags;
	imx->chip.of_pwm_n_cells = 3;

However, the flag is ignored and the output is not inverted.

By adding some prints I saw that when of_pwm_xlate_with_flags() is
called, args->args_count is 2 instead of 3.

Looking at the definition of the pwm device itself in imx6qdl.dtsi I
can see that the number of cells in a pwm reference is set to 2 not 3:

	pwm2: pwm@2084000 {
		#pwm-cells = <2>;
		...
	};

That seems to be preventing a third argument from being passed.

I can change `#pwm-cells` to <3> and then everything works for my
device but I'm not sure that is the correct solution for everyone. That
would require all pwm references on iMX6 devices to use 3 cells. The
code in of_pwm_xlate_with_flags() seems to be built to handle either 2
or 3 argument cells but I can't see any way to allow this choice in the
device tree.

If the solution is to set `#pwm-cells` to <3> I'm happy to send a patch
which does this and updates all pwm references in device trees which
include `imx6dql.dtsi`. Before I do that I'd like to know that it's the
correct approach though.

For context I've confirmed this is the case in Linux 5.4 and that the
relevant files haven't changed between that release and 5.6.0-rc4.

Thanks,

-- 
Paul Barker
Konsulko Group

Return-Path: <SRS0=UHbD=BI=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21701C433E0
	for <linux-devicetree@archiver.kernel.org>; Wed, 29 Jul 2020 09:20:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 006CB20663
	for <linux-devicetree@archiver.kernel.org>; Wed, 29 Jul 2020 09:20:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RevM9dPy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728114AbgG2JUh (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 29 Jul 2020 05:20:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728260AbgG2JUU (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 29 Jul 2020 05:20:20 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94698C0619D4
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2020 02:20:20 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id e8so13926233pgc.5
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2020 02:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=laWlLvysNkw+EqkUXXWh3qRKnJp9myxjPBYwvjpsBKI=;
        b=RevM9dPyszfsbo00TAsrrA5RNf/6znzZWEF3bluYJrFli5YQ2K1kR0L/MK5QK7Msxp
         uX5o143Tp13ao35F2TpjObPOmZnSWvwtGvs3NimBOhGM4ZytcQLt3yyRdCR5AhhBcEgg
         eMzDvf7XfOL3CqNQY8Vm7t9pqaZoeyDFT+CrU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=laWlLvysNkw+EqkUXXWh3qRKnJp9myxjPBYwvjpsBKI=;
        b=SrNNZAXt4QMB2fO8F7te6HivgJdBxJdME8KFZ/L08A2y8mO6M8ZuH8TD+gU3124C9J
         ybXVQDF/cVRAWfpMdgIXNLr1NG4rxSpN/PIeL/lhwmJ4R+uBtZGr/pW2zpaU03z/bDWP
         s6tJVTsX0uF9gArYtIRvGFudXc4aj2D3tCmb+d1CK9nYAf8v0DQ5B4O08mOxrouphKeT
         RKlEiKzsYSyzgKB/5mNM6HiM2606w6KzlWvBK5lqK34mKirZCmRgijg2srpemVhEj3w2
         v0M7GS9+DP8S2pAOyBvD/UR9OAOQFKOc5ZGr65rd5bizIvsefLQOHTwE1WeY4maa9pjC
         3rag==
X-Gm-Message-State: AOAM531OINvI+H8mQfaKMzOY94CLuGrIn05QXnfcPvHHvkNFBOLks3yd
        04/SDaiMDGfdfD4C9zknG00XOA==
X-Google-Smtp-Source: ABdhPJx9/lhEja1H2gezD9OyVNkzKTD4MosXtyG0cjUNZuaSWJgrv5Sj6Z9PzF0YYChW1FJeoNBA5Q==
X-Received: by 2002:aa7:93c3:: with SMTP id y3mr28318781pff.206.1596014419908;
        Wed, 29 Jul 2020 02:20:19 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id p1sm1568332pjp.10.2020.07.29.02.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 02:20:19 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200728230520.2011240-1-campello@chromium.org>
References: <20200728151258.1222876-1-campello@chromium.org> <20200728230520.2011240-1-campello@chromium.org>
Subject: Re: [PATCH v2 00/14] sx9310 iio driver updates
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Jonathan Cameron <jic23@kernel.org>,
        Daniel Campello <campello@chromium.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Douglas Anderson <dianders@chromium.org>,
        Enrico Granata <egranata@chromium.org>,
        Gwendal Grignou <gwendal@chromium.org>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        Rob Herring <robh+dt@kernel.org>, linux-iio@vger.kernel.org
To:     Daniel Campello <campello@chromium.org>,
        LKML <devicetree@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Date:   Wed, 29 Jul 2020 02:20:17 -0700
Message-ID: <159601441795.1360974.13003926832878715423@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Daniel Campello (2020-07-28 16:05:06)
> The first patch resends the DT binding for the driver that was merged in
> v5.8-rc1 with a small change to update for proper regulators. The second
> through the eleventh patch fixes several issues dropped from v8 to v9
> when the initial patch was merged. The twelveth patch fixes a few
> printks that are missing newlines and should be totally non-trivial to
> apply. The thirteenth patch drops channel_users because it's unused. The
> final patch adds support to enable the svdd and vdd supplies so that
> this driver can work on a board where the svdd supply isn't enabled at
> boot and needs to be turned on before this driver starts to communicate
> with the chip.
>=20

Can you add this patch onto the end?

----8<----
From: Stephen Boyd <swboyd@chromium.org>
Subject: [PATCH] iio: sx9310: Use irq trigger flags from firmware

We shouldn't need to set default irq trigger flags here as the firmware
should have properly indicated the trigger type, i.e. level low, in the
DT or ACPI tables.

Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/iio/proximity/sx9310.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/proximity/sx9310.c b/drivers/iio/proximity/sx9310.c
index 24a2360b6314..2106b9141928 100644
--- a/drivers/iio/proximity/sx9310.c
+++ b/drivers/iio/proximity/sx9310.c
@@ -945,7 +945,7 @@ static int sx9310_probe(struct i2c_client *client)
 		ret =3D devm_request_threaded_irq(dev, client->irq,
 						sx9310_irq_handler,
 						sx9310_irq_thread_handler,
-						IRQF_TRIGGER_LOW | IRQF_ONESHOT,
+						IRQF_ONESHOT,
 						"sx9310_event", indio_dev);
 		if (ret)
 			return ret;
--=20
Sent by a computer, using git, on the internet

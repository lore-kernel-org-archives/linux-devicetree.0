Return-Path: <SRS0=BuJn=2A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0BD0C43603
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Dec 2019 18:48:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C2B29206D5
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Dec 2019 18:48:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Pcg4dJHJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727617AbfLJSsi (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 10 Dec 2019 13:48:38 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:38314 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726771AbfLJSsi (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 10 Dec 2019 13:48:38 -0500
Received: by mail-lj1-f195.google.com with SMTP id k8so21046310ljh.5
        for <devicetree@vger.kernel.org>; Tue, 10 Dec 2019 10:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BOSCVw9bioi+5hxnz7bz/OpGazg6+xs3kBeEbrtXG48=;
        b=Pcg4dJHJx81bsDelVo2J311YXVKJfxTmtD9q4K/3ixqYZ3o9fcUZASvkvpmsNECc2m
         goyWlV33/Y8CabpTc3jtAu198H4wWXtuNEOLsTX9j6W1blZgb9ZTwXUjsO0keytLEoFo
         HSRPniaTF99B5LfPCNLoU/RQTDtXK0m3ygND4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BOSCVw9bioi+5hxnz7bz/OpGazg6+xs3kBeEbrtXG48=;
        b=YfEd4P5AYA/YmZFa+JTrQHdOCnuWwpJQoUzFQBwfmTzoCuWcyHbnqHLRlME583JfGc
         5GUgwrFcu1SwwsieI19TLzNsqFUwzLTXs/UfcUUygZkIoJn8H57AlwToEG8Ump1xJAt1
         5ULPNZVw9L6rpOKRjpBV5kJg5kki4avfc/sfZxrRxz0EMtdEe2NwQXQBr6zPzrgidCGr
         vJERoGFFM1ArV/pGrjyqay0Uf/1ZUkjLVM2GNIbJEv7OU03fpyyo0NrfmRPBDMf60Jnt
         bqvcZR9AY/x3IGxR4+OrIMOelBqU1QKHZ4ICuHUePutTd2erDpx9vz+y/naj239FUQXD
         HHSg==
X-Gm-Message-State: APjAAAUWfq/aZuzvgwHuUkCYuKm9F47gS+4u4tOqsKmJba59b4Igmid/
        QoEdWXixGaCdc/iVIIzGczZ4W51UWU4=
X-Google-Smtp-Source: APXvYqxIutrtvK05+4CWFePFbLBSqmFVhWrJDau0UCANd1mjENjDFQSVGDHkF2Y+Mo8lnVtnWrdJ8Q==
X-Received: by 2002:a2e:9b05:: with SMTP id u5mr21236489lji.59.1576003715887;
        Tue, 10 Dec 2019 10:48:35 -0800 (PST)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com. [209.85.167.41])
        by smtp.gmail.com with ESMTPSA id s3sm2102493lfo.77.2019.12.10.10.48.34
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Dec 2019 10:48:34 -0800 (PST)
Received: by mail-lf1-f41.google.com with SMTP id y1so3257592lfb.6
        for <devicetree@vger.kernel.org>; Tue, 10 Dec 2019 10:48:34 -0800 (PST)
X-Received: by 2002:a19:23cb:: with SMTP id j194mr8691484lfj.79.1576003713698;
 Tue, 10 Dec 2019 10:48:33 -0800 (PST)
MIME-Version: 1.0
References: <20191107000917.1092409-1-bjorn.andersson@linaro.org> <20191107000917.1092409-3-bjorn.andersson@linaro.org>
In-Reply-To: <20191107000917.1092409-3-bjorn.andersson@linaro.org>
From:   Evan Green <evgreen@chromium.org>
Date:   Tue, 10 Dec 2019 10:47:57 -0800
X-Gmail-Original-Message-ID: <CAE=gft5mLSqsJzj=DtesH3G68_wSKUr8rZ5iubOerimQmZKegA@mail.gmail.com>
Message-ID: <CAE=gft5mLSqsJzj=DtesH3G68_wSKUr8rZ5iubOerimQmZKegA@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] phy: qcom-qmp: Increase PHY ready timeout
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Nov 6, 2019 at 4:09 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> It's typical for the QHP PHY to take slightly above 1ms to initialize,
> so increase the timeout of the PHY ready check to 10ms - as already done
> in the downstream PCIe driver.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Tested-by: Evan Green <evgreen@chromium.org>

Should this have a Fixes tag for 14ced7e3a1ae9 ("phy: qcom-qmp:
Correct ready status, again")?

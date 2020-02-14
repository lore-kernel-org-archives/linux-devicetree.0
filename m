Return-Path: <SRS0=lsCC=4C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E775CC3B195
	for <linux-devicetree@archiver.kernel.org>; Fri, 14 Feb 2020 10:17:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BD94B217F4
	for <linux-devicetree@archiver.kernel.org>; Fri, 14 Feb 2020 10:17:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MNxQ+HuC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729162AbgBNKRr (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 14 Feb 2020 05:17:47 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:35554 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729070AbgBNKRr (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 14 Feb 2020 05:17:47 -0500
Received: by mail-lj1-f195.google.com with SMTP id q8so10112303ljb.2
        for <devicetree@vger.kernel.org>; Fri, 14 Feb 2020 02:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=v8ypgl7dFd+FN00YxlfzHIJKl3YchrCCrbKgFjCVTDU=;
        b=MNxQ+HuCDY088dTom9PFOh4rxyHd576KmzzMsyWnYhyp0UpgWA19L6Nitp2AQc9dOy
         Karscw08YlX4Dg1W61ESUi5f/31NGIDZm4EqIus9tIQf+O5M28Y0jyTAuo9dR1Y0H0rz
         2AVAJRbtO9yn7RjFNZXS30hjpVKDSBST7Y0jgBDL2snZDVKS2dRMHy3QacypQ2LxKwZV
         trk4g/jfx145+VkRAcZ465GPkGogpEK8AuFur1fwyfBP6l7dThSPi/EbX65bqU7Qi44y
         VyHWfpFOgYhi74jRlwh6ixM7165ALYt30ELZoP2vcFxOIAzfaRAipnLZObe3Kz/Jmo8W
         S6uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=v8ypgl7dFd+FN00YxlfzHIJKl3YchrCCrbKgFjCVTDU=;
        b=E+BVJ7IssD0yowE0/x+d5F5/lVGVWyfktbbv+zapX6umf9O8dhjHYA5AFL1zSVjWCH
         X5JMtMV7esPF5NKhrBWbt9Uuf81vudbUF6GKhm04ktE4/8wa2Nq+3EzzU0idcVz59/rn
         UuReldYa/9/1UINJ8WyfdO0LjuqpzENaLNYBN2xEzG8tmxFdqfJjDARcHozr8QTZAMtX
         4GmDHGC7Mp0brncQrKlKueD0oV3WaLz/7TL1ctaUq5ajQfNAlVUMWWvhPxc4w6gWMsOq
         2P7+8zj+xt1QnktZM+noAUunQAVn3gEpU+x5uipzVro4YuYd5TlF5X9TqXCZLIYY7/uA
         m4RA==
X-Gm-Message-State: APjAAAV61FsUPserfnzB/2YKDK4REyoz5lYyXNKvUrWA/CSmiiKoVqp2
        7vI/1mzxEtt8EV4L7xRmzYh3TpVXK3deIsCyuMPhZg==
X-Google-Smtp-Source: APXvYqyC9kNfFIiiOrwmF4acw1MAKutkTjdFGe1E/MwMDJJksNCwGjs1TmU24KDB/f98Aqw0M3pRNognuV+WdjgeGVA=
X-Received: by 2002:a2e:9013:: with SMTP id h19mr1678145ljg.223.1581675465087;
 Fri, 14 Feb 2020 02:17:45 -0800 (PST)
MIME-Version: 1.0
References: <1579439601-14810-1-git-send-email-sricharan@codeaurora.org> <1579439601-14810-3-git-send-email-sricharan@codeaurora.org>
In-Reply-To: <1579439601-14810-3-git-send-email-sricharan@codeaurora.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 14 Feb 2020 11:17:34 +0100
Message-ID: <CACRpkdY-O3es1xcPxnb+3KKucUFx95WDXawnKeq1fo0rX9N+3A@mail.gmail.com>
Subject: Re: [PATCH V6 2/5] pinctrl: qcom: Add ipq6018 pinctrl driver
To:     Sricharan R <sricharan@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>, sivaprak@codeaurora.org,
        Rajkumar Ayyasamy <arajkuma@codeaurora.org>,
        Selvam Sathappan Periakaruppan <speriaka@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sun, Jan 19, 2020 at 2:13 PM Sricharan R <sricharan@codeaurora.org> wrote:

> Add initial pinctrl driver to support pin configuration with
> pinctrl framework for ipq6018.
>
> Co-developed-by: Rajkumar Ayyasamy <arajkuma@codeaurora.org>
> Signed-off-by: Rajkumar Ayyasamy <arajkuma@codeaurora.org>
> Co-developed-by: Selvam Sathappan Periakaruppan <speriaka@codeaurora.org>
> Signed-off-by: Selvam Sathappan Periakaruppan <speriaka@codeaurora.org>
> Co-developed-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
> Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Sricharan R <sricharan@codeaurora.org>

Patch applied for v5.7.

Yours,
Linus Walleij

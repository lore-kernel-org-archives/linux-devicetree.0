Return-Path: <SRS0=m/NK=3J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 898E6C33CA1
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Jan 2020 20:07:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 621C522522
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Jan 2020 20:07:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JpzPvLHk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726936AbgATUHQ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 20 Jan 2020 15:07:16 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:43596 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726642AbgATUHQ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 20 Jan 2020 15:07:16 -0500
Received: by mail-pl1-f195.google.com with SMTP id p27so281463pli.10
        for <devicetree@vger.kernel.org>; Mon, 20 Jan 2020 12:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=zBntqnBm/t/sr39kDrW9d8+cYZzx+y01IwKgpBCSFpE=;
        b=JpzPvLHk9iigjUBcm06AscUAH8za2VLTbotRHjz/miINfcJm++dyA1mNax2Yd4Z2Ai
         mC8OLsraPZ2nLGxkD+ljDmG7mQgBK+fl3LaK9KDtnkrCA8XWo6kAU7CttcER4JD2XTZu
         QPlal7GtBKYAyRi2FGy8rRP6cEkDSJiDt0HHCSsTyB0mfGDj0qCp7ti53VZ5jDFok/r8
         5IfezClnVBFIXOQwLMp9rKANYbGxH3ZG0h/ap/8ebY1sCvGFYll+QxGgMuaeROoYh8ES
         1Fm1umRye61ATiwbxUSMz8Zg0sp5jLHamxp9sqCvNjnTJ8mVLZL0EUBCvtK4sIjZOMmv
         Eejw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=zBntqnBm/t/sr39kDrW9d8+cYZzx+y01IwKgpBCSFpE=;
        b=RGtFFElKcRAqFsaXwPu3CS/FZ0OLrsGgtjaaixQBnc1z5vLHfpTj970D+AQ0VRgkVp
         nX6sy2OhThmuEPCd5YJFWnF4y/rmPbEW4K5DtcAu3K0uKI33ciVkj8rdGt2f1kFfU+8z
         tNZTlIa/J3zCViksEkCV9gKYZb2/9U3AHRLWFloB0Ovgs6iFc7iUD7pTFPtZOqfmsISy
         rN2FJldviiMAWEOu325XOr1fETkpOcLDsithEDBejzfBL1YMywmysL5WHS6W+m1NXD6p
         AlyKCvMcPEzLbmY4k5Di1zhIQQ2XWfaI/cgY+Ioq9y+jKeE3DnBDXVqBs7ZksTrx83W1
         384w==
X-Gm-Message-State: APjAAAVX6JhWsblR2IsO+LKnhVSnN0I4cKexemAkaNvaWVRVRrktKk5O
        t86KB4lLWaljEUCG5afHqfKYrA==
X-Google-Smtp-Source: APXvYqzK9emDyuL+3sGE31QpUbs6KIbP+mVYE3WXgCXZ8T6ZTCLwzxOP0eDpWsawCgYdJamJrkqFgw==
X-Received: by 2002:a17:902:8494:: with SMTP id c20mr1493284plo.189.1579550835246;
        Mon, 20 Jan 2020 12:07:15 -0800 (PST)
Received: from yoga (wsip-184-181-24-67.sd.sd.cox.net. [184.181.24.67])
        by smtp.gmail.com with ESMTPSA id s130sm39442278pgc.82.2020.01.20.12.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2020 12:07:14 -0800 (PST)
Date:   Mon, 20 Jan 2020 12:07:11 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, od@zcrc.me,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/5] remoteproc: Add device-managed variants of
 rproc_alloc/rproc_add
Message-ID: <20200120200711.GN1511@yoga>
References: <20191210164014.50739-1-paul@crapouillou.net>
 <20191210164014.50739-2-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191210164014.50739-2-paul@crapouillou.net>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue 10 Dec 08:40 PST 2019, Paul Cercueil wrote:
[..]
> +/**
> + * devm_rproc_add() - resource managed rproc_add()
> + * @dev: the underlying device
> + * @rproc: the remote processor handle to register
> + *
> + * This function performs like rproc_add() but the registered rproc device will
> + * automatically be removed on driver detach.
> + *
> + * Returns 0 on success and an appropriate error code otherwise.

The kerneldoc format is "Return: foo on bar...". So please update this
to

Return: 0 on success, negative errno on failure

> + */
> +int devm_rproc_add(struct device *dev, struct rproc *rproc)
> +{
[..]
> +/**
> + * devm_rproc_alloc() - resource managed rproc_alloc()
> + * @dev: the underlying device
> + * @name: name of this remote processor
> + * @ops: platform-specific handlers (mainly start/stop)
> + * @firmware: name of firmware file to load, can be NULL
> + * @len: length of private data needed by the rproc driver (in bytes)
> + *
> + * This function performs like rproc_alloc() but the acuired rproc device will
> + * automatically be released on driver detach.
> + *
> + * On success the new rproc is returned, and on failure, NULL.

Return: new rproc instance, NULL on failure

Regards,
Bjorn

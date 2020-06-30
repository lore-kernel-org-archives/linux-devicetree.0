Return-Path: <SRS0=g9lS=AL=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8574EC433E0
	for <linux-devicetree@archiver.kernel.org>; Tue, 30 Jun 2020 23:46:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 51D992078B
	for <linux-devicetree@archiver.kernel.org>; Tue, 30 Jun 2020 23:46:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="C5ddrq+a"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727780AbgF3XqO (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 30 Jun 2020 19:46:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727042AbgF3Xpt (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 30 Jun 2020 19:45:49 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EBD5C03E979
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2020 16:45:49 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id l6so7085537pjq.1
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2020 16:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=z9hrflkjZ1SE3c/jCUth43iNN1iz+IaXdB4/4fx+a/U=;
        b=C5ddrq+a30EL/pmhVV17A12x7EVAGhtOhZ2a4Y2VUNFSdKNwcDwRUq4blrozmAgG0Q
         /kB2O63nZtN5a+rfpz1POtIlCmC2KfAVFtbuMJlsLnWdUxdE9u8ZEr15gb34cuvTGZqJ
         nb320LlvaOFDByGglISvO9JtSp8F4uKDOe2U8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=z9hrflkjZ1SE3c/jCUth43iNN1iz+IaXdB4/4fx+a/U=;
        b=MAkMKiUtVDF5Nce4t0WIGIDsYUkoVrA6hR0VriZAGrt9o0H0zArinOgJ2/E5S8q9yL
         ool2/H6+n2K6MQDJ7bBCeR/AT9TR212hJRJdlO1ltPkANmmbP27hxCe5Kv6P7jDOkdIr
         pNMxqFEwneh9PPYrCIbWKqyxGFxUZ9avHv8+M15ZvDfEkK8SDti1wCjFCPWiqdY9l3Ps
         8iK/+9WtCu98AUi6H0zIUUiYcZZRC8JqyuAFs4CC+gjzZ/H4QP53pbEgdtDEyREEGOS5
         EZhpr0kYOI6YoxJ9jTR4gAVJTQdi7irz1eMEcN1zSzcvyMPQ3+FHJ6NEJPtg4qz4WQW5
         ji8w==
X-Gm-Message-State: AOAM532hcZs3o9svqCyaSf+FtDszGkkIGXGCZ45gwPxQeS8tu8DbG4cM
        B7KiDkkeBK+bfgExjI2OF/ijVg==
X-Google-Smtp-Source: ABdhPJz/cQKDQr9LzDIzVxWX8iD6uKjC55b5Arumpo/AtSDFDspksBkcdE2KuF44RiswvvNC5AvUQQ==
X-Received: by 2002:a17:90b:a56:: with SMTP id gw22mr14665075pjb.52.1593560748813;
        Tue, 30 Jun 2020 16:45:48 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
        by smtp.gmail.com with ESMTPSA id o186sm3721391pgo.65.2020.06.30.16.45.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2020 16:45:48 -0700 (PDT)
Date:   Tue, 30 Jun 2020 16:45:47 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] arm64: dts: sc7180: Add sdhc opps and power-domains
Message-ID: <20200630234547.GL39073@google.com>
References: <1593506712-24557-1-git-send-email-rnayak@codeaurora.org>
 <1593506712-24557-5-git-send-email-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1593506712-24557-5-git-send-email-rnayak@codeaurora.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Jun 30, 2020 at 02:15:12PM +0530, Rajendra Nayak wrote:
> Add the power domain supporting performance state and the corresponding
> OPP tables for the sdhc device on sc7180.
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>

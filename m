Return-Path: <SRS0=EFsK=6J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2400BC55191
	for <linux-devicetree@archiver.kernel.org>; Sat, 25 Apr 2020 19:39:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 00DC8206D4
	for <linux-devicetree@archiver.kernel.org>; Sat, 25 Apr 2020 19:39:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="i3Lalq5c"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726220AbgDYTjb (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 25 Apr 2020 15:39:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726190AbgDYTjb (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 25 Apr 2020 15:39:31 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18A45C09B04F
        for <devicetree@vger.kernel.org>; Sat, 25 Apr 2020 12:39:31 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id fu13so4790082pjb.5
        for <devicetree@vger.kernel.org>; Sat, 25 Apr 2020 12:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=FFJ+RlIhSOPxhMwKLc97vVcR1rOxDF8GYeyH64M0ydo=;
        b=i3Lalq5cuGCVKoML246R4E8KH9Vsvt1oOUaMLmiW0f02n1iwTSO2C7ec3YfI6FkZY5
         dyC8mB7Y4nHzjjPkMlSt5hkzbzMJMeRAj9M3k2cZtyFEmLRfmaNs5b5z/Q3XkJgJNsIK
         WAVu/yAWl3WZ2xxyUxnFkKt7QWECEHLjbbvzo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=FFJ+RlIhSOPxhMwKLc97vVcR1rOxDF8GYeyH64M0ydo=;
        b=BV/m3zezfctRVEeY4/FasAucfbo+y0E9qZxPMJSQmCHL3Dn5sxXRx0RLteBBICx2RY
         P4ciG9sdl0FmmmAwHj+dmBfaJOMdS4GecKKIBXwJIrnDLtjqMsFk8ZZqXt23DQR0YTNT
         ZLLpbltbzsTvoyfteelwaHKLaTJC/hv0IzOA0/MwdKFespXLvqFGKVLxZMKNrSbibaF0
         Xm+C03t2ica60QiTH1Aq+K9VKHm29j+3XHKTsmnLCJ5xMUS7iBTUgMYWdb8YEkwEAXQI
         zsUhDGpwxIQxXO1crXcPjqW+yeJqwYLCWWwEPQ+6U8ARjHFx9BS0zDvzFqs5G2x9amAy
         ib+Q==
X-Gm-Message-State: AGi0PuYvgaNqoOYQzTKp67M/r00UF2FQrVuBlNmXMvGGkOP25y3zWySR
        VXAdlTmF0uRc0YQ/7rgAaKqtBQ==
X-Google-Smtp-Source: APiQypJjb7QoZatoPvZ0C5SA3OcumKCIMFSbn7THfXcy0NM0yccE/7t+zWNjac26pi33jCqWjxp58A==
X-Received: by 2002:a17:90a:d709:: with SMTP id y9mr14198065pju.50.1587843570681;
        Sat, 25 Apr 2020 12:39:30 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id n16sm8679956pfq.61.2020.04.25.12.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2020 12:39:30 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200424111644.27970-1-saiprakash.ranjan@codeaurora.org>
References: <20200424111644.27970-1-saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: Support ETMv4 power management
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        devicetree@vger.kernel.org
Date:   Sat, 25 Apr 2020 12:39:29 -0700
Message-ID: <158784356931.117437.2821018841391441959@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Sai Prakash Ranjan (2020-04-24 04:16:44)
> Now that deep idle states are properly supported on SC7180,
> we need to add "coresight-loses-context-with-cpu" property
> to avoid failure of trace session because of losing context
> on entering deep idle states.
>=20
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

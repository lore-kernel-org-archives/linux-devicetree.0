Return-Path: <SRS0=JrLZ=43=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20FD5C10F27
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Mar 2020 18:11:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DF7ED20637
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Mar 2020 18:11:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="S+pLjMqd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726545AbgCJSL0 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 10 Mar 2020 14:11:26 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:37620 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726463AbgCJSL0 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 10 Mar 2020 14:11:26 -0400
Received: by mail-pf1-f194.google.com with SMTP id p14so6865361pfn.4
        for <devicetree@vger.kernel.org>; Tue, 10 Mar 2020 11:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=yrVZjd8gZ0Ysia7WKkOlNyA8gHSCOfIvJw2hn5fXOTo=;
        b=S+pLjMqdeN6mnY8CQehC3nBw/yA6NMpCjF8qbgxUBM1lcueUbng2IKM5q69nW9YMLI
         1K9oW8b1DaZDeSNKGBvlwA1Q+d9J2pBu/3a4VL6E7nlJ3ZWwc2zSouHg+21N2OJ6NviD
         shULJYOBdJPXnC8VaRxjyev4hoQU5eXx2v66k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=yrVZjd8gZ0Ysia7WKkOlNyA8gHSCOfIvJw2hn5fXOTo=;
        b=tXHj2KWHy+FYUbCI21UdoVNk0TNURfrAz5cjJew5n3YAuL0iXmxOe1odUguzEc/Yxb
         YBP84/sXfTplkrWz6H/pJFlKcplfTn2jX1PfOUneU5SFfmVbtmKh2YUJ+vfaUzzcJ34Q
         RvsFd3N2+lukok2jrHTOd2UGqLErlGIhyACzKT1+Ida+7eC0r+lW/qO3PsseMZr3v6Rv
         yRG9Js2+TWkVa8rQXj52mYMkGmb82bOl5io+1kfhbgk+4sz9S6x0IaFKRemN7EbMtUCE
         kuTeBtjn+mcn3BujYgKx78ieXl5D0NXN5Jagps5ARY+edPGe9LFzPvm9Lp1NHw5t2jM7
         juCA==
X-Gm-Message-State: ANhLgQ3+QIW5A+R+dAQqbxBh+CxJS/ljdAKjBkM3FMFvyxy0IDpKVPBe
        tqkMJpE4DoeS1scJ9BbwIHdSXA==
X-Google-Smtp-Source: ADFU+vuipIwBt7HZ/eXbGMHyK0C9Xm3ciUBrtc453qCMfM4q/YxsgsKOtlO41E3QCYP95HQyqRhlwA==
X-Received: by 2002:a63:7e10:: with SMTP id z16mr6992656pgc.412.1583863885067;
        Tue, 10 Mar 2020 11:11:25 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id c17sm27415625pfo.71.2020.03.10.11.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2020 11:11:24 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200310063338.3344582-5-bjorn.andersson@linaro.org>
References: <20200310063338.3344582-1-bjorn.andersson@linaro.org> <20200310063338.3344582-5-bjorn.andersson@linaro.org>
Subject: Re: [PATCH v4 4/5] arm64: dts: qcom: qcs404: Add IMEM and PIL info region
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Rob Herring <robh+dt@kernel.org>
Date:   Tue, 10 Mar 2020 11:11:23 -0700
Message-ID: <158386388355.149997.17460216194595657584@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Bjorn Andersson (2020-03-09 23:33:37)
> Add a simple-mfd representing IMEM on QCS404 and define the PIL
> relocation info region, so that post mortem tools will be able to locate
> the loaded remoteprocs.
>=20
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

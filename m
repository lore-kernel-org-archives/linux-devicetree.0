Return-Path: <SRS0=JrLZ=43=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BFEAC10F27
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Mar 2020 18:11:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0783D20637
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Mar 2020 18:11:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GCb/UeYv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726636AbgCJSLl (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 10 Mar 2020 14:11:41 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:36552 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726445AbgCJSLl (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 10 Mar 2020 14:11:41 -0400
Received: by mail-pg1-f194.google.com with SMTP id c7so940536pgw.3
        for <devicetree@vger.kernel.org>; Tue, 10 Mar 2020 11:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=pN3qTpKjWmrG74+zt0MCb4nvU9mEwdxCDTu02IXOOa4=;
        b=GCb/UeYvad1VcBxP5Le7hPBRpo0tV94ewwp+L7bfi16zLWdvY79SaKTJeXfC+TLr/G
         6+IrD5CuLoIQrNsAfuW/T3WHsvHWPVEIuTIkXzpQO9jAnDCtKi8RhdbeFGStr02B4zcM
         4d2syzMFkbd/GJcAUqGJmOUuuK+trg1JVAr+Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=pN3qTpKjWmrG74+zt0MCb4nvU9mEwdxCDTu02IXOOa4=;
        b=VD+bUe2mJDc2q108Wcp2ag9JdhtQ4mGYJhaW5LuYMCK/UtphvVr5iMz0k1Vp+3jWkI
         EzpVDaPsmQHXYe2ONEB4hL26w+a0f3dzF+pzZSmbdi5quGC8ayYRiwSLbHFwpd9v9LMU
         EUnk6lob0rWGTtIpMLG1fBqYqqN3d4WPiboT3VBxgX6NM0zeW8890yQdHR4aJDCMDvFt
         6oeFNJrZMQL2XuA+g5+Xm6cApXzSbNwuN4kdAGGKuLy6nzyqCgKqx5ejVh0FALiOfSay
         oHuwvRhLBGDFHvaARpQ8wg2DgW9NNd8+jiQb7vluW7fWcSTjnzf8FZ0HP4ZXs5swPOsN
         Ezcw==
X-Gm-Message-State: ANhLgQ1x93oBSofRPcoCe/w26YC+lL0IzB44j5nJVGpiJAoubakxpjIH
        suXpIVJlAgm7w9iujDBuB6TTrQ==
X-Google-Smtp-Source: ADFU+vtPfd6sEmJbJPrHFLC6tR/0kN+w0z/+5OCEPiBHtC1WspD9R1DrHYTO6ADKDhsgGxgi0AJK8A==
X-Received: by 2002:a63:6d4e:: with SMTP id i75mr10022175pgc.443.1583863900171;
        Tue, 10 Mar 2020 11:11:40 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id d9sm2967203pjw.24.2020.03.10.11.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2020 11:11:39 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200310063338.3344582-6-bjorn.andersson@linaro.org>
References: <20200310063338.3344582-1-bjorn.andersson@linaro.org> <20200310063338.3344582-6-bjorn.andersson@linaro.org>
Subject: Re: [PATCH v4 5/5] arm64: dts: qcom: sdm845: Add IMEM and PIL info region
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Rob Herring <robh+dt@kernel.org>
Date:   Tue, 10 Mar 2020 11:11:38 -0700
Message-ID: <158386389888.149997.14127685932598676242@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Bjorn Andersson (2020-03-09 23:33:38)
> Add a simple-mfd representing IMEM on SDM845 and define the PIL
> relocation info region, so that post mortem tools will be able to locate
> the loaded remoteprocs.
>=20
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

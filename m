Return-Path: <SRS0=DG9v=56=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F20E9C2BB1D
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 20:56:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CED5920644
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 20:56:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="H3h4TqmL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2633461AbgDNU4W (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Apr 2020 16:56:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2633454AbgDNU4P (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Tue, 14 Apr 2020 16:56:15 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CCE3C061A0C
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2020 13:56:15 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id np9so5814985pjb.4
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2020 13:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=brNSySgeiKv0xhhX3n6LDxkGSMExsjipuaZvipjv6gI=;
        b=H3h4TqmLx9PW5L4u3K907ITQ3/MaeFseibP8BW62ucVchEu+eqtMF6WGLny4r+07a4
         w9f2EEvotTxR2QFHMHSI60acRTc+f1HRoswf8M6Hk/eizrXUIfTQKr7SAIFjfD9Qo1a0
         OWXFg36wiBCAhrCHM5zJhT1HUe1PPzZXbVk0A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=brNSySgeiKv0xhhX3n6LDxkGSMExsjipuaZvipjv6gI=;
        b=V3KMWoctsmJv7vWje1Z0D4bAEgQaPznJrSiYZjptTXEZn+Bcm48KEob1zIfU3Zk2Pn
         ij0q2NOo0RC1Jp9/YqkCHusqWpFJ25Lmqhvy/2KH2gjcLqP9lxI0hRrqkv7RGWNte6qi
         P2L3KR87D1tibJXsu9Ux6hGm5yEFqWrOXeRzd2kfp4MKYXgAYCJ03ZFZAt/qG2dYYxN7
         Zk58ZfESd3plX8DnJVa+rhzr5lHeS5y+CDjLW+u19BC7z6nfw5GAdzCAQ20XscUK7tjf
         B0/+QMKbuwVxveDpH6UF3cLhiVxFqwYYtva6Q7bzo7kSmBl4rvlfxqpxjUZNa5PtKUqk
         PFow==
X-Gm-Message-State: AGi0Pua3Z2nlKt8vR52K+qcPvVhUKJq+1SKQIQ0QKMkcWKflqp5Qm/9m
        9qvrmfLCCj6Lvz0ClctCntD7ftGAQ3U=
X-Google-Smtp-Source: APiQypIR+i06XONT+D8ITa/IRdit2Sz40kgbj+FvORhekoMgieSKbRgQLejrYHBQYOUK1f8naFTkeQ==
X-Received: by 2002:a17:90b:4c8f:: with SMTP id my15mr2227495pjb.63.1586897774811;
        Tue, 14 Apr 2020 13:56:14 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id x5sm6481354pfc.213.2020.04.14.13.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 13:56:14 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1585809534-11244-3-git-send-email-sanm@codeaurora.org>
References: <1585809534-11244-1-git-send-email-sanm@codeaurora.org> <1585809534-11244-3-git-send-email-sanm@codeaurora.org>
Subject: Re: [PATCH v5 2/3] dt-bindings: phy: qcom,qmp: Add support for SC7180
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Doug Anderson <dianders@chromium.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Date:   Tue, 14 Apr 2020 13:56:13 -0700
Message-ID: <158689777311.105027.10697729966586057172@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Sandeep Maheswaram (2020-04-01 23:38:53)
> Add compatible for SC7180 in QMP PHY bindings.
>=20
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

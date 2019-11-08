Return-Path: <SRS0=K2IH=ZA=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EB78FA372C
	for <linux-devicetree@archiver.kernel.org>; Fri,  8 Nov 2019 19:13:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6F2BE206A3
	for <linux-devicetree@archiver.kernel.org>; Fri,  8 Nov 2019 19:13:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JFDvfMdZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732685AbfKHTN0 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 8 Nov 2019 14:13:26 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:47064 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390878AbfKHTHf (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 8 Nov 2019 14:07:35 -0500
Received: by mail-pl1-f195.google.com with SMTP id l4so4470282plt.13
        for <devicetree@vger.kernel.org>; Fri, 08 Nov 2019 11:07:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:from:to:cc:subject:user-agent:date;
        bh=kikk2WY5kfcxGjTzJAhY6RUjMX79xyo2nvmOqI9NKHM=;
        b=JFDvfMdZ5Y0xxtanpVxlYiQHlNVk+Z9yQ83f74eGrenWkdufHlpK8NqhFqwY1ff20M
         buoDVI3VxY5kZG4l5Ob1JEvmUj+eb5L0Ma02ASUUGACaYD6gU/TLztfHmscpQsj8xP+R
         MsYzNvmY8GqYQonkW8iFXop4RnW+pIJHoGoMc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:from:to:cc:subject
         :user-agent:date;
        bh=kikk2WY5kfcxGjTzJAhY6RUjMX79xyo2nvmOqI9NKHM=;
        b=ZZ0Lm7HS9Nd7QKcPj13BoAO0RSJ5KKvsSNRxf0gH5OGvICB5/DiSZ+WBq4Ibs0tA9f
         AlIh2Zs+NiBoTzx7mkqEAh3n5xysAfL4crhmqbGo8w8PVdm5MJ/ACjD3bu0v1nGsEIDy
         ip3kXpxeVm36OWVFT05CzYr4x22GoNa6XzPFhMf656y7vjpDZxr7ZhM2tyLOPc4zX43K
         0TkLnQW9E5IkSqnqAO63ZtvWo04pnRi7+HhzIufMSfqhe0LsyLqjcu29e8hucn/4hno6
         74hVsDakdq01kdhtm+RK9fBPp5SiJQ3Pve/EabbUD7xAfN8xW/N1VcbxX8QPimZMrUUB
         1skg==
X-Gm-Message-State: APjAAAWmiG2/DTT8TNuQhRm9cgmYaxgVz3Oj66dpIcZZLWefqmxGbvkQ
        nS/0Nr8+skWMV5Ikc/TW9lFPZg==
X-Google-Smtp-Source: APXvYqxoH5Z0CCe1PUE3xdaqaiDsVPjDsTLej5DIBq/bQpgGRGi2K8JEAyDFmgRNW/c+v8ue+O5XoA==
X-Received: by 2002:a17:902:8f81:: with SMTP id z1mr11544949plo.319.1573240054508;
        Fri, 08 Nov 2019 11:07:34 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id d4sm7368030pjs.9.2019.11.08.11.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2019 11:07:34 -0800 (PST)
Message-ID: <5dc5bcf6.1c69fb81.f3fb6.2bf3@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191108092824.9773-12-rnayak@codeaurora.org>
References: <20191108092824.9773-1-rnayak@codeaurora.org> <20191108092824.9773-12-rnayak@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org,
        Kiran Gunda <kgunda@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>
Subject: Re: [PATCH v5 11/13] arm64: dts: qcom: sc7180-idp: Add RPMh regulators
User-Agent: alot/0.8.1
Date:   Fri, 08 Nov 2019 11:07:33 -0800
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Rajendra Nayak (2019-11-08 01:28:22)
> From: Kiran Gunda <kgunda@codeaurora.org>
>=20
> Add the rpmh regulators for the sc7180 idp platform. This platform
> consists of PMIC PM6150 and PM6150l
>=20
> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>


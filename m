Return-Path: <SRS0=deyM=Y4=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 993B5CA9EC9
	for <linux-devicetree@archiver.kernel.org>; Mon,  4 Nov 2019 21:47:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6001120869
	for <linux-devicetree@archiver.kernel.org>; Mon,  4 Nov 2019 21:47:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gakghABf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728940AbfKDVrC (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 4 Nov 2019 16:47:02 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:44608 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728741AbfKDVrC (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 4 Nov 2019 16:47:02 -0500
Received: by mail-pg1-f195.google.com with SMTP id f19so3280031pgk.11
        for <devicetree@vger.kernel.org>; Mon, 04 Nov 2019 13:47:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:cc:subject:from:to:user-agent:date;
        bh=7jJQ1NcKveBtKcGJsD99Mt4fr4vw7vgm5QVERgCCc+c=;
        b=gakghABf83nmBd5F1TCaDE+0Bjc80TbJMSz2bp93N5g5x2zSpsgpZVNXSoV20PykSY
         rT8mFpFNgxFS8eMOBoBhp1oC4PK4JauOvaWKfCsT0TeNa8+Uy61MRkDHl9lgUT40Imys
         2t/my0Tw/9hzxlBn8mziKSliVWFTKoBozUoNM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:cc:subject:from:to
         :user-agent:date;
        bh=7jJQ1NcKveBtKcGJsD99Mt4fr4vw7vgm5QVERgCCc+c=;
        b=KcV8tbvDBFIvXSmC3edCfedgUcWK55GDn4obw+LU+GPHePNMVMhmnyYoqKIS0v85Dl
         K7vGULgkI2Ui6xeJ40Uae69G/kqFItyUjU8g/DxwwnAzS5H5JZF2Fz/7fAZHlVgM6lfH
         /B8NIrbqQEDfyhMxCguv68lktxQm3CCaGq6Kymgo8ut8zCZjJaZLCTBUu+1gaJQQVXmY
         D72vElGuKfrY2Iv5KkhelVe1TDxfFVu0Mt4dAlhujCqZ5xy4B4VjmD9eB667NZcb02PX
         101EYD+DacL3wC8FC9Whj3YGNdjS1qEdM8WdPn3fOLItgK+FQIy9YqrcbIPIn+Yalx9x
         xQlQ==
X-Gm-Message-State: APjAAAVGTiqB7Ntdtn+Tmzd89YU9WAkthZpAJ1NDo8zsBIZjjJjoAgTi
        r88e+ZbEBnnybvmWjbLm1lYfrg==
X-Google-Smtp-Source: APXvYqzMgIlIOYaSeTWk9M5N2B38HWf8Mps81hZBv9twl3u8F3n9PNF6iVEqNVar8mMp7FeTgxDSSQ==
X-Received: by 2002:a63:4c2:: with SMTP id 185mr32077554pge.233.1572904021801;
        Mon, 04 Nov 2019 13:47:01 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id 6sm19410658pfy.43.2019.11.04.13.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2019 13:47:01 -0800 (PST)
Message-ID: <5dc09c55.1c69fb81.f5014.840a@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1572408318-28681-2-git-send-email-mkshah@codeaurora.org>
References: <1572408318-28681-1-git-send-email-mkshah@codeaurora.org> <1572408318-28681-2-git-send-email-mkshah@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        rnayak@codeaurora.org, ilina@codeaurora.org, lsrao@codeaurora.org,
        mka@chromium.org, evgreen@chromium.org, dianders@chromium.org,
        Maulik Shah <mkshah@codeaurora.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: Add cpuidle low power states
From:   Stephen Boyd <swboyd@chromium.org>
To:     Maulik Shah <mkshah@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org
User-Agent: alot/0.8.1
Date:   Mon, 04 Nov 2019 13:47:00 -0800
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Maulik Shah (2019-10-29 21:05:18)
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/q=
com/sc7180.dtsi
> index fceac50..69d5e2c 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -157,12 +178,69 @@
[...]
> +                       CLUSTER_SLEEP_0: cluster-sleep-0 {
> +                               compatible =3D "arm,idle-state";
> +                               idle-state-name =3D "cluster-power-down";
> +                               arm,psci-suspend-param =3D <0x400000F4>;

Nitpick: Lowercase hex please.

> +                               entry-latency-us =3D <3263>;
> +                               exit-latency-us =3D <6562>;
> +                               min-residency-us =3D <9987>;
> +                               local-timer-stop;
> +                       };
> +               };

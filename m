Return-Path: <SRS0=Wk2R=75=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD91EC433E0
	for <linux-devicetree@archiver.kernel.org>; Tue, 16 Jun 2020 11:15:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 988D92071A
	for <linux-devicetree@archiver.kernel.org>; Tue, 16 Jun 2020 11:15:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="X9LTNBZi"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728339AbgFPLPT (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 16 Jun 2020 07:15:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728326AbgFPLPQ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 16 Jun 2020 07:15:16 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2CE3C08C5C4
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2020 04:15:14 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id t7so9076862pgt.3
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2020 04:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=SgTOvbgxwA5VoaXVXVrIfLqGjYTA/hWr+DeE114p4Z8=;
        b=X9LTNBZiXJJz9efMUp9iGtVr8fNdH3Q1LOojyeXv01dGysdbuy3KYNUUGT1uniXOUw
         DjD9oOo8gHYvd5yg7NJnQUQpB+gjfjE6C0lTFbahQC+gzOd0JXwa/A41wgpLch45bIzZ
         VJsNzKctIhTMbqLzq9G/apS+VOjcPgo72eD3s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=SgTOvbgxwA5VoaXVXVrIfLqGjYTA/hWr+DeE114p4Z8=;
        b=alASrHiCAvDe3a56k8dgns1vteCbg7nR+Kt5jWXJFV3pYuJVEtpods2NngaZQV47Lb
         w6lhM5naQ2KBRT9zk22/nG0Twyt+GTa/Nxv9TIcFrSyR+LhMiRCP7BsruKzr9a6l81u9
         4ueXvWO2hPH4FSA8CwLdFX7WxSx0WdfMWjVXYGspfnt8XFbjyUqU/OPeGR+Ao435N4uz
         lbinA6ue8x+9d7vXprVmmuxxMkm5DZc/7XlOkSAgUHry+U1gkyiHl88jdSmaJyI83bCw
         FByynNasCzkFLFgycmajyCjr1XS0g0pLBizuiu4H5MIV/39DxdDCOEG8U9FSGLLhiMRv
         fOJQ==
X-Gm-Message-State: AOAM532sghgSo4aKBcQ+UsjD/UERqjNk01eZf71sCIhhPzOdy9eSnzsv
        RibSqUN3UZq5ybAi/GWQ32AiXaqd9Yw=
X-Google-Smtp-Source: ABdhPJydaKHWTiQS4tjTQ62P0i7l/8GnXMtSVp9/WiCYOl6NgtRjnVcqxnmh19tvXcq+VnLsQ8hwGw==
X-Received: by 2002:a65:6703:: with SMTP id u3mr1653921pgf.179.1592306113834;
        Tue, 16 Jun 2020 04:15:13 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id 67sm13336068pga.44.2020.06.16.04.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 04:15:13 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200612015030.16072-2-tanmay@codeaurora.org>
References: <20200612015030.16072-1-tanmay@codeaurora.org> <20200612015030.16072-2-tanmay@codeaurora.org>
Subject: Re: [PATCH v6 1/5] dt-bindings: msm/dp: add bindings of DP/DP-PLL driver for Snapdragon
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, seanpaul@chromium.org,
        robdclark@gmail.com, aravindh@codeaurora.org,
        abhinavk@codeaurora.org,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Vara Reddy <varar@codeaurora.org>,
        Tanmay Shah <tanmay@codeaurora.org>
To:     Tanmay Shah <tanmay@codeaurora.org>, robh+dt@kernel.org,
        sam@ravnborg.org
Date:   Tue, 16 Jun 2020 04:15:12 -0700
Message-ID: <159230611219.62212.8262135380349283774@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Tanmay Shah (2020-06-11 18:50:26)
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-sc7180.yaml=
 b/Documentation/devicetree/bindings/display/msm/dp-sc7180.yaml
> new file mode 100644
> index 000000000000..5fdb9153df00
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/dp-sc7180.yaml
> @@ -0,0 +1,142 @@
> +        data-lanes =3D <0 1>;
> +
> +        ports {
> +            #address-cells =3D <1>;
> +            #size-cells =3D <0>;
> +
> +            port@0 {
> +                reg =3D <0>;
> +                dp_in: endpoint {
> +                    remote-endpoint =3D <&dpu_intf0_out>;
> +                };
> +            };
> +
> +            port@1 {
> +                reg =3D <1>;
> +                dp_out: endpoint {

Just curious what is eventually connected here? This is possibly a
question for Rob Herring, but I can't figure out how we're supposed to
connect this to the USB type-c connector that is receiving the DP
signal. Does the type-c connector binding support connecting to this end
of the graph? Or should this connect to the DP phy and then the phy
connects to the USB type-c connector node? Right now it is empty which
seems wrong.

> +                };
> +            };
> +        };
> +    };

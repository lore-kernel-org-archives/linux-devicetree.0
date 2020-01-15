Return-Path: <SRS0=kWYo=3E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68F2DC32771
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jan 2020 22:44:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 285D42465A
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jan 2020 22:44:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EXJ9Jpxf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730244AbgAOWoJ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 15 Jan 2020 17:44:09 -0500
Received: from mail-vk1-f195.google.com ([209.85.221.195]:46710 "EHLO
        mail-vk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729442AbgAOWoJ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 15 Jan 2020 17:44:09 -0500
Received: by mail-vk1-f195.google.com with SMTP id u6so5200904vkn.13
        for <devicetree@vger.kernel.org>; Wed, 15 Jan 2020 14:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EbsE7yB3eGOjL7w6M5aCw+NaQ3bQ1Ie1J3/rIfgrCSM=;
        b=EXJ9JpxfQFkpbNO5ovU9r+uWdsKb6mmP3FVs0MzgAX1M0W5ezFJiXtx8rkazXI2s1M
         +fUMgeM4ULCcj/ldqsgpEm3+8rYCC0mLe1fn9fAoRPYgkZL+X4xaIE0elUZk9iBF++/y
         oNXg8Luw40ipFqpEBdGl33Y8JFZRautwdT438=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EbsE7yB3eGOjL7w6M5aCw+NaQ3bQ1Ie1J3/rIfgrCSM=;
        b=EOH1dXJBu4BiFDybKEtpJNNLvd0Gr/wjzzeuM48ePvOxdGF9aEazatEa3fNwDoCjSR
         vBn8XucydXoLOTgDw0gSyaHH+ytAZOEW684YFodRDCwnsuPPv0Wi47TtWm/xg2HOnUNM
         W18jC46v/Iq4jTkSvw0fT9FN7cOARo0evrbET35GSrcih9g7kgwlExZOt3ttPDKMvcaD
         tdQzSakxNt3I9jiUEnWCqukTok8I7d2cDG0QBLx7lw+vHIMvN8bw9QB9Imf+74LTZ9/J
         UJO/f3FCGQHiuk2FKHJG+YLo+1P5UXkfHfpl1Q8npTpgUIjkFNL+Dj6JvfCaIC9y5Tas
         wxIg==
X-Gm-Message-State: APjAAAWrmv1OVBARe6OGIpYGAM3eqNi3xomr/Lguu0VlxcCqNvAv1gWB
        EMqDAaRmUQPhL3bYiEap2q1HDbIpaco=
X-Google-Smtp-Source: APXvYqwcLuwUOUvE+c6FJMZNeuT55Ans2aXigSXH1umg+BelM5R+d1RAHI9x/PFv7m/Rw/za6RkEuw==
X-Received: by 2002:a1f:a2d6:: with SMTP id l205mr15703087vke.100.1579128247948;
        Wed, 15 Jan 2020 14:44:07 -0800 (PST)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id a196sm5859158vke.14.2020.01.15.14.44.06
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2020 14:44:07 -0800 (PST)
Received: by mail-ua1-f46.google.com with SMTP id h32so6937286uah.4
        for <devicetree@vger.kernel.org>; Wed, 15 Jan 2020 14:44:06 -0800 (PST)
X-Received: by 2002:ab0:2006:: with SMTP id v6mr17735083uak.22.1579128246442;
 Wed, 15 Jan 2020 14:44:06 -0800 (PST)
MIME-Version: 1.0
References: <20200110101802.4491-1-saiprakash.ranjan@codeaurora.org>
In-Reply-To: <20200110101802.4491-1-saiprakash.ranjan@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 15 Jan 2020 14:43:55 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Voec=RNabf7eqMDd68J7KCgVpNwvUxaz6SVwGMnrCppQ@mail.gmail.com>
Message-ID: <CAD=FV=Voec=RNabf7eqMDd68J7KCgVpNwvUxaz6SVwGMnrCppQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: Add iommus property to QUP0 and QUP1
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

On Fri, Jan 10, 2020 at 2:18 AM Sai Prakash Ranjan
<saiprakash.ranjan@codeaurora.org> wrote:
>
> Define iommus property for QUP0 and QUP1 with the proper SID
> and mask. Below SMMU global faults are seen without this during
> boot and when using i2c touchscreen.
>
> QUP0:
> arm-smmu 15000000.iommu: Unexpected global fault, this could be serious
> arm-smmu 15000000.iommu: GFSR 0x00000002, GFSYNR0 0x00000002, GFSYNR1 0x00000043, GFSYNR2 0x00000000
>
> QUP1:
> arm-smmu 15000000.iommu: Unexpected global fault, this could be serious
> arm-smmu 15000000.iommu: GFSR 0x00000002, GFSYNR0 0x00000002, GFSYNR1 0x000004c3, GFSYNR2 0x00000000
>
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 2 ++
>  1 file changed, 2 insertions(+)

Fixes: ba3fc6496366 ("arm64: dts: sc7180: Add qupv3_0 and qupv3_1")
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Tested-by: Douglas Anderson <dianders@chromium.org>

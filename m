Return-Path: <SRS0=GOr1=2C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 257F8C3F68F
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Dec 2019 20:46:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EC99622527
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Dec 2019 20:46:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LS9R9Sdx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730834AbfLLUqB (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 12 Dec 2019 15:46:01 -0500
Received: from mail-il1-f194.google.com ([209.85.166.194]:46558 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730784AbfLLUqB (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 12 Dec 2019 15:46:01 -0500
Received: by mail-il1-f194.google.com with SMTP id t17so116559ilm.13
        for <devicetree@vger.kernel.org>; Thu, 12 Dec 2019 12:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jyPUkZySLXKgf9TnxUpOyot3YnU8ObDh2XPQK80y2jU=;
        b=LS9R9Sdxzil058X/36VJo8VobbVEGkMn+8e2lKrWNnX0ZwWoWWS/RVEY4XZV1UBYT5
         wPneNbx3H0ThwSxxHuzE+CeXB4Od8e+v5XHcwZOFHzMuh+umqL0iCvZHsV2vWs5kP5cj
         NyU3dRkDVH2rpW4CFkJYN0i8HAff/8TX8yXnA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jyPUkZySLXKgf9TnxUpOyot3YnU8ObDh2XPQK80y2jU=;
        b=pSho3vltoJmfFidLUa2e1J1fJVYxx6PYMkiT+Eojs7mXpQ/Q1uKMiVYCKchA0fDR8E
         BcNFJXgBotoHj9+U32PK81ah9GapBMVmMrvNfAxwjjTmFIs2P4sQ/0CY2POVQGAr6CHf
         tCHuhLhLSHnF6RjywG9meXTqXEXgK1S48EwlUW2KhnbodokWRvrm1XjXzhcLLLQTVOB0
         ftfIzD9OyNhQy2jhd35mJhce8CgCbvKb7mn8WhXT5+7eVkTz7LqhGvIrm84pUMX9ncYa
         svSxjlsBztagt0vkAT5gXLSQ670MQ5LXmIOkf7xHrGbnnI2BSDBOHJucPPAyVeVp9AjI
         btDw==
X-Gm-Message-State: APjAAAVCcmK0l3FG0QJmWiyhyOdDqsEU0ppzv0/ehaFUiyC2ACWPxylt
        DHlTYuD9k6vVF6Xg0LTgBlfANGo6TJU=
X-Google-Smtp-Source: APXvYqyUAWKi7qg7l5oTcIWN9FM/TA0hbDKlfk7f86PI+k/4DVWoEh/f9Z7OFCU892+yfkcn0ME+FA==
X-Received: by 2002:a92:dc89:: with SMTP id c9mr9638737iln.190.1576183560256;
        Thu, 12 Dec 2019 12:46:00 -0800 (PST)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com. [209.85.166.48])
        by smtp.gmail.com with ESMTPSA id k16sm2026620ili.35.2019.12.12.12.45.59
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2019 12:45:59 -0800 (PST)
Received: by mail-io1-f48.google.com with SMTP id v3so72205ioj.5
        for <devicetree@vger.kernel.org>; Thu, 12 Dec 2019 12:45:59 -0800 (PST)
X-Received: by 2002:a5e:940f:: with SMTP id q15mr4341569ioj.218.1576183558931;
 Thu, 12 Dec 2019 12:45:58 -0800 (PST)
MIME-Version: 1.0
References: <20191212115443.1.I55198466344789267ed1eb5ec555fd890c9fc6e1@changeid>
In-Reply-To: <20191212115443.1.I55198466344789267ed1eb5ec555fd890c9fc6e1@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 12 Dec 2019 12:45:46 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XD2GKPc5qeMakvW8Ej9-y7n0Hi2qAie-gUM=DJOSv6sw@mail.gmail.com>
Message-ID: <CAD=FV=XD2GKPc5qeMakvW8Ej9-y7n0Hi2qAie-gUM=DJOSv6sw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: Fix order of nodes
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Rajeshwari <rkambl@codeaurora.org>,
        Maulik Shah <mkshah@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

On Thu, Dec 12, 2019 at 11:55 AM Matthias Kaehlcke <mka@chromium.org> wrote:
> +               pdc: interrupt-controller@b220000 {
> +                       compatible = "qcom,sc7180-pdc", "qcom,pdc";
> +                       reg = <0 0xb220000 0 0x30000>;

nit: when applying, maybe Bjorn / Andy could change 0xb220000 to
0x0b220000 to match the convention elsewhere in this file.  That's not
a new problem introduced in your patch, but it seems like it could be
part of the same patch and it feels like a waste to re-send just for
that.  ;-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

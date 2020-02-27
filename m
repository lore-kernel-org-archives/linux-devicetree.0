Return-Path: <SRS0=tkJE=4P=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAB07C3F2C0
	for <linux-devicetree@archiver.kernel.org>; Thu, 27 Feb 2020 21:59:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A7CF42469F
	for <linux-devicetree@archiver.kernel.org>; Thu, 27 Feb 2020 21:59:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TMG5VflR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729817AbgB0V7F (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 27 Feb 2020 16:59:05 -0500
Received: from mail-ed1-f66.google.com ([209.85.208.66]:34255 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729776AbgB0V7F (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 27 Feb 2020 16:59:05 -0500
Received: by mail-ed1-f66.google.com with SMTP id dm3so920214edb.1
        for <devicetree@vger.kernel.org>; Thu, 27 Feb 2020 13:59:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=akb/fqWb9RAKIbbLYDDh8qkuoGYS5G+iOCImBrzoF9o=;
        b=TMG5VflR3I+CGPW+mSXF7fJBlkIgbvu1pHHgkcCLliyNx/65WX4EateAFJ+aYYIZTw
         c3laEpZS9R7qXtce7smYE4n1H0nZi18snVj03jIXMRsHgoFOyMPcwQBWb+g9rcCNCD28
         PdCGEoz3ivKvIuWNhKqTW1465oIKHlXJl+83w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=akb/fqWb9RAKIbbLYDDh8qkuoGYS5G+iOCImBrzoF9o=;
        b=f+Au/ajIvybIX3DM0d1uUN208n0nG3/qNFHCBEhT2k3AbLWzc3OW9oAK9H329LA+dZ
         b99p+hmDhm8ONDIo1M7WKuJa2FdfBWKhRnJVbPXYhUh58TvlbOLKn5E2ZowmBYEX+2IT
         dpyG8J7i90grKt1XeRdRyAcUxpE6nWGLHhogerYvC+Uvl6sjR/0j/Wey3xOkQGDWMxaK
         I4ddWh3akmt+8PrZxLma3Sf4ZkLTOLWuGyhFaoo3RsYP3ROMG8ylLcttHdJukgPt8/LH
         hfdiF+tonmh0Z48CSTnkwJ/00vLa6Gbz3pPDU7xz0FS77bMljX352JhwQSYIsHU6vXoK
         s6HQ==
X-Gm-Message-State: APjAAAWhlzsqVUpJZwj+WOwsEJEzqAH8dwm8jYdg6oUpgjvWwTluP6Lc
        mqEa8L1D3ftf65/OzZM1DJsivaRxeMM=
X-Google-Smtp-Source: APXvYqzTdHOOtG8/+dJs86xtr2SApQ2xtUMqDPZ+Nu5mskKNKbWaKIK35sccxs7j5SehjLxXIl/EpQ==
X-Received: by 2002:a17:906:af84:: with SMTP id mj4mr1046479ejb.341.1582840742890;
        Thu, 27 Feb 2020 13:59:02 -0800 (PST)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com. [209.85.221.49])
        by smtp.gmail.com with ESMTPSA id x12sm331861eje.52.2020.02.27.13.59.02
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Feb 2020 13:59:02 -0800 (PST)
Received: by mail-wr1-f49.google.com with SMTP id e8so677421wrm.5
        for <devicetree@vger.kernel.org>; Thu, 27 Feb 2020 13:59:02 -0800 (PST)
X-Received: by 2002:a05:651c:1a2:: with SMTP id c2mr734150ljn.79.1582840398185;
 Thu, 27 Feb 2020 13:53:18 -0800 (PST)
MIME-Version: 1.0
References: <20200209183411.17195-1-sibis@codeaurora.org> <20200209183411.17195-6-sibis@codeaurora.org>
In-Reply-To: <20200209183411.17195-6-sibis@codeaurora.org>
From:   Evan Green <evgreen@chromium.org>
Date:   Thu, 27 Feb 2020 13:52:41 -0800
X-Gmail-Original-Message-ID: <CAE=gft755hYH7ue=fv2jvofejoWHZaguji6D-M1qHup-3SJTwQ@mail.gmail.com>
Message-ID: <CAE=gft755hYH7ue=fv2jvofejoWHZaguji6D-M1qHup-3SJTwQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] interconnect: qcom: sdm845: Split qnodes into
 their respective NoCs
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        David Dai <daidavid1@codeaurora.org>,
        Saravana Kannan <saravanak@google.com>,
        Matthias Kaehlcke <mka@chromium.org>, linux-pm@vger.kernel.org,
        Odelu Kukatla <okukatla@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sun, Feb 9, 2020 at 10:35 AM Sibi Sankar <sibis@codeaurora.org> wrote:
>
> From: David Dai <daidavid1@codeaurora.org>
>
> In order to better represent the hardware and its different Network-On-Chip
> devices, split the sdm845 provider driver into NoC specific providers.
> Remove duplicate functionality already provided by the icc rpmh and
> bcm voter drivers to calculate and commit bandwidth requests to hardware.
>
> Signed-off-by: David Dai <daidavid1@codeaurora.org>
> Signed-off-by: Odelu Kukatla <okukatla@codeaurora.org>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>

Reviewed-by: Evan Green <evgreen@chromium.org>

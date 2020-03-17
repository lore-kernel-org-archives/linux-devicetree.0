Return-Path: <SRS0=fjOU=5C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD3A5C10F29
	for <linux-devicetree@archiver.kernel.org>; Tue, 17 Mar 2020 16:51:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AF8982073E
	for <linux-devicetree@archiver.kernel.org>; Tue, 17 Mar 2020 16:51:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YkGBAuYA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726740AbgCQQvP (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 17 Mar 2020 12:51:15 -0400
Received: from mail-vk1-f196.google.com ([209.85.221.196]:35237 "EHLO
        mail-vk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726207AbgCQQvP (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 17 Mar 2020 12:51:15 -0400
Received: by mail-vk1-f196.google.com with SMTP id g25so4763977vkl.2
        for <devicetree@vger.kernel.org>; Tue, 17 Mar 2020 09:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5+4aJa7IpjGZCPI3Fh6cthpiIv4IQ9AsMliiqsg2mts=;
        b=YkGBAuYA3wpjmbt2VnCUIMI0xJVISAM2HQ+4vpw4N5qYFuYvkK/XDLG95zf96seDTj
         JLTzADnRCAjLkajykdhv5TBY+UyCAAt4Fg0/W1SluewltWU9Q42ysjJuhoOH4sDheabF
         gAhRDlrX3PZyU1wGBAo+zTG5FaY2a1pPsQWXA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5+4aJa7IpjGZCPI3Fh6cthpiIv4IQ9AsMliiqsg2mts=;
        b=anUky1lOnFcXOQx1grM5fZre8JhjwRCXjh8UmVv0ujrBdaHv/x+98Tpt5vVrK+R1Gx
         1v49yF+ovloycH0nITjy5L3d3KYnLhlkj5bxsntTxoq7f8TSUBL4TJBuR+M2QN4WclqJ
         SRgI662cpQIn/we/vihiseJTL7i+EDmSbhtHKfqkNOAG7bpvC+EzhBxUc8qW9Z7RxdDw
         bHqi8InEHrZv2PDOe62zxt8VM3Svf5yIAP4ddEqF7PfP2xMt/G8F3yjnBkRceXM11aJO
         hJP0xc9amhHra9ZdtUwUdWTaqc1pzsbFio9qafeESZ72OT6aEHPS8Sifse3KOocPjKXs
         TsFA==
X-Gm-Message-State: ANhLgQ2esS0oAX+wVvrUYYLLYGMEMNvh0V7Q8F6KJlz8nXQDlzp3R5t1
        k1Ipgz8Bba/Mdasmvepxr7/tcgXcaEo=
X-Google-Smtp-Source: ADFU+vuDOFSOgbyVZF/7R+yRlrd2xYlIZkN9TeWlJfCpl9Yuh2NImLc4QGBNOB0B0l1D5TLdq65a9g==
X-Received: by 2002:a1f:3613:: with SMTP id d19mr111207vka.71.1584463873193;
        Tue, 17 Mar 2020 09:51:13 -0700 (PDT)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id y14sm1690460uac.10.2020.03.17.09.51.12
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2020 09:51:12 -0700 (PDT)
Received: by mail-vk1-f179.google.com with SMTP id s194so6176205vkb.11
        for <devicetree@vger.kernel.org>; Tue, 17 Mar 2020 09:51:12 -0700 (PDT)
X-Received: by 2002:a1f:2305:: with SMTP id j5mr155171vkj.40.1584463871622;
 Tue, 17 Mar 2020 09:51:11 -0700 (PDT)
MIME-Version: 1.0
References: <1584430804-8343-1-git-send-email-rkambl@codeaurora.org>
In-Reply-To: <1584430804-8343-1-git-send-email-rkambl@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 17 Mar 2020 09:50:59 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VLZ4RQQuji=1kKE5EnqrpY0M=U_G8XigAWAaZ8mxc=eg@mail.gmail.com>
Message-ID: <CAD=FV=VLZ4RQQuji=1kKE5EnqrpY0M=U_G8XigAWAaZ8mxc=eg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: Changed polling-delay in
 Thermal-zones node
To:     Rajeshwari <rkambl@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        sivaa@codeaurora.org, Sandeep Maheswaram <sanm@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

On Tue, Mar 17, 2020 at 12:42 AM Rajeshwari <rkambl@codeaurora.org> wrote:
>
> Changed polling-delay and polling-delay-passive to zero as per
> the requirement.
>
> Signed-off-by: Rajeshwari <rkambl@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 100 +++++++++++++++++------------------
>  1 file changed, 50 insertions(+), 50 deletions(-)

It probably wouldn't hurt to mention in the commit message that this
is because the thermal sensor interrupts are all hooked up and thus
the polling is not a useful thing to do.  ...but other than that:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

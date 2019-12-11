Return-Path: <SRS0=G+GX=2B=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B217C00454
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Dec 2019 22:13:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CFFF7205C9
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Dec 2019 22:13:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="d5WomvyX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726524AbfLKWNx (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 11 Dec 2019 17:13:53 -0500
Received: from mail-il1-f196.google.com ([209.85.166.196]:36938 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726345AbfLKWNt (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 11 Dec 2019 17:13:49 -0500
Received: by mail-il1-f196.google.com with SMTP id t9so244050iln.4
        for <devicetree@vger.kernel.org>; Wed, 11 Dec 2019 14:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7WK0R3vgtayVNUB5s3/ppzS6WIJXfYbPpsi6siOolE4=;
        b=d5WomvyX4tnC/dQgAK832nGB1Kl75yZmGi7AihNVzJoCrM+aW4Ie3qCVKGeOPc5KJm
         snJvRR06tTFUg6q/r4CpZg+XqLsV0mSiWfTAT+ctzmceBh1B3nzgA92CF4cf6SHIA3h8
         ov94DUQkYXaaarV15MIN98KM6+XFZCUv+7GaE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7WK0R3vgtayVNUB5s3/ppzS6WIJXfYbPpsi6siOolE4=;
        b=AkQSsS62Ph2k5bnbz0FeQXcn6oHQUNIyEWS6kO299msWUsIcfpErQmA0Wi5aKkCPOz
         nnBtIBsfNFhJGQcKqh256l0EYOc5QjlSY9Ii5Ckay+F8mb0Lzg8Gzw5dmhw9WtPHm4cd
         7M2BMQJaoKHXrneGVGW1ma0rdb6aKAC6baHSdxBNaQrObR6AOJhcawNmFrpBc1q/MwO0
         WHp7dr0hjLOvFQVKsxHlolkIL27e6gdx3JQ3nVHWs57cbSysEuloKoD0Lk/K2fNqpDqQ
         3dNkVXRT9tzAX7imyzr8i9wTJiYZHwwBBfJIF5lkHA954UjNO9SzFOITYcyPazHUCPl9
         nZJw==
X-Gm-Message-State: APjAAAWmZt05/Uj9U/9ydXOoy+xuCT7gwtc0POr2KeYtoBchRsEblDwW
        DWqh5IOh4m4IwZUytpQ0t7IZ9uyppoU=
X-Google-Smtp-Source: APXvYqwK6xjajPt1SjEtZj/90BJw0vJ9ja8Up33sNz1gGHqnhuSsiAprNOyAxSi+8xWOFG6bYIlzIA==
X-Received: by 2002:a92:6b01:: with SMTP id g1mr5198355ilc.54.1576102428873;
        Wed, 11 Dec 2019 14:13:48 -0800 (PST)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com. [209.85.166.44])
        by smtp.gmail.com with ESMTPSA id l16sm809441ioj.70.2019.12.11.14.13.47
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2019 14:13:47 -0800 (PST)
Received: by mail-io1-f44.google.com with SMTP id v3so514254ioj.5
        for <devicetree@vger.kernel.org>; Wed, 11 Dec 2019 14:13:47 -0800 (PST)
X-Received: by 2002:a6b:5503:: with SMTP id j3mr425338iob.142.1576102426904;
 Wed, 11 Dec 2019 14:13:46 -0800 (PST)
MIME-Version: 1.0
References: <1574940787-1004-1-git-send-email-sanm@codeaurora.org> <1574940787-1004-4-git-send-email-sanm@codeaurora.org>
In-Reply-To: <1574940787-1004-4-git-send-email-sanm@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 11 Dec 2019 14:13:34 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XWsN72pvtHubq2UOgvm6oPs2s+RA61ct5XPGsBDbA13w@mail.gmail.com>
Message-ID: <CAD=FV=XWsN72pvtHubq2UOgvm6oPs2s+RA61ct5XPGsBDbA13w@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] dt-bindings: usb: qcom,dwc3: Add compatible for SC7180
To:     Sandeep Maheswaram <sanm@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-usb@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

On Thu, Nov 28, 2019 at 3:33 AM Sandeep Maheswaram <sanm@codeaurora.org> wrote:
>
> Add compatible for SC7180 in usb dwc3 bindings.
>
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

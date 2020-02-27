Return-Path: <SRS0=tkJE=4P=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6160C35E15
	for <linux-devicetree@archiver.kernel.org>; Thu, 27 Feb 2020 18:19:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C2BEC246BE
	for <linux-devicetree@archiver.kernel.org>; Thu, 27 Feb 2020 18:19:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NVHhsqaJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729817AbgB0STT (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 27 Feb 2020 13:19:19 -0500
Received: from mail-vk1-f194.google.com ([209.85.221.194]:46674 "EHLO
        mail-vk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729915AbgB0STT (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 27 Feb 2020 13:19:19 -0500
Received: by mail-vk1-f194.google.com with SMTP id u6so153605vkn.13
        for <devicetree@vger.kernel.org>; Thu, 27 Feb 2020 10:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=O3+t6YZki97dJn3TmsqtMQPSzhs2LsQfL/dODOkLgZk=;
        b=NVHhsqaJ7eLhlivtVpaS7uaXQFfxcmkuZnCtRTLYV3MYZWP6G1Y2cUurEHgtMKqGWL
         9h9VrA3IcEElvTZxH7PagPPJstv+J/QUbn1Dien0pGx99FV3Fe6vKPiVttL0b19DSN1n
         9EC8fsbCRcGXL2FQoLx/HsRiFdGof4zCx51nU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=O3+t6YZki97dJn3TmsqtMQPSzhs2LsQfL/dODOkLgZk=;
        b=BTbr5Akn90OQD9OIRStC49u2IumZhcj1jK0o2CfZ0IvwjgHjpVKHOU9yfq9TshDoYj
         vRSsrY3EolxB9NRAkGA2xaGhDL2rF7++UKBtGcPuPhd1ohkebitJKiV8UBvnTWd2JZfZ
         sehvbG7VahpLVm0PDP0yzOS0TYcRg8tMQ5PR8tlZpNL5pp9/J+kMTrlCcUXFuT8hI+8w
         Wwensq67xNYnPGOx3H+0Ud+R1U4tEOSnhkQjNkM9wfhFCbYvlmt8Wlo04zBf831f/thC
         8avVmSSVpOkoD7J3272EnzZ7YaiOFwMOeiVr9kfpFuZJKlAViQoIBJi8Lkrf+GU90xNt
         D8Tw==
X-Gm-Message-State: ANhLgQ1Us3H21PYSvf7hNMrpn3WUytxyXoZH8Bown/1oT/PMWhaiyjCc
        TPeETYBbxWjIbPEEyjgSu62+YEAHl60=
X-Google-Smtp-Source: ADFU+vslaGNzN5Jl2gsEYYoRpgDA0tMYE/5nrI6VE9rYSKjgrTl8xjpzShmTX3sncYZZbuamjORPAA==
X-Received: by 2002:a1f:dc42:: with SMTP id t63mr316359vkg.5.1582827557686;
        Thu, 27 Feb 2020 10:19:17 -0800 (PST)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id c7sm2230528vkn.31.2020.02.27.10.19.16
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Feb 2020 10:19:17 -0800 (PST)
Received: by mail-vk1-f170.google.com with SMTP id t129so167519vkg.6
        for <devicetree@vger.kernel.org>; Thu, 27 Feb 2020 10:19:16 -0800 (PST)
X-Received: by 2002:ac5:cdcd:: with SMTP id u13mr361384vkn.0.1582827555884;
 Thu, 27 Feb 2020 10:19:15 -0800 (PST)
MIME-Version: 1.0
References: <20200227092649.v3.1.I15e0f7eff0c67a2b49d4992f9d80fc1d2fdadf63@changeid>
In-Reply-To: <20200227092649.v3.1.I15e0f7eff0c67a2b49d4992f9d80fc1d2fdadf63@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 27 Feb 2020 10:19:03 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UuvSt0z+B4ymCW8u+c+rHQ5kGYtOQYGF8QLex__p31xQ@mail.gmail.com>
Message-ID: <CAD=FV=UuvSt0z+B4ymCW8u+c+rHQ5kGYtOQYGF8QLex__p31xQ@mail.gmail.com>
Subject: Re: [PATCH v3] arm64: dts: sc7180: Move venus node to the correct position
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Dikshita Agarwal <dikshita@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

On Thu, Feb 27, 2020 at 9:26 AM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> Per convention device nodes for SC7180 should be ordered by address.
> This is currently not the case for the venus node, move it to the
> correct position.
>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
>
> Changes in v3:
> - actually insert the venus node after usb@a6f8800 and not just
>   pretend to do it
>
> Changes in v2:
> - insert the venus node *after* the usb@a6f8800 node, not before
>
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 52 ++++++++++++++--------------
>  1 file changed, 26 insertions(+), 26 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

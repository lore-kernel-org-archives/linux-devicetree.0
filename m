Return-Path: <SRS0=9zIi=6I=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FF6EC5518A
	for <linux-devicetree@archiver.kernel.org>; Fri, 24 Apr 2020 04:06:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4EC552075A
	for <linux-devicetree@archiver.kernel.org>; Fri, 24 Apr 2020 04:06:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Nu33gOA8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726008AbgDXEGG (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 24 Apr 2020 00:06:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725823AbgDXEGF (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Fri, 24 Apr 2020 00:06:05 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F510C09B046
        for <devicetree@vger.kernel.org>; Thu, 23 Apr 2020 21:06:03 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id g14so10173140otg.10
        for <devicetree@vger.kernel.org>; Thu, 23 Apr 2020 21:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Bp7bLiuTsfsWWKh/d49PwuT5rZ0JwxKcojUgMRnOFEI=;
        b=Nu33gOA8niDaEdLvN8wgAlhCI7kCWoYqolpkmVpInY8Z06MQCgDjfMX49Y+oVOmZtx
         ODAzh7G7HrkINIviJIEo5Li2eA0u/U2zXSXC7zpOAPPRGk7I2Z3GfZnqOoQ6wI+VH0w5
         /oyTJS9tCM8GsO8IHQ+252MCDnwO6RwkWXBSLVCdsKUpqFg78c63KzZ7AEOtrVriYTCw
         kcpA26l2byANp9rQdUX1EvDk04VBBEqknDRqjmS51TrcJw6ApBGvZuG8imfmb6QsuTVu
         +RAhpGZluictRESlw0RfnGqQqfoJ7+IGhEg6KCUespkLiZaKgVUz5UDto/UtPEqPThOI
         8A8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Bp7bLiuTsfsWWKh/d49PwuT5rZ0JwxKcojUgMRnOFEI=;
        b=jlpjC7m44kIouILusIHNrzKftmtu+Bj1Q80U1rylPn2mA38jKKzMr9ZiuSRCCbNKQ5
         suObHBxQp633K7j3D6335Q3Dv7/+H6uduRFr0TvWwlDcX5BDIy23lD4563RYS3FJ8joG
         Ei6aWaA1juwTAt1DdHjDiNGn1Ps+E7HHDxui4/Q7lgMTWAU8qsR4UTJIj1M9Q6XZpQ+k
         BU2LNxCvu9IuKJQsqoA1rQE1NYsNNoZ3qep0b+EicjEAVJNwixEVJngQ0k+9VqYwvhTq
         Qcjs6js0wEpgblEsgOclds2Z5VpSuX8bL42GIEiS0VVx3aLRAf3CgdL4PV0/KK71JRvk
         C/0g==
X-Gm-Message-State: AGi0PuZLD0rhCRmSnDqz13bKVmtRzKr3aJ3LxBjVrZ5Zo0EswQOa3bYE
        jfO3xuPKbWM5j/85qyviUfMWvfsw1Gp/LvyO9yYVtg==
X-Google-Smtp-Source: APiQypICLLkZsxvRZ82zTGoSs74K9wdNIuuFRe+atFJcMRtKX5SCjZvsA1yTcpkMd0TVPp369IIUO+UGIL/p4xFojtY=
X-Received: by 2002:a54:4f02:: with SMTP id e2mr5845188oiy.10.1587701162614;
 Thu, 23 Apr 2020 21:06:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200421041815.1808-1-john.stultz@linaro.org>
In-Reply-To: <20200421041815.1808-1-john.stultz@linaro.org>
From:   John Stultz <john.stultz@linaro.org>
Date:   Thu, 23 Apr 2020 21:05:52 -0700
Message-ID: <CALAqxLUHLqoYAZRvF1HjHhOJPdztYh9oz=L0kEuYun7y6fBzGA@mail.gmail.com>
Subject: Re: [RESEND x2][PATCH v2] phy: qcom-qusb2: Re add "qcom,sdm845-qusb2-phy"
 compat string
To:     lkml <linux-kernel@vger.kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Doug Anderson <dianders@chromium.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, Apr 20, 2020 at 9:18 PM John Stultz <john.stultz@linaro.org> wrote:
>
> This patch fixes a regression in 5.7-rc1+
>
> In commit 8fe75cd4cddf ("phy: qcom-qusb2: Add generic QUSB2 V2
> PHY support"), the change was made to add "qcom,qusb2-v2-phy"
> as a generic compat string. However the change also removed
> the "qcom,sdm845-qusb2-phy" compat string, which is documented
> in the binding and already in use.
>
> This patch re-adds the "qcom,sdm845-qusb2-phy" compat string
> which allows the driver to continue to work with existing dts
> entries such as found on the db845c.

I hate to be a bother on this, but I'd really like to see this
regression resolved.  This fix missed rc1 and rc2, and it would be a
shame to miss rc3 too.

Do I have the right folks on the cc for this?

thanks
-john

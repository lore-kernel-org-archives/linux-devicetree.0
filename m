Return-Path: <SRS0=ig8w=Y5=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 706CCC17498
	for <linux-devicetree@archiver.kernel.org>; Tue,  5 Nov 2019 14:51:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3F82C217F5
	for <linux-devicetree@archiver.kernel.org>; Tue,  5 Nov 2019 14:51:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H8xdymB0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729162AbfKEOve (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 5 Nov 2019 09:51:34 -0500
Received: from mail-qk1-f195.google.com ([209.85.222.195]:40327 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727889AbfKEOve (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 5 Nov 2019 09:51:34 -0500
Received: by mail-qk1-f195.google.com with SMTP id a18so3701739qkk.7
        for <devicetree@vger.kernel.org>; Tue, 05 Nov 2019 06:51:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uYl0KjrEv9Q2fdLs6NYOjLfGeZFa/Sr+lnmD652MtRI=;
        b=H8xdymB0cGUDXEMvbtbJMAL6qBdhLzrnZTOO1QO8jH9p/3pNXubisYMykQqflatEFB
         tlJEl6YSvQpivAdYzQv/5o18WWVAuuxKYPVgb6AaWDbtp6gXsq5+vynGMJMcCKVnI6nE
         tlFWNf9YyX1oaqyVZD3ifMAoj+JW7qrl9WrMZiXVVgi2vG7JgyihqkHZrizYkxiY/F56
         PbnDYEjHShNf2Fmmq+0q4kMpJhOBklKZKeLHih9j4OxkjVUHS5u65TBHtHlrOgpAXxnn
         iieP+YcBoFVXhYvOoM3y2j3QkVfEv8ag8r3V1IQFX8JijKsKSqEAaQ+wzm5O/PuDI4hb
         bJVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uYl0KjrEv9Q2fdLs6NYOjLfGeZFa/Sr+lnmD652MtRI=;
        b=L/hPMeIhqlkLjVTAFiRA3LlN+EdaVxJz+Zeaxhnkxt+68JUwS82lG9cC+BcuE0InPW
         YjNSMoAGMs5q3XMdz4MgnCsMZ6XXHrtlFwb81F4LZuwpC+B5/TotZg9qruJZv3NwZwLN
         sEXIDF11RjgOHJE2xBI23clKfMZaZygKL4Bpup4dJDARkf4LbzK63ujhrr33xXUeJ6vu
         MqeUkah8lkDaZaIACc7EE1YL8cz4MCIoBHYQaSpoSTn7r+4yQrjO9jAtp5HsEorPtkF7
         ebWoDtiSQ/HSbrWU3JcFVPcVYiua9qgdeyNe2YgIvwRC/Ap2oMs/qkDaWgEEuStGAhMF
         HHtA==
X-Gm-Message-State: APjAAAWVl6Rfh4/YQW+vzftoF5bKo7Mn2iS/C+LT/IuuaL4QtaMwwW3B
        V40+iS9VjYNJJHJgutTJtey5V+9gcuCJsKhLXbt8Og==
X-Google-Smtp-Source: APXvYqzGPmuUNzRcNl4nCWY9qbqLt3ZVffUgLt+cslxAC0qbCCChqf3XGl5+61mPiy+nnDobNSYGuCSIbzsYslFDySQ=
X-Received: by 2002:a37:b6c3:: with SMTP id g186mr5225455qkf.187.1572965493257;
 Tue, 05 Nov 2019 06:51:33 -0800 (PST)
MIME-Version: 1.0
References: <1572610108-1363-1-git-send-email-rkambl@codeaurora.org>
 <1572610108-1363-2-git-send-email-rkambl@codeaurora.org> <5dc09bbb.1c69fb81.196e5.9770@mx.google.com>
In-Reply-To: <5dc09bbb.1c69fb81.196e5.9770@mx.google.com>
From:   Amit Kucheria <amit.kucheria@linaro.org>
Date:   Tue, 5 Nov 2019 20:21:22 +0530
Message-ID: <CAP245DWz7qkS3mGEjRA-EfhGieZtOAbnLsPZCHqSG9DL+NvPcg@mail.gmail.com>
Subject: Re: [PATCH 1/1] arm64: dts: qcom: sc7180: Add device node support for
 TSENS in SC7180
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rajeshwari <rkambl@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        sivaa@codeaurora.org, sanm@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Rajeshwari,

On Tue, Nov 5, 2019 at 3:14 AM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Rajeshwari (2019-11-01 05:08:28)
> > diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > index 07ea393..06ded1d 100644
> > --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > @@ -449,6 +465,508 @@
> >                 };
> >         };
> >
> > +       thermal-zones {
> > +               aoss-0-usr {
> > +                       polling-delay-passive = <0>;
> > +                       polling-delay = <0>;
>
> Can we get real polling delays instead of 0?
>
> > +                       thermal-governor = "user_space";
> > +                       thermal-sensors = <&tsens0 0>;
> > +                       wake-capable-sensor;
>
> What is this property?

Downstream property. If you need this, propose changes to the tsens bindings.

> > +                       trips {
> > +                               active-config0 {
> > +                                       temperature = <125000>;
> > +                                       hysteresis = <1000>;
> > +                                       type = "passive";
> > +                               };
> > +                               reset-mon-cfg {
> > +                                       temperature = <115000>;
> > +                                       hysteresis = <5000>;
> > +                                       type = "passive";
> > +                               };
> > +                       };
> > +               };
> > +
> > +               cpu-0-0-usr {
> > +                       polling-delay-passive = <0>;
> > +                       polling-delay = <0>;
> > +                       thermal-governor = "user_space";
>
> What is this property?

Based on a downstream property that was rejected upstream. Please get rid of it.

Regards,
Amit

Return-Path: <SRS0=8HU2=3X=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36217C3524D
	for <linux-devicetree@archiver.kernel.org>; Mon,  3 Feb 2020 20:48:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0A3ED222D9
	for <linux-devicetree@archiver.kernel.org>; Mon,  3 Feb 2020 20:48:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SCEVhtfb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725372AbgBCUsz (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 3 Feb 2020 15:48:55 -0500
Received: from mail-vk1-f194.google.com ([209.85.221.194]:41702 "EHLO
        mail-vk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726331AbgBCUsz (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 3 Feb 2020 15:48:55 -0500
Received: by mail-vk1-f194.google.com with SMTP id p191so4525361vkf.8
        for <devicetree@vger.kernel.org>; Mon, 03 Feb 2020 12:48:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=d+JwFHbchxJ0gg1my7n1CXaZxr3hxuHVj1YoJC44SlE=;
        b=SCEVhtfbAbnwghXPkv1qNGhfhx7+ObPqKjLQOZh9HGoAf2EoYmD7XqBz5PP5nVTOwt
         Xg77qSn8dKpq9fyJTZ4fb1ysvbU8U7zW7weoRKoHtZ2yFgzJ9Fc4br1YZ49aI0X7k802
         OZYYW2/7BmFempKoaKOmfRN2mU09LOD5o4jC0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d+JwFHbchxJ0gg1my7n1CXaZxr3hxuHVj1YoJC44SlE=;
        b=LI7RXAnUPIxFNIrGHwLzn+/iOPUEgq4tCpRP8ZjMeO24+yrSs2UzjfTaJZb2+UjP2d
         ZDKz8wqIMmDOv2sX80n2w5atVtr+Y6k3bhT4leGSCknsVg3Rw7nU12HaDedwZE/Bwyq8
         +LxGL5bzlE9a9fp0Xc28tYKqHAkvIdVyBkXFr4FidPNKQTk8E4XvADtO+BWBadAbvfCa
         6sx0Hil3GA6MEgQ/CL+aSdeyCXtVlyb8F6vMh2BvCdT5A0PF5Ivs5Kl2KjeP6LuIfVIb
         Gk3gsf54d4Rx/MwVr6Z1l0rcni3VMwiBq7zcWNXDGHWTkjNX8Aiz5QWcCcmURj7rn2hE
         SpFQ==
X-Gm-Message-State: APjAAAVcuVwYWETCE0FCULaOHxkgkK4NrvmDPZt3BNGzauNwtoIkXD6O
        dggJCYrdT978aBM6AoC+w1X9jbdDOSw=
X-Google-Smtp-Source: APXvYqyh1OOhw1SoHqQfj6lCpHzjUAg7Vjz0fFh/Ftts+mDWfM/IgKqz9P1vkMpaZ+eIOhK0hRuLyg==
X-Received: by 2002:ac5:c844:: with SMTP id g4mr14794932vkm.25.1580762933799;
        Mon, 03 Feb 2020 12:48:53 -0800 (PST)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id f17sm6111449uaq.19.2020.02.03.12.48.51
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2020 12:48:52 -0800 (PST)
Received: by mail-ua1-f51.google.com with SMTP id g13so2491901uab.7
        for <devicetree@vger.kernel.org>; Mon, 03 Feb 2020 12:48:51 -0800 (PST)
X-Received: by 2002:ab0:2006:: with SMTP id v6mr14461189uak.22.1580762931322;
 Mon, 03 Feb 2020 12:48:51 -0800 (PST)
MIME-Version: 1.0
References: <20200203183149.73842-1-dianders@chromium.org> <20200203193027.62BD22080D@mail.kernel.org>
 <CAD=FV=X2K-Qr17qXgG1Ng8MpZQogagBqMwWu=D2OpQf+ZskBPw@mail.gmail.com> <20200203200443.GN3948@builder>
In-Reply-To: <20200203200443.GN3948@builder>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 3 Feb 2020 12:48:39 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VQyTHYizfzMwjAaRbmQ4zvFFzdfgGiVkLQU+b+pFVnzg@mail.gmail.com>
Message-ID: <CAD=FV=VQyTHYizfzMwjAaRbmQ4zvFFzdfgGiVkLQU+b+pFVnzg@mail.gmail.com>
Subject: Re: [PATCH v4 00/15] clk: qcom: Fix parenting for dispcc/gpucc/videocc
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, Andy Gross <agross@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Taniya Das <tdas@codeaurora.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Harigovindan P <harigovi@codeaurora.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Matthias Kaehlcke <mka@chromium.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        "Kristian H. Kristensen" <hoegsberg@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

On Mon, Feb 3, 2020 at 12:04 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Mon 03 Feb 11:41 PST 2020, Doug Anderson wrote:
>
> > Hi,
> >
> > On Mon, Feb 3, 2020 at 11:30 AM Stephen Boyd <sboyd@kernel.org> wrote:
> > >
> > > Quoting Douglas Anderson (2020-02-03 10:31:33)
> > > >
> > > >  .../devicetree/bindings/clock/qcom,gpucc.yaml | 72 --------------
> > > >  ...om,dispcc.yaml => qcom,msm8998-gpucc.yaml} | 33 +++----
> > > >  .../bindings/clock/qcom,sc7180-dispcc.yaml    | 84 ++++++++++++++++
> > > >  .../bindings/clock/qcom,sc7180-gpucc.yaml     | 72 ++++++++++++++
> > > >  .../bindings/clock/qcom,sc7180-videocc.yaml   | 63 ++++++++++++
> > > >  .../bindings/clock/qcom,sdm845-dispcc.yaml    | 99 +++++++++++++++++++
> > > >  .../bindings/clock/qcom,sdm845-gpucc.yaml     | 72 ++++++++++++++
> > > >  ...,videocc.yaml => qcom,sdm845-videocc.yaml} | 27 ++---
> > > >  arch/arm64/boot/dts/qcom/sc7180.dtsi          | 47 +++++++++
> > > >  arch/arm64/boot/dts/qcom/sdm845.dtsi          | 28 +++++-
> > >
> > > I don't want to take patches touching dts/qcom/. These aren't necessary
> > > to merge right now, correct? Or at least, they can go via arm-soc tree?
> >
> > Right.  They can go later.
> >
> > Specifically for sdm845 until the sdm845 patches lands the old dts
> > trees will yell about the missing clocks, but it's not like they will
> > compile fail.  Also the bindings themselves will validate fine.
> > There's no other way forward, though, and the old bindings caused
> > similar yells.
> >
>
> Can you please help me parse this, will old DT cause complaints or will
> it fail to boot?

Sorry, let me try to be more clear:

a) Without my series: "make dtbs_check" limited to the bindings files
I'm touching yells.  Examples:

.../msm8998-mtp.dt.yaml: clock-controller@5065000: clock-names:1:
'gpll0_main' was expected

.../sdm845-mtp.dt.yaml: clock-controller@af00000: 'clocks' is a
required property
.../sdm845-mtp.dt.yaml: clock-controller@af00000: 'clock-names' is a
required property

.../sdm845-mtp.dt.yaml: clock-controller@ab00000: 'clocks' is a
required property
.../sdm845-mtp.dt.yaml: clock-controller@ab00000: 'clock-names' is a
required property


b) With just the bindings from my series, "make dtbs_check" yells, but
yells about different things.  The "gpll0_main" one goes away but this
one is new:

.../sdm845-mtp.dt.yaml: clock-controller@5090000: clock-names:0:
'bi_tcxo' was expected
.../sdm845-mtp.dt.yaml: clock-controller@5090000: clock-names: ['xo']
is too short
.../sdm845-mtp.dt.yaml: clock-controller@5090000: clocks: [[26, 0]] is too short


c) With just the "dts" from my series, you'll again get different
yells from "make dtbs_check".  I won't bother listing them, but they
are similar to the above.


d) With everything from my series, the "make dtbs_check" limited to
the bindings files I'm touching is clean.

---

* sdm845's ability to boot is unaffected by this series.  I have
tested booting sdm845 after this series and it's fine.  Since nothing
in this series touches the sdm845 clock drivers (only the bindings and
the dts) that means that the new dts must work with the existing
drivers.  You can land the sdm845 dts any time after Stephen and Rob
are happy with the bindings.

* It should be fine to land the sc7180 dts file without waiting for
the driver change.  The dts here will work with both the
dispcc/gpucc/videocc that's in clk-next and also the one that results
from applying all of my patches.


> > For sc7180 there's no usage of any of these clocks and this adds the
> > first usage, so definitely no problem there.
> >
> > Once you've landed then Bjorn or Andy can pick up the dts.
> >
>
> Do I need to apply these after Stephen picks the driver patches? Or are
> they simply nop until the driver patches lands?

The sdm845 patches are a nop until some future patch changes the Linux
driver to start using them.  I don't know of anyone planning to do
that.  The only real result from an sdm845 perspective will be making
things "more correct" from a dts standpoint and keeping "make
dtbs_check" happier.

The sc7180 patches are OK to land even without the driver.  They're
not a nop and I've actually validated that I can bring the display/gpu
up with them (even without the driver changes) on my downstream
kernel.

---

Sorry it's so confusing.  Happy to try to clarify more if the above is
still too hard to follow.

-Doug

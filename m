Return-Path: <SRS0=7KoJ=ZG=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CAF1C432C3
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 Nov 2019 16:49:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D235F206DC
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 Nov 2019 16:49:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NSKxpFUN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726632AbfKNQtO (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 14 Nov 2019 11:49:14 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:43731 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726628AbfKNQtO (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 14 Nov 2019 11:49:14 -0500
Received: by mail-pf1-f196.google.com with SMTP id 3so4603245pfb.10
        for <devicetree@vger.kernel.org>; Thu, 14 Nov 2019 08:49:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:cc:to:from:subject:user-agent:date;
        bh=Lsw4NM8ilCcLsFEk3WVMlx7LY6dwCnUqw6N4RDhOWYo=;
        b=NSKxpFUN3Ugn9srDVLslcd3E1wLcNJ9OJWAmw1RcOC2DgJVNZW7Xitu3fkRLFV+iTT
         0QNUR4I2eb6VBkCC98XVZDpXS+J7AwrEpA7EHnW5hFiulgFS44mIr8MGatPPHDn3zpuI
         6cCWWx1oNLikmFSv9TuQz7YOp+EPcHHUXrVNw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:cc:to:from:subject
         :user-agent:date;
        bh=Lsw4NM8ilCcLsFEk3WVMlx7LY6dwCnUqw6N4RDhOWYo=;
        b=kDcb8WsBl/wYdSuWMr22INP0ljft6tpHKoGsbUzxqP1hxuJgQbCgyGZILKSkqMkV7e
         w6EaaKJpbgMWQ+KSkLjKVvxo+v4AEEgPTiG/LP3CDseI/MoxxuK0rqkNSJlWlt0mJvaW
         wyeNeVyy/OHm6WyvJTZZwoDR+N8OGHNL4zh82TDh9sNqnQrWQYcUlrXD9x3xXyXLervD
         ZVIGPfC75nEqsZIKtf64oSS0PCLX/bBa4OW/0sstqn/isDLs64bCkqe30MGnwseJiALk
         mcgjKMUvTXvRPFFIGL8lISnfOWBUPzEIxbfcTOOfEo6sUh3gLIozHSmAOnD0xfD52GYa
         /a/w==
X-Gm-Message-State: APjAAAVLOSLhB9R/zG6EajHb3zo06NYM6s5j3hE6383Tl/RFF4HHXv6E
        ujCf+O0Mu2vqaFI3Bmsp8Q5ymg==
X-Google-Smtp-Source: APXvYqxGXLXZNqmiLg6+BlJtaLCbmznDeauL5lts/GdPdVYICcsYus3WdGS3aAfiD9MZzjC4BUUs4Q==
X-Received: by 2002:a62:5258:: with SMTP id g85mr11585671pfb.180.1573750153174;
        Thu, 14 Nov 2019 08:49:13 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id y22sm7199564pfn.6.2019.11.14.08.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2019 08:49:12 -0800 (PST)
Message-ID: <5dcd8588.1c69fb81.2528a.3460@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1565197bda60573937453e95dcafbe68@codeaurora.org>
References: <cover.1571484439.git.saiprakash.ranjan@codeaurora.org> <20191021033220.GG4500@tuxbook-pro> <CAL_JsqLzRRQe8UZCxgXArVNhNry7PgMCthAR2aZNcm6CCEpvDA@mail.gmail.com> <2fbab8bc38be37fba976d34b2f89e720@codeaurora.org> <CAL_Jsq+5p7gQzDfGipNFr1ry-Pc3pDJpcXnAqdX9eo0HLETATQ@mail.gmail.com> <81f57dc623fe8705cea52b5cb2612b32@codeaurora.org> <1565197bda60573937453e95dcafbe68@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-kernel@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>,
        Doug Anderson <dianders@chromium.org>,
        linux-arm-msm-owner@vger.kernel.org
To:     Rob Herring <robh+dt@kernel.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCHv2 0/3] Add LLCC support for SC7180 SoC
User-Agent: alot/0.8.1
Date:   Thu, 14 Nov 2019 08:49:11 -0800
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Sai Prakash Ranjan (2019-11-13 07:00:40)
> Hello Rob,
>=20
> On 2019-10-25 13:24, Sai Prakash Ranjan wrote:
> > On 2019-10-25 04:03, Rob Herring wrote:
> >> On Thu, Oct 24, 2019 at 6:00 AM Sai Prakash Ranjan
> >> <saiprakash.ranjan@codeaurora.org> wrote:
> >>>=20
> >>> Hi Rob,
> >>>=20
> >>> On 2019-10-24 01:19, Rob Herring wrote:
> >>> > On Sun, Oct 20, 2019 at 10:32 PM Bjorn Andersson
> >>> > <bjorn.andersson@linaro.org> wrote:
> >>> >>
> >>> >> On Sat 19 Oct 04:37 PDT 2019, Sai Prakash Ranjan wrote:
> >>> >>
> >>> >> > LLCC behaviour is controlled by the configuration data set
> >>> >> > in the llcc-qcom driver, add the same for SC7180 SoC.
> >>> >> > Also convert the existing bindings to json-schema and add
> >>> >> > the compatible for SC7180 SoC.
> >>> >> >
> >>> >>
> >>> >> Thanks for the patches and thanks for the review Stephen. Series
> >>> >> applied
> >>> >
> >>> > And they break dt_binding_check. Please fix.
> >>> >
> >>>=20
> >>> I did check this and think that the error log from dt_binding_check=20
> >>> is
> >>> not valid because it says cache-level is a required property [1], but
> >>> there is no such property in LLCC bindings.
> >>=20
> >> Then you should point out the issue and not just submit stuff ignoring
> >> it. It has to be resolved one way or another.
> >>=20
> >=20
> > I did not ignore it. When I ran the dt-binding check locally, it did=20
> > not
> > error out and just passed on [1] and it was my bad that I did not check
> > the entire build logs to see if llcc dt binding check had some warning =

> > or
> > not. But this is the usual case where most of us don't look at the=20
> > entire
> > build logs to check if there is a warning or not. We notice if there is=
=20
> > an
> > immediate exit/fail in case of some warning/error. So it would be good =

> > if
> > we fail the dt-binding check build if there is some warning/error or=20
> > atleast
> > provide some option to strict build to fail on warning, maybe there is =

> > already
> > a flag to do this?
> >=20
> > After submitting the patch, I noticed this build failure on
> > patchwork.ozlabs.org and was waiting for your reply.
> >=20
> > [1] https://paste.ubuntu.com/p/jNK8yfVkMG/
> >=20
> >> If you refer to the DT spec[1], cache-level is required. The schema is
> >> just enforcing that now. It's keying off the node name of
> >> 'cache-controller'.
> >>=20
> >=20
> > This is not L2 or L3 cache, this is a system cache (last level cache)=20
> > shared by
> > clients other than just CPU. So I don't know how do we specify=20
> > cache-level for
> > this, let me know if you have some pointers.
> >=20
>=20
> Any ideas on specifying the cache-level for system cache? Does=20
> dt-binding-check
> needs to be updated for this case?
>=20

I don't see how 'cache-level' fits here. Maybe the node name should be
changed to 'system-cache-controller' and then the schema checker can
skip it?


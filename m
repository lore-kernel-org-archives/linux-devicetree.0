Return-Path: <SRS0=rjyW=3U=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC240C2D0DB
	for <linux-devicetree@archiver.kernel.org>; Fri, 31 Jan 2020 21:36:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7CF94214D8
	for <linux-devicetree@archiver.kernel.org>; Fri, 31 Jan 2020 21:36:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UFqfczXo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726163AbgAaVga (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 31 Jan 2020 16:36:30 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:39107 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726154AbgAaVga (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 31 Jan 2020 16:36:30 -0500
Received: by mail-lj1-f194.google.com with SMTP id o15so3055006ljg.6
        for <devicetree@vger.kernel.org>; Fri, 31 Jan 2020 13:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tPp4CE2TXss+Iqg1JyzdT3AoBMysWvmpqcl+5tL7wfM=;
        b=UFqfczXofGowOc/1d9Jw/A37caNSorQt1frX6+nTQmuT76g0i6gIKLAHxwJewlH+l9
         IGrJg1etsGOvaN8ZKYm66P/904XHwcbCr0qT4p1L/wP/MhQZx4Lx2YwF9GmPXZX7vkX8
         LmWpQZH6FkjbDoMHGjw3AvhYWsDQiu2AkMkEWKg/09My08fRFAtuBoC0Y4Yiqb0hq58D
         ARSU1Ey73Bnth/YIGBqVb0PhaihCAKyiUA0BT5uw2qLytabhK57lp2ol8ez5wkamI8C8
         cqwsdkcxkeITkI3xnTKYHrufuq9hjxaoFvqA5+t+X4hkVyM4ZC6Pym69Nsc4ibhT2LTf
         8Rmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tPp4CE2TXss+Iqg1JyzdT3AoBMysWvmpqcl+5tL7wfM=;
        b=oyfL2NGdOXEyJxrKqxkoSYfOmZnQmVf+cbO/CY9X7Lx3vqR7p0oK6/HqKnv02IzVX1
         VExEoiesCqft3T4ixNF75IIr17tKcU5lNWRv0yQJzJO0xUJLSzwq9XUdlqHsJFsdJtPj
         PJF1F2kkJC75FAULZQ/WI2rpug1vGyO2UKgYmzLQs2wijMsCFv9jYfWQZGc8OJU/L4DF
         hS2AGzDcMVB8pR01aDG2vDWiRTDtYyRZSllShmEq0hHHELbJrJC2CkTQQ/4VpeWWXHje
         SiaYnLqN6b8M5bMUGynsZNFZxKP8RlNniDC+lh7jAKXYDXdrTGuoiAjDCx8tcdexr4ta
         PiJQ==
X-Gm-Message-State: APjAAAW7h6KB/SL1qN+PixmJg0Sv/pDEJ+VD6l3RkilMFZWvFctQZkF/
        FyzlrK+jmO0kVUO1+PLI84sZoItU/9I4K32IMsKCew==
X-Google-Smtp-Source: APXvYqyt/2uWbr7uISs4LADoAJ7mFl38eOmZqrUOoScK9Xl/jliht9jHg5OxSyMaVzZ4S/+E8Ii5bMdspbN94RNqBe4=
X-Received: by 2002:a2e:85ce:: with SMTP id h14mr7134662ljj.41.1580506587808;
 Fri, 31 Jan 2020 13:36:27 -0800 (PST)
MIME-Version: 1.0
References: <1578630784-962-1-git-send-email-daidavid1@codeaurora.org> <1578630784-962-4-git-send-email-daidavid1@codeaurora.org>
In-Reply-To: <1578630784-962-4-git-send-email-daidavid1@codeaurora.org>
From:   Evan Green <evgreen@google.com>
Date:   Fri, 31 Jan 2020 13:35:51 -0800
Message-ID: <CAE=gft7GDtQCYy8UqpVRK18eXQLTD8q19=Sfq-iitekQCS1FMA@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] dt-bindings: interconnect: Update Qualcomm SDM845
 DT bindings
To:     David Dai <daidavid1@codeaurora.org>
Cc:     Georgi Djakov <georgi.djakov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, sboyd@kernel.org,
        Lina Iyer <ilina@codeaurora.org>,
        Sean Sweeney <seansw@qti.qualcomm.com>,
        Alex Elder <elder@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Jan 9, 2020 at 8:33 PM David Dai <daidavid1@codeaurora.org> wrote:
>
> Redefine the Network-on-Chip devices to more accurately describe
> the interconnect topology on Qualcomm's SDM845 platform. Each
> interconnect device can communicate with different instances of the
> RPMh hardware which are described as RSCs(Resource State Coordinators).
>
> Signed-off-by: David Dai <daidavid1@codeaurora.org>
> ---
>  .../bindings/interconnect/qcom,sdm845.yaml         | 49 ++++++++++++++++++----
>  1 file changed, 40 insertions(+), 9 deletions(-)
>

This patch doesn't seem to apply cleanly on top of patch 1 because of
whitespace context differences.

I'll use this as an opportunity to plug the "patman" tool, which lives
(weirdly) in the u-boot repository, but is an excellent way to manage
and spin upstream submissions.

-Evan

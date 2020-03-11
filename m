Return-Path: <SRS0=AZXu=44=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A773C0044D
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Mar 2020 23:25:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0397420755
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Mar 2020 23:25:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FDuOKRQ4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731399AbgCKXZp (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 11 Mar 2020 19:25:45 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:33088 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731412AbgCKXZp (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 11 Mar 2020 19:25:45 -0400
Received: by mail-pf1-f194.google.com with SMTP id n7so2242054pfn.0
        for <devicetree@vger.kernel.org>; Wed, 11 Mar 2020 16:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=chyavRIYqqg/mT1hVMLjimyfJ88wTwSB8SQE5bJSCcg=;
        b=FDuOKRQ4jYAowPTrfkqbWPNwLC7ne85VH2TIBW4KS2PmvN2f6LhHAIPRx3ZI8cJWyc
         l4865PDFEMva7cIi8Zt5qHizgX8lFeYT5H30cNNZ8/WeEXOONjMQI4utYiRmU1VIZixr
         QA+8hVzyQYT9CfKVouR7a6z9Bf+kwLRUrAq2g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=chyavRIYqqg/mT1hVMLjimyfJ88wTwSB8SQE5bJSCcg=;
        b=PMGRxrJ93OVOnz8Xe7yNio6LtTyYhIzS9Oi2H7XbPyw0gq6PwNjwMFK2db8XYw5BbG
         lRqfQDY190x6A/ikJVCNe1R75JxVMXSsUfemkulhdw5fwIl4zplLl1/yyEOBNHN4RErs
         uDnC+PcesZSnByDtVLxgf+hSV4gfZnLmTRlbEG/YTy309JhRL1BR+5eWj4JjIC66KDZL
         KBeT8U6n//ntIFwXTx5YyGNTs+i0x0OedybK2BEcqS6B2O6eP5Qf7C/H2w5nQmA1w9N1
         4bz3HXx0zvduNQbRJsjheObxsMCxxQ3hn9y34R6VQK1NoXKWDgGIiV4JO/Lfc1H5LFI8
         RQ7A==
X-Gm-Message-State: ANhLgQ0BaM5WZMaORKRZXrTVdwYCnXbgIYB6V2oFyUTTvgai3b++JQIr
        dGhBfRKZvCro1vLmCVm+cRMG/g==
X-Google-Smtp-Source: ADFU+vv2rgEtd5LEvteUH15nHk8MoZckTyu4sc5oAWNh51o+qVCUk8hdHGfWn2+RI0sNiXgdi5lb8g==
X-Received: by 2002:aa7:92da:: with SMTP id k26mr5126575pfa.139.1583969144060;
        Wed, 11 Mar 2020 16:25:44 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id w128sm50656459pgb.55.2020.03.11.16.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 16:25:43 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200310212728.GQ264362@yoga>
References: <20200310063338.3344582-1-bjorn.andersson@linaro.org> <20200310063338.3344582-3-bjorn.andersson@linaro.org> <158387214232.149997.3935472981193001512@swboyd.mtv.corp.google.com> <20200310212728.GQ264362@yoga>
Subject: Re: [PATCH v4 2/5] remoteproc: qcom: Introduce driver to store pil info in IMEM
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Date:   Wed, 11 Mar 2020 16:25:42 -0700
Message-ID: <158396914211.149997.8114928596665644267@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Bjorn Andersson (2020-03-10 14:27:28)
> On Tue 10 Mar 13:29 PDT 2020, Stephen Boyd wrote:
>=20
> > Why can't we search in DT for the
> > imem node and then find the pil reloc info compatible string on the
> > first call to this library? Then we don't need an API to see if the
> > device has probed yet (qcom_pil_info_available)
>=20
> I think this sounds reasonable.

Great!

>=20
> > and we can just ioremap
> > some region of memory that's carved out for this reason. Forcing
> > everything through the regmap is mostly adding pain.
> >=20
>=20
> My concern here was simply that we'll end up ioremapping various small
> chunks of the imem region 10 (or so) times. But I agree that things
> would be cleaner here.

Alright. I'd like the ioremap() approach. ioremap() will "do the right
thing" and reuse mappings if they're already there and overlap in the
page. So it's OK that the syscon/simple-mfd exists and makes a device,
etc. etc., but we don't need to care about it. We can just ioremap() the
area and not worry that the regmap users may have a mapping to the same
place. This is a dedicated carveout inside IMEM so we're safe from other
meddling users.

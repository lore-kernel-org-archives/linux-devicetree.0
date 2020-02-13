Return-Path: <SRS0=Uhz2=4B=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E149AC352A3
	for <linux-devicetree@archiver.kernel.org>; Thu, 13 Feb 2020 19:34:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C049A218AC
	for <linux-devicetree@archiver.kernel.org>; Thu, 13 Feb 2020 19:34:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Zag+Nocp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728055AbgBMTef (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 13 Feb 2020 14:34:35 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:35746 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728034AbgBMTee (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 13 Feb 2020 14:34:34 -0500
Received: by mail-pl1-f196.google.com with SMTP id g6so2743938plt.2
        for <devicetree@vger.kernel.org>; Thu, 13 Feb 2020 11:34:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=nUfkheJIghMNHD2cw8r6nBFU7H0TResTxkp5eL08reQ=;
        b=Zag+Nocpq/QP1R17TZfcAh/C2ektsQ+tpX9S7VwD9afHkZ7ByCqxRhehsj8DI2vwIk
         UvWmb9MOfA0i7dY42q0MLO5lUtDWZgerO2l4Z9ddHG+8Ot1GLLXpJ6mreXQ9TNkms7ie
         9i8Z4Z2bGQT5zRK0JP18zKHz6+1nelvI5v6Vg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=nUfkheJIghMNHD2cw8r6nBFU7H0TResTxkp5eL08reQ=;
        b=ucMfivVGl3rMQZCyya0Azbxd4lhCg/onl8apZ9LrriwltZTtZ2VlYixnQgct8AJHoB
         JNxFKBIHcjLbkWr/WRsnB0ruTnjgl3mR1FUl8Upl2LJ90UzlS5PBalXq+zlBEuQv2nuf
         Pkz6TeOOTNI835LgzD1FkzFbcOQgIKIknBGFLMztktuXt+s9Yh2qqXftVuAyxunEWW6/
         5A8SSUS9ZklFKudfxFRCU/kTR4CZkJDAf9Kn5zATLAXC7GVOsI2SI46mGi7eIV0l+9xn
         a22EFqqIlsuhhiIbmLL7lN8IvqwSmGnE+rZ2ZMZfRGZ3JC6wWYpBOed39T1Vn0dkvlaU
         V3sg==
X-Gm-Message-State: APjAAAW1sIk1JGLmOh3XLpnWWUXH2WBCYi9OlfCnkT2c9uYpsw7Roam4
        4AuonpTFBDiWcB0+jItTrdq4PQ==
X-Google-Smtp-Source: APXvYqwsaliT2nemofJEfOxRJLQ1xQvumEmxILh1zgJ8lYiPxPy+4CycCbIjCD6iW3hSpAl6MYrKIg==
X-Received: by 2002:a17:90a:8a96:: with SMTP id x22mr6676707pjn.139.1581622472698;
        Thu, 13 Feb 2020 11:34:32 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id z29sm4341344pgc.21.2020.02.13.11.34.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Feb 2020 11:34:31 -0800 (PST)
Date:   Thu, 13 Feb 2020 11:34:30 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Dikshita Agarwal <dikshita@codeaurora.org>,
        linux-media@vger.kernel.org, stanimir.varbanov@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, vgarodia@codeaurora.org
Subject: Re: [PATCH V4 0/4] Enable video on sc7180
Message-ID: <20200213193430.GG50449@google.com>
References: <1579006416-11599-1-git-send-email-dikshita@codeaurora.org>
 <20200203180240.GD3948@builder>
 <20200213185305.GF50449@google.com>
 <20200213192627.GA1455@tuxbook-pro>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200213192627.GA1455@tuxbook-pro>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Feb 13, 2020 at 11:26:27AM -0800, Bjorn Andersson wrote:
> On Thu 13 Feb 10:53 PST 2020, Matthias Kaehlcke wrote:
> 
> > Hi Bjorn,
> > 
> > On Mon, Feb 03, 2020 at 10:02:40AM -0800, Bjorn Andersson wrote:
> > > On Tue 14 Jan 04:53 PST 2020, Dikshita Agarwal wrote:
> > > 
> > > > Hello,
> > > > 
> > > > Changes since v3:
> > > > 
> > > >   - addressed DT and DT schema review comments.
> > > > 
> > > >   - renamed DT schema file.
> > > > 
> > > > v3 can be found at [1].
> > > > These changes depend on patch series [2] - [6].
> > > > 
> > > > Thanks,
> > > > Dikshita
> > > > 
> > > 
> > > Picked up the dts patches for 5.7, with Stan's acks
> > 
> > I can't seem to find the patches in the QCOM repo, neither in
> > 'arm64-for-5.7' nor 'for-next'. Am I looking at the wrong place or
> > maybe you forget to push these?
> > 
> 
> Thanks for the question Matthias, I was looking for this email as I
> rebased onto v5.6-rc1 earlier this week, but got distracted.
> 
> I pulled them in, but in the rebase I realized that we don't have the
> interconnects in place, so in it's current form these patches doesn't
> compile.

Now that you say it, I also stumbled across this at some point ...

> Seems we're waiting for rather trivial respin of
> https://lore.kernel.org/linux-arm-msm/1577782737-32068-1-git-send-email-okukatla@codeaurora.org/
> to get this settled.

Thanks for the clarification!

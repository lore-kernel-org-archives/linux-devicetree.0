Return-Path: <SRS0=C4ig=Y7=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AB62C43331
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 Nov 2019 21:31:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 368E721D7F
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 Nov 2019 21:31:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xs2bqevE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726118AbfKGVb4 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 7 Nov 2019 16:31:56 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:51048 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725870AbfKGVb4 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 7 Nov 2019 16:31:56 -0500
Received: by mail-wm1-f67.google.com with SMTP id l17so3296766wmh.0
        for <devicetree@vger.kernel.org>; Thu, 07 Nov 2019 13:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=hHsW+JRYhrDgl1RAw8hfUItw5fl0jUVBr6z/UEkwzB0=;
        b=Xs2bqevEHRfVM1V+5qFCFDQEEfo/IazXVNudvvz+F4iB6x/RBeo6QO4uwxK/Qanyxb
         QP/hjEVb+ji9jb7Nxyb3oRyMBt9K/OBerjM0dBoIdn4ihonzTJVqq2Dr5zkd1rW4vbk4
         Jw+YI/yZM14yPsxwW8QBIuE27EdkSEB/4kWTVlOdeEHZpiKQ5e0SlBtRO9HgYqrSkgPD
         MjD/ilFj/N3ZwtEDlfsyb/V0M0j9fGJDmme2MdjwCUyNh0Lg33Oz0w7hnspVAcLua0ta
         PlgzWLrAUtEgBmPRaVB1GuYTEPOCai4vd8SjkmmvUwvoh7hf1IakPkldAwl3kv79YQg/
         cqVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=hHsW+JRYhrDgl1RAw8hfUItw5fl0jUVBr6z/UEkwzB0=;
        b=MAbiXtyLBqyu3SvgP8oA5lHtWXp9WdWvuW0WHVh/JxdCEX4rW80YMRWSLbpxL0linv
         vwpf6Ya62YNxhZMeGuTK2OprxfHnDQ4nUgnCPvzd8ts3J+aBJsuLv0CIhXJVWvWoTtIE
         rW2RBY+wv+SQCMna4ZOkvd+gcIzZ7awKLqvAbqcZZn0Xup8wLdYgZi2CErNKQN6NG8Jw
         bFFTT+ccrvJRK3QTn9lpuZHOzTozvvhDsr5YOzR5sd50BBxGF51jwqXBA2CWjRGJ4SQB
         EGx/ZEqvrhPmWYB4uZaHKo2SQmbk2TwWp5lmiMgdmTtFoDEXTj4Tv4gavtOd+ZuT/ONq
         Iy3g==
X-Gm-Message-State: APjAAAWNLmUl+qKF75QYwr0nKT77K3+46CXyN2xb6i5P3p8vzNYSZa9B
        8SMFrII6GZqLbTj+veEBQ8MqvMdlwt4=
X-Google-Smtp-Source: APXvYqyjWb1v2kprZcT+WSTyR+FX54UKTZ42FdNHpkxdMxOMVN8EQOPzg06s5YSWmS9I6W92eGv9Dg==
X-Received: by 2002:a7b:c08c:: with SMTP id r12mr4948782wmh.67.1573162312776;
        Thu, 07 Nov 2019 13:31:52 -0800 (PST)
Received: from dell ([95.147.198.88])
        by smtp.gmail.com with ESMTPSA id j66sm3280860wma.19.2019.11.07.13.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2019 13:31:51 -0800 (PST)
Date:   Thu, 7 Nov 2019 21:31:48 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <mripard@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Add syscon YAML description
Message-ID: <20191107213148.GA18902@dell>
References: <20191101141034.259906-1-maxime@cerno.tech>
 <20191104071554.GK5700@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191104071554.GK5700@dell>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, 04 Nov 2019, Lee Jones wrote:

> On Fri, 01 Nov 2019, Maxime Ripard wrote:
> 
> > The syscon binding is a pretty loose one, with everyone having a bunch of
> > vendor specific compatibles.
> > 
> > In order to start the effort to describe them using YAML, let's create a
> > binding that tolerates additional, not listed, compatibles.
> > 
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > ---
> >  .../devicetree/bindings/mfd/syscon.txt        | 32 --------
> >  .../bindings/misc/allwinner,syscon.txt        | 20 -----
> >  .../devicetree/bindings/misc/syscon.yaml      | 74 +++++++++++++++++++
> 
> Why are you moving this to drivers/misc?

That's a NACK by the way. ;)

> >  3 files changed, 74 insertions(+), 52 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/mfd/syscon.txt
> >  delete mode 100644 Documentation/devicetree/bindings/misc/allwinner,syscon.txt
> >  create mode 100644 Documentation/devicetree/bindings/misc/syscon.yaml
> 

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog

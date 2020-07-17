Return-Path: <SRS0=Xf3c=A4=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42284C433E4
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Jul 2020 14:41:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1FBC322B4D
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Jul 2020 14:41:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q5BxwmUV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726836AbgGQOlF (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 17 Jul 2020 10:41:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726962AbgGQOlE (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 17 Jul 2020 10:41:04 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1E42C0619D3
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2020 07:41:04 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id m9so5489871pfh.0
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2020 07:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=rA+TsQJZMiHTQ0R1Ot7MnJ/9+FZrNTz5ZJI/VTReH+s=;
        b=q5BxwmUVXql0ftAWG2Aj5qT7PgLwLDn8MdXraWBLy2W1Y9qli331A7ylq4xPtRS1ki
         JC0ktlxSE7YzyvxShB14Y1k8uGGm3jEMXt5QZ1ovG5IrI6pgpXg1SErxh/xhZE8yrymP
         oSAjvkXZR49KJgQjFNhA0P6En6DEJ8GChfiHkOXAqJ1c+pvZVFBYpISY3WZNmLFllBog
         SY3lUkXBQ75NoG0h+Ib3dw3PlpjIi/kcYxzP7ySHVZVaMyKekjV2l0KPO6POyH7496GY
         gqXe3RnBeivtmq+Su7DqdnIB+B7rM76JrBDu8Z8POlzltAgs0W4Uz1KAyfyrX8f15UcD
         mtfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=rA+TsQJZMiHTQ0R1Ot7MnJ/9+FZrNTz5ZJI/VTReH+s=;
        b=U6PjOdRVBF2daiQir0hahQipDsqRczJ/GDX2BbnEi+GWiDyJZQiAEF1gVYxNCfupWd
         ThuTUCwFPhJpbafW+bn0aBd11scBgca/Vzt6miFANreRChgs0XAW2o3CKX+uBm6MUFjE
         sVuOAGG90URFnBQZkkMtGkHmsouxPwzEu8VXcwgKcxv2IJ4g9vSN97H+UvX+JZq+JGT6
         OTjKYNxwXfLJnH6DkR0oQukPAihoY+nUFxm/DhbBrEuQEt4aTZcj5MNC7c+bXyTIl71W
         2IlPtIxMGLFlg2cGe1jc67dIzXasXp+0qNv/ciAm1gYUucz5nm5mqxA2EzypmdSRYN5d
         TV8Q==
X-Gm-Message-State: AOAM532khabT7xBiqMqlqGS8Xe16CneKNlKaBIIm0Zoa+bg4XmFSgfoM
        pp1ZT9x/En5uvwtBJDbKcX1i
X-Google-Smtp-Source: ABdhPJwc4uvrqSC2KnCTla14xdgKuaF/d71QbgGedE2EUeW2qH6+RQwS1znUv1XASWeZrkTMK6EgGA==
X-Received: by 2002:a62:86cc:: with SMTP id x195mr8252851pfd.39.1594996864265;
        Fri, 17 Jul 2020 07:41:04 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6382:1ac4:99cf:535d:1e55:97cf])
        by smtp.gmail.com with ESMTPSA id j3sm7594822pfe.102.2020.07.17.07.40.59
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Jul 2020 07:41:03 -0700 (PDT)
Date:   Fri, 17 Jul 2020 20:10:57 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Amit Tomer <amittomer25@gmail.com>
Cc:     Andre Przywara <andre.przywara@arm.com>,
        Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
        Rob Herring <robh+dt@kernel.org>, cristian.ciocaltea@gmail.com,
        linux-kernel@vger.kernel.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-actions@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 10/10] arm64: dts: actions: Add uSD support for
 Cubieboard7
Message-ID: <20200717144056.GB3301@Mani-XPS-13-9360>
References: <1593701576-28580-1-git-send-email-amittomer25@gmail.com>
 <1593701576-28580-11-git-send-email-amittomer25@gmail.com>
 <20200712173044.GL6110@Mani-XPS-13-9360>
 <CABHD4K8+cZMwA=pQx4Gvv5Z4xLof8Ln6fUNrB0=-SS2M_0_3aw@mail.gmail.com>
 <20200713030055.GA2978@Mani-XPS-13-9360>
 <CABHD4K-JdzcNa2YqH2KnVtVQrjoaVp+Y0L6F1jJNm2iN-pJ3=A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABHD4K-JdzcNa2YqH2KnVtVQrjoaVp+Y0L6F1jJNm2iN-pJ3=A@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, Jul 13, 2020 at 02:38:55PM +0530, Amit Tomer wrote:
> Hi,
> 
> > Fixed regulators are used to nicely model the regulators which aren't tied to
> > any PMIC. But for some cases we use them to represent supplies when there is
> > no support for the specific PMIC present in the kernel and they are turned
> > on/configured by the bootloader (this is what happening here).
> >
> > And there is no use of declaring fixed regulators when there is no consumer.
> > Even if you don't define these, the corresponding supplies in the board will
> > always be in the same state configured by the bootloader. So I'd suggest you
> > to remove this for now.
> 
> Checked the schematics and regulator name is the same for both eMMC and uSD

Okay, fine.

> Shall we keep uSD regulator sd_vcc to be consistent across ACTIONS platform?
> 

No. As I said before it depends on the individual board schematics.

Thanks,
Mani

> > Since I don't have the schematics to check, please make sure you name the
> > regulators as mentioned in the schematics (this could vary from board to board,
> > so don't just copy from others).
> >
> 
> Sure, point noted.
> 
> Thanks
> -Amit.

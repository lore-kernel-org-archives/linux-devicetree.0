Return-Path: <SRS0=92uP=7A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E0F2C433DF
	for <linux-devicetree@archiver.kernel.org>; Mon, 18 May 2020 18:36:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 13CC420715
	for <linux-devicetree@archiver.kernel.org>; Mon, 18 May 2020 18:36:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SP6KFNP8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728572AbgERSgh (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 18 May 2020 14:36:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728552AbgERSgg (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 18 May 2020 14:36:36 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1E5AC05BD0B
        for <devicetree@vger.kernel.org>; Mon, 18 May 2020 11:36:36 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id x13so5343644pfn.11
        for <devicetree@vger.kernel.org>; Mon, 18 May 2020 11:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=gvKKfXKVwXyHM5zyQzU2yfD82YJ/ssxteenCSL12PQo=;
        b=SP6KFNP8GBJH4Y0iu8AifmlsrJrIDmqF86ly0zVJjsY9edGxCLOGJgRntsHb0RHjQG
         gATe1S/lNrSEnPx6+nA/9Db0kPWSNByB+aLbETP0I7rvxRd5Pg5ppv5wkwn5hjz58cu/
         /58rWXz8O5y2llnAhz2PnD1PepCOMtPQz0wlcWd4cCLGYB8YoMdMS4KqF902+qJ/GrWu
         rYOlTmXrrdAjjv2aIxMNhSrdaKjlbrB4OS5ce1/H/hEo88g4KjJQ31AE7yroPGtfE9G0
         GSPSNWOTyxVLaXh8veu7K3K0s5sMenbgG1ZDSnf8416Sc5oeIX+1pRsFFZpq8ADiflTg
         Yiqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gvKKfXKVwXyHM5zyQzU2yfD82YJ/ssxteenCSL12PQo=;
        b=ojBMGFxLGn+e5IBnZdVpHF15oxaKhSYmiqzO5gYR+3rrg7MBswgXyakBYJNWjlYoUm
         tHR7f+v3Q4xo/YVmUE2cme+T78ZrQIOfCdBQ1llsBVH6GmymsGJgjcPmEMVvWV5/T0sb
         +FPT/ZJeESHT3KjQ7BdHKxNXoVSaZYvyLqi+ZdO4/WWdrAbLEBNG7ketasE/qua2wG/k
         Zfdet1mv1AjQfKo8Hd4sZ9+4y9iOF2bUgLc78R5BVCgiZb0BlswRA+2HTB/2436vWyLk
         IwzUBQri0P3nq8cmF6MRXMgfgSiyYY8u1n65DMLo3M4wAHeKy1pBC+HOBXLiXMaXAvFi
         QoOg==
X-Gm-Message-State: AOAM532W1UKzdlPPaqiLFu3TeNOaWgSnu7tjR5lgH4FFYHYblXcxiuVy
        hIrIHUjVMxhV7j6uRLXclHmXgQ==
X-Google-Smtp-Source: ABdhPJwzQPbROOk4HuXutlusmWdCXG1o7ldok+fY8PJ23k2eDMM1tiiAiGoPeKkibIa2gifPhE5rpA==
X-Received: by 2002:a65:5186:: with SMTP id h6mr17090119pgq.453.1589826995952;
        Mon, 18 May 2020 11:36:35 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id z1sm209932pjn.43.2020.05.18.11.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 11:36:35 -0700 (PDT)
Date:   Mon, 18 May 2020 11:35:12 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Georgi Djakov <georgi.djakov@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>,
        Chandana Kishori Chiluveru <cchiluve@codeaurora.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v7 2/4] usb: dwc3: qcom: Add interconnect support in dwc3
 driver
Message-ID: <20200518183512.GE2165@builder.lan>
References: <1585718145-29537-1-git-send-email-sanm@codeaurora.org>
 <1585718145-29537-3-git-send-email-sanm@codeaurora.org>
 <878shu4uwk.fsf@kernel.org>
 <875zcy4uuj.fsf@kernel.org>
 <20200514171352.GP4525@google.com>
 <abbc3f8c-c8c9-c189-735e-f8058dab3e40@linaro.org>
 <87tv0h3fpv.fsf@kernel.org>
 <090e48d7-7988-eea1-bf39-f6820578d354@linaro.org>
 <87r1vl3e42.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87r1vl3e42.fsf@kernel.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu 14 May 23:29 PDT 2020, Felipe Balbi wrote:

> 
> Hi,
> 
> Georgi Djakov <georgi.djakov@linaro.org> writes:
> >>>>>> Sandeep Maheswaram <sanm@codeaurora.org> writes:
> >>>>>>> +static int dwc3_qcom_interconnect_init(struct dwc3_qcom *qcom)
> >>>>>>> +{
> >>>>>>> +	struct device *dev = qcom->dev;
> >>>>>>> +	int ret;
> >>>>>>> +
> >>>>>>> +	if (!device_is_bound(&qcom->dwc3->dev))
> >>>>>>> +		return -EPROBE_DEFER;
> >>>>>>
> >>>>>> this breaks allmodconfig. I'm dropping this series from my queue for
> >>>>>> this merge window.
> >>>>>
> >>>>> Sorry, I meant this patch ;-)
> >>>>
> >>>> I guess that's due to INTERCONNECT being a module. There is currently a
> >>>
> >>> I believe it's because of this:
> >>> ERROR: modpost: "device_is_bound" [drivers/usb/dwc3/dwc3-qcom.ko] undefined!
> >>>
> >>>> discussion about this  with Viresh and Georgi in response to another
> >>>> automated build failure. Viresh suggests changing CONFIG_INTERCONNECT
> >>>> from tristate to bool, which seems sensible to me given that interconnect
> >>>> is a core subsystem.
> >>>
> >>> The problem you are talking about would arise when INTERCONNECT=m and
> >>> USB_DWC3_QCOM=y and it definitely exists here and could be triggered with
> >>> randconfig build. So i suggest to squash also the diff below.
> >>>
> >>> Thanks,
> >>> Georgi
> >>>
> >>> ---8<---
> >>> diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
> >>> index 206caa0ea1c6..6661788b1a76 100644
> >>> --- a/drivers/usb/dwc3/Kconfig
> >>> +++ b/drivers/usb/dwc3/Kconfig
> >>> @@ -129,6 +129,7 @@ config USB_DWC3_QCOM
> >>>  	tristate "Qualcomm Platform"
> >>>  	depends on ARCH_QCOM || COMPILE_TEST
> >>>  	depends on EXTCON || !EXTCON
> >>> +	depends on INTERCONNECT || !INTERCONNECT
> >> 
> >> I would prefer to see a patch adding EXPORT_SYMBOL_GPL() to device_is_bound()
> >
> > Agree, but just to clarify, that these are two separate issues that need to
> > be fixed. The device_is_bound() is the first one and USB_DWC3_QCOM=y combined
> > with INTERCONNECT=m is the second one.
> 
> If INTERCONNECT=m, QCOM3 shouldn't be y. I think the following is
> enough:
> 
> 	depends on INTERCONNECT=y || INTERCONNECT=USB_DWC3_QCOM
> 

This misses the case where INTERCONNECT=n and USB_DWC3_QCOM=[ym] which
I don't see a reason for breaking.

But if only INTERCONNECT where a bool, then we don't need to specify a
depends on, because it will either be there, or the stubs will.
We've come to this conclusion in a lot of different frameworks and I
don't see why we should do this differently with INTERCONNECT.

Regards,
Bjorn

Return-Path: <SRS0=ioLT=AU=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 024B8C433E0
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Jul 2020 17:26:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CB3FF20767
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Jul 2020 17:26:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YMK7N//u"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728396AbgGIR0j (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 9 Jul 2020 13:26:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728392AbgGIR0j (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 9 Jul 2020 13:26:39 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2292C08E6DC
        for <devicetree@vger.kernel.org>; Thu,  9 Jul 2020 10:26:38 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id k5so1091284plk.13
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2020 10:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=fAVMof5nNwaeOe0UjH7aEaTqC0vuF4D1qFzyqvlHDMA=;
        b=YMK7N//u1wp3f+ymy0j9gl/3flzcYQz53aZpmqO7VGDdmq6ht7XX5idCJyJybOzq2X
         wdUIBwZUGuUmjCB5FN1/G9/P50YCCgGRi5GVPPimM6uooU4F3iaqi8cS2khxAyJi4hBe
         +WSLxitMer7bbujtrum3loVKkZbxzWSA+DVy4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fAVMof5nNwaeOe0UjH7aEaTqC0vuF4D1qFzyqvlHDMA=;
        b=rA93oS+i8sKY+6en4B7ERKaUCFmfNZV8CeuXOKvepEoJoG5jnCsDKtgmFunDq/h2bN
         bRhpqltDKbi/EXqPRcbBiqEVTAWV6/gj01FIRZ21OBWhtBo/CcUyMZtI0uNC/bxm/7lm
         xyQu72aOuSVPU+Ic7eLupg+QfRBTEJ6YeuAwDJWPKZ0guibIsSqt91xD6ncseKCjO7aT
         ZY7oIagDiBpJkzcjKw6yGrpOuP59hEjVXZRX7RXOvldze/kkAp53Y8dHP7B2g9PddPwN
         1xzAo/22KOgFgt9umUNi+qGPkCjBgiMpgzHV8/pxwiX6NsTO9ohBf/M7YYmnKEoDsELA
         aIOA==
X-Gm-Message-State: AOAM532sNfut/f/q9AS5yQMJX61mSQgWR7tTYYyDn2HJLSKkCwn23pQd
        UQI33x7wEPylGGnr6RFQJEqJoA==
X-Google-Smtp-Source: ABdhPJwzBJkpMTYA6AAa9Z1wDaiyNvhZ2Z/dNzuJcOR6hBmjNBylvIiW3pKrued1/Rg34jcKcwbpTA==
X-Received: by 2002:a17:90a:bb84:: with SMTP id v4mr1232421pjr.162.1594315598390;
        Thu, 09 Jul 2020 10:26:38 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
        by smtp.gmail.com with ESMTPSA id o17sm3096883pjq.6.2020.07.09.10.26.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2020 10:26:37 -0700 (PDT)
Date:   Thu, 9 Jul 2020 10:26:36 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Sandeep Maheswaram <sanm@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>,
        Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
Subject: Re: [PATCH v8 1/2] usb: dwc3: qcom: Add interconnect support in dwc3
 driver
Message-ID: <20200709172636.GL3191083@google.com>
References: <1594310413-14577-1-git-send-email-sanm@codeaurora.org>
 <1594310413-14577-2-git-send-email-sanm@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1594310413-14577-2-git-send-email-sanm@codeaurora.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

inline one more thing I forgot to comment on in my previous mail

On Thu, Jul 09, 2020 at 09:30:11PM +0530, Sandeep Maheswaram wrote:
> Add interconnect support in dwc3-qcom driver to vote for bus
> bandwidth.
> 
> This requires for two different paths - from USB master to
> DDR slave. The other is from APPS master to USB slave.
> 
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> Signed-off-by: Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 127 ++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 125 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 1dfd024..5532988 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
>
> ...
>
> @@ -648,6 +763,11 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  		goto depopulate;
>  	}
>  
> +	qcom->max_speed = usb_get_maximum_speed(&qcom->dwc3->dev);

What if the function returns USB_SPEED_UNKNOWN?

You need a reasonable default value for that case, which I think would be
USB_SPEED_SUPER (i.e. the controller would work properly at super speed,
though the interconnects would consume a bit more power than necessary lower
speed modes).

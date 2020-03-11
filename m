Return-Path: <SRS0=AZXu=44=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9AD8C0044D
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Mar 2020 17:51:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6C49320739
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Mar 2020 17:51:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="eNRE/qbm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730603AbgCKRv5 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 11 Mar 2020 13:51:57 -0400
Received: from mail-pj1-f66.google.com ([209.85.216.66]:37351 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730505AbgCKRv5 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 11 Mar 2020 13:51:57 -0400
Received: by mail-pj1-f66.google.com with SMTP id ca13so1389359pjb.2
        for <devicetree@vger.kernel.org>; Wed, 11 Mar 2020 10:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=a5g25PDEXPRR99KehOK1iE2Gu80HzFKYuNkkikGwIFI=;
        b=eNRE/qbm63stiKXIvgwIlV+IxOrzorOkM4iow7B6RZUpJva1559bRWMvw2agkD7Mis
         2YTH3veSMsgbKxZyscQrguxH0BD1nYGckFuQ/fdaY2NKujUR7G6NuenUZTTOfFuGSGgH
         Qxht0ueO4ugRgmAZGeX2WtSxnNFHitwKoKXgM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=a5g25PDEXPRR99KehOK1iE2Gu80HzFKYuNkkikGwIFI=;
        b=kWUQGriL62k4aGfAwTo65jkxnHQQlkJEB5AqS3wSu0w6DewK8RxMLVY5YIo6RfKTCl
         a6GkkjcJyAXd1uSMYW8Su4fwFhmGtPZ12DaoSrUAl8MycaWFLvNcfxhgAxi/HObDnzgh
         6ZreEv3ptTTakUkWPTx3rR46Frqvbj2JSX/sJvx9iv5tm0yhFRmhaiuCmc4zU9hHssr6
         Ra8+4UOYgn5XjA5Ang7MibUhZ6DZ1g1WOWArMxCiRf0iILetXnx0gbIp3MUcDgrGXaxN
         QyuTIN6x12sC4DjHFPsCzSfLbBS2Xp4pmhVzmxyyzt6ce0ks9wkGg71SZBwKW+F81lNO
         yb6A==
X-Gm-Message-State: ANhLgQ3fHEbc9sNdxYEiQ1lbpbwzMdJepwfGzX7yjHdUPZVjgb9Mpbkm
        DWwpqsT5mAGUa/N6AhWbdgfksw==
X-Google-Smtp-Source: ADFU+vsBi+bUj1VxZCycAe0rgyooLlJtfjkUSx8xr00Nuup+ET1asdfp4FcWsNKm5fSW9KpT0NQn8w==
X-Received: by 2002:a17:902:bc4c:: with SMTP id t12mr3853587plz.54.1583949115991;
        Wed, 11 Mar 2020 10:51:55 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id d3sm5730078pfq.126.2020.03.11.10.51.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2020 10:51:54 -0700 (PDT)
Date:   Wed, 11 Mar 2020 10:51:53 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Sandeep Maheswaram <sanm@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>
Subject: Re: [PATCH v4 4/4] arm64: dts: qcom: sc7180: Correct qmp phy reset
 entries
Message-ID: <20200311175153.GB144492@google.com>
References: <1583928252-21246-1-git-send-email-sanm@codeaurora.org>
 <1583928252-21246-5-git-send-email-sanm@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1583928252-21246-5-git-send-email-sanm@codeaurora.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Sandeep,

This patch landed in Bjorn's tree (arm64-for-5.7 branch). In case you have
to re-spin the series there is no need to include it.

On Wed, Mar 11, 2020 at 05:34:12PM +0530, Sandeep Maheswaram wrote:
> The phy reset entries were incorrect.so swapped them.
> 
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 9d112aa..253274d 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -1306,8 +1306,8 @@
>  				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>;
>  			clock-names = "aux", "cfg_ahb", "ref", "com_aux";
>  
> -			resets = <&gcc GCC_USB3_DP_PHY_PRIM_BCR>,
> -				 <&gcc GCC_USB3_PHY_PRIM_BCR>;
> +			resets = <&gcc GCC_USB3_PHY_PRIM_BCR>,
> +				 <&gcc GCC_USB3_DP_PHY_PRIM_BCR>;
>  			reset-names = "phy", "common";
>  
>  			usb_1_ssphy: phy@88e9200 {
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
> 

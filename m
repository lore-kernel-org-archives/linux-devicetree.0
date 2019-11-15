Return-Path: <SRS0=ud5f=ZH=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB907C432C3
	for <linux-devicetree@archiver.kernel.org>; Fri, 15 Nov 2019 05:04:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B1FF82072B
	for <linux-devicetree@archiver.kernel.org>; Fri, 15 Nov 2019 05:04:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=codeaurora.org header.i=@codeaurora.org header.b="iiYPQpiW";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=codeaurora.org header.i=@codeaurora.org header.b="iiYPQpiW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726961AbfKOFED (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 15 Nov 2019 00:04:03 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:36810 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726308AbfKOFED (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 15 Nov 2019 00:04:03 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id B52AE6106C; Fri, 15 Nov 2019 05:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573794241;
        bh=w1wAr/Z0FnLpEaQzB+EHW09y0AC/Z1vObdEYrGrIxQQ=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=iiYPQpiWypwMsch2ccEPPlhg+Hw/0yiLyCphNQRFDviwcqqH+gQpYU6dC7QXDwxAx
         WCE1dEYfmmcwLk84mviB0E4Dnt604FaOas4nQ3Dxilg0PgYGqW9hKYDHRpfOb8DlHY
         pySWYtaWYNyDBNIOwtVeDZ1UrFRfgpvJ2RxT5PX4=
Received: from [10.206.25.219] (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sanm@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2C99861019;
        Fri, 15 Nov 2019 05:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573794241;
        bh=w1wAr/Z0FnLpEaQzB+EHW09y0AC/Z1vObdEYrGrIxQQ=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=iiYPQpiWypwMsch2ccEPPlhg+Hw/0yiLyCphNQRFDviwcqqH+gQpYU6dC7QXDwxAx
         WCE1dEYfmmcwLk84mviB0E4Dnt604FaOas4nQ3Dxilg0PgYGqW9hKYDHRpfOb8DlHY
         pySWYtaWYNyDBNIOwtVeDZ1UrFRfgpvJ2RxT5PX4=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2C99861019
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=sanm@codeaurora.org
Subject: Re: [PATCH v2 1/1] arm64: dts: qcom: sc7180: Add USB related nodes
To:     Stephen Boyd <swboyd@chromium.org>, Andy Gross <agross@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>
References: <1573733569-25940-1-git-send-email-sanm@codeaurora.org>
 <1573733569-25940-2-git-send-email-sanm@codeaurora.org>
 <5dcd8471.1c69fb81.aee46.634e@mx.google.com>
From:   "Sandeep Maheswaram (Temp)" <sanm@codeaurora.org>
Message-ID: <41a8bbbc-2e85-2c8e-dc1b-fe0283c4390d@codeaurora.org>
Date:   Fri, 15 Nov 2019 10:33:56 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <5dcd8471.1c69fb81.aee46.634e@mx.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


On 11/14/2019 10:14 PM, Stephen Boyd wrote:
> Quoting Sandeep Maheswaram (2019-11-14 04:12:49)
>> Add nodes for DWC3 USB controller, QMP and QUSB PHYs.
>>
>> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
>
> One minor nit below.
>
>> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> index 666e9b9..82f0b3a 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> @@ -911,6 +924,98 @@
>>                          status = "disabled";
>>                  };
>>   
>> +               usb_1_hsphy: phy@88e3000 {
>> +                       compatible = "qcom,sc7180-qusb2-phy";
>> +                       reg = <0 0x088e3000 0 0x400>;
>> +                       status = "disabled";
>> +                       #phy-cells = <0>;
>> +                       clocks = <&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
>> +                                <&rpmhcc RPMH_CXO_CLK>;
>> +                       clock-names = "cfg_ahb","ref";
> Add a space after that comma please.
OK. Will do in next version.
>
>> +                       resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
>> +
>> +                       nvmem-cells = <&qusb2p_hstx_trim>;
>> +               };
>> +

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation


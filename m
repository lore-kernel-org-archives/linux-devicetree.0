Return-Path: <SRS0=rqTW=6V=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DACBC38A2A
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 May 2020 14:15:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2293B2075E
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 May 2020 14:15:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xHLeno1U"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726320AbgEGOPC (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 7 May 2020 10:15:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726616AbgEGOPB (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 7 May 2020 10:15:01 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3734CC05BD09
        for <devicetree@vger.kernel.org>; Thu,  7 May 2020 07:15:01 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id e26so6725622wmk.5
        for <devicetree@vger.kernel.org>; Thu, 07 May 2020 07:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=80yiYsGNxQYgC14+ONNQZJtixdahVRq8sbQRIcGiJ/M=;
        b=xHLeno1U1D2JxSDY0VwysCdednHox1CRK4tqaDgcPjB1kD7dbbbAmNMRHDzfCis+aN
         qGreKXNF5t8LqZouabVyGeeT00XjidmPAP+YDI0fZR5KzvslIabMNssidOk64jxJVwxL
         OFn0fAhk4COiZkmGEEAA/EPeD3wkFyPKGqkVgZMi4h2yMppyDMc+wYe54dGicVV4me5U
         TnvIFjQruEF+PI1IXXj5SVHjhoT3HcsIP8By//uxugZGneacSdqagGSBFj4D8EZOw2zr
         dKuhwy8uiazBmwGnsAsxSZa6YXBT+vDrJuBNrFyeEUm1dOXAIJ9h3krBGLU8LNr6aaLb
         gFEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=80yiYsGNxQYgC14+ONNQZJtixdahVRq8sbQRIcGiJ/M=;
        b=nMCyyiLbwA8XowuqJ0Oy91ozjoWu4SXMGu9iwqZWPozAijomlsAi4SKHGorJeqYiPz
         32FDXW1z609M39dsDI+X7IAmD2RqfaQj62UA93zVx0dDXeFyIqZJIYgoPdkIYowQaXHK
         0iFpn6oowq6xjxPixKnd+8DvN0Y134bnDuWv2S7QlZTYbHzuRJ8xOsBQsvFIgm1klY6g
         kXCeN9eonb0gtDDa7thsBlhciJwP+Z35xzqzf2Kzr7sWGLfVoomSUP1XWjWOZ+F09B2b
         lgodygVYDqyiaVPqyoOUG+YOuiwgVzMqcWVQcciNwetO4I8w7UVNwjW6NC1EKGTKHJmd
         VkZQ==
X-Gm-Message-State: AGi0PuZYsJl8y6J17m11YkjM5TSH+L41fsiZPq0ide8LyST9OPZHlojO
        1TT0PjedU+FJKvU+0c/VHkmgHw==
X-Google-Smtp-Source: APiQypKJnrDI/unFafYYlu8wEGtnza7NvJq/DS7+7kM4NUNsoslVvgL0Zjgb/O8UP2MGzqiINyfcxA==
X-Received: by 2002:a1c:25c4:: with SMTP id l187mr7105670wml.89.1588860899951;
        Thu, 07 May 2020 07:14:59 -0700 (PDT)
Received: from [192.168.0.38] ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id v2sm8653085wrn.21.2020.05.07.07.14.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2020 07:14:59 -0700 (PDT)
Subject: Re: [PATCH 0/1] Add USB role switch to tps6598x
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     heikki.krogerus@linux.intel.com, robh+dt@kernel.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        nikolaus.voss@loewensteinmedical.de, garsilva@embeddedor.com,
        keescook@chromium.org
References: <20200507124556.1774311-1-bryan.odonoghue@linaro.org>
 <20200507134130.GX185537@smile.fi.intel.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Message-ID: <2ad37f99-9e93-8856-f976-5d6be2dcf51c@linaro.org>
Date:   Thu, 7 May 2020 15:15:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200507134130.GX185537@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 07/05/2020 14:41, Andy Shevchenko wrote:
> On Thu, May 07, 2020 at 01:45:55PM +0100, Bryan O'Donoghue wrote:
>> This patch - adds USB role switching to the TI TPS6598x. It has been tested
>> out with a ChipIdea controller inside a Qualcomm MSM8939.
>>
>> Right now you need to have configured the TPS firmware with the TI
>> configuration tool so that the chip knows if it should initiate or accept
>> data and power role swaps.
>>
>> https://www.ti.com/lit/an/slva843a/slva843a.pdf
> 
> Can you include that in the patch under DocLink tag with some background info?
> 

yep, np.

thanks for the reivews

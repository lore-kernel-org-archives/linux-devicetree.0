Return-Path: <SRS0=vVuV=BW=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBB0CC433E0
	for <linux-devicetree@archiver.kernel.org>; Wed, 12 Aug 2020 09:05:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B6045206B2
	for <linux-devicetree@archiver.kernel.org>; Wed, 12 Aug 2020 09:05:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="O5q29GXn"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726255AbgHLJFg (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 12 Aug 2020 05:05:36 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:57977 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726601AbgHLJFe (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 12 Aug 2020 05:05:34 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1597223133; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=iNoMFzi6wivdS43d2jnSYlOQT+G0stMjqpRwc/JfHtg=; b=O5q29GXnzZMQfdJWLdtG3fCaSR3th9848zPe76MUfRhpn6rywM1CAVNUedWE3Y8dMURBYLjB
 2znVZj/F7py5kHadBXcJBiXNkiS98yiVoH9ySor2MW1I3pt1ZlIRHI9zT93X0GAy3PaOfIsb
 xdadXO/YVNvcsoiLtvy3Zgw0suA=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1YmJiNiIsICJkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 5f33b0ce4c787f237b791f79 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 12 Aug 2020 09:05:18
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A205DC43395; Wed, 12 Aug 2020 09:05:18 +0000 (UTC)
Received: from [10.206.24.160] (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sanm)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D234EC433C9;
        Wed, 12 Aug 2020 09:05:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D234EC433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sanm@codeaurora.org
Subject: Re: [PATCH v11 1/2] usb: dwc3: qcom: Add interconnect support in dwc3
 driver
To:     Felipe Balbi <balbi@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>,
        Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
References: <1595869597-26049-1-git-send-email-sanm@codeaurora.org>
 <1595869597-26049-2-git-send-email-sanm@codeaurora.org>
 <20200727192050.GD3191083@google.com>
 <cd5c6c99-d8ee-da59-1abf-e64e5f7f6f8f@codeaurora.org>
 <87v9honyff.fsf@kernel.org>
From:   "Sandeep Maheswaram (Temp)" <sanm@codeaurora.org>
Message-ID: <322d193c-d4d2-789b-ffec-ebdee2730c1e@codeaurora.org>
Date:   Wed, 12 Aug 2020 14:35:11 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <87v9honyff.fsf@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi

On 8/12/2020 12:27 PM, Felipe Balbi wrote:
> "Sandeep Maheswaram (Temp)" <sanm@codeaurora.org> writes:
>
>> Hi Felipe,
>>
>> On 7/28/2020 12:50 AM, Matthias Kaehlcke wrote:
>>> On Mon, Jul 27, 2020 at 10:36:36PM +0530, Sandeep Maheswaram wrote:
>>>> Add interconnect support in dwc3-qcom driver to vote for bus
>>>> bandwidth.
>>>>
>>>> This requires for two different paths - from USB to
>>>> DDR. The other is from APPS to USB.
>>>>
>>>> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
>>>> Signed-off-by: Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
>>> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
>> Please ack if you are ok with this patch.
> What's the plan to get this upstream? Should I take dwc3-qcom patch and
> ignore the rest? Is there a hard-dependency on something else?
Yes take dwc3-qcom patch only,the dt change is already in linux-next.

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation


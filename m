Return-Path: <SRS0=21hy=4I=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62645C11D04
	for <linux-devicetree@archiver.kernel.org>; Thu, 20 Feb 2020 11:19:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 361E1207FD
	for <linux-devicetree@archiver.kernel.org>; Thu, 20 Feb 2020 11:19:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="SjKzBemT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727285AbgBTLS7 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 20 Feb 2020 06:18:59 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:30220 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726882AbgBTLS7 (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Thu, 20 Feb 2020 06:18:59 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1582197538; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=6KJhbm7JPq1+wBTiL3Bw1Lt65SssqbW9iQ7FMNPxTLc=;
 b=SjKzBemTU0b4hicwqjfz6nAMgArskZ1szetrfHqMydxJ6oJwe8Wkr4cIwsBAOKSJmLaF7W9+
 4qnt86B+Al35qRoeNSK+gVf8vNMs2PkToLQDWmW6bnnljnroFzCkE9zHrKWZoeGQOkrzvXcc
 0wBSq6kRr+oqqqYdUSLxdYqNE8c=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1YmJiNiIsICJkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e4e6b22.7fc9a682f8b8-smtp-out-n02;
 Thu, 20 Feb 2020 11:18:58 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id F0729C447A0; Thu, 20 Feb 2020 11:18:56 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 43580C43383;
        Thu, 20 Feb 2020 11:18:56 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 20 Feb 2020 16:48:56 +0530
From:   Sibi Sankar <sibis@codeaurora.org>
To:     Taniya Das <tdas@codeaurora.org>
Cc:     Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh+dt@kernel.org, linux-soc-owner@vger.kernel.org
Subject: Re: [PATCH v4 3/5] dt-bindings: clock: Add YAML schemas for the QCOM
 MSS clock bindings
In-Reply-To: <6298769e-09bc-eb69-bf72-5aedd0e87f16@codeaurora.org>
References: <1582049733-17050-1-git-send-email-tdas@codeaurora.org>
 <1582049733-17050-4-git-send-email-tdas@codeaurora.org>
 <20200218230026.GA3778@bogus>
 <6298769e-09bc-eb69-bf72-5aedd0e87f16@codeaurora.org>
Message-ID: <7cf3950b53a7b5881c840ed371e64158@codeaurora.org>
X-Sender: sibis@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hey Taniya,

+    <&gcc GCC_MSS_NAV_AXIS_CLK>,

error is because of ^^ typo
it should be GCC_MSS_NAV_AXI_CLK
instead, with that dt_bindings
check will go though.

On 2020-02-19 09:35, Taniya Das wrote:
> Hi Rob,
> 
> On 2/19/2020 4:30 AM, Rob Herring wrote:
>> On Tue, 18 Feb 2020 23:45:31 +0530, Taniya Das wrote:
>>> The Modem Subsystem clock provider have a bunch of generic properties
>>> that are needed in a device tree. Add a YAML schemas for those.
>>> 
>>> Signed-off-by: Taniya Das <tdas@codeaurora.org>
>>> ---
>>>   .../devicetree/bindings/clock/qcom,sc7180-mss.yaml | 62 
>>> ++++++++++++++++++++++
>>>   1 file changed, 62 insertions(+)
>>>   create mode 100644 
>>> Documentation/devicetree/bindings/clock/qcom,sc7180-mss.yaml
>>> 
>> 
>> My bot found errors running 'make dt_binding_check' on your patch:
>> 
>> Error: 
>> Documentation/devicetree/bindings/clock/qcom,sc7180-mss.example.dts:21.26-27 
>> syntax error
>> FATAL ERROR: Unable to parse input tree
>> scripts/Makefile.lib:300: recipe for target 
>> 'Documentation/devicetree/bindings/clock/qcom,sc7180-mss.example.dt.yaml' 
>> failed
>> make[1]: *** 
>> [Documentation/devicetree/bindings/clock/qcom,sc7180-mss.example.dt.yaml] 
>> Error 1
>> Makefile:1263: recipe for target 'dt_binding_check' failed
>> make: *** [dt_binding_check] Error 2
>> 
>> See https://patchwork.ozlabs.org/patch/1240251
>> Please check and re-submit.
>> 
> 
> I did see the same issue and then when I re-ordered by patches
> dt-bindings: clock: Add support for Modem clocks in GCC (dependent) on
> this binding patch, I no longer encountered the issue.
> https://patchwork.kernel.org/patch/11389243/
> 
> Please let me know.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.

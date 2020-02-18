Return-Path: <SRS0=1Pza=4G=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01698C34031
	for <linux-devicetree@archiver.kernel.org>; Tue, 18 Feb 2020 21:31:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BD17921D56
	for <linux-devicetree@archiver.kernel.org>; Tue, 18 Feb 2020 21:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1582061475;
	bh=i6ll1SXea6ymq1xZXQDHDtb7qAh1nM0mkG8AAio8yCA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=GCIZHf6aNH0sI1nOfYJdCY7Mcl/kOzoaWCh2L1YiOQB6eKb+LXlHvBWaUpqVJhvyV
	 W7Z3WQ8EMW2vyYeMXGjTGvc1AkdfUZ0H3HeIt+gIIT7wZTCXu+T4NAxgVhYiEt+w2G
	 BqNcKAUUXwh8fki4JV4XbFSOA0hfY0cUFVrdu7D4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727421AbgBRVbP (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 18 Feb 2020 16:31:15 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:33363 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726339AbgBRVbP (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 18 Feb 2020 16:31:15 -0500
Received: by mail-oi1-f195.google.com with SMTP id q81so21711343oig.0;
        Tue, 18 Feb 2020 13:31:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=tGcTfoZxYvClFOWD39xPrEMHMH+Oemu3qPr2N0W7i4w=;
        b=EsPx+chIp3IAvKBTGxVFQg4HDs6Swjpdj6Ko8eNTcz/BznPmj2YP4aC8yc2RQD+Tn3
         Kf3pp0iAQx6lw9GimKfEZK5Awmzg0xunqOFukbqJX9e3qLNmOViUw3+Oa5j3PjoFcqaD
         CeVR/Ak9trtCPtLCY5jVrxh2OFdK93kWO3JaHEXpwB3GgRCNwrS0wx/jXs2tqsBWh/65
         OCuOfHWRZJu0/SP+WMmc87CoH502fXy3JuFGrfREJAm0WSOtJqeR08i0usCE6R9xMrsc
         5M+/7Ky1Z/YI9zDh/XjGsBMNwFYqDyFotYGfk1UdDCKMQOjc6zy5dClO1oXYJ22xuUOd
         WtUw==
X-Gm-Message-State: APjAAAXrCMUUDJRBzB2Al9ak1sST9a7a1kNwBZQ9LhKlAwBL6mKyX04D
        7z92+cGNuThrPxBm2TFzbA==
X-Google-Smtp-Source: APXvYqz/p/FBdkbrHVviTZSphewiNXQxjvTetF21MxLAmpUgXWvPmNbZlkne5jkonL/+9o4UMVyfZw==
X-Received: by 2002:aca:55cc:: with SMTP id j195mr2653176oib.22.1582061474205;
        Tue, 18 Feb 2020 13:31:14 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id p14sm1166065oto.41.2020.02.18.13.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2020 13:31:13 -0800 (PST)
Received: (nullmailer pid 8141 invoked by uid 1000);
        Tue, 18 Feb 2020 21:31:12 -0000
Date:   Tue, 18 Feb 2020 15:31:12 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     robh+dt@kernel.org, georgi.djakov@linaro.org, evgreen@chromium.org,
        bjorn.andersson@linaro.org, agross@kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mark.rutland@arm.com,
        daidavid1@codeaurora.org, saravanak@google.com, mka@chromium.org,
        linux-pm@vger.kernel.org, Odelu Kukatla <okukatla@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>
Subject: Re: [PATCH v3 2/6] dt-bindings: interconnect: Add YAML schemas for
 QCOM bcm-voter
Message-ID: <20200218213112.GA8072@bogus>
References: <20200209183411.17195-1-sibis@codeaurora.org>
 <20200209183411.17195-3-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200209183411.17195-3-sibis@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, 10 Feb 2020 00:04:07 +0530, Sibi Sankar wrote:
> From: David Dai <daidavid1@codeaurora.org>
> 
> Add YAML schemas for interconnect bcm-voters found on QCOM RPMh-based
> SoCs.
> 
> Signed-off-by: David Dai <daidavid1@codeaurora.org>
> Signed-off-by: Odelu Kukatla <okukatla@codeaurora.org>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  .../bindings/interconnect/qcom,bcm-voter.yaml | 45 +++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interconnect/qcom,bcm-voter.yaml
> 

Acked-by: Rob Herring <robh@kernel.org>

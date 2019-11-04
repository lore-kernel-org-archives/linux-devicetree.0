Return-Path: <SRS0=deyM=Y4=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAC39CA9ED3
	for <linux-devicetree@archiver.kernel.org>; Mon,  4 Nov 2019 06:33:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A172421744
	for <linux-devicetree@archiver.kernel.org>; Mon,  4 Nov 2019 06:33:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NCyO1NSR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728274AbfKDGdy (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 4 Nov 2019 01:33:54 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:45656 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726018AbfKDGdy (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 4 Nov 2019 01:33:54 -0500
Received: by mail-pl1-f195.google.com with SMTP id y24so7148590plr.12
        for <devicetree@vger.kernel.org>; Sun, 03 Nov 2019 22:33:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=0Ass+24tFlqpReyltDSt47RFVZA2qHTtO7ep5Q7UfMI=;
        b=NCyO1NSRonSyXrYq7apmUVzU98eR5hMXhQVKS0d78bYAR4p/QBl2QXEIfhKwRjt2a3
         kWrQuROowm5YNAWH0bHCs9aqgzK1Lz0a3F9jPcIrXzw3dqgQXeVvnkInbXbvd8Jgsov5
         bvXcii/iEu/3GRGbpjw9r0bFOotnqtK25rrJiobHz/HXsuEyzJKszhsRvv0Jf6M07tyi
         ffW+iNAKXlZz73Gqj4HWvAuk9r9AByYBv+b9lA6Atz8kE3kiVrLGyzzetdQVtzryAgbc
         26wppNvB/4JxODkCJBFhr79bHSotZEuUYd0D3zSY6Mmbp1gEoAJUOkfvpcif0pHiYVgr
         S5BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=0Ass+24tFlqpReyltDSt47RFVZA2qHTtO7ep5Q7UfMI=;
        b=XU+J0i7QBx1qSumIyNsmt90y0aU3UBwBabuJ/T6zvIdk+IVC/FJJjrErV2XG6QnsE7
         m+9bC8L+6V7qjc9uvFf4NgNKgz4syrl6HMqE4xGA6lIlsOgCtqsr5eJyQE8aD148KO+Z
         7fip+QIWOo7p3b2yhva+RS2TJS47uEECa0miaZStYaqGItl8cjDenyBx0zikEtKrYQI3
         5CrEPyiSgvVYc8MAn4KMFetuqfEt3S66CnI99GZz2Mti4GWlMwIzrpqr7wKVBZC3lwQQ
         mBKvL52U4i0jumGU98POhjQJGC7QriAzYfLZzMbHBtLJpZA0rIiRQs/xaRj69wjBwFcn
         3Ttw==
X-Gm-Message-State: APjAAAViLKJaHoCpWfpAyfgGxUX1kthnUP1DOF/f0L8XRZZwOu51wYa/
        7ZZO3TFIqV4wZdFIU/s9UfgNiw==
X-Google-Smtp-Source: APXvYqwnjPAdlM2I7PhZLkjX2zkNcYt4bFQoZaT9Oqa5uNq88dNgTRo6qncVEj1olQQW+5Ccb6RlFw==
X-Received: by 2002:a17:902:a58c:: with SMTP id az12mr25199923plb.140.1572849231607;
        Sun, 03 Nov 2019 22:33:51 -0800 (PST)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 71sm3788185pfx.107.2019.11.03.22.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2019 22:33:50 -0800 (PST)
Date:   Sun, 3 Nov 2019 22:33:48 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     Matthias Kaehlcke <mka@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>, agross@kernel.org,
        robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Maulik Shah <mkshah@codeaurora.org>
Subject: Re: [PATCH v3 11/11] arm64: dts: qcom: sc7180: Add pdc interrupt
 controller
Message-ID: <20191104063348.GA2464@tuxbook-pro>
References: <20191023090219.15603-1-rnayak@codeaurora.org>
 <20191023090219.15603-12-rnayak@codeaurora.org>
 <5db86de0.1c69fb81.9e27d.0f47@mx.google.com>
 <20191030195021.GC27773@google.com>
 <6610d7fe-5a4d-5a43-5c4f-9ae61e7e53ee@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6610d7fe-5a4d-5a43-5c4f-9ae61e7e53ee@codeaurora.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sun 03 Nov 22:17 PST 2019, Rajendra Nayak wrote:

> 
> 
> On 10/31/2019 1:20 AM, Matthias Kaehlcke wrote:
> > On Tue, Oct 29, 2019 at 09:50:40AM -0700, Stephen Boyd wrote:
> > > Quoting Rajendra Nayak (2019-10-23 02:02:19)
> > > > From: Maulik Shah <mkshah@codeaurora.org>
> > > > 
> > > > Add pdc interrupt controller for sc7180
> > > > 
> > > > Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> > > > Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> > > > ---
> > > > v3:
> > > > Used the qcom,sdm845-pdc compatible for pdc node
> > > 
> > > Everything else isn't doing the weird old compatible thing. Why not just
> > > add the new compatible and update the driver? I guess I'll have to go
> > > read the history.
> > 
> > Marc Zyngier complained  on v2 about the churn from adding compatible
> > strings for identical components, and I kinda see his point.
> > 
> > I agree that using the 'sdm845' compatible string for sc7180 is odd too.
> > Maybe we should introduce SoC independent compatible strings for IP blocks
> > that are shared across multiple SoCs? If differentiation is needed SoC
> > specific strings can be added.
> 
> Sure, I will perhaps add a qcom,pdc SoC independent compatible to avoid
> confusion.
> 

I agree,

compatible = "qcom,sc7180-pdc", "qcom,pdc";

is the way to go.

Reusing qcom,sdm845-pdc would prevent us from tackling any unforeseen
issues/variations/erratas with one or the other platform in the future.

Regards,
Bjorn

> 
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation

Return-Path: <SRS0=6ipe=3L=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B405DC32771
	for <linux-devicetree@archiver.kernel.org>; Wed, 22 Jan 2020 23:09:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7C8DA2465A
	for <linux-devicetree@archiver.kernel.org>; Wed, 22 Jan 2020 23:09:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u0DNfOwo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726181AbgAVXJY (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 22 Jan 2020 18:09:24 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:40175 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726164AbgAVXJX (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 22 Jan 2020 18:09:23 -0500
Received: by mail-pl1-f195.google.com with SMTP id s21so461507plr.7
        for <devicetree@vger.kernel.org>; Wed, 22 Jan 2020 15:09:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=nKS4ZgdlHHnHLUwY8RgxlpKouMlIJtGCSDCXGaIr8ik=;
        b=u0DNfOwoANhlQX2iaeD/Rd1l0fTDY4rKp4scoyXbG98q2ezDtpsrnZotpTkejKufHl
         213geWr0bo/PO/QkXs5pRtXn2ip2IYPuJXb1OlBnJG/6dkuwFvfFcelM/oPNa2rQX9a5
         6kcnY4VZ9X9Ksld/4jx/0Prah4EUh5Cn5r/LMI5xE7VPe/vFWQrqreNjrRmY+f8uFdp/
         iwvhHDsL/nuBiSi6QOdcjq7gG01NwHlIYdenXFTDWv5lAS7lFb+NGjoP3XSRn78at3vV
         a19LK+/DlB2vCPQA99d3CM6LGuAJa1QUyPYJyJw8w2jOEZ25TngUfrOV97VxujoVh8Eb
         ueDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nKS4ZgdlHHnHLUwY8RgxlpKouMlIJtGCSDCXGaIr8ik=;
        b=Tj28Q2MzykY97T1Fdt5469zp+YOpDGt1fRidRpMZKCoBVUuU4vVjXqYSUE7LaFGK0E
         AV1pFyRQo0SoKO3wuvvq4nytUwKreK9eGsD+hm6q79YUJip6ohz1awczcH7c2bWkGYWm
         C165Tvogks07KR8sYUPrBfgiSapZB9x7RbRcCjzPpi7fKYVydawrX9SruddRZMZpVzLu
         A2hBh2FGxIAw0vrOk8GKoXj1FWEJAcn3QH5DRvY6BbMRqM0i7CdvJZNEDs3CBr+a9+W4
         3tNDR0sZhpClgkwug9sXTRyBVpnM6JnugqW4E37hwPt9LfMIaIvnj2dmk/vDZLRlq+By
         m4CA==
X-Gm-Message-State: APjAAAWVugYb28hTes0xhYkmAHEMDaVrhKJ5PM+79fspHYIX0BpWEX/j
        9eV+HNWPbvG0//FlrJzT5qwj1g==
X-Google-Smtp-Source: APXvYqyBFXtJqp1jOWq2KNpdMpTmjOylVfH3v84i0J511zxYJkbS9tWibL8rKRyReKS3P6Lcs4fWfw==
X-Received: by 2002:a17:902:704b:: with SMTP id h11mr13773573plt.147.1579734563159;
        Wed, 22 Jan 2020 15:09:23 -0800 (PST)
Received: from ripper (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id g18sm14101pfi.80.2020.01.22.15.09.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2020 15:09:22 -0800 (PST)
Date:   Wed, 22 Jan 2020 15:08:49 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     rishabhb@codeaurora.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Sibi Sankar <sibis@codeaurora.org>
Subject: Re: [PATCH v2 2/8] remoteproc: qcom: Introduce driver to store pil
 info in IMEM
Message-ID: <20200122230849.GC3261042@ripper>
References: <20191227053215.423811-1-bjorn.andersson@linaro.org>
 <20191227053215.423811-3-bjorn.andersson@linaro.org>
 <60c10082ba90fbba0f056df8575d205f@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <60c10082ba90fbba0f056df8575d205f@codeaurora.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed 22 Jan 14:56 PST 2020, rishabhb@codeaurora.org wrote:
> On 2019-12-26 21:32, Bjorn Andersson wrote:
> > diff --git a/drivers/remoteproc/qcom_pil_info.c
[..]
> > +static int pil_reloc_probe(struct platform_device *pdev)
> > +{
> > +	struct pil_reloc *reloc;
> > +
> > +	reloc = devm_kzalloc(&pdev->dev, sizeof(*reloc), GFP_KERNEL);
> > +	if (!reloc)
> > +		return -ENOMEM;
> > +
> > +	reloc->dev = &pdev->dev;
> > +	reloc->map = syscon_node_to_regmap(pdev->dev.parent->of_node);
> If there are multiple entries like "pil-reloc" in the imem node
> mapping the entire imem multiple times may not work. Is there a way
> we can somehow just iomap the required region for pil?

With the entire imem being represented as a syscon this will be
ioremapped once and all callers of syscon_node_to_regmap() (or one of
the other syscon getters) will get a regmap back that reference this one
mapping.

So doing it this way allow us to "map" sections of imem that is smaller
than PAGE_SIZE.


That said, it means that all imem users/clients should access imem
through this syscon regmap.

Regards,
Bjorn

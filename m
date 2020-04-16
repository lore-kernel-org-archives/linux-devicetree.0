Return-Path: <SRS0=e4CZ=6A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58085C2BA2B
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Apr 2020 07:17:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 326DC206D5
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Apr 2020 07:17:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LJXSpv4K"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439037AbgDPHRk (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 16 Apr 2020 03:17:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2437060AbgDPHRi (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Thu, 16 Apr 2020 03:17:38 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF1EFC061A0C
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2020 00:17:36 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id a25so3598837wrd.0
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2020 00:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=wxbpA+gkMQzP49NMDgYKzmcFDKrFFfhXbq9DHHrnuNU=;
        b=LJXSpv4KpEVnkUH8WFCBWBaib2J9uL1w43yQ2BA7ThHLLvSV9NKeh+SoX9WTHLiwa5
         1sM9bpENrVAgMyEhNzNSWe7bv2T6VIXjXtdYhTWj+pnD2UauH6Sb9D8y3bGXpUGP6Adr
         611auVtBf5IclwqCjtLvu+19UUYwIl25KMATsGFHrae8OzX7tsUtofGOt6Mxa2Y8QGSb
         jXPsXYtGRIpObdQMxjwBmi/XSQWjfsBiOnRJbDxONdfeEnSoEEIYCIiXObkBNtrZ+80D
         ddVaftTGpbpJpfqCEq8P5gjYLFFSUW6PkWzaeyBKQFplWqRAzX45rXPwTv4Be3UNu4Bc
         Whag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=wxbpA+gkMQzP49NMDgYKzmcFDKrFFfhXbq9DHHrnuNU=;
        b=mvaF0pNwepI/fHmcECPz5w2pwsvO6BvZYz2BJE3fTSAyLGNvekv1lj1fhivBEdRx8+
         noarjcwDMX6TQpND5fgWryPUJ9W91MbhUuq1qC6a2LhvdC/2IVnFAePQdPX1cG+c/M0u
         /OjZzAKQMHo9MEIvV0oZr+nzyEyufOS+2dSJwQwNTFUPkqq1oynCgAieCwJXxLDI3qdI
         B8tbhOa8mAU/pwgJHFm0g1QJJ3JsemTkqp4v35U2FVU0woft1CWTMU6MQkHNnfYEUkmi
         FSqQRZgCTehOTRXtXXio7OGIQ+HbscWS40gw+L3E3KDWdjj3qMlH027wTTJvUEcs/Jbk
         zLuA==
X-Gm-Message-State: AGi0PuZR+5l0tFE1sawQSvitbaDjZzQBugPZFTiiS1277bAJ+0OCKwOA
        +5L0HzFY42mtfrti3INAzebCRg==
X-Google-Smtp-Source: APiQypJZ6oLLqIKvsbJo/X2R5PGU1Kjo53h8hr94MPus2CWNL1NzO6VzQpwajJvKPdifJbTZsraJOg==
X-Received: by 2002:a05:6000:192:: with SMTP id p18mr34168071wrx.398.1587021455171;
        Thu, 16 Apr 2020 00:17:35 -0700 (PDT)
Received: from dell ([95.149.164.124])
        by smtp.gmail.com with ESMTPSA id h1sm2565341wme.42.2020.04.16.00.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2020 00:17:34 -0700 (PDT)
Date:   Thu, 16 Apr 2020 08:18:35 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Dilip Kota <eswara.kota@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        kishon@ti.com, robh@kernel.org, andriy.shevchenko@intel.com,
        cheol.yong.kim@intel.com, chuanhua.lei@linux.intel.com,
        qi-ming.wu@intel.com, yixin.zhu@intel.com
Subject: Re: [PATCH v5 1/4] mfd: syscon: Add fwnode_to_regmap
Message-ID: <20200416071835.GR2167633@dell>
References: <cover.1585103753.git.eswara.kota@linux.intel.com>
 <9953bb25281397553cb87b09d641c968d8432dd9.1585103753.git.eswara.kota@linux.intel.com>
 <20200415093116.GH2167633@dell>
 <0adafade-7228-58d3-3db0-b06325712468@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0adafade-7228-58d3-3db0-b06325712468@linux.intel.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, 16 Apr 2020, Dilip Kota wrote:

> 
> On 4/15/2020 5:31 PM, Lee Jones wrote:
> > On Wed, 25 Mar 2020, Dilip Kota wrote:
> > 
> > > Traverse regmap handle entry from firmware node handle.
> > > 
> > > Signed-off-by: Dilip Kota <eswara.kota@linux.intel.com>
> > > ---
> > > Changes on v5:
> > >    No changes
> > > 
> > > Changes on v4:
> > >    No changes
> > > 
> > >   drivers/mfd/syscon.c       | 8 ++++++++
> > >   include/linux/mfd/syscon.h | 6 ++++++
> > >   2 files changed, 14 insertions(+)
> > I think you'll find it very difficult to have a patch merged if you do
> > not send it to any Maintainers of the associated subsystem(s).
> Sorry, i completely missed adding the system configuration Maintainers. I
> was completely thinking about the PHY driver( in doing changes and upgrades)
> while sending the patches.
> I have noticed it, and already sent v6 patch series by adding you and
> arnd@arndb.de
> 
> "[RESEND PATCH v6 0/4] Add Intel ComboPhy driver"
> Snippet from the mail.
> 
> "Re-sending the patches v6 by adding the system configuration Maintainers,
> which i missed to add them."

I have it now.  Thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog

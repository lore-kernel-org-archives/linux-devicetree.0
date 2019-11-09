Return-Path: <SRS0=1yYv=ZB=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF4A4C17442
	for <linux-devicetree@archiver.kernel.org>; Sat,  9 Nov 2019 01:57:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 94B69215EA
	for <linux-devicetree@archiver.kernel.org>; Sat,  9 Nov 2019 01:57:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vw1HQQNk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726289AbfKIB5n (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 8 Nov 2019 20:57:43 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:34864 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725884AbfKIB5m (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 8 Nov 2019 20:57:42 -0500
Received: by mail-pl1-f193.google.com with SMTP id s10so5112438plp.2
        for <devicetree@vger.kernel.org>; Fri, 08 Nov 2019 17:57:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=wABmcIUMWqa+dvchqrcCmAVK5Fqcc0dVO4cUH6ycLOw=;
        b=vw1HQQNkKqAAL/e97In4V441WtCpDoo1dWsCAtylvAvld0m4gl3WvhUMz57VkU7MD6
         INXsxbXWV/nhZjUCMMHB6HDODS7AQiB8BVFwCXw78O6yHRsam7S3keYN36wSoXYMcBVx
         JWlkcx+NYX8U4fP22eBC8A8PcPrhkY0gREssaqwsfGqE1edZ+MZY5hxDeceYqZGUT7YC
         WZMxUjlNyH6YPlgAMGsn7d6dAdwueervyw/tH6go2EtHqaNsr/wr0F9M5EYjMng466ng
         5qzk89NywTn+L1AxJ36H4WrU6c3+dviIpEBv20Ni2JDuFx1hl5P2L4rvTX/jWmCBUnwe
         rHzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wABmcIUMWqa+dvchqrcCmAVK5Fqcc0dVO4cUH6ycLOw=;
        b=XpBBbhEYhZPSB5La/5X+3oZlOSqMRhMX3cOZp1FP2RLL6WvpUSa1dXkErYEdJqUKYN
         d0s9+/3F94OZx3C/wbdo57winNxYu3mXS+JK/u0PrIx953MnurE9gCXXy4lbxDP4A5tf
         wZS9C/FgW/AtfA9sMf+x2oJw+NzqO7hNKm7WZw3LmD0jAW0f6Qz7REyaVIuBDoJRVtaJ
         yZ1Sf7moQ6lkBaOg88vd+rlOPIzvGtGhdeXwSth31+wHSWIeBETKce4rHT6H44tfO3XX
         bN/dOIgSEMr22oToam/2Vv6h13YztavZBBgYvu4M0NMpZLfci6PN6aWJKnwGctrk53Gm
         PBqA==
X-Gm-Message-State: APjAAAV1L5X60Shi0y8k8nTjCCJ+dsqBRp+7fYJFVZ67ApSdf5CXixp2
        UwVy7VR4aVztvCtsFEtGg3k5aw==
X-Google-Smtp-Source: APXvYqxpl+7pNkv2HTiAT0aIk1CC1Hfq/h+HZM4z6Q14XJeWhCwfLOpTT/n1edlNqbWV9FMcx9ta8g==
X-Received: by 2002:a17:902:7793:: with SMTP id o19mr14249657pll.335.1573264660540;
        Fri, 08 Nov 2019 17:57:40 -0800 (PST)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id z62sm10131303pfz.135.2019.11.08.17.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2019 17:57:39 -0800 (PST)
Date:   Fri, 8 Nov 2019 17:57:37 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Brian Masney <masneyb@onstation.org>
Cc:     georgi.djakov@linaro.org, agross@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/4] ARM: qcom_defconfig: add msm8974 interconnect
 support
Message-ID: <20191109015737.GB5592@tuxbook-pro>
References: <20191024103140.10077-1-masneyb@onstation.org>
 <20191024103140.10077-2-masneyb@onstation.org>
 <20191109004310.GA4494@onstation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191109004310.GA4494@onstation.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri 08 Nov 16:43 PST 2019, Brian Masney wrote:

> On Thu, Oct 24, 2019 at 06:31:37AM -0400, Brian Masney wrote:
> > Add interconnect support for msm8974-based SoCs in order to support the
> > GPU on this platform.
> > 
> > Signed-off-by: Brian Masney <masneyb@onstation.org>
> > ---
> > Changes since v1:
> > - Set CONFIG_INTERCONNECT=y since its now a bool instead of a tristate
> > 
> >  arch/arm/configs/qcom_defconfig | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/arch/arm/configs/qcom_defconfig b/arch/arm/configs/qcom_defconfig
> > index 9792dd0aae0c..cbe4e1d86f9a 100644
> > --- a/arch/arm/configs/qcom_defconfig
> > +++ b/arch/arm/configs/qcom_defconfig
> > @@ -252,6 +252,9 @@ CONFIG_PHY_QCOM_IPQ806X_SATA=y
> >  CONFIG_PHY_QCOM_USB_HS=y
> >  CONFIG_PHY_QCOM_USB_HSIC=y
> >  CONFIG_QCOM_QFPROM=y
> > +CONFIG_INTERCONNECT=y
> > +CONFIG_INTERCONNECT_QCOM=y
> > +CONFIG_INTERCONNECT_QCOM_MSM8974=m
> >  CONFIG_EXT2_FS=y
> >  CONFIG_EXT2_FS_XATTR=y
> >  CONFIG_EXT3_FS=y
> 
> Georgi: Since Greg wants to allow compiling the interconnect support as
> a module [1], should I change CONFIG_INTERCONNECT to be a module? Or
> leave this as is? The GPU works fine with interconnect as a module on my
> phone. I know it's more for the cpufreq case.
> 

This is the qcom_defconfig file, so it's fine to leave it =y. For the
multi-platform ones we should do the specific drivers =m, where
possible.

> [1] https://lore.kernel.org/lkml/20191107142111.GB109902@kroah.com/
> 

Thanks for the pointer, I don't think this is a good idea and did reply.

> Andy/Bjorn: This series didn't get picked up for this upcoming merge
> window. If it's too late for this window (which is fine), then I'll
> hold off on resubmitting this until rc4 since I'll most likely have
> more device tree changes by then.
> 

Sorry for missing it in the final preparation for v5.5.

I don't see anything among these patches that would require you to
repost the series, either we pick them up for another PR (although it's
rather late now) or we'll apply them as -rc1 lands (for v5.6).

Regards,
Bjorn

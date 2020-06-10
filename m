Return-Path: <SRS0=7bfi=7X=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7486C433DF
	for <linux-devicetree@archiver.kernel.org>; Wed, 10 Jun 2020 20:20:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 738CE206F7
	for <linux-devicetree@archiver.kernel.org>; Wed, 10 Jun 2020 20:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1591820425;
	bh=zUv+l6eCuUka+t0W+/cq8TDwEtZ/VpuvX+Ir/0vilz0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=n/cXmDSmowaRAGCNIXeGutSwGXf676m1VSUP7jaQmPc6q/Nsj4Hn669gPZwPdWxzP
	 xvg3Ig3wLg68Yye0RtsRSZiEa4PdJn32SYrvoEStvX6/Kxfp+TLwx8INDrNE2CzyMO
	 pDUe2+gZXpgpfqLfcvuUXFAZK6EmTVRnxDQVzD+E=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726293AbgFJUUW (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 10 Jun 2020 16:20:22 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:34268 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726081AbgFJUUV (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 10 Jun 2020 16:20:21 -0400
Received: by mail-io1-f67.google.com with SMTP id m81so3832893ioa.1;
        Wed, 10 Jun 2020 13:20:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tl8LETKmS+P6kESj029xJGHxTqRp5D9lmw9Z1M3J9vU=;
        b=DrfUH3zYO2X4WaBnNtd7+2SGFw03niiSjySGOfb6RQJWswHhjRy6lEdiqAMnXOkIQ/
         /a+nks3Trd7K1fiXkIZp8xtRvVnbmaNgXq2eRrDOS6BaBN/U12kRHWJIIumNCjFtg1x0
         o/MnXw0xK59Nc73xoeI7bxzpsEU752Jg9GLVJXdMT8ZbcAEfRwoznG4k1N/VeGEWJFmn
         EtbnzmTBgcNK1N4YOZaymW7u2C4pU5BZXJteMawGs3TmoMTnHBT3XmcPcWQImRDpoemP
         gf2kIPwIRPtpjH96us9xyDwYgSoJC8Bc96POmQunWLqtxQ5/ADXoMXXNF2JBnp80iJLE
         arDg==
X-Gm-Message-State: AOAM533KEtyNOLMCxR+1wxlUteoNPobLe+CSA/KEjW1V6/9SE6F/sPvP
        UEx2J4pr4WRRQ5Loyd0p9Q==
X-Google-Smtp-Source: ABdhPJwf363QrAeSH44mRLwoy+rufj4TKAIbsyKss64pemnd+VDJVxMcmbKNnoWonDT8GTc5XdYa1w==
X-Received: by 2002:a05:6638:35d:: with SMTP id x29mr4726694jap.71.1591820420247;
        Wed, 10 Jun 2020 13:20:20 -0700 (PDT)
Received: from xps15 ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id k126sm423901iof.50.2020.06.10.13.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 13:20:19 -0700 (PDT)
Received: (nullmailer pid 3646187 invoked by uid 1000);
        Wed, 10 Jun 2020 20:20:18 -0000
Date:   Wed, 10 Jun 2020 14:20:18 -0600
From:   Rob Herring <robh@kernel.org>
To:     Shengjiu Wang <shengjiu.wang@nxp.com>
Cc:     ckeepax@opensource.cirrus.com, patches@opensource.cirrus.com,
        perex@perex.cz, alsa-devel@alsa-project.org, info@metux.net,
        broonie@kernel.org, tiwai@suse.com, allison@lohutok.net,
        tglx@linutronix.de, lgirdwood@gmail.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ASoC: bindings: wm8960: Add property for headphone
 detection
Message-ID: <20200610202018.GA3646134@bogus>
References: <1591180013-12416-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1591180013-12416-1-git-send-email-shengjiu.wang@nxp.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, 03 Jun 2020 18:26:52 +0800, Shengjiu Wang wrote:
> Add two properties for headphone detection.
> 
> wlf,hp-cfg: A list of headphone jack detect configuration register values
> wlf,gpio-cfg: A list of GPIO configuration register values
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  Documentation/devicetree/bindings/sound/wm8960.txt | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

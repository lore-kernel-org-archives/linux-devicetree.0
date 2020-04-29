Return-Path: <SRS0=VloT=6N=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A74C5C83000
	for <linux-devicetree@archiver.kernel.org>; Wed, 29 Apr 2020 21:37:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7C9E120BED
	for <linux-devicetree@archiver.kernel.org>; Wed, 29 Apr 2020 21:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1588196222;
	bh=PLLnGZEtUcmcIki8AgyErHiweZRULTDAyReBVYOJ550=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=JHfcj/Z2LjEr5kQkZYwBKcHFriZlll7zhTVQ973FNNjKUBRSaLHpEtH3auk9W2RJQ
	 XJPaIYa7pMRYKngjXhBfTylLyFxMvSwcV2mOfgvJdNl/owogbsZO61zoU66VCpu7K3
	 CoN7FE9vdeRVooVEF9pLD8X1pPPc6QtQkkFHSRmY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726852AbgD2VhC (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 29 Apr 2020 17:37:02 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:33166 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726554AbgD2VhB (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 29 Apr 2020 17:37:01 -0400
Received: by mail-ot1-f68.google.com with SMTP id j26so3102363ots.0
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2020 14:37:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=WBs097QRcMaB96mTIfk9aSICQXe9iSUV0NFsgPGO5Ho=;
        b=p8FofVdwqf+xK8KDanO1rVDRWJIpB4+/Dc7ExUfsTkQF6zDAm8YAkvIaQUQuJm2kS8
         J92zpMhZGKpU3ewDZeIT4BzpCkIN3kYCCXL15+A2n0QCpcLiF2PhoJNVY99pkRt+Z/Lh
         bRxWX5fFYJbl3TxRJEZKg4n1aZKNFQWKeenQh7Wo0RsU9iWUvLovL3zt1BzlFQSr0oR5
         lJlNA1dYa3GFEWSCXjQLgkIlvu0TxhwwapfdkQdUN+56La4RxDvcVDhBAUVpQpLbelRn
         B/UwkYdTA6wXHS2tHIdwqW/cANL4t5PiG5ynvlQI4SX+JgHMvtrRqc/rlMnQotDY28IA
         nX2g==
X-Gm-Message-State: AGi0PubZh8VTkqmOGfiTpUMc6p0frv5kww0GbvO+f0tZSY4uydcyzeWz
        5IPger0j0rWWY7O2Mbr65w==
X-Google-Smtp-Source: APiQypKK9UxJhS/WzpSBBM/RSMfnkutAau5MtusHmsnbdXLdy5YbeJuMpvmW/+iyT9GLgpjbcuXT0Q==
X-Received: by 2002:a9d:7418:: with SMTP id n24mr52296otk.54.1588196220739;
        Wed, 29 Apr 2020 14:37:00 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id t13sm801792ooo.1.2020.04.29.14.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2020 14:37:00 -0700 (PDT)
Received: (nullmailer pid 9089 invoked by uid 1000);
        Wed, 29 Apr 2020 21:36:59 -0000
Date:   Wed, 29 Apr 2020 16:36:59 -0500
From:   Rob Herring <robh@kernel.org>
To:     Michael Tretter <m.tretter@pengutronix.de>
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Rohit Visavalia <rohit.visavalia@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Dhaval Shah <dshah@xilinx.com>, kernel@pengutronix.de,
        Michael Tretter <m.tretter@pengutronix.de>
Subject: Re: [PATCH v3 4/6] dt-bindings: soc: xlnx: extract xlnx,vcu-settings
 to separate binding
Message-ID: <20200429213659.GA9051@bogus>
References: <20200417070526.7178-1-m.tretter@pengutronix.de>
 <20200417070526.7178-5-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200417070526.7178-5-m.tretter@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, 17 Apr 2020 09:05:24 +0200, Michael Tretter wrote:
> The xlnx,vcu binding comprises two adjacent register banks:
> 
> The first register bank ("vcu_slcr") contains registers for setting the
> clocks of the vcu and controlling the performance monitors. The second
> bank ("logicoreip") contains the configuration settings of the video codec
> unit, which are set before synthesizing the bitstream.
> 
> Drivers that drive the actual video codec unit need to to read the
> registers from the logicoreip register bank for configuring the vcu
> firmware.
> 
> As logicoreip is a too generic name for this register bank, use
> "vcu-settings" as a binding name, because the register bank basically
> provides the configuration settings of the VCU.
> 
> Therefore, add the vcu-settings binding to provide a syscon interface
> for other drivers to read these registers.
> 
> The alternative would have been to merge the two register banks of the
> xlnx,vcu binding into one register bank and make xlnx,vcu provide a
> syscon interface, but that would lead to more incompatibility than
> making second register bank of xlnx,vcu optional.
> 
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> ---
> Changelog:
> 
> v2 -> v3:
> - none
> 
> v1 -> v2:
> - drop custom select for syscon
> ---
>  .../soc/xilinx/xlnx,vcu-settings.yaml         | 34 +++++++++++++++++++
>  .../bindings/soc/xilinx/xlnx,vcu.txt          |  9 ++---
>  2 files changed, 36 insertions(+), 7 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/soc/xilinx/xlnx,vcu-settings.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

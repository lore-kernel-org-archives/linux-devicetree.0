Return-Path: <SRS0=aO3b=7J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7860C433DF
	for <linux-devicetree@archiver.kernel.org>; Wed, 27 May 2020 17:47:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8626A20663
	for <linux-devicetree@archiver.kernel.org>; Wed, 27 May 2020 17:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1590601677;
	bh=rSaJJZXTFSQo5V8SYqelQDcIOgr53WZjyRZI3TXtzSo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=w64RldfCRcmFnkSXKx23kG/L501S0L4d+99wi41CHT3tbTW8s0rxS879r/0MaYbwh
	 hsE5i1s2pbCGPxHfCdZVAF+bLjCg0CcpGTiqXOmug/+4D9h9zh3Z5cp/3xjb60iFj9
	 rjLKk9rNAoAKkuSjEJ02suxGlsaMOxyoLbjAG+yg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391538AbgE0Rr5 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 27 May 2020 13:47:57 -0400
Received: from mail-il1-f196.google.com ([209.85.166.196]:41322 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387924AbgE0Rr4 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 27 May 2020 13:47:56 -0400
Received: by mail-il1-f196.google.com with SMTP id d1so2432761ila.8;
        Wed, 27 May 2020 10:47:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IRFVL6+5bKwj2i/4vQTFTXAfMw+OfdS62EpNoSmSV3I=;
        b=bmI0PA2/78uOXCpFTZE0LIwrvpDl3yYmVm6lNA5pfwmaJhul5j7aTcmzpAJZFHqbkA
         dy8LLfR2OwyKJ8mRTiJrEUCqgiXI/GmWZkL38O26sfJxEhKR1MzM+h272x/JVX3Q5X+Z
         20oSo+HkzqCpvY+MStVQnrv2XHTE2kQDhGHDHaZaHUQWttr3/MjuPpakVyccFj6GGWhd
         yIDW1l1lK8NjSaZJ3nZK9kZd4j50au2g0tYzGURQVk9KVpWTviiMvR5mq8CqRos0FKL6
         h9/IeUUTWU8VJS+k9bWSS0h6FECgepuNjGoo15yHT3KIz/KCOcBzJ5jP6dUGzjcGziYf
         rlPw==
X-Gm-Message-State: AOAM531JD0/iXTze/7lnBbE4B2S+lC760MzujYm71cDpr19WIAgyofb5
        S6rgjbTw7s4fMeXZsTyE1w==
X-Google-Smtp-Source: ABdhPJzUBxL+J+xPV5JwZZiLBG7Yc15b/Sdl4BNiDHIgs0PftuDN9IsXIOwC4XuIpdh/Lt3QSRMCTA==
X-Received: by 2002:a92:d591:: with SMTP id a17mr4951741iln.13.1590601675793;
        Wed, 27 May 2020 10:47:55 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id r68sm1858093ilb.37.2020.05.27.10.47.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2020 10:47:55 -0700 (PDT)
Received: (nullmailer pid 2443835 invoked by uid 1000);
        Wed, 27 May 2020 17:47:54 -0000
Date:   Wed, 27 May 2020 11:47:54 -0600
From:   Rob Herring <robh@kernel.org>
To:     Charles Keepax <ckeepax@opensource.cirrus.com>
Cc:     patches@opensource.cirrus.com, broonie@kernel.org,
        linux@roeck-us.net, lgirdwood@gmail.com,
        devicetree@vger.kernel.org, mturquette@baylibre.com,
        linus.walleij@linaro.org, sboyd@kernel.org, lee.jones@linaro.org,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org, jdelvare@suse.com
Subject: Re: [PATCH v3 5/5] mfd: lochnagar: Move binding over to dtschema
Message-ID: <20200527174754.GA2443798@bogus>
References: <20200512152359.11839-1-ckeepax@opensource.cirrus.com>
 <20200512152359.11839-5-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200512152359.11839-5-ckeepax@opensource.cirrus.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, 12 May 2020 16:23:58 +0100, Charles Keepax wrote:
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
> 
> No changes since v2.
> 
> Thanks,
> Charles
> 
>  .../devicetree/bindings/mfd/cirrus,lochnagar.txt   |  85 -----
>  .../devicetree/bindings/mfd/cirrus,lochnagar.yaml  | 352 +++++++++++++++++++++
>  .../bindings/regulator/cirrus,lochnagar.txt        |  82 -----
>  MAINTAINERS                                        |  11 +-
>  4 files changed, 357 insertions(+), 173 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mfd/cirrus,lochnagar.txt
>  create mode 100644 Documentation/devicetree/bindings/mfd/cirrus,lochnagar.yaml
>  delete mode 100644 Documentation/devicetree/bindings/regulator/cirrus,lochnagar.txt
> 

Applied, thanks!

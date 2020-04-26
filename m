Return-Path: <SRS0=vHNE=6K=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BB6BC54FCB
	for <linux-devicetree@archiver.kernel.org>; Sun, 26 Apr 2020 13:40:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3F0B72071C
	for <linux-devicetree@archiver.kernel.org>; Sun, 26 Apr 2020 13:40:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IbGMQCl4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726149AbgDZNk1 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 26 Apr 2020 09:40:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726140AbgDZNk1 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 26 Apr 2020 09:40:27 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AF35C061A0F
        for <devicetree@vger.kernel.org>; Sun, 26 Apr 2020 06:40:27 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id x17so16539806wrt.5
        for <devicetree@vger.kernel.org>; Sun, 26 Apr 2020 06:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+sfLnAVkgwewq2yi0A2h0qB6umF29EB4ptAx48KX6IA=;
        b=IbGMQCl4dehckFgGfBMPACJvT4fPKNpMmAnPSOo4IIXBvP4gL7G6i1saj4ix9wTuBY
         YlzmWwZadF+cGzBclaWrHk1OVWRsbw1KDMs1elqQZDZgoTFihLK34/XQCe0ek7kczLtk
         duswcMcQZyW6D07Uo5UPikSdUvfbNQ0OkFyFnuPGUI73vGsGkAUneb9b0I877vic/3Jo
         XMjX3CShkv2fVtHO/o5bZ1nDvisKvH5OPhKXpBUzRrQLkrJVmOmituz+inVwdNsBPqgW
         g/0djWUXSPXw5dZ2dQQAejvTqlUOA+Yp7gDHC6mlpuRU7pRxJ6N4yi0PJcSjDGoT6njW
         lOow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+sfLnAVkgwewq2yi0A2h0qB6umF29EB4ptAx48KX6IA=;
        b=lXd5UIcYDk33N0eWUQVjLD3m+uxvXSGmeO4fCtDB398a+NYpuEGaUkTN1e9Y4BuchO
         iUvfyDeUYppNTRFbCcPvUIsmLVAJs+MaXbnCMUnWWG/HdmwdPqHvrEzk6iFKfKh/Dmct
         swyPSf00wGZVtClq2ST8tsRkH/hH+4uoNxfB1Pmu05424BXolJlbJh4Hjmblb4u4d5Rd
         bSIPav+6RpBy7140tAI6X5XRKzo4FzFqp2+brQuwdUori5wF5FV9bbsnQovZJtAuqmlp
         lzHMefRY4V70Z747rwVije6SeLfxrWecwDueoLCXufsdjwropgGx1BlE9bH3eXD756Ks
         N/Rw==
X-Gm-Message-State: AGi0PuY4OQZDt9VD8wlRsDNH+XRNz7uVWLuO7TYSbHHY0oE5Osre2UwB
        Z7Nkjke1oEFpiALVLelhzOM=
X-Google-Smtp-Source: APiQypIDYRhG+TLJ9OvTSTngiaU1AY0a5tECxjZhh5mXZdCjrL1m9rRadFtsRcosEArIIPzOPZ6/lw==
X-Received: by 2002:adf:f10c:: with SMTP id r12mr22691915wro.409.1587908425710;
        Sun, 26 Apr 2020 06:40:25 -0700 (PDT)
Received: from [192.168.2.1] (ip51ccf9cd.speed.planet.nl. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id d7sm16376047wrn.78.2020.04.26.06.40.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Apr 2020 06:40:25 -0700 (PDT)
Subject: Re: [PATCH v5 3/7] MAINTAINERS: add maintainers to rockchip nfc
To:     Yifeng Zhao <yifeng.zhao@rock-chips.com>,
        miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        robh+dt@kernel.org
Cc:     devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
        heiko@sntech.de, linux-rockchip@lists.infradead.org
References: <20200426100250.14678-1-yifeng.zhao@rock-chips.com>
 <20200426100250.14678-4-yifeng.zhao@rock-chips.com>
From:   Johan Jonker <jbx6244@gmail.com>
Message-ID: <9e9e4831-3035-86dd-a478-c2f0eb3b47fd@gmail.com>
Date:   Sun, 26 Apr 2020 15:40:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200426100250.14678-4-yifeng.zhao@rock-chips.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Yifeng,

Thank you for version 5.
A test with the command below gives this warning:

WARNING: Missing commit description - Add an appropriate one

WARNING: Misordered MAINTAINERS entry - list file patterns in alphabetic
order
#21: FILE: MAINTAINERS:2314:
 F:	Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml
+F:	Documentation/devicetree/bindings/*/*rockchip*.yaml

./scripts/checkpatch.pl --strict
0003-MAINTAINERS-add-maintainers-to-rockchip-nfc.patch

The enties of MAINTAINERS have been sort with this command:

./scripts/parse-maintainers.pl --input=MAINTAINERS --output=MAINTAINERS
--order

On 4/26/20 12:02 PM, Yifeng Zhao wrote:

Add a commit description.

> Signed-off-by: Yifeng Zhao <yifeng.zhao@rock-chips.com>
> ---
> 
> Changes in v5: None
> Changes in v4: None
> Changes in v3: None
> Changes in v2: None
> 
>  MAINTAINERS | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 58725773cec4..187415b1481a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2308,11 +2308,11 @@ L:	linux-rockchip@lists.infradead.org
>  S:	Maintained
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git

>  F:	Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml
> -F:	Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml
> -F:	Documentation/devicetree/bindings/spi/spi-rockchip.yaml
> +F:	Documentation/devicetree/bindings/*/*rockchip*.yaml

The script likes to see a different order here.

>  F:	arch/arm/boot/dts/rk3*
>  F:	arch/arm/boot/dts/rv1108*
>  F:	arch/arm/mach-rockchip/
> +F:	drivers/*/*/*/*rockchip*
>  F:	drivers/*/*/*rockchip*
>  F:	drivers/*/*rockchip*
>  F:	drivers/clk/rockchip/
> 


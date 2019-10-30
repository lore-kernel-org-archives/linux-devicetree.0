Return-Path: <SRS0=UUkD=YX=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81742CA9EC6
	for <linux-devicetree@archiver.kernel.org>; Wed, 30 Oct 2019 14:34:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5595A20874
	for <linux-devicetree@archiver.kernel.org>; Wed, 30 Oct 2019 14:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1572446059;
	bh=cQ1r1GSwB3hVmeIwtUFlcFOgmsPuuu6iBKA2V/JzBZ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=2r7eKjbtqJEeTP3uk9kVBEiG+lDbw8XdxVQ/VZQHYAGsU5zCB0c/eE3tHyYauxYKv
	 dpHUKmzGpEWvabPmKvVGUwHPgpKHrqXzG2pMC5TUd8jo8hUJBWXQ82hRZDr9qYoVT1
	 GVnNOkkOhxP/T3LANdjQ69D1DE7UYMxftrRcIO9Q=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726377AbfJ3OeS (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 30 Oct 2019 10:34:18 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:34524 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726370AbfJ3OeS (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 30 Oct 2019 10:34:18 -0400
Received: by mail-ot1-f67.google.com with SMTP id m19so2314231otp.1;
        Wed, 30 Oct 2019 07:34:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=iNB9zaQ8dSRe5Mnad1wsyC4kIdvQ+zLzoATcArIwY64=;
        b=U9rZWPkp5uz59474NlPkExX8zv4yq5tvJF7wdv4SI0BuPtvpBHZie3VF6eDZrWIVlp
         TX65X8a1a8VNFPEmY60spCoHhro90dc0BA6kLgII1J6FuCYJZUWGhymRgs6xAYB+9ipn
         vtTC2rzdWY7ER73owGPBfBdSlqm1Xoq+fUlXRxZemyUa/Lxi0s8xAD1gBPeXAeoZ2XHD
         mg0SWVkZX4AGifhfz9EvaOHkU95wq5MUQOdHIqsXXtw9B34ktqC04iCqvyFLoK3r2Xmv
         gYr7u98UpXGdzC0UU+2J23NgH6k3g9LadsKrbM+cadvL78FiVGEeicv7g0547b/kQrpd
         xY8A==
X-Gm-Message-State: APjAAAXSHA6l+aWc9j6OfPi67EoH7omPV7UYs/0vdxdyYxHugILG+DRN
        ZCyjHRqOZmFX+aUw+tRPOg==
X-Google-Smtp-Source: APXvYqxK9XtqYio/UoUdgfg5a2J5HDiBryxSLKGwIfeMVHAnes3sC9LJgcfHOh1ijxXGwwZBeASXKQ==
X-Received: by 2002:a9d:4aa:: with SMTP id 39mr125853otm.311.1572446057489;
        Wed, 30 Oct 2019 07:34:17 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id b4sm53728oiy.30.2019.10.30.07.34.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2019 07:34:15 -0700 (PDT)
Date:   Wed, 30 Oct 2019 09:34:10 -0500
From:   Rob Herring <robh@kernel.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     mturquette@baylibre.com, sboyd@kernel.org, mark.rutland@arm.com,
        geert+renesas@glider.be, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/4] dt-bindings: clock: renesas: rcar-usb2-clock-sel:
 Add power-domains and resets properties
Message-ID: <20191030143410.GA11171@bogus>
References: <1572242850-9073-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1572242850-9073-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1572242850-9073-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, Oct 28, 2019 at 03:07:28PM +0900, Yoshihiro Shimoda wrote:
> This patch adds missing required properties of power-domains and resets.
> Fortunately, no one has this device node for now, so that we don't
> need to think of backward compatibility.
> 
> Fixes: 311accb64570 ("clk: renesas: rcar-usb2-clock-sel: Add R-Car USB 2.0 clock selector PHY")
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  .../devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.txt        | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.txt b/Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.txt
> index 5c1903f..bad876f 100644
> --- a/Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.txt
> +++ b/Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.txt
> @@ -43,6 +43,9 @@ Required properties:
>   - The USB_EXTAL clock pin must be "usb_extal"
>   - The USB_XTAL clock pin must be "usb_xtal"
>  - #clock-cells: Must be 0
> +- power-domains: A phandle and symbolic PM domain specifier.
> +                 See power/renesas,rcar-sysc.txt.
> +- resets: A list of phandles and specifier pairs.
>  
>  Example (R-Car H3):
>  
> @@ -54,4 +57,6 @@ Example (R-Car H3):
>  			 <&usb_extal>, <&usb_xtal>;
>  		clock-names = "ehci_ohci", "hs-usb-if", "usb_extal", "usb_xtal";
>  		#clock-cells = <0>;
> +		power-domains = <&sysc R8A7795_PD_ALWAYS_ON>>;

Typo in '>>'

With that,

Reviewed-by: Rob Herring <robh@kernel.org>

Return-Path: <SRS0=PToE=Z3=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49244C2BD09
	for <linux-devicetree@archiver.kernel.org>; Thu,  5 Dec 2019 17:59:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1FA1824249
	for <linux-devicetree@archiver.kernel.org>; Thu,  5 Dec 2019 17:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1575568758;
	bh=qVMCWZ7EusUgM1R6oC6oHHiHcIw/i2qTfp8xvH8m0UA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=1Rh9q41bB4k455hoY4uOIBV/LU3JlmRtpGSlr4StgVO5DcI5HBnwftAsMLNVdWwAn
	 muCHz77eW7mhpHa+ZBevIMAdwWv0wsjqv0pqvWPF/Wzn1kwCI+fJimwK7W3I9rRIRM
	 nSq0eS4Q3yzbzmmEVOJt3pzkA4yki+MjuH4tXsAY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730229AbfLER7R (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 5 Dec 2019 12:59:17 -0500
Received: from mail.kernel.org ([198.145.29.99]:50698 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730220AbfLER7R (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 5 Dec 2019 12:59:17 -0500
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D779224652;
        Thu,  5 Dec 2019 17:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1575568757;
        bh=qVMCWZ7EusUgM1R6oC6oHHiHcIw/i2qTfp8xvH8m0UA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=xMyAnC/+gC29B7/vl9p4PepbUckp0NEWdUSvAyXvcNFi4tCl2s+/HIv+XLOu5eCJF
         s+nXxrmxdiqQMyi9XgAhcSUvg90KDM1NBH9tv299ogPI1PeuYEgOev3vX9Zhp3Lafk
         FAPAiISPTJ2GrjL4vfwPHOAaXxkbrG0T0y92GKzU=
Received: by mail-qt1-f169.google.com with SMTP id q8so4349265qtr.10;
        Thu, 05 Dec 2019 09:59:16 -0800 (PST)
X-Gm-Message-State: APjAAAUuBc/SzrB73/yZNIKH1e05RlOa7UZ9wB4OFkr4fopTM4H0J9KY
        jOL+nFyMz0u/F/ookxrvnYjalJYt75wtdPLcmg==
X-Google-Smtp-Source: APXvYqy+xiTb+SVZTsD+gIM5Zp+s5G1KvyND6C+q9ugLlAusZepqXnQoudEMJX/P5+snxqgcFfANKH0gbous/zPt/50=
X-Received: by 2002:ac8:5513:: with SMTP id j19mr8837734qtq.143.1575568755943;
 Thu, 05 Dec 2019 09:59:15 -0800 (PST)
MIME-Version: 1.0
References: <20191127153928.22408-1-grygorii.strashko@ti.com>
In-Reply-To: <20191127153928.22408-1-grygorii.strashko@ti.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Thu, 5 Dec 2019 11:59:04 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+viKkF4FFgpMhTjKCMLeGOX1o9Uq-StU6xwFuTcpCL2Q@mail.gmail.com>
Message-ID: <CAL_Jsq+viKkF4FFgpMhTjKCMLeGOX1o9Uq-StU6xwFuTcpCL2Q@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: net: mdio: use non vendor specific
 compatible string in example
To:     Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org,
        Simon Horman <simon.horman@netronome.com>,
        netdev <netdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Nov 27, 2019 at 9:39 AM Grygorii Strashko
<grygorii.strashko@ti.com> wrote:
>
> Use non vendor specific compatible string in example, otherwise DT YAML
> schemas validation may trigger warnings specific to TI ti,davinci_mdio
> and not to the generic MDIO example.
>
> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
> ---
>  Documentation/devicetree/bindings/net/mdio.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/net/mdio.yaml b/Documentation/devicetree/bindings/net/mdio.yaml
> index 5d08d2ffd4eb..524f062c6973 100644
> --- a/Documentation/devicetree/bindings/net/mdio.yaml
> +++ b/Documentation/devicetree/bindings/net/mdio.yaml
> @@ -56,7 +56,7 @@ patternProperties:
>  examples:
>    - |
>      davinci_mdio: mdio@5c030000 {
> -        compatible = "ti,davinci_mdio";
> +        compatible = "vendor,mdio";

The problem with this is eventually 'vendor,mdio' will get flagged as
an undocumented compatible. We're a ways off from being able to enable
that until we have a majority of bindings converted. Though maybe
examples can be enabled sooner rather than later.

>          reg = <0x5c030000 0x1000>;
>          #address-cells = <1>;
>          #size-cells = <0>;
> --
> 2.17.1
>

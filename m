Return-Path: <SRS0=KHJB=AD=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72ABDC433E1
	for <linux-devicetree@archiver.kernel.org>; Mon, 22 Jun 2020 20:04:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4D3672076A
	for <linux-devicetree@archiver.kernel.org>; Mon, 22 Jun 2020 20:04:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="wO3cMTXC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729337AbgFVUEn (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 22 Jun 2020 16:04:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728050AbgFVUEm (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 22 Jun 2020 16:04:42 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CCC9C061796
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2020 13:04:41 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id n24so20745882lji.10
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2020 13:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GI2HHNZ9gqZ+5Dmai68yTkhXYHMNey1Kp/NbRXupY1g=;
        b=wO3cMTXCazG8NMjBFRopORQBMfk+avBjNT7LCgZPgPpbxtAX1BapllUZnzvAHuTyyo
         Elk8ZiHGQLDdBZMLiMJwEkue13hYunxtnQvyK9oZkvW+j3f6Shag1N3/jJiwIQ+zKx2+
         momEguFa3ACunAys3wEQZ3l5MkxakQe1kXr1GH/ecpfHlBn7gLM3g9IkuUbX4/qLvJs5
         k1wDvbiQ5pXb1m17VYvQhl5qdeXNrvm9WpPhws7ap+vvLQ63rJ9vKDUVwcafO9Ko3/zE
         o1yEhOuL33LgUnFNj6zby/ekkXs71TpU+5cOk9psNG9ei8P96ZokLPj+TUV2yVPwpQS4
         zKlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=GI2HHNZ9gqZ+5Dmai68yTkhXYHMNey1Kp/NbRXupY1g=;
        b=fJo26DUboZKMxtoIyXiTiTTV16EzSrDNd3jhRcvDSi7jZjJwgiscNo6IuA0C0O5d8d
         z2J72Kc2fufPr7gYfPdWvB5+/nGX83zhLaOuYV7GwQmzrcVRrX5DlTUQ4hul+oJxrTFD
         4Z4kQWvi2ORtO+heKQ6NWbxbVIvivHz1vvDAvCQF3SuOJOWQNzFh8e5JdGZ0P/xAS69W
         8T0Hij5HPj9nQpoth/x+SLT//cRqK/Z3mbXRuGrzvQR2KS0WajgyTQsHClcQAyMZq5LP
         mL+Bm3/x0WTR1ryGIcb/0buVjplQ6E1NRGFaq/a04KPYEOZjm2g8vFj6XjLOL3wgGgDc
         HQug==
X-Gm-Message-State: AOAM533HS45mNQPBSwTNsbHzh/VtOjqHcNrNb5p4EwPkcZX/vxWe9YYx
        C3q/e1GmWNTmhAlYrZ3gNu7Ryqi4Gk1O7Q==
X-Google-Smtp-Source: ABdhPJxaQEp4KH3s96BySjZEQ8j52vi5htdaEbU950oS/ZVIaS98tqjjk9rnuh/YtHhSe0tyXmby/Q==
X-Received: by 2002:a05:651c:3cc:: with SMTP id f12mr9199933ljp.244.1592856279008;
        Mon, 22 Jun 2020 13:04:39 -0700 (PDT)
Received: from wasted.cogentembedded.com ([2a00:1fa0:4203:64df:af75:c7a5:2eac:da37])
        by smtp.gmail.com with ESMTPSA id n10sm3651851lfb.82.2020.06.22.13.04.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Jun 2020 13:04:38 -0700 (PDT)
Subject: Re: [PATCH/RFC] dt-bindings: net: renesas,etheravb: Convert to
 json-schema
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20200621081710.10245-1-geert+renesas@glider.be>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <8d90ef9a-32d3-659f-f808-5d62d1d7ac6d@cogentembedded.com>
Date:   Mon, 22 Jun 2020 23:04:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20200621081710.10245-1-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hello!

On 06/21/2020 11:17 AM, Geert Uytterhoeven wrote:

> Convert the Renesas Ethernet AVB (EthernetAVB-IF) Device Tree binding
> documentation to json-schema.
> 
> Add missing properties.
> Update the example to match reality.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

   As I'm only seeing the formatting issues, here's my:

Reviewed-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

> diff --git a/Documentation/devicetree/bindings/net/renesas,etheravb.yaml b/Documentation/devicetree/bindings/net/renesas,etheravb.yaml
> new file mode 100644
> index 0000000000000000..c87d8c6389328eaa
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/renesas,etheravb.yaml
> @@ -0,0 +1,269 @@
[...]
> +maintainers:
> +  - Sergei Shtylyov <sergei.shtylyov@gmail.com>

   Thank you! :-)

> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - renesas,etheravb-r8a7742      # RZ/G1H
> +              - renesas,etheravb-r8a7743      # RZ/G1M
> +              - renesas,etheravb-r8a7744      # RZ/G1N
> +              - renesas,etheravb-r8a7745      # RZ/G1E
> +              - renesas,etheravb-r8a77470     # RZ/G1C
> +              - renesas,etheravb-r8a7790      # R-Car H2
> +              - renesas,etheravb-r8a7791      # R-Car M2-W
> +              - renesas,etheravb-r8a7792      # R-Car V2H
> +              - renesas,etheravb-r8a7793      # R-Car M2-N
> +              - renesas,etheravb-r8a7794      # R-Car E2

   Hm, overindented starting with "- items:"?

> +          - const: renesas,etheravb-rcar-gen2 # R-Car Gen2 and RZ/G1
> +
> +      - items:
> +          - enum:
> +              - renesas,etheravb-r8a774a1     # RZ/G2M
> +              - renesas,etheravb-r8a774b1     # RZ/G2N
> +              - renesas,etheravb-r8a774c0     # RZ/G2E
> +              - renesas,etheravb-r8a7795      # R-Car H3
> +              - renesas,etheravb-r8a7796      # R-Car M3-W
> +              - renesas,etheravb-r8a77961     # R-Car M3-W+
> +              - renesas,etheravb-r8a77965     # R-Car M3-N
> +              - renesas,etheravb-r8a77970     # R-Car V3M
> +              - renesas,etheravb-r8a77980     # R-Car V3H
> +              - renesas,etheravb-r8a77990     # R-Car E3
> +              - renesas,etheravb-r8a77995     # R-Car D3
> +          - const: renesas,etheravb-rcar-gen3 # R-Car Gen3 and RZ/G2

   Here as well...

[...]
> +allOf:
> +  - $ref: ethernet-controller.yaml#
> +
> +  - if:
> +      properties:

   Overindented?

> +        compatible:
> +          contains:
> +            enum:
> +              - renesas,etheravb-rcar-gen2
> +              - renesas,etheravb-r8a7795
> +              - renesas,etheravb-r8a7796
> +              - renesas,etheravb-r8a77961
> +              - renesas,etheravb-r8a77965
[...]
> +  - if:
> +      properties:

   Overindented?

> +  - if:
> +      properties:

   Overindented?

> +        compatible:
> +          contains:
> +            const: renesas,etheravb-r8a77995
> +    then:
> +      properties:
> +        renesas,rxc-delay-ps:
> +          const: 1800
> +
> +  - if:
> +      properties:

   Overindented?

[...]

MBR, Sergei


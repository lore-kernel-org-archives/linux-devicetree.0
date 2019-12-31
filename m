Return-Path: <SRS0=+REJ=2V=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B73CAC2D0C2
	for <linux-devicetree@archiver.kernel.org>; Tue, 31 Dec 2019 17:46:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 91117205ED
	for <linux-devicetree@archiver.kernel.org>; Tue, 31 Dec 2019 17:46:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="10RtHqBF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727064AbfLaRqy (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 31 Dec 2019 12:46:54 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:39380 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726060AbfLaRqy (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 31 Dec 2019 12:46:54 -0500
Received: by mail-lf1-f65.google.com with SMTP id y1so27369860lfb.6
        for <devicetree@vger.kernel.org>; Tue, 31 Dec 2019 09:46:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3fTDdhLi1IOKP9I0hbX5TWBA0qDWLDQvrRlWQlcOtq8=;
        b=10RtHqBF5lBxwbvD2uSgcXpsDW/ubqiM/5wkw3R8xH1L5e7xlKEk9NrD8QxtTLYAzk
         qwo3Wi4pachA6Q5iz0966j+dj9uDynIenvc9GDRgE9533GqqhAkt6GICA+nsbiAEr+00
         l0noo0DZCTrXkWh7UILFMvdaTWwvFtQ36zkcfpTS9deVhg+v9AGRtfgC02yjOPWaKOna
         Bikchmy8NxJDau2cBNxBqrZCnS4SKBSxW19osA0IP7mibwpThaYZXd9bi9a55xRMz/gE
         KO9NkezXMuCIxrIGpWexhNQz14+LBRFsEXCcJOoj75lGkXzIf57OCFfXSdw1UZszz93j
         cbig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=3fTDdhLi1IOKP9I0hbX5TWBA0qDWLDQvrRlWQlcOtq8=;
        b=b3KzvP0mKW0a2W7q/vf1AGO6yiLf+CNRM/6GA6TccqcF6giYxvpvjgJhPqMycoQq7b
         Wdb+qIx91xrqm9WKtxqvkk4MBO4QAjAhqYbKnStJViz4sLP9z1+C+hnhVLVEsAMCCklo
         v7Egh3+amMdlfGQn4v3eClqN0xg/fHcTvpu8+ILp5veocik2pXK3GhonlGh7zdBHtIP8
         NHTtrTOgrFsGPRaUTsRP30k65/PtphzZlCFvJm8kKl9VX7w+z+tqKm4Mknuoxvo/Oxdj
         o62hyyO3B7JRpUzL4IAdQkii0BlsL0i6S6EbtOb9pxD4FsgE28gt5cWDi9dwWdabizHc
         8s9w==
X-Gm-Message-State: APjAAAUd3/tjuJay8cfdQyufnVVSKnR7ucJgYFiCc/4WLUd2Q3DTcUma
        OOvYBaiFmohN9OAiquncIWO8ew==
X-Google-Smtp-Source: APXvYqymB4BjR6axudSAtiLveX48fUBKnrk5NTKARe+yKnx6TPJotX2dYZnRGIs5cCmqWUjMzNJSrg==
X-Received: by 2002:ac2:52a5:: with SMTP id r5mr42540399lfm.19.1577814411813;
        Tue, 31 Dec 2019 09:46:51 -0800 (PST)
Received: from wasted.cogentembedded.com ([2a00:1fa0:278:b572:bf70:f2c5:7a0b:f05])
        by smtp.gmail.com with ESMTPSA id 78sm19602629ljj.28.2019.12.31.09.46.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 31 Dec 2019 09:46:51 -0800 (PST)
Subject: Re: [PATCH 1/2] dt-bindings: Create DT bindings for [PS]ATA
 controllers
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Jens Axboe <axboe@kernel.dk>
Cc:     linux-ide@vger.kernel.org
References: <20191231172458.25984-1-linus.walleij@linaro.org>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <41b527ba-003d-425b-5e59-43cdd8c778e2@cogentembedded.com>
Date:   Tue, 31 Dec 2019 20:46:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20191231172458.25984-1-linus.walleij@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hello!

On 12/31/2019 08:24 PM, Linus Walleij wrote:

> I need to create subnodes for drives connected to PATA
> or SATA host controllers, and this needs to be supported
> generally, so create a common YAML binding for
> "pata-controller" or "sata-controller" that will support
> subnodes with drives.
> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  .../bindings/ata/pata-sata-common.yaml        | 47 +++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/ata/pata-sata-common.yaml
> 
> diff --git a/Documentation/devicetree/bindings/ata/pata-sata-common.yaml b/Documentation/devicetree/bindings/ata/pata-sata-common.yaml
> new file mode 100644
> index 000000000000..d94aa20a29e3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/ata/pata-sata-common.yaml
> @@ -0,0 +1,47 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/ata/pata-sata-common.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Common Properties for Parallel and Serial AT attachment controllers
> +
> +maintainers:
> +  - Linus Walleij <linus.walleij@linaro.org>
> +
> +description: |
> +  This document defines device tree properties common to most Parallel
> +  (PATA) and Serial (SATA) AT attachment storage devices. It doesn't
> +  constitue a device tree binding specification by itself but is meant to
> +  be referenced by device tree bindings.
> +
> +  The PATA/SATA controller device tree bindings are responsible for
> +  defining whether each property is required or optional.
> +
> +properties:
> +  $nodename:
> +    pattern: "^[ps]ata-controller(@.*)?$"

   I thought the DT spec has long ago standardized the node name as "ide" and "sata"?

> +    description:
> +      Specifies the host controller node.
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
[...]

MBR, Sergei

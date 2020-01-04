Return-Path: <SRS0=ng1M=2Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6614FC32771
	for <linux-devicetree@archiver.kernel.org>; Sat,  4 Jan 2020 21:36:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3CDA02465A
	for <linux-devicetree@archiver.kernel.org>; Sat,  4 Jan 2020 21:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578173812;
	bh=Gyd/bU7Y+tPiaitKzJdqAWHNM4gk6qITC6+roiF/TGA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=bQonVeaQ3liIWEJcqBQVtxZMrmbRSgyDbR4zX7L6LAO08KyPOt1aGdD37YSL1Xepx
	 R2ZtGUjw/Lm+Zsnxyn1B5q2nI1gmwWkI/z9LkIUL0DJtEroLCNmaUn/SGiAg/QcORl
	 cQ6rV+CO0IWJghNIU+TIE1+htcWTrPegRmOrDwLI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726368AbgADVgu (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 4 Jan 2020 16:36:50 -0500
Received: from mail-io1-f68.google.com ([209.85.166.68]:42682 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726240AbgADVgs (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 4 Jan 2020 16:36:48 -0500
Received: by mail-io1-f68.google.com with SMTP id n11so38023699iom.9
        for <devicetree@vger.kernel.org>; Sat, 04 Jan 2020 13:36:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=e6NIkJehX5PQPcR5AGeQlXeeI6cS9FMXt1VVPV226sY=;
        b=Ry9e4aTUnJdRSO6fYrOo2HZyy+4nt3QP+t3ggCcRedWSS6yD5aYgdxLP7c8SRjc7gW
         sTdX00bDoBVGzmbvi6VnLwtpOtxz4iPJLiPAADrr52JODdSVdXSUoRLxb69s/RkEdDo3
         +cYKDmZAP+n82sow+GetXIEa5nkkYH6+lrq5o+qRWKAsAx8nRsRVWkLjAG3+eWWljA9Y
         zkIFrGkg0yX+mmL8bizD/bQ53Tu3m1mBK2Mx6WLBCdqM4b7rCPTbFlx92fcx4GngC/F6
         0BqT4JZnNFFuU6kQob5hnyxLZuHc70s5TqJEHQ2vDdlcTXQuvcpgydArYbJ1F0Rc0ffZ
         MSAg==
X-Gm-Message-State: APjAAAXr1vS+VW5NFuvZAX/UYsHKKvx1u1PmmmUtVzStF/5XuEmRO8+P
        qpKU0rBdnOMhCDqZGXTAhTSYxpk=
X-Google-Smtp-Source: APXvYqy14UmkSLg/X6/2/zgOy9AejWUcSgNxA7kUUdI81nEmIQ8qLnyxyTi6etMKdXylHHPwQGplXA==
X-Received: by 2002:a5e:8309:: with SMTP id x9mr21716347iom.184.1578173807565;
        Sat, 04 Jan 2020 13:36:47 -0800 (PST)
Received: from rob-hp-laptop ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id q23sm5271564iob.39.2020.01.04.13.36.46
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2020 13:36:46 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2219a3
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Sat, 04 Jan 2020 14:36:45 -0700
Date:   Sat, 4 Jan 2020 14:36:45 -0700
From:   Rob Herring <robh@kernel.org>
To:     Taniya Das <tdas@codeaurora.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette =?iso-8859-1?Q?=A0?= 
        <mturquette@baylibre.com>, David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: Add YAML schemas for the QCOM
 MSS clock bindings
Message-ID: <20200104213645.GA25711@bogus>
References: <1577421760-1174-1-git-send-email-tdas@codeaurora.org>
 <1577421760-1174-2-git-send-email-tdas@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1577421760-1174-2-git-send-email-tdas@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Dec 27, 2019 at 10:12:38AM +0530, Taniya Das wrote:
> The MSS clock provider have a bunch of generic properties that
> are needed in a device tree. Add a YAML schemas for those.
> 
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---
>  .../devicetree/bindings/clock/qcom,mss.yaml        | 41 ++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,mss.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,mss.yaml b/Documentation/devicetree/bindings/clock/qcom,mss.yaml
> new file mode 100644
> index 0000000..05efe2b2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,mss.yaml
> @@ -0,0 +1,41 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/bindings/clock/qcom,mss.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Modem Clock Controller Binding
> +
> +maintainers:
> +  - Taniya Das <tdas@codeaurora.org>
> +
> +description: |
> +  Qualcomm modem clock control module which supports the clocks.
> +
> +properties:
> +  compatible :

drop space     ^

> +    enum:
> +       - qcom,sc7180-mss
> +
> +  '#clock-cells':
> +    const: 1
> +
> +  reg:
> +    maxItems: 1
> +
> +  additionalItems: false

With the indentation here, you are defining a property. Should be no 
indent.

> +
> +required:
> +  - compatible
> +  - reg
> +  - '#clock-cells'
> +
> +examples:
> +  # Example of MSS with clock nodes properties for SC7180:
> +  - |
> +    clock-controller@41aa000 {
> +      compatible = "qcom,sc7180-mss";
> +      reg = <0x041aa000 0x100>;
> +      #clock-cells = <1>;
> +    };
> +...
> --
> Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
> of the Code Aurora Forum, hosted by the  Linux Foundation.
> 

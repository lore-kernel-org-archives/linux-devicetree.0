Return-Path: <SRS0=V/11=AM=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD868C433DF
	for <linux-devicetree@archiver.kernel.org>; Wed,  1 Jul 2020 09:37:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BBA2C20775
	for <linux-devicetree@archiver.kernel.org>; Wed,  1 Jul 2020 09:37:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rmz9B2oL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729260AbgGAJhC (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 1 Jul 2020 05:37:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728982AbgGAJhC (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 1 Jul 2020 05:37:02 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B102C061755
        for <devicetree@vger.kernel.org>; Wed,  1 Jul 2020 02:37:02 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id l17so21694101wmj.0
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2020 02:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=ApaJ7XslOv0puD5Ya7Hg0iUdQq65YrcXGmCrZN90huU=;
        b=rmz9B2oLJd0djRRszL1VPVj1GbcOEY3WYBWpoZwNNDASXC+fI3Z+M6u0pQGjVyhYL6
         VImHKYBkoWoqqFd/W5faHsHyzUUJkd9BDRKeK2J5Vg9F5352c9Azw116e6ZxmW/ct9TA
         10YykSR7LQYsXwAvy96TaQqxXglsT9hdiAgBQASYzlCoHj4UbLssrsJt0tH2dSKclXHX
         yYGe1ZskkoCQNCe/CV20KlBRZeD2CE8ko2NCS0RuAOtMAUW9fOqn9BRK+IUgLfRHd0xQ
         0+WgfgXS0UgS41dE026G6VFjnBeB+lq7eUx8YLu5RA6gmfUaoRKeQ0lZ0wvompgn4uHI
         dB+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=ApaJ7XslOv0puD5Ya7Hg0iUdQq65YrcXGmCrZN90huU=;
        b=K3jr8eNnJfnXMEH5bxXhJIq+Fu0Dz+e+YVTS5WJF0IAyRjKFD80+6f3dX+n7IWn/NG
         82DPPvDyEINc15JS+ZOA3tO1fA0fDqHA698nymU4lanlRQ1nVHpBVLEicfjMQBys+DcP
         2/LDduD1hKU1Iadmmn2ReL/6lETb5P6Ys4Wo4eARyKuC5u4AXw1RKxbrk5RH0R06WehJ
         WKayQYilFAFwXtJGwMuZZ/qws6uOOZ4DX3ZHhqib5aG1YJc7dM8skYr8W8OTNMeLsGuT
         bU+/rEB8n7kBh0c/jExxLntCUzBAAq/pp9+mQe5rysTh6a4BJlccezMpV6jp3KLp1buz
         nZ5Q==
X-Gm-Message-State: AOAM531Lff7RSBQPMPiHhC7qe0D9IgNDh6oUXUshA4GqjdJCAwhhktMI
        P7NIQ+H8591+9G3G+xeBmbH5Tw==
X-Google-Smtp-Source: ABdhPJwP9WYEePjnW74iRE2rDiNoAoXSn+pkbBqpLnxDgw/w4htCBaT0FgN9utswiFtCa4GoK+N0Xg==
X-Received: by 2002:a1c:6006:: with SMTP id u6mr25256263wmb.111.1593596220723;
        Wed, 01 Jul 2020 02:37:00 -0700 (PDT)
Received: from dell ([2.27.35.144])
        by smtp.gmail.com with ESMTPSA id w128sm7024230wmb.19.2020.07.01.02.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2020 02:37:00 -0700 (PDT)
Date:   Wed, 1 Jul 2020 10:36:58 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Benjamin GAIGNARD <benjamin.gaignard@st.com>
Cc:     Fabio Estevam <festevam@gmail.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [RFC] dt-bindings: mfd: st,stmfx: Remove extra
 additionalProperties
Message-ID: <20200701093658.GY1179328@dell>
References: <20200629192335.24622-1-festevam@gmail.com>
 <18c2405c-3c9d-58e0-c5ab-61a214341322@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <18c2405c-3c9d-58e0-c5ab-61a214341322@st.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, 01 Jul 2020, Benjamin GAIGNARD wrote:

> 
> 
> On 6/29/20 9:23 PM, Fabio Estevam wrote:
> > The following build error is seen with 'make dt_binding_check':
> >
> >    CHKDT   Documentation/devicetree/bindings/mfd/st,stmfx.yaml
> > /home/fabio/linux-next/Documentation/devicetree/bindings/mfd/st,stmfx.yaml: properties:pinctrl:patternProperties: {'enum': ['$ref', 'additionalItems', 'additionalProperties', 'allOf', 'anyOf', 'const', 'contains', 'default', 'dependencies', 'deprecated', 'description', 'else', 'enum', 'if', 'items', 'maxItems', 'maximum', 'minItems', 'minimum', 'multipleOf', 'not', 'oneOf', 'pattern', 'patternProperties', 'properties', 'propertyNames', 'required', 'then', 'unevaluatedProperties']} is not allowed for 'additionalProperties'
> >
> > Remove the extra 'additionalProperties' to pass the build.
> Reviewed-by: Benjamin Gaignard <benjamin.gaignard@st.com>

FYI: The resend of this patch has already been applied.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog

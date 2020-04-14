Return-Path: <SRS0=DG9v=56=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D7A2C2BB85
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 18:54:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 01A202074D
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 18:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1586890450;
	bh=0GvoAjXtu35JJeCD7d4r3qGbR7fZBOrkLuAbhEmxWbY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=Pm7MCLwZpz5qPnoGKz4XX1WrKSDWt3KhsI4h+02QiFdVMII3SUYXeKfiPOsyUNz1u
	 qvsAXAbzleQidiHE0DWWWDO3uAoRGjsxHM8g+e8nIAlr+zt2XNHGMUvvdQvd1kwoI1
	 8RAu6hReDe3Y4IdXwAvtYldRE0HJEJw/Zcxxy0Qc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504434AbgDNSyI (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Apr 2020 14:54:08 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:38834 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2504485AbgDNSyG (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 14 Apr 2020 14:54:06 -0400
Received: by mail-ot1-f65.google.com with SMTP id k21so775375otl.5
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2020 11:54:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=kmPsIaQP5KMooblYRoWezJ0UlsEuPl/dt/DckuGO7ZA=;
        b=p2r8hHLjio3HTiWKY8K2+JsyFPMKHG4cJJ2xnTBqnUFy7PTP3eyyKy0MsG52PcwlqY
         Rojqtxjhf7kavBfSf+lzlVFB+5YOb1IhWJsPkawhgbQbedvDe/0U5BjpOAOXJ7UTS3bl
         061RfaY7fjZKHwRGsoDJrbodCL0efAWjLP1Jrn8e0JQsX3jj9KFMAVexgbvbwqq/dcob
         xWNLWAQa4KrAP43SQTjJsUTIuULCyXKpjSuL9B9R7HIUj44mGBAsac6XxkxxtLUrU/G8
         j6/zjOPpyYSlvhDJFCM/G9jR8F42GrcfazxAVh5aOaOXucXFyOSk4bYNxt5CyTpJ71rX
         lscQ==
X-Gm-Message-State: AGi0Pua62k5XLz9F0zn1slCRfDtROrRPk1YDChH52KDhhZY3+4SJ6K+f
        G6E7oxcGLoUzsubj7O9laA==
X-Google-Smtp-Source: APiQypKdGD/FSc00sPVSQf5wlNVzrVoViIugO6yPcV0GsI0rZyLM7N7krbcR3AWLLOQTO6JuuXtE4g==
X-Received: by 2002:a9d:7e92:: with SMTP id m18mr4002041otp.269.1586890445368;
        Tue, 14 Apr 2020 11:54:05 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id u205sm5799839oia.37.2020.04.14.11.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 11:54:04 -0700 (PDT)
Received: (nullmailer pid 9188 invoked by uid 1000);
        Tue, 14 Apr 2020 18:54:03 -0000
Date:   Tue, 14 Apr 2020 13:54:03 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     dri-devel@lists.freedesktop.org,
        Thierry Reding <thierry.reding@gmail.com>,
        devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
        Werner Johansson <werner.johansson@sonymobile.com>
Subject: Re: [PATCH v2 29/36] dt-bindings: display: convert sharp,ls043t1le01
 to DT Schema
Message-ID: <20200414185403.GA9127@bogus>
References: <20200408195109.32692-1-sam@ravnborg.org>
 <20200408195109.32692-30-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200408195109.32692-30-sam@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed,  8 Apr 2020 21:51:02 +0200, Sam Ravnborg wrote:
> The txt binding specified the property "power-supply".
> But the example and the actual implementation in the linux-kernel
> uses "avdd-supply".
> So the binding is adjusted to use avdd-supply as this seems
> to be the correct choice.
> There are no DT files in the linux kernel to check.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Werner Johansson <werner.johansson@sonymobile.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  .../display/panel/sharp,ls043t1le01.txt       | 22 --------
>  .../display/panel/sharp,ls043t1le01.yaml      | 51 +++++++++++++++++++
>  2 files changed, 51 insertions(+), 22 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/sharp,ls043t1le01.txt
>  create mode 100644 Documentation/devicetree/bindings/display/panel/sharp,ls043t1le01.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

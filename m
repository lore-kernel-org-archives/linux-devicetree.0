Return-Path: <SRS0=+eHa=B3=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B580C433E1
	for <linux-devicetree@archiver.kernel.org>; Mon, 17 Aug 2020 21:45:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 336B620738
	for <linux-devicetree@archiver.kernel.org>; Mon, 17 Aug 2020 21:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1597700724;
	bh=TvxWczVIqWe4LL/KSDof/H6rXu5yC1hpJo1ovzjCnIY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=M4Mwym7iooVBpngc9QZDxEdptAGUUm/YpZxWlIT0SI3yyIN5+YG7m/W2ETrW9KOIC
	 LaFnkv8mBOKneZgDbG/DVMDAeyAFoIavyWNfPKH5a38Vo9vQiHZJQxk8gwVL8wGtWR
	 qmNKlJz3duudbN/kHhf0vVnLhYSOtMfJBuNFUd3Y=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728169AbgHQVpX (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 17 Aug 2020 17:45:23 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:33040 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726634AbgHQVpW (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 17 Aug 2020 17:45:22 -0400
Received: by mail-il1-f194.google.com with SMTP id r13so11433157iln.0;
        Mon, 17 Aug 2020 14:45:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6MCExLbE/HoZ4/itLcKvfqk9IbuYr3ZYOuZYZlBisHk=;
        b=jpDweivx2scnaG2b+hRArpD84Ak4VqSjiuR4Qavu+kLOO35+OE5zyWFsaM5MHfE0Ip
         2N/NIK7rdJXAfyJtspdDwUFCKAyBkPY78CrnXC61hFxKJlX6sge3ZOyPLq+gxwG6vMv4
         BCqvhNnxnchH6L388H84uLuVGubg91Zt1iYuBslanA2HGqVTOVZE4++6nbWYiE8b04ae
         trCQ+9n/C2++zd4BBrD+S35V+VruuWlaWpfuBfwlaB0oAVHlnSBng1XtFrutUtyTZz4Z
         0l+rbIMWpigEJo53s+wjGxCc+omC4FcPPNFwVMZmtAgjPgFH8tE/87D7XmWY+JrWNr0d
         HSVw==
X-Gm-Message-State: AOAM532b4R4En4KuCEllk+mZ9t9dAwkdgiLxE5pCFhz5oKX668Sh2GjA
        VV7qx/cle6za/ST/WXcs5t0GCn+xyw==
X-Google-Smtp-Source: ABdhPJzT3Gv9BdpgDcFKfqnmcnA3xcG7NppGvntnORG6ISGsKMIJ4xUhlHmEMSoAi6uiHU0gIijvkQ==
X-Received: by 2002:a92:ce07:: with SMTP id b7mr9401223ilo.270.1597700721377;
        Mon, 17 Aug 2020 14:45:21 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
        by smtp.gmail.com with ESMTPSA id r6sm10175679iod.7.2020.08.17.14.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2020 14:45:20 -0700 (PDT)
Received: (nullmailer pid 1624448 invoked by uid 1000);
        Mon, 17 Aug 2020 21:45:19 -0000
Date:   Mon, 17 Aug 2020 15:45:19 -0600
From:   Rob Herring <robh@kernel.org>
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     linux-kernel@vger.kernel.org, o.rempel@pengutronix.de,
        devicetree@vger.kernel.org, Linux-imx@nxp.com,
        srinivas.kandagatla@linaro.org, robh+dt@kernel.org
Subject: Re: [PATCH] dt-bindings: nvmem: Convert snvs lpgpr to json-schema
Message-ID: <20200817214519.GA1624368@bogus>
References: <1596610172-30323-1-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1596610172-30323-1-git-send-email-Anson.Huang@nxp.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, 05 Aug 2020 14:49:32 +0800, Anson Huang wrote:
> Convert the snvs lpgpr binding to DT schema format using json-schema.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
>  .../devicetree/bindings/nvmem/snvs-lpgpr.txt       | 21 ---------------
>  .../devicetree/bindings/nvmem/snvs-lpgpr.yaml      | 31 ++++++++++++++++++++++
>  2 files changed, 31 insertions(+), 21 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/nvmem/snvs-lpgpr.txt
>  create mode 100644 Documentation/devicetree/bindings/nvmem/snvs-lpgpr.yaml
> 

Applied, thanks!

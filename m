Return-Path: <SRS0=jmN2=2I=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAA5BC43603
	for <linux-devicetree@archiver.kernel.org>; Wed, 18 Dec 2019 20:23:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AA1B221582
	for <linux-devicetree@archiver.kernel.org>; Wed, 18 Dec 2019 20:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1576700628;
	bh=NIrU2g0K1UTwJpgJUfmj8SmhJrlFd+A7kkOJl59tEgo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=vIakZaYNA8MX+yo6MJKoI2mxh1K12ykOklXkY1TCaE/T6LPrVfu4P3MH7ZS/2eOiI
	 q2SYFr0JhxF4OzoX36lgHrH0zNFPeXEFl7qsQ10Y8PInqLANWu8vK5ZWWiJpJtNHjj
	 G/nJOyigJ0fDmGuHlCPCvtBmd1kVSiHqqPf6OyDQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727497AbfLRUXs (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 18 Dec 2019 15:23:48 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:47080 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727422AbfLRUXr (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 18 Dec 2019 15:23:47 -0500
Received: by mail-ot1-f67.google.com with SMTP id c22so3962861otj.13
        for <devicetree@vger.kernel.org>; Wed, 18 Dec 2019 12:23:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=V4M27G+pEl3yUJbtQ0vcjxtkFqVokmfh8l26CP8uQpc=;
        b=TI6yPlTnUeGFi3eREyM7++5LnCPG/F/Dc4edtgMVqqpYoFPAKe3imBquV3bQJYumAL
         fzzXvcMXmtTYne07hNp9PsfmlogXLlPFWa6jkSo1yHRCgZmTvFyOBVVMsAGb32GGVbqw
         DwttRFRTzHHjL099WVxgMOqBK73jvUPNN8GtU3/x6wlbWVcYRIRLSEW7jtYCMugc94DB
         w2/nxJ3O8+6h+rGOtG9dIYi4ax/gDyO6rm3DvJ6HSL1XzVIgGATUbiZRW3prD+kyHqmu
         YnRnPyn31Dgo21m/5F9qF+xdNE4R/kHKW4HbTaZCsCJbrdwLvDogRbsf8sPfrFXCMkbL
         lYQw==
X-Gm-Message-State: APjAAAV0aCyEq2tfgVIOcPIYLi9q9SSWP+oN1m2fjkB9NJzo5iuc04rN
        gPUY/qxu4OPbOd2/LsHwPg==
X-Google-Smtp-Source: APXvYqwWVSGcbERyxqe72y3zKoDlTj6uKQZX3SkE5ooMSuV5NR5p4D7vbxRzK7qbzq59I91oDVnICQ==
X-Received: by 2002:a9d:7757:: with SMTP id t23mr4742036otl.315.1576700626882;
        Wed, 18 Dec 2019 12:23:46 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 4sm1221723otu.0.2019.12.18.12.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2019 12:23:46 -0800 (PST)
Date:   Wed, 18 Dec 2019 14:23:45 -0600
From:   Rob Herring <robh@kernel.org>
To:     Kamel Bouhara <kamel.bouhara@bootlin.com>
Cc:     Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        linux-arm-kernel@lists.infradead.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: arm: at91: Document Kizboxmini and
 Smartkiz boards binding
Message-ID: <20191218202345.GA22591@bogus>
References: <20191209091339.32593-1-kamel.bouhara@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191209091339.32593-1-kamel.bouhara@bootlin.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, Dec 09, 2019 at 10:13:38AM +0100, Kamel Bouhara wrote:
> Document devicetree's bindings for the Overkiz's Kizbox Mini and
> Smartkiz boards, based on a SAM9G25 Atmel SoC.
> 
> Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
> ---
> Changes in v2
> =============
> 	- Added Kizboxmini Base board documentation
> 	- Merged Smartkiz documentation as it is also a sam9g25 based
> 	board
> 
> Changes in v3
> =============
> 	- Made a single items list with all the sam9g25 based boards and
> 	put description into a comment.
> 	- Fixed duplicated item in enum list and checked with 'make
> 	dt_binding_check'
> 
> Changes in v4
> =============
> 	- Fix missing "-" before items list
> 
> Changes in v5
> =============
> 	- s/at91-kizboxmini_common.dtsi/at91-kizboxmini-common.dtsi/
> ---
>  Documentation/devicetree/bindings/arm/atmel-at91.yaml | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/atmel-at91.yaml b/Documentation/devicetree/bindings/arm/atmel-at91.yaml
> index 6dd8be401673..8d50915330e8 100644
> --- a/Documentation/devicetree/bindings/arm/atmel-at91.yaml
> +++ b/Documentation/devicetree/bindings/arm/atmel-at91.yaml
> @@ -35,6 +35,16 @@ properties:
>                - atmel,at91sam9x60
>            - const: atmel,at91sam9
> 
> +      - items:
> +          - enum:
> +                - overkiz,kizboxmini-base # Overkiz kizbox Mini Base Board
> +                - overkiz,kizboxmini-mb   # Overkiz kizbox Mini Mother Board
> +                - overkiz,kizboxmini-rd   # Overkiz kizbox Mini RailDIN
> +                - overkiz,smartkiz        # Overkiz SmartKiz Board

Should be indented 2 fewer spaces. Otherwise,

Reviewed-by: Rob Herring <robh@kernel.org>

> +          - const: atmel,at91sam9g25
> +          - const: atmel,at91sam9x5
> +          - const: atmel,at91sam9
> +
>        - items:
>            - enum:
>                - atmel,at91sam9g15
> --
> 2.24.0
> 

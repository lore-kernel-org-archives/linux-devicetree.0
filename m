Return-Path: <SRS0=2ZKK=7K=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9B59C433DF
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 May 2020 20:34:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 85E68207BC
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 May 2020 20:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1590698066;
	bh=7+GoFZWcv9iNLLysNZA9H0UXEPX8luKlHBiS/YHQXhk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=E+6Pefje3WdFoKs9RJnunJ98Ti2nWdtUiOs+X7+g1MvcRd2eZEJaRm1IJY2FkhTt9
	 2YnG5Wa8dJq8Ndkif10ymPHzTZ1BAk+PTWXWx5C3heKrMn57f3nwadkbMmOqCqlSmP
	 RFjg7ulA2veFOoSi0z9xpkISFZ04XP8m4V7ou46E=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407292AbgE1UeZ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 28 May 2020 16:34:25 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:44238 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407020AbgE1UeY (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 28 May 2020 16:34:24 -0400
Received: by mail-io1-f67.google.com with SMTP id p20so18230462iop.11;
        Thu, 28 May 2020 13:34:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1Qv4VwHDkU/5Nbgv5zqdCW5uv7aHC3Zhpckl+yLNYm0=;
        b=X8jrf7l1w39CgReXJpjl4VVH28BMy/ZTj1hCgRbW+a+zRYrWBa6vjz4otEbOcHWI2G
         HxKR4SRX+njnwMhiAACLVccvww7fijpTHVTd9L6x9WViDOFtKqgTKRvlMiB0q8esuM04
         SEUYQVw7Z4DdlM+lf8Lf2H9kogydoUOc2qQRfB9Yl485kf0lsYUdvb7uKy9/S6gkPtpj
         NTRAjVrBSvYkALoRM1qEZrMg2pN5GFxDzMpY06Lwq6VrXP3yPNKXSCy2BGNt/UgvDJeh
         J7sEYRrv4KxXzpYF7FOZb7yewpvV5v6kEr9h6CbM69tTRcp569VF+mjDwimmtFy+V5wa
         eBTA==
X-Gm-Message-State: AOAM532XWla+iE13usaS6u450q9Gpr3lEayI73hLYldEq224UQeugYTB
        38k+t6BmPFZaGk4DRmu/3A==
X-Google-Smtp-Source: ABdhPJwIKimzlFFArNqNbGuZF7XGK10jOed78fnY8n/C/Lxyv7KPhKrnRlyEPxw70g55D7RDN9hZrA==
X-Received: by 2002:a05:6602:2e0e:: with SMTP id o14mr3872515iow.164.1590698063713;
        Thu, 28 May 2020 13:34:23 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id c10sm2659732iob.22.2020.05.28.13.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 13:34:20 -0700 (PDT)
Received: (nullmailer pid 631410 invoked by uid 1000);
        Thu, 28 May 2020 20:34:19 -0000
Date:   Thu, 28 May 2020 14:34:19 -0600
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        linux-renesas-soc@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: clock: renesas: cpg: Convert to
 json-schema
Message-ID: <20200528203419.GA631266@bogus>
References: <20200518081644.23683-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200518081644.23683-1-geert+renesas@glider.be>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, 18 May 2020 10:16:44 +0200, Geert Uytterhoeven wrote:
> Convert the Renesas Clock Pulse Generator (CPG) Device Tree
> binding documentation to json-schema, combining support for:
>   - R-Mobile APE6 (R8A73A4) and A1 (R8A7740),
>   - R-Car M1 (R8A7778) and H1 (R8A7779),
>   - RZ/A1 (R7S72100),
>   - SH-Mobile AG5 (SH73A0).
> 
> Keep the example for R-Mobile A1, which shows most properties.
> Drop the consumer examples, as they do not belong here.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>   - Remove unneeded 'allOf' container around '$ref',
> 
> To be queued in clk-renesas-for-v5.8.
> 
> For a clean dtbs_check, this depends on commit e47cb97f153193d4 ("ARM:
> dts: r8a7740: Add missing extal2 to CPG node") in v5.7-rc6.
> 
> As these bindings are very similar, I merged them into a single
> document.  SoC-specific differences are mostly limited to the "clocks"
> and "clock-output-names" properties, and "#power-domain-cells" for clock
> domain providers.
> 
> JFYI, the diffstat for the individual conversions would look like:
>      .../clock/renesas,r8a73a4-cpg-clocks.txt      | 33 --------
>      .../clock/renesas,r8a73a4-cpg-clocks.yaml     | 70 ++++++++++++++++
>      .../clock/renesas,r8a7740-cpg-clocks.txt      | 41 ----------
>      .../clock/renesas,r8a7740-cpg-clocks.yaml     | 81 +++++++++++++++++++
>      .../clock/renesas,r8a7778-cpg-clocks.txt      | 47 -----------
>      .../clock/renesas,r8a7778-cpg-clocks.yaml     | 64 +++++++++++++++
>      .../clock/renesas,r8a7779-cpg-clocks.txt      | 49 -----------
>      .../clock/renesas,r8a7779-cpg-clocks.yaml     | 65 +++++++++++++++
>      .../bindings/clock/renesas,rz-cpg-clocks.txt  | 53 ------------
>      .../bindings/clock/renesas,rz-cpg-clocks.yaml | 66 +++++++++++++++
>      .../clock/renesas,sh73a0-cpg-clocks.txt       | 35 --------
>      .../clock/renesas,sh73a0-cpg-clocks.yaml      | 69 ++++++++++++++++
>      12 files changed, 415 insertions(+), 258 deletions(-)
>      delete mode 100644 Documentation/devicetree/bindings/clock/renesas,r8a73a4-cpg-clocks.txt
>      create mode 100644 Documentation/devicetree/bindings/clock/renesas,r8a73a4-cpg-clocks.yaml
>      delete mode 100644 Documentation/devicetree/bindings/clock/renesas,r8a7740-cpg-clocks.txt
>      create mode 100644 Documentation/devicetree/bindings/clock/renesas,r8a7740-cpg-clocks.yaml
>      delete mode 100644 Documentation/devicetree/bindings/clock/renesas,r8a7778-cpg-clocks.txt
>      create mode 100644 Documentation/devicetree/bindings/clock/renesas,r8a7778-cpg-clocks.yaml
>      delete mode 100644 Documentation/devicetree/bindings/clock/renesas,r8a7779-cpg-clocks.txt
>      create mode 100644 Documentation/devicetree/bindings/clock/renesas,r8a7779-cpg-clocks.yaml
>      delete mode 100644 Documentation/devicetree/bindings/clock/renesas,rz-cpg-clocks.txt
>      create mode 100644 Documentation/devicetree/bindings/clock/renesas,rz-cpg-clocks.yaml
>      delete mode 100644 Documentation/devicetree/bindings/clock/renesas,sh73a0-cpg-clocks.txt
>      create mode 100644 Documentation/devicetree/bindings/clock/renesas,sh73a0-cpg-clocks.yaml
> ---
>  .../bindings/clock/renesas,cpg-clocks.yaml    | 241 ++++++++++++++++++
>  .../clock/renesas,r8a73a4-cpg-clocks.txt      |  33 ---
>  .../clock/renesas,r8a7740-cpg-clocks.txt      |  41 ---
>  .../clock/renesas,r8a7778-cpg-clocks.txt      |  47 ----
>  .../clock/renesas,r8a7779-cpg-clocks.txt      |  49 ----
>  .../bindings/clock/renesas,rz-cpg-clocks.txt  |  53 ----
>  .../clock/renesas,sh73a0-cpg-clocks.txt       |  35 ---
>  7 files changed, 241 insertions(+), 258 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/renesas,cpg-clocks.yaml
>  delete mode 100644 Documentation/devicetree/bindings/clock/renesas,r8a73a4-cpg-clocks.txt
>  delete mode 100644 Documentation/devicetree/bindings/clock/renesas,r8a7740-cpg-clocks.txt
>  delete mode 100644 Documentation/devicetree/bindings/clock/renesas,r8a7778-cpg-clocks.txt
>  delete mode 100644 Documentation/devicetree/bindings/clock/renesas,r8a7779-cpg-clocks.txt
>  delete mode 100644 Documentation/devicetree/bindings/clock/renesas,rz-cpg-clocks.txt
>  delete mode 100644 Documentation/devicetree/bindings/clock/renesas,sh73a0-cpg-clocks.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>

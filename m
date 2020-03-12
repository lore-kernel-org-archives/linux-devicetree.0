Return-Path: <SRS0=4Y7L=45=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06072C10DCE
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Mar 2020 19:16:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CE0132071C
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Mar 2020 19:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1584040615;
	bh=WyT43/LOujoKr15uit4clEi1bkBXHMumtpl8mqnfRv8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=RZWG0NOtqtyA9IMquOowOQO8vq4aWhN4xDSYuHybO4Fs5Btxpu2N4U/5JNRm3P5sX
	 /q/+baY3fZG/WWjVi97ifZ3hZEAD72Y75wV5xgu2QF2f9rUAWknQrJNwdLzeQL+Eaf
	 HZ0im/oFRXkPO+Uk+6ZajqLKrbYw0CDtIA/MKJWg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726799AbgCLTQz (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 12 Mar 2020 15:16:55 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:38521 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726469AbgCLTQz (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 12 Mar 2020 15:16:55 -0400
Received: by mail-ot1-f68.google.com with SMTP id t28so4875435ott.5;
        Thu, 12 Mar 2020 12:16:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=vVrdJ+qhKEIpJd556IN01Cf39121xsXF8l1otnFI8JQ=;
        b=mmx2DfrtaNl1pfF3GUOiljsaFOm1XLuTkpt6XMvSTem+tJ+4SOp+G8xXthi5J5+Pcn
         9UyBP/z3n0dYwV9yu2qKu62ladMLkRBAT1D6e20VLbVXELiL4Ro9YeVHym0eebGV4Kjy
         oHnlzvYcjpAvbsCt8vPmpRNXROxTSd7me32rmDs2w7jhRbyExmUvQsVIkvp/2wkdT10D
         PGl2bZYf+5bzif0Ci7iOAJYg4SaaCLj87NwVPn1DNMndkJqffhdigbuR5CcxSj3Wr7Rr
         GsSK0uO3BLRBemVR3DIeDy6QJ07ufgXKnSjgvb6R7UHthL8DV9t5r3RLqXtp6Wr9RD82
         m1sQ==
X-Gm-Message-State: ANhLgQ1H6/k3fH+jBR3NmceCyGVKs7t4F6/NXudwCUz+9Z7svZ1DLytc
        l9e4QwCrlA0x5Uko05gBvw==
X-Google-Smtp-Source: ADFU+vvH6bRUxHrHHHS6+ktlFtWiyq46Nvumz8hQ5kL7ReKHjgRHELRbJnuG/uj1KI1hhAfO8JvCAQ==
X-Received: by 2002:a05:6830:1e09:: with SMTP id s9mr7303753otr.149.1584040614178;
        Thu, 12 Mar 2020 12:16:54 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id d9sm11580372otl.50.2020.03.12.12.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 12:16:53 -0700 (PDT)
Received: (nullmailer pid 14872 invoked by uid 1000);
        Thu, 12 Mar 2020 19:16:52 -0000
Date:   Thu, 12 Mar 2020 14:16:52 -0500
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Mark Brown <broonie@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v3 1/2] spi: dt-bindings: spi-controller: Fix
 #address-cells for slave mode
Message-ID: <20200312191652.GA14819@bogus>
References: <20200306085038.8111-1-geert+renesas@glider.be>
 <20200306085038.8111-2-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200306085038.8111-2-geert+renesas@glider.be>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri,  6 Mar 2020 09:50:37 +0100, Geert Uytterhoeven wrote:
> Currently, the DT bindings for an SPI controller specify that
> "#address-cells" must be fixed to one.  However, that applies to an SPI
> controller in master mode only.  When running in SPI slave mode,
> "#address-cells" should not be specified.
> 
> Fix this making "#address-cells" mutually-exclusive with "spi-slave".
> 
> Fixes: 0a1b929356830257 ("spi: Add YAML schemas for the generic SPI options")
> Reported-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v3:
>   - Make #address-cells mutually-exclusive with spi-slave,
> 
> v2:
>   - Use "enum: [0, 1]" instead of min/max limit,
>   - use "- spi-slave" instead of "[ spi-slave ]".
> ---
>  Documentation/devicetree/bindings/spi/spi-controller.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

Return-Path: <SRS0=Dihy=4Q=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2398DC3F2CD
	for <linux-devicetree@archiver.kernel.org>; Fri, 28 Feb 2020 15:08:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DCDE6246AE
	for <linux-devicetree@archiver.kernel.org>; Fri, 28 Feb 2020 15:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1582902535;
	bh=HHwEYyDSEKdV6Xycj4HlJPneyj3PZUumbO+wq7TktNg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=EzlScMLtPk+32/IPtoBQRttWZtft4KPvEYElUfWjsdMgAePXXUeys0eckwzusybSi
	 EhIkkLeBQtaqhOdq3+jf925pr2l1HVVRK7Q/EeKbZ9dMHZp+u96ayEqL4rAPlFyqcJ
	 araOsjVPNw8asiPvkhAcOAA4KHBBP5xvmTP0XwvU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727142AbgB1PIy (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 28 Feb 2020 10:08:54 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:35775 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727181AbgB1PIr (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 28 Feb 2020 10:08:47 -0500
Received: by mail-oi1-f196.google.com with SMTP id b18so3167273oie.2
        for <devicetree@vger.kernel.org>; Fri, 28 Feb 2020 07:08:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=GrxfLKNeb7VX7iUvU68jTNFGkoGVVgvbiiMbCe2hCME=;
        b=LGmrXQpdq8jD5ZzShnEZKrBeKV/Bnl4ojIbiTK3jggZxWjpr9QkZQIOroeDw3ceuLP
         4XEBw9n8RK561Rp52nV26jN4aFHf/gtzO+h7cgK3FCoBgR6CH3Dxijk0Hv6pnycPqHPu
         LA8G5KsmNMpRR6IcH7aMbfE0+QZp3mhUPNJKrb+YpGx/293Vt6ObbDpfbCa8E+aUEYEp
         /zDuohgRoz00En1zFFyYGa9Ge9jAoe46TSPVFA0zluMfIfzfOx8A5BdHzIazSTdXGjHl
         IAMaO1y8oMjypaFTxQhFye3lQw/ftB5iwx9OueGJ8trLfQbtT78ee96MBHs7c2CZ2Iyj
         Wbnw==
X-Gm-Message-State: APjAAAXLv6GmTBJP/CBT5jId0lv/bZHQAhvv+eumVmlg9ipVbjgJjdHd
        w/YagG/GFpqmVkMokufcrupBakk=
X-Google-Smtp-Source: APXvYqyIW4if0WiCCw0nWSFPDRi7C8E817zpUync88QJ06v4KoR749wkve/rgQKkMl0LMEvnPVD/GA==
X-Received: by 2002:a05:6808:45:: with SMTP id v5mr3356762oic.90.1582902526405;
        Fri, 28 Feb 2020 07:08:46 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id l12sm3204651oth.9.2020.02.28.07.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2020 07:08:45 -0800 (PST)
Received: (nullmailer pid 27469 invoked by uid 1000);
        Fri, 28 Feb 2020 15:08:44 -0000
Date:   Fri, 28 Feb 2020 09:08:44 -0600
From:   Rob Herring <robh@kernel.org>
To:     Charles-Antoine Couret <charles-antoine.couret@mind.be>
Cc:     alsa-devel@alsa-project.org,
        Charles-Antoine Couret <charles-antoine.couret@mind.be>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2 V2] ASoC: tas5756m: Add DT binding document
Message-ID: <20200228150844.GA26458@bogus>
References: <20200227232327.46309-1-charles-antoine.couret@mind.be>
 <20200227232327.46309-3-charles-antoine.couret@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200227232327.46309-3-charles-antoine.couret@mind.be>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, 28 Feb 2020 00:23:27 +0100, Charles-Antoine Couret wrote:
> Document the bindings for the tas5756m driver.
> 
> Signed-off-by: Charles-Antoine Couret <charles-antoine.couret@mind.be>
> ---
>  .../devicetree/bindings/sound/tas5756m.yaml   | 64 +++++++++++++++++++
>  1 file changed, 64 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/tas5756m.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

warning: no schema found in file: Documentation/devicetree/bindings/sound/tas5756m.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/tas5756m.yaml: ignoring, error parsing file
Documentation/devicetree/bindings/display/simple-framebuffer.example.dts:21.16-37.11: Warning (chosen_node_is_root): /example-0/chosen: chosen node must be at root node
Documentation/devicetree/bindings/sound/tas5756m.yaml:  did not find expected <document start>
  in "<unicode string>", line 4, column 1
Documentation/devicetree/bindings/Makefile:12: recipe for target 'Documentation/devicetree/bindings/sound/tas5756m.example.dts' failed
make[1]: *** [Documentation/devicetree/bindings/sound/tas5756m.example.dts] Error 1
Makefile:1263: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1246173
Please check and re-submit.

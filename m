Return-Path: <SRS0=wLM1=AN=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6775C433DF
	for <linux-devicetree@archiver.kernel.org>; Thu,  2 Jul 2020 16:20:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ADF8A20720
	for <linux-devicetree@archiver.kernel.org>; Thu,  2 Jul 2020 16:20:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L5eD/yDv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726140AbgGBQUl (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 2 Jul 2020 12:20:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726119AbgGBQUl (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 2 Jul 2020 12:20:41 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAD88C08C5C1
        for <devicetree@vger.kernel.org>; Thu,  2 Jul 2020 09:20:40 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id n23so33020747ljh.7
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2020 09:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=to6+D5f8O6QjVCBzMxdSKQZOKqML3sVNgqs+L1fyNoo=;
        b=L5eD/yDve1SL5FOrb16xd3UrwkLFF6E6YsAD55G8ud4Q/KznFilBy9mhPrFPdpt1nv
         4Im+BKJR2iU1Be9kFT8M7JGRSONqYuH6cR2c5pQWxZLAaXRnaGlqHwtaw8p+Pcv1a3nT
         27uAHbWlDOWuwa3m2lve8bSDeZlIr9VAvNjA20KZmAmzaPCyj6Bg8j+gfX6kli7hgu+e
         orXFLoG8UU9XecllJKDlNia/VrnLNhx++aGJGWWD3P8DgP84VMGpzCxQAOCzvS6NJnt2
         IxXZuySJh9glh3oVyt4lkkuIqKUr5Hee0BOxPWrUkUaEKA5CHBTOHtmeXQ8exHCcoIBc
         eoyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=to6+D5f8O6QjVCBzMxdSKQZOKqML3sVNgqs+L1fyNoo=;
        b=s61oKyczpybYdIQF+bzxFxQ5zrlsVfWlijCxLKTG5Zh3Bh6Ev24xMwNfzdFTMoiu+n
         WErMs8aLCwSCuPdHLjsIumyqv/V4WK8wz+5ujxTeoTvcIOf4BhDN80d+Px3cG8IRRJI7
         TUi+NexqEs+8Q5GU5AmasAzoaEmHMkF8zKrrWcg5kzyBf3ZYvHJr5FqXZZXbZee3tdfZ
         GDVIEMsw0oYsbumtsBa2H5w2Vc0GFsX3KWFHpI0CaBmKptXoMFP2gXS/SF8bknvy6MO4
         0g2zsOy8k2OvrYngcEJXzzdQNhNSPJIAoLYxlxqtseefKczMu5pW30qR9hWy6B5St83a
         tpOw==
X-Gm-Message-State: AOAM532imlOzBOXcgCmW0KoRE6+zkd81mzcxhYmuaOYJwYC2p3gknIku
        0iV45WNNrRLamH8YcGdrOPvWYXP7G4IhunToMk5JAwnr4uY=
X-Google-Smtp-Source: ABdhPJxdnw+YusE4W4778lHd/jw5nmBBjVAfjZaYgYILKa1NYaUwiRMdwnxufhPYa/KXqx8skFgdPKC7fiYai56DHSk=
X-Received: by 2002:a2e:a375:: with SMTP id i21mr12651290ljn.403.1593706839118;
 Thu, 02 Jul 2020 09:20:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAOMZO5B0DNuFfgYsiMLRg3eTvt7NsrvyznidwQzgQc=L_ThAxQ@mail.gmail.com>
 <20200702143213.3ep7ol52wjgtfio3@gilmour.lan>
In-Reply-To: <20200702143213.3ep7ol52wjgtfio3@gilmour.lan>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Thu, 2 Jul 2020 13:20:28 -0300
Message-ID: <CAOMZO5DUe-qJL08iv7zw_Pj7mBTr211SWynm8UtUR6A7dbtExw@mail.gmail.com>
Subject: Re: Warning coming from raspberrypi,bcm2835-firmware.yaml
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Maxime,

On Thu, Jul 2, 2020 at 11:32 AM Maxime Ripard <maxime@cerno.tech> wrote:

> I've sent a patch for it
>
> https://lore.kernel.org/linux-devicetree/20200626115433.125735-1-maxime@cerno.tech/

Thanks. Yes, this fixes the warning in
Documentation/devicetree/bindings/soc/imx/fsl,aips-bus.yaml

BTW, there are still warnings coming from bcm2835-firmware.example.yaml:

$ make dt_binding_check
DT_SCHEMA_FILES=Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
  CHKDT   Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
  SCHEMA  Documentation/devicetree/bindings/processed-schema-examples.yaml
  DTC     Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.example.dt.yaml
Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.example.dts:23.37-26.15:
Warning (simple_bus_reg): /example-0/firmware/clocks: missing or empty
reg/ranges property
  CHECK   Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.example.dt.yaml
/home/fabio/linux-next/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.example.dt.yaml:
firmware: $nodename:0: 'firmware' does not match
'^(bus|soc|axi|ahb|apb)(@[0-9a-f]+)?$'
/home/fabio/linux-next/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.example.dt.yaml:
firmware: '#address-cells' is a required property
/home/fabio/linux-next/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.example.dt.yaml:
firmware: '#size-cells' is a required property
/home/fabio/linux-next/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.example.dt.yaml:
firmware: 'ranges' is a required property

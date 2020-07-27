Return-Path: <SRS0=xnVj=BG=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E780C433EC
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Jul 2020 18:10:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 21EB520729
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Jul 2020 18:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1595873436;
	bh=GrPr9w+sJVGDeHdhbVqbOV2dSDf20PamwcXE5W1dxiM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=q5ew/vmN/V9dDdbOA4bWwEkaU2/F+5TRaNqPCea2LAfqmr2v6Di7vbBDYg96fTNsa
	 0qNLg0xR+I8f8rFV7Qt81NDv7alD9ZAQI0OohFu2mgtbpsWzW1/kiHdwYd80x4ou8S
	 2Y8STFte4Yx1G16oGJgLV/EiF55+fjV32HCPSqdY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729086AbgG0SKf (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 27 Jul 2020 14:10:35 -0400
Received: from mail-il1-f195.google.com ([209.85.166.195]:37380 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728663AbgG0SKf (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 27 Jul 2020 14:10:35 -0400
Received: by mail-il1-f195.google.com with SMTP id r12so13899657ilh.4
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2020 11:10:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jRzTHR+VUU5DFiybjijCTcymNwc6WwfSJ1wj6lSvSl4=;
        b=TgEB7jNLiVuC4q+2xsvvwUS81T/JwKCKcS2hiyITOdn4JCUkkvLHGvM11JPN0xJJ1B
         sIwwM1AmuNRbNCTCx5qJhUmsqBM/Oxgq9opWYWapc+ajDgtXYK6lrHolbjJ+8f3ixYHL
         eR63my9FLq+GgtjMUBAW2A7gt7nRe1weKQreaZ3rPqorG2HKi2G/N+4A26ICqT5+WDi6
         Z3rdahPk4ejs6V3Gss5AwWxHYOhh+/tkIpuXtHTh3eTKQ27vyQ7PL7e1I08GyQR4WDZT
         drUP8KGw86MlHQAfFnI25cDuO1G5UTC3LifROot04Bcz9gZmhdmMBJoCGpYTXdxajaoc
         3ksQ==
X-Gm-Message-State: AOAM53041on2n9u2834vR8miWszNkZdx8Mz1fxt1q4Fu/7eGnE21a3t4
        NuAmlqDvYo7Qygm0J7kB7w==
X-Google-Smtp-Source: ABdhPJw1a3yQdlRw7bOiSeDh/nd8Gh2ukbCWk8IYLKoeUc7WnO6thQ/sgeWWEpYf2f0YkxeHe4+Odg==
X-Received: by 2002:a92:cc4d:: with SMTP id t13mr17986305ilq.283.1595873433143;
        Mon, 27 Jul 2020 11:10:33 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id q70sm4862762ili.49.2020.07.27.11.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 11:10:32 -0700 (PDT)
Received: (nullmailer pid 634067 invoked by uid 1000);
        Mon, 27 Jul 2020 18:10:32 -0000
Date:   Mon, 27 Jul 2020 12:10:32 -0600
From:   Rob Herring <robh@kernel.org>
To:     Marek Vasut <marex@denx.de>
Cc:     Rob Herring <robh+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: Add DT bindings for Toshiba TC358762
 DSI-to-DPI bridge
Message-ID: <20200727181032.GB633248@bogus>
References: <20200725211457.5772-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200725211457.5772-1-marex@denx.de>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sat, 25 Jul 2020 23:14:56 +0200, Marek Vasut wrote:
> Add DT bindings for Toshiba TC358762 DSI-to-DPI bridge, this
> one is used in the Raspberry Pi 7" touchscreen display unit.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> To: dri-devel@lists.freedesktop.org
> Cc: Eric Anholt <eric@anholt.net>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: devicetree@vger.kernel.org
> ---
>  .../display/bridge/toshiba,tc358762.yaml      | 116 ++++++++++++++++++
>  1 file changed, 116 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/toshiba,tc358762.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

Documentation/devicetree/bindings/display/bridge/toshiba,tc358762.example.dts:20.13-23: Warning (reg_format): /example-0/bridge@0:reg: property has invalid length (4 bytes) (#address-cells == 1, #size-cells == 1)
Documentation/devicetree/bindings/display/bridge/toshiba,tc358762.example.dt.yaml: Warning (pci_device_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/display/bridge/toshiba,tc358762.example.dt.yaml: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/display/bridge/toshiba,tc358762.example.dt.yaml: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/display/bridge/toshiba,tc358762.example.dt.yaml: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/display/bridge/toshiba,tc358762.example.dt.yaml: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/bridge/toshiba,tc358762.example.dt.yaml: example-0: bridge@0:reg:0: [0] is too short
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/bridge/toshiba,tc358762.example.dt.yaml: bridge@0: '#address-cells', '#size-cells', 'port@0', 'port@1' do not match any of the regexes: 'pinctrl-[0-9]+'
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/bridge/toshiba,tc358762.example.dt.yaml: bridge@0: 'ports' is a required property


See https://patchwork.ozlabs.org/patch/1336337

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.


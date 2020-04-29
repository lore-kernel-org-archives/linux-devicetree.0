Return-Path: <SRS0=VloT=6N=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6335C83000
	for <linux-devicetree@archiver.kernel.org>; Wed, 29 Apr 2020 14:55:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AE725206F0
	for <linux-devicetree@archiver.kernel.org>; Wed, 29 Apr 2020 14:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1588172113;
	bh=o5+qieYC1jNSQz5eJwHFnRMubO1WO57oPgy4ZnZ6/80=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=d6JuhtNX0tHQzy9ZAVjhewmiPfDDOjP/iC3b1O4lhU6MyUn8vrNObUCZdF8kLDjBF
	 var5XttiYDAHn2uQIapKeJuCcJPmoE8f2xkckErjKcfgkMzby9sawJW/60AvOHiwq6
	 RAtF4+58jZaipvh0OMDoohHefaQhB0jFIg6ncBGE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726476AbgD2OzN (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 29 Apr 2020 10:55:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:45426 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726456AbgD2OzN (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 29 Apr 2020 10:55:13 -0400
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B15A920B80
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2020 14:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588172112;
        bh=o5+qieYC1jNSQz5eJwHFnRMubO1WO57oPgy4ZnZ6/80=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=FsaDwm/RJkBJHqMIroJ+44p/jNXijYy79P0wF5b12jLM1EExMUyz2iyseDNJjx9Et
         ov2K5u49q77X7k7Cq2mgVmn1J9TlP2mjQvKZLvBr7uCkwuMFZY2hAp/15IQD2zO5fA
         DqzO8FFeBwlhBwAWAgYwzp+eXyQxoWuKQeoRLV9k=
Received: by mail-ot1-f53.google.com with SMTP id g14so1887760otg.10
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2020 07:55:12 -0700 (PDT)
X-Gm-Message-State: AGi0PuaQsGb0kq1n9dC5/lCOaddkA331mkz8Fmt1+43C288YrfOykv7X
        CAXYbjNnDytgPjyag7LCwF60C6ZoIPb7oAlrDQ==
X-Google-Smtp-Source: APiQypJSfmto6bzeis9z5KUnimUNVl97fompNnDgnZX8cq19V3OO58z1uxH0xGL3xXnRejbdArofpQJuDy5QTPVWK4s=
X-Received: by 2002:a9d:7d85:: with SMTP id j5mr25331065otn.107.1588172111959;
 Wed, 29 Apr 2020 07:55:11 -0700 (PDT)
MIME-Version: 1.0
References: <6cdf20c3-7b74-679c-0e6f-4d385d12f9fe@xilinx.com>
 <CAL_Jsq+ehJSK7sjqmKtWOVjr-QZ3LDB+ywCO85uF8WJ+cB=AAw@mail.gmail.com> <845e6a12-ca33-957f-debb-4a1fcec70742@xilinx.com>
In-Reply-To: <845e6a12-ca33-957f-debb-4a1fcec70742@xilinx.com>
From:   Rob Herring <robh@kernel.org>
Date:   Wed, 29 Apr 2020 09:55:00 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLMDqpkyg-Q7mUfw-XH67-v068Q6e9wTq2UOoN=0-_coQ@mail.gmail.com>
Message-ID: <CAL_JsqLMDqpkyg-Q7mUfw-XH67-v068Q6e9wTq2UOoN=0-_coQ@mail.gmail.com>
Subject: Re: u-boot DT configuration node
To:     Michal Simek <michal.simek@xilinx.com>
Cc:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
        Tom Rini <trini@konsulko.com>,
        Loic Poulain <loic.poulain@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Apr 28, 2020 at 8:51 AM Michal Simek <michal.simek@xilinx.com> wrote:
>
> On 28. 04. 20 15:23, Rob Herring wrote:
> > On Wed, Apr 1, 2020 at 4:23 AM Michal Simek <michal.simek@xilinx.com> wrote:
> >>
> >> Hi Rob and others,
> >>
> >> for couple of years already u-boot is using config node in root DT for
> >> u-boot configuration.
> >>
> >> Here is one example in u-boot source code.
> >> https://gitlab.denx.de/u-boot/u-boot/-/blob/master/arch/arm/dts/exynos5250-spring.dts#L47
> >>
> >> And here is dt binding description
> >> https://gitlab.denx.de/u-boot/u-boot/-/blob/master/doc/device-tree-bindings/config.txt
> >>
> >> I was checking dt binding specification and there no such a thing
> >> described there. It means I expect this is more adhoc u-boot solution.
> >> We have reached the point where could be beneficial to put some u-boot
> >> specific configurations to DT.
> >>
> >> Actually I have done similar thing some time ago too by using chosen
> >> node and add xilinx specific property there to point to eeprom.
> >> https://gitlab.denx.de/u-boot/u-boot/-/blob/master/arch/arm/dts/zynqmp-zcu102-revA.dts#L39
> >
> > In this case, I think an alias should be used as it's more of just a
> > shortcut to finding a specific node.
>
> What alias name do you suggest to use?
> We have systems where one i2c eeprom described based board and another
> i2c eeprom describe bootable module. And I need to have shotcuts to both
> of them.
>
> dt specification doesn't list any keywords for aliases but there is
> generic name recommendation.

I do want make aliases a registered list of names.

> Based on keywords it should look like this.
> eeprom0 = ...;
> eeprom1 = ...;

That was my initial thought, but maybe "nvmemX" to be a bit more generic.


> >> I think it is a time to discuss it and do it properly.
> >>
> >> First of all my question is where we could list SW prefixes to make sure
> >> that they are listed and everybody is aware about it. We have
> >> vendor-prefixes and we should have a way to record also prefixes for sw
> >> projects. U-Boot is using u-boot. Xen has file in the kernel with using
> >> xen prefix. At least these two should be listed.
> >
> > Documentation/devicetree/bindings/vendor-prefixes.yaml.
>
> thx
>
> >
> >> Next my question is what is the recommended way to pass sw specific
> >> parameters via DT? I think using chosen node is more appropriate then
> >> adhoc config node. Or is there a better way how this should be done?
> >
> > /chosen
> >
> > For vendor specific things though I would be cautious. If they are
> > settings for a specific device, then they probably belong in the
> > device's node. Second, are they really vendor specific? What we don't
> > want is each vendor doing the same thing in slightly different ways.
>
> For u-boot specific setting like - offsets it should be generic for
> everybody. I was already talking to Loic that for saving u-boot
> variables to QSPI we should be using MTD partition map and put there
> maybe a flag to say that this is the location for storing them.

I'd standardize on the partition name.

Rob

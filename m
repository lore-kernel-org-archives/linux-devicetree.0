Return-Path: <SRS0=mbMJ=64=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED787C433E1
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 May 2020 18:07:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B3FD32065D
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 May 2020 18:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1589479655;
	bh=WyHa+wELNsyl80RXvrhvCWLoOE1V/uqut8e3OIWVpaU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=Aqxhj2rsv8E5QOX5ddaXOCoBbXicqLGGMESL8s3O2lrX1bdAOLV259qs/g2ZkyptI
	 MMYvUY4+QLrbEA7Ms68/4Afv9MBxeYnZbQA6rT6xcUjD8Iu5qb8FedCIDAhdua3OiP
	 zlAEtLot1mswmQhOBOMweVmUCo39f3ANmxnCPepk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726096AbgENSHf (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 14 May 2020 14:07:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:57088 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726128AbgENSHe (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 14 May 2020 14:07:34 -0400
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 95FE82078C
        for <devicetree@vger.kernel.org>; Thu, 14 May 2020 18:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589479653;
        bh=WyHa+wELNsyl80RXvrhvCWLoOE1V/uqut8e3OIWVpaU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=XTALV3avaoq4YWS8GfGp8NCEt2ffNXylR9ZPpjg2cKkeN6+nNeML74wSKi4cA4v+I
         DZx3GeV5V043IQL6i2IopJsVRp6wAUABh8UeKTmt5SXGloPJJD4c7nNGuv/saV3XsI
         sxtxLdq2OC+Hwov5YwFtawDkOU/crJ6zGpfwdyr4=
Received: by mail-oi1-f180.google.com with SMTP id j145so3516024oib.5
        for <devicetree@vger.kernel.org>; Thu, 14 May 2020 11:07:33 -0700 (PDT)
X-Gm-Message-State: AGi0Pub2iU/TNcvWSDCFB8lae3KVd3/AkX/CBBATDEEqzU13hjUKy5/l
        EumxRPLjIh6lIXCc4Q7kJDDuGndU19tHqoScxA==
X-Google-Smtp-Source: APiQypLzmGlA03x219T3xZy1EGY40BKB38ixzPKJvjbc7adByMGKD1o6ryoPg8v4s+b+V8BQZLYIAFbbFK4AyJNqI5g=
X-Received: by 2002:aca:1904:: with SMTP id l4mr32189058oii.106.1589479652784;
 Thu, 14 May 2020 11:07:32 -0700 (PDT)
MIME-Version: 1.0
References: <6cdf20c3-7b74-679c-0e6f-4d385d12f9fe@xilinx.com>
 <CAL_Jsq+ehJSK7sjqmKtWOVjr-QZ3LDB+ywCO85uF8WJ+cB=AAw@mail.gmail.com>
 <845e6a12-ca33-957f-debb-4a1fcec70742@xilinx.com> <CAL_JsqLMDqpkyg-Q7mUfw-XH67-v068Q6e9wTq2UOoN=0-_coQ@mail.gmail.com>
 <fefb0e66-b82e-23ec-1e81-471d590df032@xilinx.com>
In-Reply-To: <fefb0e66-b82e-23ec-1e81-471d590df032@xilinx.com>
From:   Rob Herring <robh@kernel.org>
Date:   Thu, 14 May 2020 13:07:21 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJksDAt7G_YfpB9P+5GLzf26M4CbcJ+YnjwekorNzSXtg@mail.gmail.com>
Message-ID: <CAL_JsqJksDAt7G_YfpB9P+5GLzf26M4CbcJ+YnjwekorNzSXtg@mail.gmail.com>
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

On Thu, Apr 30, 2020 at 6:13 AM Michal Simek <michal.simek@xilinx.com> wrote:
>
> On 29. 04. 20 16:55, Rob Herring wrote:
> > On Tue, Apr 28, 2020 at 8:51 AM Michal Simek <michal.simek@xilinx.com> wrote:
> >>
> >> On 28. 04. 20 15:23, Rob Herring wrote:
> >>> On Wed, Apr 1, 2020 at 4:23 AM Michal Simek <michal.simek@xilinx.com> wrote:
> >>>>
> >>>> Hi Rob and others,
> >>>>
> >>>> for couple of years already u-boot is using config node in root DT for
> >>>> u-boot configuration.
> >>>>
> >>>> Here is one example in u-boot source code.
> >>>> https://gitlab.denx.de/u-boot/u-boot/-/blob/master/arch/arm/dts/exynos5250-spring.dts#L47
> >>>>
> >>>> And here is dt binding description
> >>>> https://gitlab.denx.de/u-boot/u-boot/-/blob/master/doc/device-tree-bindings/config.txt
> >>>>
> >>>> I was checking dt binding specification and there no such a thing
> >>>> described there. It means I expect this is more adhoc u-boot solution.
> >>>> We have reached the point where could be beneficial to put some u-boot
> >>>> specific configurations to DT.
> >>>>
> >>>> Actually I have done similar thing some time ago too by using chosen
> >>>> node and add xilinx specific property there to point to eeprom.
> >>>> https://gitlab.denx.de/u-boot/u-boot/-/blob/master/arch/arm/dts/zynqmp-zcu102-revA.dts#L39
> >>>
> >>> In this case, I think an alias should be used as it's more of just a
> >>> shortcut to finding a specific node.
> >>
> >> What alias name do you suggest to use?
> >> We have systems where one i2c eeprom described based board and another
> >> i2c eeprom describe bootable module. And I need to have shotcuts to both
> >> of them.
> >>
> >> dt specification doesn't list any keywords for aliases but there is
> >> generic name recommendation.
> >
> > I do want make aliases a registered list of names.
> >
> >> Based on keywords it should look like this.
> >> eeprom0 = ...;
> >> eeprom1 = ...;
> >
> > That was my initial thought, but maybe "nvmemX" to be a bit more generic.
>
> I am fine with that. It means that multiple eeproms and order will be
> direct by alias number.
> In past I wanted to use list but aliases number is also fine.
>
> >
> >
> >>>> I think it is a time to discuss it and do it properly.
> >>>>
> >>>> First of all my question is where we could list SW prefixes to make sure
> >>>> that they are listed and everybody is aware about it. We have
> >>>> vendor-prefixes and we should have a way to record also prefixes for sw
> >>>> projects. U-Boot is using u-boot. Xen has file in the kernel with using
> >>>> xen prefix. At least these two should be listed.
> >>>
> >>> Documentation/devicetree/bindings/vendor-prefixes.yaml.
> >>
> >> thx
>
> Sent a patch for it. Please review.
> https://lore.kernel.org/linux-devicetree/85b8dc9e6288270bbfdf55f1c156dba160293f01.1588239081.git.michal.simek@xilinx.com/
>
>
> >>>> Next my question is what is the recommended way to pass sw specific
> >>>> parameters via DT? I think using chosen node is more appropriate then
> >>>> adhoc config node. Or is there a better way how this should be done?
> >>>
> >>> /chosen
> >>>
> >>> For vendor specific things though I would be cautious. If they are
> >>> settings for a specific device, then they probably belong in the
> >>> device's node. Second, are they really vendor specific? What we don't
> >>> want is each vendor doing the same thing in slightly different ways.
> >>
> >> For u-boot specific setting like - offsets it should be generic for
> >> everybody. I was already talking to Loic that for saving u-boot
> >> variables to QSPI we should be using MTD partition map and put there
> >> maybe a flag to say that this is the location for storing them.
> >
> > I'd standardize on the partition name.
>
> ok. Documentation/devicetree/bindings/mtd/partition.txt?
>
> I have grep u-boot repo and I see these label names
>
> "NAND.u-boot";
> "NAND.u-boot-env";
> "NAND.u-boot-env.backup1";
> "NAND.u-boot-spl-os";
> "QSPI.u-boot";
> "QSPI.u-boot-env";
> "QSPI.u-boot-env.backup1";
> "qspi-u-boot-img";
> "qspi-u-boot-spl";
> "QSPI.u-boot-spl-os";
> "u-boot
> "u-boot";
> "u-boot-2";
> "u-boot-2.backup1";
> "u-boot.backup1";
> "u-boot-env";
> "u-boot-env.backup1";
> "u-boot-spl";
>
> kernel is kind of similar
> "alt-u-boot";
> "alt-u-boot-env";
> "NAND.u-boot";
> "NAND.u-boot-env";
> "NAND.u-boot-env.backup1";
> "NAND.u-boot-spl-os";
> "QSPI.u-boot";
> "QSPI.u-boot-env";
> "QSPI.u-boot-env.backup1";
> "QSPI.u-boot-spl-os";
> "u-boot
> "u-boot";
> "u-boot.backup1";
> "u-boot-env";
> "u-boot-env2";
> "u-boot-env.backup1";
> "u-boot-environment";
> "u-boot-factory";
> "u-boot-nand";
> "u-boot-nor";
> "u-boot-spi";
> "u-boot-spl";
>
> It means it is mix of names. I think SPI cases are the most complicated
> one because you can have multiple spi devices in the system and you
> can't use the same name for registration.
>
> That's why I think that make sense to use an optional prefix as people
> are using QSPI/NAND already. But not quite sure that using QSPI is
> generic enough because you can have multiple QSPIs. Using alias name is
> also not ideal because one simple change in aliases would require
> changes in partition name/label.
> Any better suggestion?

Okay, that's a mess of names. I guess perhaps properties in /chosen
pointing to data would work. Then you just have to update that
property if you're switching partitions (using SPI vs. MMC or  for A/B
style partition switching). We should point to partitions rather than
raw offsets though.

One thing I'm not certain of is 'stdout-path' used a path string
rather than phandle. I'm not sure why. It may predate phandles or that
they weren't necessarily stable. Or just path string is more human
readable. So phandle vs. path/alias is something to figure out.

Rob

Return-Path: <SRS0=mbMJ=64=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00711C433E0
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 May 2020 18:47:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A61CA20657
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 May 2020 18:47:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=monstr-eu.20150623.gappssmtp.com header.i=@monstr-eu.20150623.gappssmtp.com header.b="kuxu7ZCJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727794AbgENSrN (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 14 May 2020 14:47:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726778AbgENSrN (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Thu, 14 May 2020 14:47:13 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80748C061A0C
        for <devicetree@vger.kernel.org>; Thu, 14 May 2020 11:47:12 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id d16so3246574edq.7
        for <devicetree@vger.kernel.org>; Thu, 14 May 2020 11:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=70aSJ51PQNlhZOjRExmQwzrV0KzWgV/zA/fKxeo33t4=;
        b=kuxu7ZCJ1VvaHRd5yjJ6Q63OlIuje/7WmoCuXELXHIxFkuHeGQnye56OswerMr3u/0
         6eLfzibtJsVJcmiuWU5BzU4+1m1f8nBnz6tv57dFYXXRT5iW2Nba1Zvm7CoLVe6UpLOn
         7YX523KfDUyW3eGzH0jZXrqCh811HsY0a9R80QlngnVBBCxOoGPeXdw4Of1/MhlwTOdf
         7BqIneRz/cZHXDVWJ0X0t2Xy1nde/DT/bUepBNguO63OLltY1DFSzcx2/nnJ4nP2F9qn
         Ski6aM99tqa7w5BJIt56MZevo9PzSDRgR2AQZ16c5ryEHkhTmPHo2Vf18BAw+e/Rj5DL
         YMqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=70aSJ51PQNlhZOjRExmQwzrV0KzWgV/zA/fKxeo33t4=;
        b=L1owS5kxsPI66M+xTJll7cgCacUA1PSwm2BSrKoxc38vcnK9A03z9nO2Vn5f4U/+kQ
         357Fclevlq1mbRi0DLQcowBgmAPTYCk25XHsifLt4IcBWOdrA/jNJxVOxxH4Cb9w9uHD
         Vx1EDyNEEoiiJnVGV540X2xLkcTrhiY8O0CEivNH9Gt31kTiIM9xXesRDsGvMUGdVxfr
         /r9vB261z46j0zESTmdew4OxhJeXpyVhhwMf78jmWyq2k/sWgGAHJWFhB8rtIVjpFHuv
         cSyoJqd1ztlt+ago7on0c1h8LbMjg1orMgMppCFXKqPLi1vw498qCYIlMhfz5UQFDu/G
         iK/g==
X-Gm-Message-State: AOAM530kKEnI0t+y6mWyfcQ3xaczMFv7USogd2ySZjZWbIBeClCo4ahw
        i1JiFJasCcWB9nerzWpVoGzHhas9prv0MQg6+ZnJtg==
X-Google-Smtp-Source: ABdhPJyhIBlfHd00kENrTCITZUwYPv8DGi8lYAWZBmp8BeDAHQWmTEUBEU8ZkUcmFsNK1+QKt/6XplE8rcHz/5rpJoA=
X-Received: by 2002:a05:6402:14d5:: with SMTP id f21mr5361690edx.327.1589482031055;
 Thu, 14 May 2020 11:47:11 -0700 (PDT)
MIME-Version: 1.0
References: <6cdf20c3-7b74-679c-0e6f-4d385d12f9fe@xilinx.com>
 <CAL_Jsq+ehJSK7sjqmKtWOVjr-QZ3LDB+ywCO85uF8WJ+cB=AAw@mail.gmail.com>
 <845e6a12-ca33-957f-debb-4a1fcec70742@xilinx.com> <CAL_JsqLMDqpkyg-Q7mUfw-XH67-v068Q6e9wTq2UOoN=0-_coQ@mail.gmail.com>
 <fefb0e66-b82e-23ec-1e81-471d590df032@xilinx.com> <CAL_JsqJksDAt7G_YfpB9P+5GLzf26M4CbcJ+YnjwekorNzSXtg@mail.gmail.com>
In-Reply-To: <CAL_JsqJksDAt7G_YfpB9P+5GLzf26M4CbcJ+YnjwekorNzSXtg@mail.gmail.com>
From:   Michal Simek <monstr@monstr.eu>
Date:   Thu, 14 May 2020 20:46:59 +0200
Message-ID: <CAHTX3d+c5kEQdoxc0vZ4h_eSpPrnxE0wtgEfOt8eaX2Gt7Oq1g@mail.gmail.com>
Subject: Re: u-boot DT configuration node
To:     Rob Herring <robh@kernel.org>
Cc:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
        Tom Rini <trini@konsulko.com>,
        Loic Poulain <loic.poulain@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

=C4=8Dt 14. 5. 2020 v 20:07 odes=C3=ADlatel Rob Herring <robh@kernel.org> n=
apsal:
>
> On Thu, Apr 30, 2020 at 6:13 AM Michal Simek <michal.simek@xilinx.com> wr=
ote:
> >
> > On 29. 04. 20 16:55, Rob Herring wrote:
> > > On Tue, Apr 28, 2020 at 8:51 AM Michal Simek <michal.simek@xilinx.com=
> wrote:
> > >>
> > >> On 28. 04. 20 15:23, Rob Herring wrote:
> > >>> On Wed, Apr 1, 2020 at 4:23 AM Michal Simek <michal.simek@xilinx.co=
m> wrote:
> > >>>>
> > >>>> Hi Rob and others,
> > >>>>
> > >>>> for couple of years already u-boot is using config node in root DT=
 for
> > >>>> u-boot configuration.
> > >>>>
> > >>>> Here is one example in u-boot source code.
> > >>>> https://gitlab.denx.de/u-boot/u-boot/-/blob/master/arch/arm/dts/ex=
ynos5250-spring.dts#L47
> > >>>>
> > >>>> And here is dt binding description
> > >>>> https://gitlab.denx.de/u-boot/u-boot/-/blob/master/doc/device-tree=
-bindings/config.txt
> > >>>>
> > >>>> I was checking dt binding specification and there no such a thing
> > >>>> described there. It means I expect this is more adhoc u-boot solut=
ion.
> > >>>> We have reached the point where could be beneficial to put some u-=
boot
> > >>>> specific configurations to DT.
> > >>>>
> > >>>> Actually I have done similar thing some time ago too by using chos=
en
> > >>>> node and add xilinx specific property there to point to eeprom.
> > >>>> https://gitlab.denx.de/u-boot/u-boot/-/blob/master/arch/arm/dts/zy=
nqmp-zcu102-revA.dts#L39
> > >>>
> > >>> In this case, I think an alias should be used as it's more of just =
a
> > >>> shortcut to finding a specific node.
> > >>
> > >> What alias name do you suggest to use?
> > >> We have systems where one i2c eeprom described based board and anoth=
er
> > >> i2c eeprom describe bootable module. And I need to have shotcuts to =
both
> > >> of them.
> > >>
> > >> dt specification doesn't list any keywords for aliases but there is
> > >> generic name recommendation.
> > >
> > > I do want make aliases a registered list of names.
> > >
> > >> Based on keywords it should look like this.
> > >> eeprom0 =3D ...;
> > >> eeprom1 =3D ...;
> > >
> > > That was my initial thought, but maybe "nvmemX" to be a bit more gene=
ric.
> >
> > I am fine with that. It means that multiple eeproms and order will be
> > direct by alias number.
> > In past I wanted to use list but aliases number is also fine.
> >
> > >
> > >
> > >>>> I think it is a time to discuss it and do it properly.
> > >>>>
> > >>>> First of all my question is where we could list SW prefixes to mak=
e sure
> > >>>> that they are listed and everybody is aware about it. We have
> > >>>> vendor-prefixes and we should have a way to record also prefixes f=
or sw
> > >>>> projects. U-Boot is using u-boot. Xen has file in the kernel with =
using
> > >>>> xen prefix. At least these two should be listed.
> > >>>
> > >>> Documentation/devicetree/bindings/vendor-prefixes.yaml.
> > >>
> > >> thx
> >
> > Sent a patch for it. Please review.
> > https://lore.kernel.org/linux-devicetree/85b8dc9e6288270bbfdf55f1c156db=
a160293f01.1588239081.git.michal.simek@xilinx.com/
> >
> >
> > >>>> Next my question is what is the recommended way to pass sw specifi=
c
> > >>>> parameters via DT? I think using chosen node is more appropriate t=
hen
> > >>>> adhoc config node. Or is there a better way how this should be don=
e?
> > >>>
> > >>> /chosen
> > >>>
> > >>> For vendor specific things though I would be cautious. If they are
> > >>> settings for a specific device, then they probably belong in the
> > >>> device's node. Second, are they really vendor specific? What we don=
't
> > >>> want is each vendor doing the same thing in slightly different ways=
.
> > >>
> > >> For u-boot specific setting like - offsets it should be generic for
> > >> everybody. I was already talking to Loic that for saving u-boot
> > >> variables to QSPI we should be using MTD partition map and put there
> > >> maybe a flag to say that this is the location for storing them.
> > >
> > > I'd standardize on the partition name.
> >
> > ok. Documentation/devicetree/bindings/mtd/partition.txt?
> >
> > I have grep u-boot repo and I see these label names
> >
> > "NAND.u-boot";
> > "NAND.u-boot-env";
> > "NAND.u-boot-env.backup1";
> > "NAND.u-boot-spl-os";
> > "QSPI.u-boot";
> > "QSPI.u-boot-env";
> > "QSPI.u-boot-env.backup1";
> > "qspi-u-boot-img";
> > "qspi-u-boot-spl";
> > "QSPI.u-boot-spl-os";
> > "u-boot
> > "u-boot";
> > "u-boot-2";
> > "u-boot-2.backup1";
> > "u-boot.backup1";
> > "u-boot-env";
> > "u-boot-env.backup1";
> > "u-boot-spl";
> >
> > kernel is kind of similar
> > "alt-u-boot";
> > "alt-u-boot-env";
> > "NAND.u-boot";
> > "NAND.u-boot-env";
> > "NAND.u-boot-env.backup1";
> > "NAND.u-boot-spl-os";
> > "QSPI.u-boot";
> > "QSPI.u-boot-env";
> > "QSPI.u-boot-env.backup1";
> > "QSPI.u-boot-spl-os";
> > "u-boot
> > "u-boot";
> > "u-boot.backup1";
> > "u-boot-env";
> > "u-boot-env2";
> > "u-boot-env.backup1";
> > "u-boot-environment";
> > "u-boot-factory";
> > "u-boot-nand";
> > "u-boot-nor";
> > "u-boot-spi";
> > "u-boot-spl";
> >
> > It means it is mix of names. I think SPI cases are the most complicated
> > one because you can have multiple spi devices in the system and you
> > can't use the same name for registration.
> >
> > That's why I think that make sense to use an optional prefix as people
> > are using QSPI/NAND already. But not quite sure that using QSPI is
> > generic enough because you can have multiple QSPIs. Using alias name is
> > also not ideal because one simple change in aliases would require
> > changes in partition name/label.
> > Any better suggestion?
>
> Okay, that's a mess of names. I guess perhaps properties in /chosen
> pointing to data would work. Then you just have to update that
> property if you're switching partitions (using SPI vs. MMC or  for A/B
> style partition switching). We should point to partitions rather than
> raw offsets though.

That means that when you deploy images this property doesn't need to be the=
re
and then your firmware (in our case u-boot) can fill this property
based on your logic.
I definitely want to avoid cases where we would need to maintain
different DTs for
different mode which would bring more overhead.

We should document these u-boot properties in the u-boot project for sure.
But there could also be the reason to do it in Linux because likely
these properties
will get to Linux dtses. Would be good to get some feedback on this.
And if we should
document it in Linux, path and name suggestions would be welcome.

> One thing I'm not certain of is 'stdout-path' used a path string
> rather than phandle. I'm not sure why. It may predate phandles or that
> they weren't necessarily stable. Or just path string is more human
> readable. So phandle vs. path/alias is something to figure out.

That's not a problem I will figure out.

Thanks,
Michal

--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs

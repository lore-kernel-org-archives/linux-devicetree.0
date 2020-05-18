Return-Path: <SRS0=92uP=7A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF28BC433DF
	for <linux-devicetree@archiver.kernel.org>; Mon, 18 May 2020 15:55:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9548820758
	for <linux-devicetree@archiver.kernel.org>; Mon, 18 May 2020 15:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1589817317;
	bh=LlPBKtM0kX2w8u5TS7zMOgzMRjJ0ApJEloecq5MvepY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=woO/xNSXQxs3ZqGhB/cHqIVi0k5OA2eyN7rilHRCO417t5aaB8JTL60mj9mKaFGQ7
	 W4tKKqeQvbSaG9YYd7uwiRVIoSZgHe55VeBTFrlvmhw4yiv81KjZRlsJd0aY0CjSUY
	 +nAsglYohQNWILHXQZ0TYw0vtMUPei9sCmG+T87Q=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727973AbgERPzR (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 18 May 2020 11:55:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:45348 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727005AbgERPzR (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 18 May 2020 11:55:17 -0400
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D3D07207E8
        for <devicetree@vger.kernel.org>; Mon, 18 May 2020 15:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589817315;
        bh=LlPBKtM0kX2w8u5TS7zMOgzMRjJ0ApJEloecq5MvepY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=pQPFY2iuenJ53U8cFA7secti799xtldCllZxmb+UGavntE5ykK0m1IKjSYj89Uiqq
         ETwEYSF+kaG/fklpkQvTwGP3BT66hpCLym/nDZM1dTGsI2+ykrMUEofI6kRYVW6phj
         8jz81XosmgBHJS9Phu05VXgpxtn/uyda03DgyYHM=
Received: by mail-ot1-f47.google.com with SMTP id d7so2082955ote.6
        for <devicetree@vger.kernel.org>; Mon, 18 May 2020 08:55:15 -0700 (PDT)
X-Gm-Message-State: AOAM533JcgkoJ0L4MAJcj+f2dH+TjeeNrb/RphUNqKm28KpbqpijfAIR
        jBMikLidScKKOoxmd2g2LO63yjvdNNd85jPJKg==
X-Google-Smtp-Source: ABdhPJybz2D23wKGr4m1qrUvP/yYT39FbTZHcTiQs3xbuK4pKj6RVrMvh5bD42iGGL80poHR5JKzXa5oRlIk8/sLP64=
X-Received: by 2002:a05:6830:18d9:: with SMTP id v25mr8755719ote.107.1589817315071;
 Mon, 18 May 2020 08:55:15 -0700 (PDT)
MIME-Version: 1.0
References: <6cdf20c3-7b74-679c-0e6f-4d385d12f9fe@xilinx.com>
 <CAL_Jsq+ehJSK7sjqmKtWOVjr-QZ3LDB+ywCO85uF8WJ+cB=AAw@mail.gmail.com>
 <845e6a12-ca33-957f-debb-4a1fcec70742@xilinx.com> <CAL_JsqLMDqpkyg-Q7mUfw-XH67-v068Q6e9wTq2UOoN=0-_coQ@mail.gmail.com>
 <fefb0e66-b82e-23ec-1e81-471d590df032@xilinx.com> <CAL_JsqJksDAt7G_YfpB9P+5GLzf26M4CbcJ+YnjwekorNzSXtg@mail.gmail.com>
 <CAHTX3d+c5kEQdoxc0vZ4h_eSpPrnxE0wtgEfOt8eaX2Gt7Oq1g@mail.gmail.com>
In-Reply-To: <CAHTX3d+c5kEQdoxc0vZ4h_eSpPrnxE0wtgEfOt8eaX2Gt7Oq1g@mail.gmail.com>
From:   Rob Herring <robh@kernel.org>
Date:   Mon, 18 May 2020 09:55:03 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLLVweHu3LE=FkZNFPFss4zqh4ByXRjVaGiXYY+q4gJjA@mail.gmail.com>
Message-ID: <CAL_JsqLLVweHu3LE=FkZNFPFss4zqh4ByXRjVaGiXYY+q4gJjA@mail.gmail.com>
Subject: Re: u-boot DT configuration node
To:     Michal Simek <monstr@monstr.eu>
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

On Thu, May 14, 2020 at 12:47 PM Michal Simek <monstr@monstr.eu> wrote:
>
> =C4=8Dt 14. 5. 2020 v 20:07 odes=C3=ADlatel Rob Herring <robh@kernel.org>=
 napsal:
> >
> > On Thu, Apr 30, 2020 at 6:13 AM Michal Simek <michal.simek@xilinx.com> =
wrote:
> > >
> > > On 29. 04. 20 16:55, Rob Herring wrote:
> > > > On Tue, Apr 28, 2020 at 8:51 AM Michal Simek <michal.simek@xilinx.c=
om> wrote:
> > > >>
> > > >> On 28. 04. 20 15:23, Rob Herring wrote:
> > > >>> On Wed, Apr 1, 2020 at 4:23 AM Michal Simek <michal.simek@xilinx.=
com> wrote:
> > > >>>>
> > > >>>> Hi Rob and others,
> > > >>>>
> > > >>>> for couple of years already u-boot is using config node in root =
DT for
> > > >>>> u-boot configuration.
> > > >>>>
> > > >>>> Here is one example in u-boot source code.
> > > >>>> https://gitlab.denx.de/u-boot/u-boot/-/blob/master/arch/arm/dts/=
exynos5250-spring.dts#L47
> > > >>>>
> > > >>>> And here is dt binding description
> > > >>>> https://gitlab.denx.de/u-boot/u-boot/-/blob/master/doc/device-tr=
ee-bindings/config.txt
> > > >>>>
> > > >>>> I was checking dt binding specification and there no such a thin=
g
> > > >>>> described there. It means I expect this is more adhoc u-boot sol=
ution.
> > > >>>> We have reached the point where could be beneficial to put some =
u-boot
> > > >>>> specific configurations to DT.
> > > >>>>
> > > >>>> Actually I have done similar thing some time ago too by using ch=
osen
> > > >>>> node and add xilinx specific property there to point to eeprom.
> > > >>>> https://gitlab.denx.de/u-boot/u-boot/-/blob/master/arch/arm/dts/=
zynqmp-zcu102-revA.dts#L39
> > > >>>
> > > >>> In this case, I think an alias should be used as it's more of jus=
t a
> > > >>> shortcut to finding a specific node.
> > > >>
> > > >> What alias name do you suggest to use?
> > > >> We have systems where one i2c eeprom described based board and ano=
ther
> > > >> i2c eeprom describe bootable module. And I need to have shotcuts t=
o both
> > > >> of them.
> > > >>
> > > >> dt specification doesn't list any keywords for aliases but there i=
s
> > > >> generic name recommendation.
> > > >
> > > > I do want make aliases a registered list of names.
> > > >
> > > >> Based on keywords it should look like this.
> > > >> eeprom0 =3D ...;
> > > >> eeprom1 =3D ...;
> > > >
> > > > That was my initial thought, but maybe "nvmemX" to be a bit more ge=
neric.
> > >
> > > I am fine with that. It means that multiple eeproms and order will be
> > > direct by alias number.
> > > In past I wanted to use list but aliases number is also fine.
> > >
> > > >
> > > >
> > > >>>> I think it is a time to discuss it and do it properly.
> > > >>>>
> > > >>>> First of all my question is where we could list SW prefixes to m=
ake sure
> > > >>>> that they are listed and everybody is aware about it. We have
> > > >>>> vendor-prefixes and we should have a way to record also prefixes=
 for sw
> > > >>>> projects. U-Boot is using u-boot. Xen has file in the kernel wit=
h using
> > > >>>> xen prefix. At least these two should be listed.
> > > >>>
> > > >>> Documentation/devicetree/bindings/vendor-prefixes.yaml.
> > > >>
> > > >> thx
> > >
> > > Sent a patch for it. Please review.
> > > https://lore.kernel.org/linux-devicetree/85b8dc9e6288270bbfdf55f1c156=
dba160293f01.1588239081.git.michal.simek@xilinx.com/
> > >
> > >
> > > >>>> Next my question is what is the recommended way to pass sw speci=
fic
> > > >>>> parameters via DT? I think using chosen node is more appropriate=
 then
> > > >>>> adhoc config node. Or is there a better way how this should be d=
one?
> > > >>>
> > > >>> /chosen
> > > >>>
> > > >>> For vendor specific things though I would be cautious. If they ar=
e
> > > >>> settings for a specific device, then they probably belong in the
> > > >>> device's node. Second, are they really vendor specific? What we d=
on't
> > > >>> want is each vendor doing the same thing in slightly different wa=
ys.
> > > >>
> > > >> For u-boot specific setting like - offsets it should be generic fo=
r
> > > >> everybody. I was already talking to Loic that for saving u-boot
> > > >> variables to QSPI we should be using MTD partition map and put the=
re
> > > >> maybe a flag to say that this is the location for storing them.
> > > >
> > > > I'd standardize on the partition name.
> > >
> > > ok. Documentation/devicetree/bindings/mtd/partition.txt?
> > >
> > > I have grep u-boot repo and I see these label names
> > >
> > > "NAND.u-boot";
> > > "NAND.u-boot-env";
> > > "NAND.u-boot-env.backup1";
> > > "NAND.u-boot-spl-os";
> > > "QSPI.u-boot";
> > > "QSPI.u-boot-env";
> > > "QSPI.u-boot-env.backup1";
> > > "qspi-u-boot-img";
> > > "qspi-u-boot-spl";
> > > "QSPI.u-boot-spl-os";
> > > "u-boot
> > > "u-boot";
> > > "u-boot-2";
> > > "u-boot-2.backup1";
> > > "u-boot.backup1";
> > > "u-boot-env";
> > > "u-boot-env.backup1";
> > > "u-boot-spl";
> > >
> > > kernel is kind of similar
> > > "alt-u-boot";
> > > "alt-u-boot-env";
> > > "NAND.u-boot";
> > > "NAND.u-boot-env";
> > > "NAND.u-boot-env.backup1";
> > > "NAND.u-boot-spl-os";
> > > "QSPI.u-boot";
> > > "QSPI.u-boot-env";
> > > "QSPI.u-boot-env.backup1";
> > > "QSPI.u-boot-spl-os";
> > > "u-boot
> > > "u-boot";
> > > "u-boot.backup1";
> > > "u-boot-env";
> > > "u-boot-env2";
> > > "u-boot-env.backup1";
> > > "u-boot-environment";
> > > "u-boot-factory";
> > > "u-boot-nand";
> > > "u-boot-nor";
> > > "u-boot-spi";
> > > "u-boot-spl";
> > >
> > > It means it is mix of names. I think SPI cases are the most complicat=
ed
> > > one because you can have multiple spi devices in the system and you
> > > can't use the same name for registration.
> > >
> > > That's why I think that make sense to use an optional prefix as peopl=
e
> > > are using QSPI/NAND already. But not quite sure that using QSPI is
> > > generic enough because you can have multiple QSPIs. Using alias name =
is
> > > also not ideal because one simple change in aliases would require
> > > changes in partition name/label.
> > > Any better suggestion?
> >
> > Okay, that's a mess of names. I guess perhaps properties in /chosen
> > pointing to data would work. Then you just have to update that
> > property if you're switching partitions (using SPI vs. MMC or  for A/B
> > style partition switching). We should point to partitions rather than
> > raw offsets though.
>
> That means that when you deploy images this property doesn't need to be t=
here
> and then your firmware (in our case u-boot) can fill this property
> based on your logic.
> I definitely want to avoid cases where we would need to maintain
> different DTs for
> different mode which would bring more overhead.

Not sure I follow. How would u-boot fill in properties it needs for
itself? The properties could be populated whenever the partitions are.
Just as stdout-path is populated when the uart node is.

> We should document these u-boot properties in the u-boot project for sure=
.
> But there could also be the reason to do it in Linux because likely
> these properties
> will get to Linux dtses. Would be good to get some feedback on this.

No problem with that as long as the properties are documented.

> And if we should
> document it in Linux, path and name suggestions would be welcome.

/chosen already has a schema in dt-schema[1]. Add it there or add a
chosen-u-boot.yaml.

Rob

[1] https://github.com/devicetree-org/dt-schema/blob/master/schemas/chosen.=
yaml

Return-Path: <SRS0=92uP=7A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0EB5C433DF
	for <linux-devicetree@archiver.kernel.org>; Mon, 18 May 2020 16:05:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A988E2065F
	for <linux-devicetree@archiver.kernel.org>; Mon, 18 May 2020 16:05:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=monstr-eu.20150623.gappssmtp.com header.i=@monstr-eu.20150623.gappssmtp.com header.b="DFSw8jmg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727040AbgERQFn (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 18 May 2020 12:05:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726958AbgERQFm (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 18 May 2020 12:05:42 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A30FC061A0C
        for <devicetree@vger.kernel.org>; Mon, 18 May 2020 09:05:42 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id f134so73658wmf.1
        for <devicetree@vger.kernel.org>; Mon, 18 May 2020 09:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20150623.gappssmtp.com; s=20150623;
        h=to:cc:references:from:autocrypt:subject:message-id:date:user-agent
         :mime-version:in-reply-to;
        bh=wppghXZGjrfZtaB5Lmci9H2hszJWc7s5qRs9DPc9Gzs=;
        b=DFSw8jmgx6mOigwsa8yKBtaW/3wMMVjdb8wc4H+Mt1abyk+dQ3dvg4iGt1XY3JBs77
         yxDwJxG+4aTXAaKYK2Xa0rhIHW83Hu2IJ0BN/EMh0UE95Bp3g29CWCssZMszhkuh0Ijf
         98o9Hh6X+w5UmUfMgKXrQhVw6+bBMYiGqIoEYTook0GuxFlTX6WLwSBhVFa0K+l9JreB
         UPFen3rLegO2LBo868hyFTTK1+XttdTi2b1PE6XCXLKzMknfyeO9Bz4+kE0tK6+Q1rAv
         3ECrzxy/laA+x/RG719GU+7tNEsidmpYDykSu9dPoNsRzQ54uYW1nsArc5KlaCkZaNGo
         Fc9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:autocrypt:subject
         :message-id:date:user-agent:mime-version:in-reply-to;
        bh=wppghXZGjrfZtaB5Lmci9H2hszJWc7s5qRs9DPc9Gzs=;
        b=GyOcSeHFttWbHgoPr0sAmqyEL4Q2o6fXd4FRpeFEo8SK2ftqR1VepxD3FX86mqVwrj
         l4XCtdNVwnQimG8rx2aLhHU101j+mT09gNib2fiEGFNttodwvGBSedNq5XasLpWfyGzI
         8a2rEymKqLReh88vkqkQ9KFf4zaqetL/3izUZVhI3hxnCfBBlsXFGzgyXrmwbJmnKJQW
         D+jKC/6jkL228RC2qb8TIujShbgtWGtz+H6MitspglFvNk21Nk/Upo7ukalajLItfTQt
         iAXy7Y70Qikk9IMCQKWg81+SGuGAc90eUJYuv+4+9w5o64VL5NKtdhnoi8FxqdWW4HjX
         V9dw==
X-Gm-Message-State: AOAM530qowcemaQ2a+LRf9HxzjsVoCZEyTjiFuD1OFvosdNzvMQlOSSn
        JEr1f/lTrHEkiN2ytnKmWtU4Jw==
X-Google-Smtp-Source: ABdhPJx1Z1QMnCFiaGOKOgmqa4TW2Ya603BB9ztxZIdc66ABQGxe/X7nkiSeDgj/SaWXjGGliDpRQg==
X-Received: by 2002:a1c:1c6:: with SMTP id 189mr77364wmb.47.1589817940654;
        Mon, 18 May 2020 09:05:40 -0700 (PDT)
Received: from [66.102.1.109] ([149.199.62.129])
        by smtp.gmail.com with ESMTPSA id k5sm16454032wrx.16.2020.05.18.09.05.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2020 09:05:39 -0700 (PDT)
To:     Rob Herring <robh@kernel.org>
Cc:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
        Tom Rini <trini@konsulko.com>,
        Loic Poulain <loic.poulain@linaro.org>
References: <6cdf20c3-7b74-679c-0e6f-4d385d12f9fe@xilinx.com>
 <CAL_Jsq+ehJSK7sjqmKtWOVjr-QZ3LDB+ywCO85uF8WJ+cB=AAw@mail.gmail.com>
 <845e6a12-ca33-957f-debb-4a1fcec70742@xilinx.com>
 <CAL_JsqLMDqpkyg-Q7mUfw-XH67-v068Q6e9wTq2UOoN=0-_coQ@mail.gmail.com>
 <fefb0e66-b82e-23ec-1e81-471d590df032@xilinx.com>
 <CAL_JsqJksDAt7G_YfpB9P+5GLzf26M4CbcJ+YnjwekorNzSXtg@mail.gmail.com>
 <CAHTX3d+c5kEQdoxc0vZ4h_eSpPrnxE0wtgEfOt8eaX2Gt7Oq1g@mail.gmail.com>
 <CAL_JsqLLVweHu3LE=FkZNFPFss4zqh4ByXRjVaGiXYY+q4gJjA@mail.gmail.com>
From:   Michal Simek <monstr@monstr.eu>
Autocrypt: addr=monstr@monstr.eu; keydata=
 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
 0Z1MQlmNcq2bhOMzTxuXX2NDzUZs4aqEyZQ=
Subject: Re: u-boot DT configuration node
Message-ID: <e9a791e9-a06f-ee6f-d94e-89d88c30ff14@monstr.eu>
Date:   Mon, 18 May 2020 18:05:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqLLVweHu3LE=FkZNFPFss4zqh4ByXRjVaGiXYY+q4gJjA@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="HGDQ61HxqkbHym4RW9MTfp52xCAnZ4MeA"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--HGDQ61HxqkbHym4RW9MTfp52xCAnZ4MeA
Content-Type: multipart/mixed; boundary="ZjFb4XDR53fPCKtBJsMOXEtC0CdUdv3cX";
 protected-headers="v1"
From: Michal Simek <monstr@monstr.eu>
To: Rob Herring <robh@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>, Tom Rini
 <trini@konsulko.com>, Loic Poulain <loic.poulain@linaro.org>
Message-ID: <e9a791e9-a06f-ee6f-d94e-89d88c30ff14@monstr.eu>
Subject: Re: u-boot DT configuration node
References: <6cdf20c3-7b74-679c-0e6f-4d385d12f9fe@xilinx.com>
 <CAL_Jsq+ehJSK7sjqmKtWOVjr-QZ3LDB+ywCO85uF8WJ+cB=AAw@mail.gmail.com>
 <845e6a12-ca33-957f-debb-4a1fcec70742@xilinx.com>
 <CAL_JsqLMDqpkyg-Q7mUfw-XH67-v068Q6e9wTq2UOoN=0-_coQ@mail.gmail.com>
 <fefb0e66-b82e-23ec-1e81-471d590df032@xilinx.com>
 <CAL_JsqJksDAt7G_YfpB9P+5GLzf26M4CbcJ+YnjwekorNzSXtg@mail.gmail.com>
 <CAHTX3d+c5kEQdoxc0vZ4h_eSpPrnxE0wtgEfOt8eaX2Gt7Oq1g@mail.gmail.com>
 <CAL_JsqLLVweHu3LE=FkZNFPFss4zqh4ByXRjVaGiXYY+q4gJjA@mail.gmail.com>
In-Reply-To: <CAL_JsqLLVweHu3LE=FkZNFPFss4zqh4ByXRjVaGiXYY+q4gJjA@mail.gmail.com>

--ZjFb4XDR53fPCKtBJsMOXEtC0CdUdv3cX
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 18. 05. 20 17:55, Rob Herring wrote:
> On Thu, May 14, 2020 at 12:47 PM Michal Simek <monstr@monstr.eu> wrote:=

>>
>> =C4=8Dt 14. 5. 2020 v 20:07 odes=C3=ADlatel Rob Herring <robh@kernel.o=
rg> napsal:
>>>
>>> On Thu, Apr 30, 2020 at 6:13 AM Michal Simek <michal.simek@xilinx.com=
> wrote:
>>>>
>>>> On 29. 04. 20 16:55, Rob Herring wrote:
>>>>> On Tue, Apr 28, 2020 at 8:51 AM Michal Simek <michal.simek@xilinx.c=
om> wrote:
>>>>>>
>>>>>> On 28. 04. 20 15:23, Rob Herring wrote:
>>>>>>> On Wed, Apr 1, 2020 at 4:23 AM Michal Simek <michal.simek@xilinx.=
com> wrote:
>>>>>>>>
>>>>>>>> Hi Rob and others,
>>>>>>>>
>>>>>>>> for couple of years already u-boot is using config node in root =
DT for
>>>>>>>> u-boot configuration.
>>>>>>>>
>>>>>>>> Here is one example in u-boot source code.
>>>>>>>> https://gitlab.denx.de/u-boot/u-boot/-/blob/master/arch/arm/dts/=
exynos5250-spring.dts#L47
>>>>>>>>
>>>>>>>> And here is dt binding description
>>>>>>>> https://gitlab.denx.de/u-boot/u-boot/-/blob/master/doc/device-tr=
ee-bindings/config.txt
>>>>>>>>
>>>>>>>> I was checking dt binding specification and there no such a thin=
g
>>>>>>>> described there. It means I expect this is more adhoc u-boot sol=
ution.
>>>>>>>> We have reached the point where could be beneficial to put some =
u-boot
>>>>>>>> specific configurations to DT.
>>>>>>>>
>>>>>>>> Actually I have done similar thing some time ago too by using ch=
osen
>>>>>>>> node and add xilinx specific property there to point to eeprom.
>>>>>>>> https://gitlab.denx.de/u-boot/u-boot/-/blob/master/arch/arm/dts/=
zynqmp-zcu102-revA.dts#L39
>>>>>>>
>>>>>>> In this case, I think an alias should be used as it's more of jus=
t a
>>>>>>> shortcut to finding a specific node.
>>>>>>
>>>>>> What alias name do you suggest to use?
>>>>>> We have systems where one i2c eeprom described based board and ano=
ther
>>>>>> i2c eeprom describe bootable module. And I need to have shotcuts t=
o both
>>>>>> of them.
>>>>>>
>>>>>> dt specification doesn't list any keywords for aliases but there i=
s
>>>>>> generic name recommendation.
>>>>>
>>>>> I do want make aliases a registered list of names.
>>>>>
>>>>>> Based on keywords it should look like this.
>>>>>> eeprom0 =3D ...;
>>>>>> eeprom1 =3D ...;
>>>>>
>>>>> That was my initial thought, but maybe "nvmemX" to be a bit more ge=
neric.
>>>>
>>>> I am fine with that. It means that multiple eeproms and order will b=
e
>>>> direct by alias number.
>>>> In past I wanted to use list but aliases number is also fine.
>>>>
>>>>>
>>>>>
>>>>>>>> I think it is a time to discuss it and do it properly.
>>>>>>>>
>>>>>>>> First of all my question is where we could list SW prefixes to m=
ake sure
>>>>>>>> that they are listed and everybody is aware about it. We have
>>>>>>>> vendor-prefixes and we should have a way to record also prefixes=
 for sw
>>>>>>>> projects. U-Boot is using u-boot. Xen has file in the kernel wit=
h using
>>>>>>>> xen prefix. At least these two should be listed.
>>>>>>>
>>>>>>> Documentation/devicetree/bindings/vendor-prefixes.yaml.
>>>>>>
>>>>>> thx
>>>>
>>>> Sent a patch for it. Please review.
>>>> https://lore.kernel.org/linux-devicetree/85b8dc9e6288270bbfdf55f1c15=
6dba160293f01.1588239081.git.michal.simek@xilinx.com/
>>>>
>>>>
>>>>>>>> Next my question is what is the recommended way to pass sw speci=
fic
>>>>>>>> parameters via DT? I think using chosen node is more appropriate=
 then
>>>>>>>> adhoc config node. Or is there a better way how this should be d=
one?
>>>>>>>
>>>>>>> /chosen
>>>>>>>
>>>>>>> For vendor specific things though I would be cautious. If they ar=
e
>>>>>>> settings for a specific device, then they probably belong in the
>>>>>>> device's node. Second, are they really vendor specific? What we d=
on't
>>>>>>> want is each vendor doing the same thing in slightly different wa=
ys.
>>>>>>
>>>>>> For u-boot specific setting like - offsets it should be generic fo=
r
>>>>>> everybody. I was already talking to Loic that for saving u-boot
>>>>>> variables to QSPI we should be using MTD partition map and put the=
re
>>>>>> maybe a flag to say that this is the location for storing them.
>>>>>
>>>>> I'd standardize on the partition name.
>>>>
>>>> ok. Documentation/devicetree/bindings/mtd/partition.txt?
>>>>
>>>> I have grep u-boot repo and I see these label names
>>>>
>>>> "NAND.u-boot";
>>>> "NAND.u-boot-env";
>>>> "NAND.u-boot-env.backup1";
>>>> "NAND.u-boot-spl-os";
>>>> "QSPI.u-boot";
>>>> "QSPI.u-boot-env";
>>>> "QSPI.u-boot-env.backup1";
>>>> "qspi-u-boot-img";
>>>> "qspi-u-boot-spl";
>>>> "QSPI.u-boot-spl-os";
>>>> "u-boot
>>>> "u-boot";
>>>> "u-boot-2";
>>>> "u-boot-2.backup1";
>>>> "u-boot.backup1";
>>>> "u-boot-env";
>>>> "u-boot-env.backup1";
>>>> "u-boot-spl";
>>>>
>>>> kernel is kind of similar
>>>> "alt-u-boot";
>>>> "alt-u-boot-env";
>>>> "NAND.u-boot";
>>>> "NAND.u-boot-env";
>>>> "NAND.u-boot-env.backup1";
>>>> "NAND.u-boot-spl-os";
>>>> "QSPI.u-boot";
>>>> "QSPI.u-boot-env";
>>>> "QSPI.u-boot-env.backup1";
>>>> "QSPI.u-boot-spl-os";
>>>> "u-boot
>>>> "u-boot";
>>>> "u-boot.backup1";
>>>> "u-boot-env";
>>>> "u-boot-env2";
>>>> "u-boot-env.backup1";
>>>> "u-boot-environment";
>>>> "u-boot-factory";
>>>> "u-boot-nand";
>>>> "u-boot-nor";
>>>> "u-boot-spi";
>>>> "u-boot-spl";
>>>>
>>>> It means it is mix of names. I think SPI cases are the most complica=
ted
>>>> one because you can have multiple spi devices in the system and you
>>>> can't use the same name for registration.
>>>>
>>>> That's why I think that make sense to use an optional prefix as peop=
le
>>>> are using QSPI/NAND already. But not quite sure that using QSPI is
>>>> generic enough because you can have multiple QSPIs. Using alias name=
 is
>>>> also not ideal because one simple change in aliases would require
>>>> changes in partition name/label.
>>>> Any better suggestion?
>>>
>>> Okay, that's a mess of names. I guess perhaps properties in /chosen
>>> pointing to data would work. Then you just have to update that
>>> property if you're switching partitions (using SPI vs. MMC or  for A/=
B
>>> style partition switching). We should point to partitions rather than=

>>> raw offsets though.
>>
>> That means that when you deploy images this property doesn't need to b=
e there
>> and then your firmware (in our case u-boot) can fill this property
>> based on your logic.
>> I definitely want to avoid cases where we would need to maintain
>> different DTs for
>> different mode which would bring more overhead.
>=20
> Not sure I follow. How would u-boot fill in properties it needs for
> itself? The properties could be populated whenever the partitions are.
> Just as stdout-path is populated when the uart node is.

If you look at all xilinx evalution boards then you can find out that at
least 3 boot modes are supported on all of them. And we use the same
boot images irrespective of bootmode selection. For example you have
zcu102 and boot image (called boot.bin). If you copy boot.bin to fat32
partition on sd, or write it to qspi, etc. It is the same image all the
time.
But doesn't make sense to save u-boot variables or look for boot script
in qspi if you boot from SD boot mode. I mean if you explicitly say that
via DT property then fine but if this property is not there u-boot
should be looking for it and bootmode should have priority.

Exactly how for example in u-boot distro boot works. You boot from sd,
than sd is your first location to look at. If you boot from qspi then
look at qspi, etc.

>=20
>> We should document these u-boot properties in the u-boot project for s=
ure.
>> But there could also be the reason to do it in Linux because likely
>> these properties
>> will get to Linux dtses. Would be good to get some feedback on this.
>=20
> No problem with that as long as the properties are documented.
>=20
>> And if we should
>> document it in Linux, path and name suggestions would be welcome.
>=20
> /chosen already has a schema in dt-schema[1]. Add it there or add a
> chosen-u-boot.yaml.

good.

Thanks,
Michal

--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs



--ZjFb4XDR53fPCKtBJsMOXEtC0CdUdv3cX--

--HGDQ61HxqkbHym4RW9MTfp52xCAnZ4MeA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQQbPNTMvXmYlBPRwx7KSWXLKUoMIQUCXsKySQAKCRDKSWXLKUoM
IWP1AJ954x9EjUGlz34c/wOs3s7FspE8iQCfe6K+AQ1C4NkPmNRSzF3rpbocwQ4=
=2oEv
-----END PGP SIGNATURE-----

--HGDQ61HxqkbHym4RW9MTfp52xCAnZ4MeA--

Return-Path: <SRS0=KHJB=AD=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04B7FC433E0
	for <linux-devicetree@archiver.kernel.org>; Mon, 22 Jun 2020 13:32:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D933F20732
	for <linux-devicetree@archiver.kernel.org>; Mon, 22 Jun 2020 13:32:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yzWbEtJw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728339AbgFVNcw (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 22 Jun 2020 09:32:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728929AbgFVNcw (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 22 Jun 2020 09:32:52 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4ABEC061573
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2020 06:32:50 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id rk21so1644302ejb.2
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2020 06:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=DN+aIrNNSN4VZvLqRGfauOKkPbvay1cyyn1lN95aoco=;
        b=yzWbEtJwrPJKbiLaeKXvfuyfqHafyIJ0bgC41vGAyu4gMBeHvixHGOIY9b7msORZoo
         wgtBscreEdbMak8oBnBE/57VEdZZ8e3gi+zE5xNhaONMl4nICm+WQ/bOgND3hBWVGF84
         bhX8Q24cJRWVUqFoOaH/JxqIFsQoHcvI47ML1OyjHfTBECvN3Y+SYOKtFEnxPWZYUaZr
         FBg16HOe1Et13yABN5E9jsCdWGHut4nAbIX77+6qvR+jDbUqzLr9Uobe2VmwCfBHTP0Y
         Tv2p91wpWva9Oi7rg8lX2rHkyEHHVIBQg09sHId/rc0w16tEHglt+mlZSsDLY8PI0/Uh
         fF5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=DN+aIrNNSN4VZvLqRGfauOKkPbvay1cyyn1lN95aoco=;
        b=XxVkeBnklOBgr7IwqDYw+R29uDtck4FTx5YXbhvfJ0Wcw3je8EtROwSu7KHSKCxoTu
         Fd61zrYQC9IXP3QpEg8flgY5QekW2QoXecV4Y7/69+asYNAgyBRuBDEnSK7R0inmhD3e
         SFJbYgLVnmy+0o4VxVmOOzPW60Ofkbmae4Zy3gZmvp9WmXD89AMVSLsR2nSd4uJXJN3I
         J5avqou4smCOtkrM5deYdGsXiH6OUG48lZCOax3j08bG8zcGMMWCsAfTdSY036Wy4Lla
         NT2r7gXK3kOcRnZrur9v6RJnI+4Jh+jZNuhUDfx0tem0f51Rbclq+F651O6deAJp796i
         oepw==
X-Gm-Message-State: AOAM532RYPnMrgTrp1O/UhjwEIuQ4bDPPXdP47UhXWdl8mIA7Xt/RMj4
        fyCSDyx9UQIJaAsAbTrQFoA3VQ==
X-Google-Smtp-Source: ABdhPJwQskSgfiCPBZPphv6mJbhvwfrvXYjmrfJ2WkcPKDBC2x2YMZVtMkHmBAfue4WjvYFeKgFQjw==
X-Received: by 2002:a17:907:1104:: with SMTP id qu4mr15187950ejb.382.1592832769399;
        Mon, 22 Jun 2020 06:32:49 -0700 (PDT)
Received: from [192.168.2.2] (ppp089210109128.access.hol.gr. [89.210.109.128])
        by smtp.gmail.com with ESMTPSA id u19sm4810426edd.62.2020.06.22.06.32.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Jun 2020 06:32:48 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH 1/2] dt-bindings: sound: Device tree bindings for the
 apq8039 sound complex
From:   Pantelis Antoniou <pantelis.antoniou@linaro.org>
In-Reply-To: <20200622120409.GD4560@sirena.org.uk>
Date:   Mon, 22 Jun 2020 16:32:46 +0300
Cc:     Stephan Gerhold <stephan@gerhold.net>, alsa-devel@alsa-project.org,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Matthew Porter <mporter@konsulko.com>,
        Shawn Guo <shawn.guo@linaro.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <519B5FAC-4DB8-4968-B9D4-96E376D74F1E@linaro.org>
References: <20200619193831.12528-1-pantelis.antoniou@linaro.org>
 <20200619193831.12528-2-pantelis.antoniou@linaro.org>
 <20200619214126.GA1251@gerhold.net>
 <2070B433-83E0-4ACE-A470-36401934FC5A@linaro.org>
 <20200622120409.GD4560@sirena.org.uk>
To:     Mark Brown <broonie@kernel.org>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Mark,


> On Jun 22, 2020, at 15:04 , Mark Brown <broonie@kernel.org> wrote:
>=20
> On Mon, Jun 22, 2020 at 02:34:23PM +0300, Pantelis Antoniou wrote:
>=20
>>> This looks much like a replacement for ALSA UCM and userspace audio =
jack
>>> detection coded into the device tree.
>=20
>> I wouldn=E2=80=99t call it a replacement exactly. It=E2=80=99s merely =
a way to bundle all
>> of this information about codec glue in the kernel (where it should =
belong IMO).
>=20
> No, you're encoding use case decisions into the DT here - for example
> your example will break use cases like ring tones and shutter sounds
> which should play through both speaker and headphones.  It's also
> setting volumes which may be inappropriate or may be not and =
interferes
> with userspace using those same physical volume controls.

It is completely optional whether you use this functionality or not.

In that case you don=E2=80=99t use the automatic routing you merely set =
it to off
and everything works as before. Or you merely use the route setup for
the function from userspace.

The device in question is not a mobile phone so there is no requirement
to have speaker and headphone active at the same time. It is possible to
create a function that would be headphone+speaker active at the same =
time
for that case.

Regards

=E2=80=94 Pantelis


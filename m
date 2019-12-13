Return-Path: <SRS0=VR/D=2D=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FFB2C43603
	for <linux-devicetree@archiver.kernel.org>; Fri, 13 Dec 2019 07:04:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 631102077B
	for <linux-devicetree@archiver.kernel.org>; Fri, 13 Dec 2019 07:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1576220655;
	bh=CZ/7eswAiedF4nd0ssGIMpgBSy8FwLDfcxIHRmihe1A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-ID:From;
	b=UZ7gcRGk78vy/zO2J3HbVGCko0Sp3W3mmAE8f6EPoFrRTHigeRXzRbnKG2yT73iUQ
	 BZqrRhWraKtzp3tosBlTQlJzZgS/XrbSqEEVTaWwrLyfU9l0mSyv0AtxhawcAt1qco
	 PV1XfFlt0tYi8a2FzEjCfmafU4c7+0kJCC/2lKMI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726016AbfLMHEO (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 13 Dec 2019 02:04:14 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:44346 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725991AbfLMHEO (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 13 Dec 2019 02:04:14 -0500
Received: by mail-lf1-f66.google.com with SMTP id v201so1135443lfa.11;
        Thu, 12 Dec 2019 23:04:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=eH240sD43iWskdXO7QwdUUcc+Sa2LsEm2jXeYjhezwI=;
        b=mEO24JaZRKyTk+K6PipxWEABn0ls/zib9DvmbeY3hHz7zZhq5l8oER8RXkj7b/PuW1
         mKh1OjMhbUWPe6aUUOt0l/2f+6EomEa9Wq9zYlfJfbil0TxaiSY9P0PN8eNRYjLViOXh
         RFz5aaIp7dNls3jDzfZt/ZBe25QeyQGaJjxKQiWiS0lLfhs/GzGAI4vK8IXm4dltl/JE
         kAXNEDSjBvLGvSy6tL8mFVYRmNmG2IDoyJLUdYISqk0B8agUwoqpKiW30tko41uBH9Q+
         J1iX7CIX/8e8aQefdQIn+1CFCgQwXZB+A2pEz5gGvg/91QP6XVj7jWSx5TQky7Wlgxag
         +rfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=eH240sD43iWskdXO7QwdUUcc+Sa2LsEm2jXeYjhezwI=;
        b=h4s3zLzmUvBNhgmHzJ0jNykdr9mW/jldvq5zYK+2HayN93lqCD7kScP57D1vM7F891
         9yVBn8p4I4qJS0tqimBhc6UNkkJPBlKZ81VQer15pHnT3ISH2P2MfGBzmabm5FiQ0neA
         A9FH01kX2mfBJMV3Ga3ove7+rPk//tHUKUprjkSFYoHIWJBZXjX84zCFxshdxu2+wTQM
         Mflw0bh0KpV1sqdLcliifJjhF7Q+wzUl0KZjQk5Xwzytz37BX/DN75ORoO6hnukSOHed
         KCaWTVobFaXIBSk3gGQLSqk4WiTXbC+Yd+RJgNas9iJV5ml2QPRnnHAt2tsHjv013xZr
         oocg==
X-Gm-Message-State: APjAAAWB4/RX+GPg8CgU9wng/LbB01SLFZlFdsF0uDHr1/ILvAF5h3ca
        EFJuwQeu14dQ7vVdcClPJeQ=
X-Google-Smtp-Source: APXvYqz8AyOKUmi4nJd1RE9+Qmbd5XDuYdIdRs/wc3kynUUkLpVW4tnrZkxUUD9FLdsQzUTPfmTfgQ==
X-Received: by 2002:a19:c1c1:: with SMTP id r184mr8103756lff.128.1576220652008;
        Thu, 12 Dec 2019 23:04:12 -0800 (PST)
Received: from saruman (88-113-215-33.elisa-laajakaista.fi. [88.113.215.33])
        by smtp.gmail.com with ESMTPSA id h18sm4210612ljk.94.2019.12.12.23.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2019 23:04:10 -0800 (PST)
From:   Felipe Balbi <balbi@kernel.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb\@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree\@vger.kernel.org" <devicetree@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     John Youn <John.Youn@synopsys.com>
Subject: Re: [RFC PATCH 13/14] usb: devicetree: dwc3: Add property to disable mult TRB fetch
In-Reply-To: <6193f738-03ac-51b5-cdf0-d9b252a50146@synopsys.com>
References: <cover.1576118671.git.thinhn@synopsys.com> <b791f032edb8e6a739c342dbd0d2d5faa66ddfb8.1576118671.git.thinhn@synopsys.com> <87mubyvtuh.fsf@kernel.org> <6193f738-03ac-51b5-cdf0-d9b252a50146@synopsys.com>
Date:   Fri, 13 Dec 2019 09:04:54 +0200
Message-ID: <87d0cswvs9.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Thinh Nguyen <Thinh.Nguyen@synopsys.com> writes:
>> Thinh Nguyen <Thinh.Nguyen@synopsys.com> writes:
>>> DWC_usb32 has a feature where it can issue multiple TRB fetch requests.
>>> Add a new property to limit and only do only single TRB fetch request.
>>>
>>> Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
>>> ---
>>>   Documentation/devicetree/bindings/usb/dwc3.txt | 2 ++
>>>   1 file changed, 2 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documenta=
tion/devicetree/bindings/usb/dwc3.txt
>>> index ff35fa6de2eb..29d6f9b1fc70 100644
>>> --- a/Documentation/devicetree/bindings/usb/dwc3.txt
>>> +++ b/Documentation/devicetree/bindings/usb/dwc3.txt
>>> @@ -108,6 +108,8 @@ Optional properties:
>>>    - snps,num-trb-prefetch: max value to do TRBs cache for DWC_usb32. T=
he value
>>>   			can be from 1 to DWC_USB32_CACHE_TRBS_PER_TRANSFER.
>>>   			Default value is DWC_USB32_CACHE_TRBS_PER_TRANSFER.
>>> + - snps,dis-mult-trb-fetch: set to issue only single TRB fetch request=
 in
>>> +			DWC_usb32.
>> two questions:
>>
>> - how is this different from passing 1 to the previous DT binding
>
> The previous DT binding is related to the number TRBs to cache while=20
> this one is related to whether the controller will send multiple=20
> (internal) fetch commands to fetch the TRBs.
>
>> - do we know of anybody having issues with multi-trb prefetch?
>
> No, we added this for various internal tests.

We really a better way for you guys to have your test coverage enabled
with upstream kernel. I wonder if DT guys would accept a set of bindings
marked as "for testing purposes". In any case, we really need to enable
Silicon Validation with upstream kernel.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl3zOBYACgkQzL64meEa
mQa/+BAAlFkcIcEqavcePYa5Pe8cqpbuMP2uRZacvCV88KaalWMKKG0fsz3W4Wn8
BOrxG8ux+gEC+9P68n4JOBJZXISeC42XPBnm4A+3dYwy1Js5p0mSCXeR9+Q4tqZd
JW5gZtTX+uc3ehgUV3A5NBdTvmfEAif/tLfdxQOx7+euOtLjYDHhvnv1tAXyZ7/T
zCeq25QIb7+hJl56ZDcS7NK+mO0eK19JpFKvcGhJldFGbhQ9bdMoJaPQqZj7K/J1
DhPv5q92N6wl67UICuKTp8Nrr8vtKFZxRATXOHU2KrF8PWZklPooL1GedzPf9GDS
GNPkfaWGhXnJuRq+6AZIj5zFEzhh5sqvKFA8Hn/mV5RgzasLeLok/wb00GtIXMkP
OBzzBJPEtb05aownQ+Sk/TfSB0eobD6/TDg0Q8C3D+H8G325EhxBncFXpg1bv0b/
1wtKE/pknHWFsyt0rBMxXYpKO7kwPSAJzIXVE7Q9vP2/zIalT1D1N7dBM/KKlTbq
xOL7j1x3+JhTKtR+cPAXEvVs1/4AZk6fYA0M/VWjldsavay6udA5zVn5xgkDNUXT
3gBwj3v8nQTsbNIrqLKQhlNBgGGYgP2NvXfgf+Jy3qxegAAqUY+RoQBklom6zWtP
zyhfU5GlsA4s6hGV2g3mQGYr56DOjsm73XElUMTe1PAD0b3O0SA=
=IuyY
-----END PGP SIGNATURE-----
--=-=-=--

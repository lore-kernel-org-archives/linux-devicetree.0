Return-Path: <SRS0=jMr8=BA=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BDA0C433E5
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Jul 2020 09:48:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7910E2072E
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Jul 2020 09:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1595324887;
	bh=fewzulx0sXM9hu4e0oE2cq/l0SHIfo9dR9WvWfCLC38=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-ID:From;
	b=oyodoJ1XklmWCj3sIDen/Uad+eIRhmcm6rD+xcM7JJQQz+aRScAmzNiDH1UlICOKb
	 wwIgg0McSl/jMYEof0ZeX1c+V5wf3eQWQUGpJC853ntD0hlCb4UCiv82UoofuKkYCN
	 JtqEmms32y3ElGwr3eo0el9DQDmTbAO5sU69oNJU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729010AbgGUJsH (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 21 Jul 2020 05:48:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728963AbgGUJsG (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 21 Jul 2020 05:48:06 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B941C061794;
        Tue, 21 Jul 2020 02:48:06 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id i19so6086515lfj.8;
        Tue, 21 Jul 2020 02:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=7wunV2ExdV89dWEoZPnYy/3JPsFVGoQ7tDA3ou4ObdQ=;
        b=sPMrBqUcqLyd18Nf5OihoaB26bn/O/uwHcKyIMuRfy1j5mV9D83Dx3qQqiI53LjZ39
         WErNKKJHGPufEGjgj/epsZLv3T6gcHrFoP8EmLZqfm1hK93jUvSDZa5AVZKDBUMz1X/5
         59h4CstrQhEoG6cNF+Web7BLarRz2jg7BavRxiMN5URiV7it6uAnHEOsP1skd0NhPw3v
         gzv7siKwnAVpoxUlMDS1ZbjUUjtF0OmZ23xFbImBRoKJhnxl/1nQ1fJjns9LwwkWE6R1
         uKWYXwmnluw9B7VBzCgn1kDIhHoo1Mf90mMRFCdOn+A3EhmJBuJrXuxdz8Si9v0BsC8f
         IV/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=7wunV2ExdV89dWEoZPnYy/3JPsFVGoQ7tDA3ou4ObdQ=;
        b=p4inFEd41ohnUGfQT5Za+pndOrx+Yg0Tofkx78hh4AwvmM1Plap/gkikWWkkc90QLx
         bwECWzE4793hhLqy8R1o60svvJm2D1ycW/GCdCoQduQL5GcdE0FjRjY0td+7Rb/UeggW
         GIJ6sWGJvAX0Y+98wS3JQ7++TIYU4Yf46JMVkb0UfxiKKNgbkrAxu0mE79h0fNThBI4X
         UK8X01FprcVP08pbh0iSQEL/DG3k5neszmXwSFXG/odbauycW6oB3jIXFgKpJ7uBsUxa
         mLaMZtud3U2l22amyHLncPD5/HJyjLjF9rz1Ll8ppEEbbS8a83A5YNZ52gMZ9HjMZXaG
         F3Yg==
X-Gm-Message-State: AOAM5330prt6x+hvY1QKOxmUCJlWfT05xFtVI9MLszysjObEJQabmJ3S
        oqeQY5UH5+xcLCrn7WTGR4crDhUcLuRfpA==
X-Google-Smtp-Source: ABdhPJynB8qlKtpSomVyCX1Z2Rp34rWVjRCdLC/W6YvpOF2RYCUh8DCFP3S2yyWzCBX+v+Px3ubKIg==
X-Received: by 2002:a05:6512:74f:: with SMTP id c15mr13283968lfs.26.1595324884741;
        Tue, 21 Jul 2020 02:48:04 -0700 (PDT)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
        by smtp.gmail.com with ESMTPSA id d23sm4964236lfm.85.2020.07.21.02.48.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Jul 2020 02:48:03 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     Tejas Joglekar <Tejas.Joglekar@synopsys.com>,
        Tejas Joglekar <Tejas.Joglekar@synopsys.com>,
        Rob Herring <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>
Cc:     "linux-usb\@vger.kernel.org" <linux-usb@vger.kernel.org>,
        John Youn <John.Youn@synopsys.com>,
        "gregkh\@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "devicetree\@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v3 3/4] usb: dwc3: Add device property sgl-trb-cache-size-quirk
In-Reply-To: <2f61133b-319d-80dc-f3f3-7e08e0228953@synopsys.com>
References: <cover.1590415123.git.joglekar@synopsys.com> <83eba2e9f0069f20ccc94537e3b99cbaec209441.1590415123.git.joglekar@synopsys.com> <5534d9d6-5452-dade-e46e-f4b0910becdb@synopsys.com> <877dvhqh2e.fsf@kernel.org> <2f61133b-319d-80dc-f3f3-7e08e0228953@synopsys.com>
Date:   Tue, 21 Jul 2020 12:47:59 +0300
Message-ID: <878sfdp5bk.fsf@kernel.org>
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

Tejas Joglekar <Tejas.Joglekar@synopsys.com> writes:

> Hi Rob,
>
> On 7/6/2020 12:13 PM, Felipe Balbi wrote:
>>=20
>> Hi,
>>=20
>> Tejas Joglekar <Tejas.Joglekar@synopsys.com> writes:
>>>> @@ -95,6 +95,10 @@ int dwc3_host_init(struct dwc3 *dwc)
>>>>  	if (dwc->usb2_lpm_disable)
>>>>  		props[prop_idx++] =3D PROPERTY_ENTRY_BOOL("usb2-lpm-disable");
>>>>=20=20
>>>> +	if (dwc->sgl_trb_cache_size_quirk)
>>>> +		props[prop_idx++] =3D
>>>> +			PROPERTY_ENTRY_BOOL("sgl-trb-cache-size-quirk");
>>>> +
>>>>  	/**
>>>>  	 * WORKAROUND: dwc3 revisions <=3D3.00a have a limitation
>>>>  	 * where Port Disable command doesn't work.
>>>>
>>> Does this implementation looks good to you? Rob has some concerned over=
 the DT entries,
>>> you suggested using compatible string with this quirk addition.
>>> Can you please brief about how you would like to have this quirk implem=
ented?
>>> I can send the updated patch. My patch series is pending for merge just=
 because of the
>>> DT and quirk issue. Can you please help?
>>=20
>> Yeah, you need to get into an agreement with Rob :-) I don't mind having
>> extra DT flags for things which can't be detected in runtime, Rob
>> disagrees.
>>=20
> The compatible string is not suitable option as it does not work with pla=
tform drivers
> with PCI based system. Also Synopsys controllers IP version register is n=
ot visible to xhci
> driver and hence we don't have separate compatible string for each Synops=
ys version on the
> xhci driver side.=20
> Due to which I depend on DT flag addition for the quirk. Can we add these=
 DT flags and quirk?

As I said, I'm well aware of the situation regarding usage of compatible
strings and the fact that dwc3 must work on PCI and non-PCI systems (I
wrote the thing as it is after all). The person blocking new quirk flags
is Rob, not me. You need to convince Rob that this is the way to go.

Rob, ball's in your court. Sorry.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl8Wuc8ACgkQzL64meEa
mQajFg/+OrB8kftTAnhyjxcw+b5fL1n7lUgHqcXF1BNTWFia0/tfNkcW/XNjbPbv
V50OdZ4SUdOQGvrmALzxGve+SSs55QLvRfA+e3VzAL9KYpDXLmp+3habfuIRHgDC
JojlvbYKWevMma727Oj5vrdmbLmoLpivT1kcf5+RT+AXS1P8ujWKwj4nnMQgO0KZ
FAVKSMB84Uam3sEn49eBFxGJNipdl3M1NBI/E39RTN9MaF9Y56cKMWtXC+VqZ+DQ
bU0OiBs+YJHIgwfAB3kXk5lF/uuKc9TgAkDPT4XOoMPLVgWi25ZdZSdtI1wXeaxv
cgiIEY/XUaQMij9+8Wr0Ii87gpLQmRDavANp/7xZRfh5DA/WuPuGpyjabMqkucX5
hG+FUXv1IGqI1pdwzWlFqS1v2bJUjWEp2iZaXMbq5mmuS9KBgWfm32KsTMDcsrbC
h76U09ljSIZfVfvtp/+Nroy2RkwPSRoRxmeujcB7gIksH0A9+1dCvco9WjewfHHq
LDx8MVYOnt0fguKFVVwiebkTlgE17/z89mqFCP1jjFWg96+iwbcUuDdOvl3khPkV
qxjf8eg0PxwsHunCSlHRA997QmtXckyQdrLyb3j2n6sd0E0+gAdxmL+m9O1/59qQ
71CLZaeVgojR1Y0esRLVh4r9O6lFV+JCaUyzir/e23fRGahnJ7Y=
=kiWu
-----END PGP SIGNATURE-----
--=-=-=--

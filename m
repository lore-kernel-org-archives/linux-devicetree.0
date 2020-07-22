Return-Path: <SRS0=Wzi+=BB=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 413B0C433EA
	for <linux-devicetree@archiver.kernel.org>; Wed, 22 Jul 2020 11:06:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1564B206F5
	for <linux-devicetree@archiver.kernel.org>; Wed, 22 Jul 2020 11:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1595415995;
	bh=bZjQ2Uob/4CUYWd7rIddx1aYEPpWUUs6EczK2hxIPq0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-ID:From;
	b=gc7gYX2CtpWGz+jDGSmzabRyoBq50upd36atNVojdH3iHNQs41e/LORVCpqy8mBle
	 g+1kHLA9Ap2kOAgrRE6bHogH8Ps4+ToNWS6zvTQRkT6QN+aC3N4nz2Y7v6DGCS4zsp
	 61rbpcg1JrqVWcj04vjFIgaHeLOI2hJhRo93rsOM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727847AbgGVLGe (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 22 Jul 2020 07:06:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726153AbgGVLGe (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 22 Jul 2020 07:06:34 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D478EC0619DC;
        Wed, 22 Jul 2020 04:06:33 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id q7so2046492ljm.1;
        Wed, 22 Jul 2020 04:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=ULZvt2k9btgSmmBhSl+qWzrfYfaCTiUlaEZAENWSLQg=;
        b=il/2GsfEvGypgLnNtWr+fb5XjbXK1r2XfFa6ss6jkMBBS61IxuTwJdlwkEg3yGYdJY
         z3+EyrNVZzW2Ggmqv/ltQLFGxHfFwQLmybR7rqmtpveDOFv9VJHyxOKKT8jPK3DL0CWW
         MVEqwL1PNYt1ThXGt5/gcRY5Wvj7TUiYWhXx6nxDntw1S+C+G98paIaWr0IUuilPj5ab
         UwFoza3CoiClnrcJbpAFchSflWcUIyufbfFs+00q/C3Moxo/MitRABtVSvSsVToeDXTM
         jCMVpMoX89fq0HvJ0Uk76C5mM2XE5SDhoP/ZZifTasjxBcmlluo2bjaZqAlPpmmaUZpH
         SWNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=ULZvt2k9btgSmmBhSl+qWzrfYfaCTiUlaEZAENWSLQg=;
        b=m/VIf1nlDNg+1kIwSodhDPMQsExdPSLN93KZZ+2kM8evd3zh3RZfSOQVkeM+5mDiuM
         D6Revdu8y6nH7DlIgefFo78Sl/jOnOv/4J2WrrvPVcu5idho2bAq8lrgA6RAWw8rO/b9
         L31tbl4WD6WADysPn0V+5J7qkvWZi8dDDUXq7LQ84stqCfXi0XOTxctR2P6UyNnHzn2m
         CbsH1dqZMb/NvUkyTXw9eYSIrX1VYkWGHz3aKlKHU+oX/h5Nd2WFu1o48kpXpmoBFyFn
         LDy84kzVzKp+/wnMK/71g5uDUbwyLsU0GcOrKZG9FHjqg8CVKHr6+7NyzrJ5nr7DIBZg
         SB+Q==
X-Gm-Message-State: AOAM533WSFhEFOsk3lU9OrbE0kW2HQwm5+IPls+6pdynp36JWEtGtGcu
        NmUwSXRvQzJQLJzLS7wtGpI=
X-Google-Smtp-Source: ABdhPJxnm4mHvApRmdVWkKxGaTTlFx8Y7YgkR1OoNTJq1SZ+Qz4Kcq6gw7Z5p03A7medByHk3J3YRA==
X-Received: by 2002:a2e:8ecc:: with SMTP id e12mr15230082ljl.130.1595415992232;
        Wed, 22 Jul 2020 04:06:32 -0700 (PDT)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
        by smtp.gmail.com with ESMTPSA id s2sm4512846lfs.4.2020.07.22.04.06.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Jul 2020 04:06:31 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Rob Herring <robh@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb\@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree\@vger.kernel.org" <devicetree@vger.kernel.org>,
        John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH 06/11] usb: devicetree: dwc3: Introduce num-lanes and lsm
In-Reply-To: <57fffdfb-a4fa-6e50-1156-1ada3765e362@synopsys.com>
References: <cover.1594935978.git.thinhn@synopsys.com> <9684a2b2adb01b6b1a8c513928ea49b4a6436184.1594935978.git.thinhn@synopsys.com> <20200721033908.GA3508628@bogus> <d7e3d5c6-05c1-f256-7773-2b88f6cd5ca3@synopsys.com> <CAL_JsqLSKKT__dJaML4SWCpFpFYV_Cpkor=mNh5-Z7hE4n4fMA@mail.gmail.com> <57fffdfb-a4fa-6e50-1156-1ada3765e362@synopsys.com>
Date:   Wed, 22 Jul 2020 14:06:26 +0300
Message-ID: <87wo2voll9.fsf@kernel.org>
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
> Rob Herring wrote:
>> On Mon, Jul 20, 2020 at 11:01 PM Thinh Nguyen <Thinh.Nguyen@synopsys.com=
> wrote:
>>> Rob Herring wrote:
>>>> On Thu, Jul 16, 2020 at 02:59:08PM -0700, Thinh Nguyen wrote:
>>>>> Introduce num-lanes and lane-speed-mantissa-gbps for devices operating
>>>>> in super-speed-plus. DWC_usb32 IP supports multiple lanes and can
>>>>> operate in different sublink speeds. Currently the device controller
>>>>> does not have the information of the phy's number of lanes supported.=
 As
>>>>> a result, the user can specify them through these properties if they =
are
>>>>> different than the default setting.
>>>>>
>>>>> Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
>>>>> ---
>>>>>    Documentation/devicetree/bindings/usb/dwc3.txt | 9 +++++++++
>>>>>    1 file changed, 9 insertions(+)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documen=
tation/devicetree/bindings/usb/dwc3.txt
>>>>> index d03edf9d3935..4eba0615562f 100644
>>>>> --- a/Documentation/devicetree/bindings/usb/dwc3.txt
>>>>> +++ b/Documentation/devicetree/bindings/usb/dwc3.txt
>>>>> @@ -86,6 +86,15 @@ Optional properties:
>>>>>     - snps,quirk-frame-length-adjustment: Value for GFLADJ_30MHZ fiel=
d of GFLADJ
>>>>>       register for post-silicon frame length adjustment when the
>>>>>       fladj_30mhz_sdbnd signal is invalid or incorrect.
>>>>> + - snps,num-lanes: set to specify the number of lanes to use. Valid =
inputs are
>>>>> +                    1 or 2. Apply if the maximum-speed is super-spee=
d-plus
>>>>> +                    only. Default value is 2 for DWC_usb32. For DWC_=
usb31,
>>>>> +                    it is always 1 at super-speed-plus.
>>>>> + - snps,lane-speed-mantissa-gbps: set to specify the symmetric lane =
speed
>>>>> +                    mantissa in Gbps. Valid inputs are 5 or 10. Appl=
y if
>>>>> +                    the maximum-speed is super-speed-plus only. Defa=
ult
>>>>> +                    value is 10. For DWC_usb31, it's always 10 at
>>>>> +                    super-speed-plus.
>>>> This is all common USB things and should be common properties (which we
>>>> may already have).
>>> Sure. For "num-lanes" is simple, any objection if we use
>>> "lane-speed-mantissa-gbps"? Or should we add "lane-speed-exponent"?
>> 'num-lanes' is good as that's what PCIe uses. Document that with
>> 'maximum-speed'.
>>
>> I think 'super-speed-plus' should mean gen 2 10G per lane. Then
>> between num-lanes and maximum-speed you can define all 4 possible
>> rates.
>
> That may confuse the user because now we'd use 'super-speed-plus' to=20
> define the speed of the lane rather than the device itself.

I agree. In USB land we should refer solely to the USB specification
naming schemes.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl8YHbIACgkQzL64meEa
mQbfzA//cXtk5a9Glesdts9G35MMDG9Jva0bthRppWu3PtUS0iq6A9jcT+8xVWsf
r4wor+BCD8cwH5nDAPoV8KWwqgDcB0ioqYXp+UT8J7Ron7xWns5UhuIIZJXxO2W0
HtRVASJqcY9stnI65L3RkZZ6C+l0+PU9PwYPONGtcMe0qdHN7LWNYnLya15c2tgj
9uadQscWJ/PvlYAdTLNuV2Rm/UVHqPrRLF5lvwVrpa8jxnMtObyaI0vPvSWBTnnL
U6h80+1AEsmwSoVtjhoPXK682lAqW7rHVSDaoZPQtBls+0uR/Ls05QTO280EXeAF
xUr+ZXJDXGaTxJAhmnzxRWeNRfc5ybKb9wO8lxZanYrjvGD2LRYTVcsqWoRkjDB4
fr2qlB4jvIUMu2MLTJpMuSKCmJugROMkhilzq0LxqpS5mrKqlawRL37aU/F7ZkoG
ATiTO+RfpK1Nk6hESr2Z7DTG6v8GPaHNbF7JOLRuGSbrQvJtqVY4uFHeiudYpbr/
YABGu89glDerA2u2X4exUiY9GE9xdmMdguENFILUbdfqVESzkQ98MDe0iLQcXEXZ
M45GD5uBZItFZUdE3HqPuiLOeOHX7CR3+/tiMF3weJjz+cNo0g4XRB66IvE1LgpU
YgrHkN2/eHGasQKbhE9FP6Odzw5oz9VCrGeqGR69xBr5ptFgM8E=
=sg/C
-----END PGP SIGNATURE-----
--=-=-=--

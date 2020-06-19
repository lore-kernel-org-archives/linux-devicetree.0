Return-Path: <SRS0=bA0P=AA=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C3B7C433E0
	for <linux-devicetree@archiver.kernel.org>; Fri, 19 Jun 2020 07:47:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3A99D2073E
	for <linux-devicetree@archiver.kernel.org>; Fri, 19 Jun 2020 07:47:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WlNwGxVj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730954AbgFSHrA (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 19 Jun 2020 03:47:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730914AbgFSHq7 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 19 Jun 2020 03:46:59 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD860C06174E;
        Fri, 19 Jun 2020 00:46:58 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id o15so9127224ejm.12;
        Fri, 19 Jun 2020 00:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=IFkTAzmjZ7cgHQnzN4laokd63UwaRWbc5sN0eQcw0Ug=;
        b=WlNwGxVjhv2hKysTXHEqMr1ZpfCx3uYYT3ALhGe+K7yl0jNvOKYVac18bJIvHN8XKN
         MpJhwoy7fS8aacmKiVIETU2VNiuEiLXwVgm8Tl7FP3tT5sVUtTVnNhMFAybHSK5Vhsav
         mykVzDhqdD3V6+z9ST6ig5cWcPaBOir8b7fSof4+ox1fQEJWeP958Iz7zGq3h0PmLoFE
         pyCnRaSPJ3vXHOSyp3SjMDjG8lSdciLJTCMiA/MYNHmQPiVjWIlnSJJXQGlRcJqBPcu8
         w8EG1pi3oBKeQtBiSsUI78QU44F9uplvMuQlkgzPhursH3J2FyZTH9W9MgtfBCslZ2mv
         w7gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=IFkTAzmjZ7cgHQnzN4laokd63UwaRWbc5sN0eQcw0Ug=;
        b=ESze3eB9wyIX8sWbs2ZAb2puA0rnv0f9Jg32nJR5qY2AX7+kOweIn5+liQcONJnSqH
         w6T9GYclS5fGO/swQP59muwUFt9MxYKvh9OXqZRxaFsEmmsj5uPZJuzyam3gRVyYKdxw
         iU94dHFu99BQKOqEXn9UP8OQVF1Q3Atdovu112lQqunNleIBrwaLr5vzKR7GKQxjUnS8
         JmBxfCq64TA0shOYycwPpTuWOCB1jok1IOdgdGgH9zJoYnY8oLgLlzhj73NygHv1JsCB
         VeCtsICWkUAw5smoiAxqIm2PTaEN65mg/I/IeMG8tGUmaNrWbfZkh9OnS0i2CPbG+mwa
         cHNg==
X-Gm-Message-State: AOAM530rbsXaEaTARsdS3c2pFwuwiJy2xbeVzJ/K/9o5+Aa1C5xHYRTJ
        mZIfVDyLoGsHJQnE7fyY4HDWP/Fc
X-Google-Smtp-Source: ABdhPJyvwwHHiLThMLGYsAkIDjfAfQDF227Rr+kaLDQ+9/QkW6+M4+fktvNTsW3Sg5VoQCKmUFm2aw==
X-Received: by 2002:a17:906:f49:: with SMTP id h9mr2540008ejj.155.1592552817259;
        Fri, 19 Jun 2020 00:46:57 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id h17sm3955881edw.92.2020.06.19.00.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2020 00:46:55 -0700 (PDT)
Date:   Fri, 19 Jun 2020 09:46:54 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 37/38] dt-bindings: pwm: Explicitly include pwm.yaml
Message-ID: <20200619074654.GD3704347@ulmo>
References: <20200612141903.2391044-1-thierry.reding@gmail.com>
 <20200612141903.2391044-38-thierry.reding@gmail.com>
 <20200618025140.GB3378010@bogus>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="TybLhxa8M7aNoW+V"
Content-Disposition: inline
In-Reply-To: <20200618025140.GB3378010@bogus>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--TybLhxa8M7aNoW+V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 17, 2020 at 08:51:40PM -0600, Rob Herring wrote:
> On Fri, Jun 12, 2020 at 04:19:02PM +0200, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > For PWM controller device tree bindings, make sure that they include the
> > pwm.yaml controller core bindings explicitly. This prevents the tooling
> > from matching on the $nodename pattern, which can falsely match things
> > like pinmux nodes, etc.
>=20
> My preference here is to clean-up the mess that is pinmux nodes.

Any suggestions on how to do that? Do you just want to rename the
problematic nodes? Or do you want to introduce a standard naming scheme?
As an example, I was running into the issue with this node:

	pinmux@70000014 {
		pinctrl-names =3D "default";
		pinctrl-0 =3D <&state_default>;

		state_default: pinmux {
			...

			pwm-a-b {
				nvidia,pins =3D "sdc";
				nvidia,function =3D "pwm";
				nvidia,tristate =3D <TEGRA_PIN_ENABLE>;
			};

			...
		};
	};

My first instinct was to just add some sort of prefix to this, but then
I realized that might not be the best option because there could be
countless other nodes whose names might start with "pwm-" but that had
nothing to do with PWM controllers whatsoever.

You could for example have some node named "pwm-fan" and then these
standard bindings will require that to be have a #pwm-cells property.

So I think the solution of only explicitly "activating" PWM controller
bindings would work well in this particular case because it would only
apply the bindings where explicitly requested. That way it doesn't
matter what nodes are named.

> This has the side effect of no longer checking pwm nodes that didn't=20
> have explicit schema. Perhaps that's of somewhat limited value.

There are two easy solutions to this: 1) convert all PWM bindings to
YAML so that they have an explicit schema or 2) consider the presence of
the #pwm-cells property as a marker that the node represents a PWM
controller/provider, irrespective of the name. The latter would be much
like gpio-controller or interrupt-controller, though less redundant.

We could even go as far as using #pwm-cells as the definitive marker and
then require that it has a certain name, like we do for other types of
nodes. I did a quick audit and came up with the following results. These
are all the PWM controller nodes that I could find that don't follow the
"^pwm(@.*)?$" pattern. The files are only one example of where I found
them and there were often others that used the same pattern.

 - arch/arm64/boot/dts/rockchip/rk3399-gru-chromebook.dtsi
     - ec-pwm

       It should be trivial to rename these to just "pwm" since I don't
       see the cros-ec driver relying on the exact name.

 - arch/arm/boot/dts/am5729-beagleboneai.dts
     - stmpe_pwm

       The stmpe MFD driver actually relies on this name, so not sure if
       there's a lot we can do about that.

 - arch/arm/boot/dts/armada-38x.dtsi
     - gpio@...

       This is both a GPIO and PWM controller, so can't really do much
       about the name.

 - arch/arm/boot/dts/at91-kizbox.dts
     - pwm

       Actually also matches the pattern because the '@.*' part is
       optional.

 - arch/arm/boot/dts/at91sam9n12.dtsi
     - hlcdc-pwm

       The MFD driver matches on the compatible string, so we should be
       able to just rename this to "pwm".

 - arch/arm/boot/dts/da850.dtsi
    - ecap@...

      No matching on the name as far as I can tell, so we should be able
      to rename this 'pwm@...'.

 - arch/arm/boot/dts/logicpd-torpedo-baseboard.dtsi
    - dmtimer-pwm

      Could probably be renamed 'pwm'.

 - arch/arm/boot/dts/lpc32xx.dtsi
    - mpwm@...

      Could probably be renamed 'pwm'.

 - arch/arm/boot/dts/motorola-mapphone-common.dtsi
    - dmtimer-pwm-*

      Maybe these should be renamed 'pwm@*' instead?

 - arch/arm/boot/dts/s3c24xx.dtsi
    - timer@...

      This is a variant similar to dmtimer-pwm above and is driven by a
      timer that can run in PWM mode. I think this is the same category
      as the GPIO/PWM controller hybrid above.

      Not much we can do about the name.

 - arch/arm/boot/dts/stm32f429.dtsi
    - pwm

      Matches the pattern.

 - arch/arm/boot/dts/twl4030.dtsi
    - pwm

      Matches the pattern.

    - pwmled

      Perhaps both of the above should be named 'pwm@*'? There doesn't
      seem to be any matching on the name.

For many of the above it should be possible to rename them. But then we
will always have exceptions where we can't do that because then it might
conflict with other bindings.

Two interesting things I gathered from the above are that:

  1) nothing in the above actually matches the pwm-* variant that's part
     of the current pattern defined in pwm.yaml and which is causing the
     problem for the pinmux nodes, so an easy solution would be to
     simply drop that part of the pattern since it is useless anyway.

  2) There are actually quite a few PWM controllers that currently are
     not checked because of the name matching. Now I haven't actually
     checked the reverse, i.e. to see if all nodes matching the pattern
     actually have a #pwm-cells property, but given that we miss a
     number of controller because they don't match the pattern makes me
     think that that aspect isn't actually very helpful.

All of the above makes me think even more that we should just abandon
the idea of matching on the names for PWM controller because in some
instances we can't change the name for backwards-compatibility or
because the names would then conflict with other bindings.

Thierry

--TybLhxa8M7aNoW+V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl7sbWwACgkQ3SOs138+
s6EkUQ/8CfobSw5tN7kHV27Up2nPbtgxT0JzwhC+iMatGJJglEb/0HvmG/T4HgEl
q2ky225l4PxEBQ8VjCm7vnQxQQ2IGn2dYtuj99n9mRjOKI49EMCPK6b1rZuV2cgQ
1F8oDpq3vchobyvvT2RnoBo/+mvIC77Jas7nppUcFIPQJOorG7wZFCq1W4U+fIoI
ozX51pXr3/XeoIBKsng3eikM44hNvlDmrtt53FPaSZqQm2G8mS2KHJtOVttLoFsf
uhu5TShU+xesO2XG/5i+dN65y5Dw+ExabqJbgSfDxhsPXxGCDkbPnsZVEgEWUwFy
g9BgVzv0yP34nHsBN38WlU3lVCiM5BzB+HHg0UHgzzzAfgFv6nnjd23ii4PAT68B
V+qDyDKYm1IaBGnF34kZ3IpSqr/snYNHhdTNZ+yucHos3gY6z04ExsoOUpZmGDln
Qr1ly9J6DF1luwN5mxIyOdoCD+l03owo6oOnf+xLZv8yHra/IPNG9andBHr/u7Y9
BinKNHS7cxjAKf9p5e5Ar0k+5NPbICzRi0WyAwM/zqkfneaAQWW07d/9X1hMxQx4
KsJE6TWpt5nq1xboPaHaHc5kgPhbhgn8/7zbOdDDtGrttU3lwU1rC7x5LJO+ezr1
GWHzs5tekqEuqKX+jtOq8laXCH7zHOCYBs4/SBMVDJesNP2HAQc=
=ZZ89
-----END PGP SIGNATURE-----

--TybLhxa8M7aNoW+V--

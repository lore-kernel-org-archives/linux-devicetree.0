Return-Path: <SRS0=KHJB=AD=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79655C433E0
	for <linux-devicetree@archiver.kernel.org>; Mon, 22 Jun 2020 11:51:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5BFA320720
	for <linux-devicetree@archiver.kernel.org>; Mon, 22 Jun 2020 11:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1592826693;
	bh=6kI4L4zPUlkblUHtlE0vjkJQynOdD+oESUx6nEDdgtA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=gw3JyoWPKKc/eVhFnlH804PRNz3Xpd07dXmQtYiw2iYbXdRXZuq9udu/8wBaz+R3V
	 9W5UY1cPtV83q6HeMdhTf/MO8qsYpAxWM286JlFHwYFJU6v1PpnWMeCYyg8UvTDgSa
	 3ooJCsKYUPyspQyoY1vk/QwMx2zuWXsP03KGqQm8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727914AbgFVLvc (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 22 Jun 2020 07:51:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:54302 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727864AbgFVLvc (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 22 Jun 2020 07:51:32 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2D93B206EB;
        Mon, 22 Jun 2020 11:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592826691;
        bh=6kI4L4zPUlkblUHtlE0vjkJQynOdD+oESUx6nEDdgtA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=k5bbji9DbfRj4tdakCUFG9c0m2fv4xOMhtcICMHdf7aexe0EUGfar7nMd2ujoLGWj
         Zm9fi6pWgwb3HpZxKrRYxjVAtm+/vsWZjURMA/jMuJ7C+ouAEWJT6VL3hBBqWebpCx
         xiZ5uBYb12DAW6k45vIv8bs9j8QJ0quxF2AHCaEQ=
Date:   Mon, 22 Jun 2020 12:51:29 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Pantelis Antoniou <pantelis.antoniou@linaro.org>,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Matt Porter <mporter@konsulko.com>,
        Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: sound: Device tree bindings for the
 apq8039 sound complex
Message-ID: <20200622115129.GC4560@sirena.org.uk>
References: <20200619193831.12528-1-pantelis.antoniou@linaro.org>
 <20200619193831.12528-2-pantelis.antoniou@linaro.org>
 <20200619214126.GA1251@gerhold.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="0vzXIDBeUiKkjNJl"
Content-Disposition: inline
In-Reply-To: <20200619214126.GA1251@gerhold.net>
X-Cookie: laser, n.:
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--0vzXIDBeUiKkjNJl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 19, 2020 at 11:41:26PM +0200, Stephan Gerhold wrote:
> Hi Pantelis,
>=20
> On Fri, Jun 19, 2020 at 10:38:30PM +0300, Pantelis Antoniou wrote:
> > Add a yaml device binding for the QCOM apq8039 sound complex driver.
> >=20
>=20
> Nice to see some activity to get sound working on another SoC!
> Thanks for documenting all these properties.

Please delete unneeded context from mails when replying.  Doing this
makes it much easier to find your reply in the message, helping ensure
it won't be missed by people scrolling through the irrelevant quoted
material.

> > +  function-definition:
> > +    type: object
> > +    description: |
> > +      Functional configuration for the sound complex via a
> > +      simple control. allows fixed and dynamically constructed
> > +      function selection.
> > +
> > +    properties:
> > +      mixer-control:
> > +        $ref: /schemas/types.yaml#/definitions/string
> > +        description: |
> > +          Name of the exported alsa mix control.

This does *not* look like something that should be in a DT binding, it
is quite clearly OS specific.

> > +      system-list:
> > +        $ref: /schemas/types.yaml#/definitions/phandle-array
> > +        description: |
> > +          phandle(s) of the default, init and shutdown functions
> > +          Must be one of the declared ones in the function property.
> > +          The default function is the one selected by default on
> > +          startup (after the init function's sequence is executed).
> > +          On shutdown the shutdown function sequence will be executed.
> > +          Typically init and shutdown are the same and it's purpose
> > +          is to initialize the sound complex mixer controls to the
> > +          all off state, and be ready for a regular function selection.

> This looks much like a replacement for ALSA UCM and userspace audio jack
> detection coded into the device tree.

Very much so.  This is use case configuration and completely
inappropriate for DT.  DT should describe the hardware, the way the OS
intends to use the hardware is up to the OS.

> If you want to discuss ways to integrate mixer enable/disable sequences
> into the device tree, I suggest that you post your ideas separately as
> [RFC] with a more generic subject. That will make it more easy for
> everyone interested to share their thoughts.

> Right now it's quite hidden in a patch set where the subjects suggest
> that it's just a simple machine driver to glue some codecs together.

Indeed, I agree entirely.

--0vzXIDBeUiKkjNJl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7wm0AACgkQJNaLcl1U
h9CUhgf/RIFd53orwiMac+A1ik82HDNf5kX/wfvcuhQB6aFkTGuyMHXXcAC/8JJp
XgvvAcZqZpVpGZd+l9FoSp3Ye2iAPJfA4zfM7pQ5MLHoZNjnQG8n5gE04w6JhCZq
fWi4khSCyOej+9u3Wef+37mCCLIT8g1mB34QialxOU/JsFyZEzULz/9q0reposju
yxbv899e+GoUrRdYwhYafXcbsvy2t8UfERlBdoaGb5WDOXpYXJeTbirDhnYCKWtb
ze3jg9a1/OAtqkPjolDJHxHY8AC4WJSYwVyPGjHMPKnf5nhuLa/CKB7J6UMyyEXN
SEQyffj47T49rSpjtvS9FdMTg7nwXw==
=4kwO
-----END PGP SIGNATURE-----

--0vzXIDBeUiKkjNJl--

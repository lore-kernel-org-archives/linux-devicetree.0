Return-Path: <devicetree-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_NONE,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2E33D7D981
	for <lwn-devicetree@archive.lwn.net>; Wed, 11 Mar 2020 16:28:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730176AbgCKQ2d (ORCPT <rfc822;lwn-devicetree@archive.lwn.net>);
        Wed, 11 Mar 2020 12:28:33 -0400
Received: from foss.arm.com ([217.140.110.172]:51592 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729511AbgCKQ2d (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 11 Mar 2020 12:28:33 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 74F8C31B;
        Wed, 11 Mar 2020 09:28:32 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EB3443F6CF;
        Wed, 11 Mar 2020 09:28:31 -0700 (PDT)
Date:   Wed, 11 Mar 2020 16:28:30 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Olivier MOYSAN <olivier.moysan@st.com>
Cc:     "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "perex@perex.cz" <perex@perex.cz>,
        "tiwai@suse.com" <tiwai@suse.com>,
        "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
        Alexandre TORGUE <alexandre.torgue@st.com>,
        "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
        "robh@kernel.org" <robh@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-stm32@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] ASoC: dt-bindings: stm32: convert spdfirx to
 json-schema
Message-ID: <20200311162830.GG5411@sirena.org.uk>
References: <20200117170352.16040-1-olivier.moysan@st.com>
 <d792a2b8-3b59-f04e-c24d-06185d60c734@st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="w/VI3ydZO+RcZ3Ux"
Content-Disposition: inline
In-Reply-To: <d792a2b8-3b59-f04e-c24d-06185d60c734@st.com>
X-Cookie: I'm a Lisp variable -- bind me!
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org
Archived-At: <http://archive.lwn.net:8080/devicetree/20200311162830.GG5411@sirena.org.uk/>
List-Archive: <http://archive.lwn.net:8080/devicetree/>
List-Post: <mailto:devicetree@vger.kernel.org>


--w/VI3ydZO+RcZ3Ux
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2020 at 03:37:01PM +0000, Olivier MOYSAN wrote:
> Hi,
> Kind reminder for this patch.

Please don't send content free pings and please allow a reasonable time
for review.  People get busy, go on holiday, attend conferences and so=20
on so unless there is some reason for urgency (like critical bug fixes)
please allow at least a couple of weeks for review.  If there have been
review comments then people may be waiting for those to be addressed.

Sending content free pings adds to the mail volume (if they are seen at
all) which is often the problem and since they can't be reviewed
directly if something has gone wrong you'll have to resend the patches
anyway, so sending again is generally a better approach though there are
some other maintainers who like them - if in doubt look at how patches
for the subsystem are normally handled.

--w/VI3ydZO+RcZ3Ux
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5pEa0ACgkQJNaLcl1U
h9DdKAf/RDfG02WXRCBnnFoaoVDDhiXfiLY3E3cosFMFo8a7Gmv/wb6FwPPevsyq
MiA+WtsBBa8juOJ6PlmQ7IWC84GpUDFMpoeW7HkEMzGJ+CxF5su7kQCQfCG0XeR7
xiTK0cF1l+zLaKcz2gkyO4P0pAu0eQbHF5MC9sEX7HsYd6qZd26GU4gpLOGqqZBN
eMzdoSHCY8tJpZqbT0f9JnU5+el6wwfo8c3LPEmbzTBT6b6oCxc9fhXi8BIsTWsi
64G1cgZIzc34qeX4JeAtb2lPBAKYd9Fm9bJOhGhf1XkIq8SOWlONePAb454reMOZ
kiJO+xOE40GqCY82X5SD8I5A7DU4Og==
=F+uO
-----END PGP SIGNATURE-----

--w/VI3ydZO+RcZ3Ux--

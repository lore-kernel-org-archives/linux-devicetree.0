From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v12 RESEND 0/4] generic TEE subsystem
Date: Fri, 28 Oct 2016 19:19:14 +0100
Message-ID: <20161028181914.xkse5orwwp42dvj3@sirena.org.uk>
References: <1477649984-16777-1-git-send-email-jens.wiklander@linaro.org>
 <1e532aeb-4944-62e4-c8c4-1e23438b92cd@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="2yk6gt67ognzv34w"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1e532aeb-4944-62e4-c8c4-1e23438b92cd@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Andrew F. Davis" <afd@ti.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Al Viro <viro@ZenIV.linux.org.uk>, valentin.manea@huawei.com, jean-michel.delorme@st.com, emmanuel.michel@st.com, javier@javigon.com, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Mark Rutland <mark.rutland@arm.com>, Michal Simek <michal.simek@xilinx.com>, Rob Herring <robh+dt@kernel.org>, Will Deacon <will.deacon@arm.com>, Arnd Bergmann <arnd@arndb.de>, Nishanth Menon <nm@ti.com>
List-Id: devicetree@vger.kernel.org


--2yk6gt67ognzv34w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 28, 2016 at 10:43:24AM -0500, Andrew F. Davis wrote:

> Do we see this as a chicken and egg situation, or is there any harm
> beyond the pains of supporting an out-of-tree driver for a while, to
> wait until we have at least one other TEE to add to this subsystem
> before merging?

We haven't been overburneded with TEE vendors wanting to get their
driver code into mainline - do we have any reasonable prospect of other
TEE vendors with an interest in mainline turning up in any kind of
reasonable timeframe?

--2yk6gt67ognzv34w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAABCAAGBQJYE5ahAAoJECTWi3JdVIfQcgcH/0zWes/JzwQBSYGseP+XizSI
KGzkBrZ1tqwn1QGmQzoTsmzhmoZmR1el5C8xFoMxWGy9CWr9feSZSdVOe9Nb5npO
KYG81KH86uLJLeme42A/P1WBnQDPrKD38IpiSFAa9CL0b71052WbaqhV6uYU9jFB
gQE2jyfiumNN0pK1CoZMCK3GghTVQluoM1FGaHU40PnFxalw1/1hDeplgmT6VXgn
9HgJJr0AW1W7goAbb0G+jFsYtzSk6uRkKwzookoGgybDciSfgv98MuKZg7wru8t8
JOCSH5esk9DUofB2dQgbTs+IvmaGXi8bXPQV9W2k2DNTuRQ7fqkclEOyk1kVmwI=
=ndbn
-----END PGP SIGNATURE-----

--2yk6gt67ognzv34w--

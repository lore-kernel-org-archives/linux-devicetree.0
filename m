From: =?utf-8?Q?Javier_Gonz=C3=A1lez?= <javier@javigon.com>
Subject: Re: [PATCH v10 0/4] generic TEE subsystem
Date: Mon, 6 Jun 2016 20:51:23 +0200
Message-ID: <A8774850-9E8D-442D-AF8C-80948822803C@javigon.com>
References: <1464784888-19854-1-git-send-email-jens.wiklander@linaro.org>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: multipart/signed; boundary="Apple-Mail=_177F3E6F-DF3D-47B7-B084-DB3B34483843"; protocol="application/pgp-signature"; micalg=pgp-sha512
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1464784888-19854-1-git-send-email-jens.wiklander@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Al Viro <viro@ZenIV.linux.org.uk>, Andreas Dannenberg <dannenberg@ti.com>, valentin.manea@huawei.com, jean-michel.delorme@st.com, emmanuel.michel@st.com, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Mark Rutland <mark.rutland@arm.com>, Michal Simek <michal.simek@xilinx.com>, Rob Herring <robh+dt@kernel.org>, Will Deacon <will.deacon@arm.com>, Arnd Bergmann <arnd@arndb.de>, Nishanth Menon <nm@ti.com>
List-Id: devicetree@vger.kernel.org


--Apple-Mail=_177F3E6F-DF3D-47B7-B084-DB3B34483843
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii

Hi,

> On 01 Jun 2016, at 14:41, Jens Wiklander <jens.wiklander@linaro.org> wrote:
> 
> [TL;DR; This patch set needs more review, if you're using OP-TEE please
> help reviewing.]
> 
> This patch set introduces a generic TEE subsystem. The TEE subsystem will
> contain drivers for various TEE implementations. A TEE (Trusted Execution
> Environment) is a trusted OS running in some secure environment, for
> example, TrustZone on ARM CPUs, or a separate secure co-processor etc.

Have you considered moving the code to a security subsystem? Back in the
days I talked to some of the TPM maintainers and they were not closed to
the idea of having support for hardware security extensions in a single
place. I think TPM is still considered as a char device...

We would all benefit if it were possible to have an overview of all
available all the security extensions, if nothing else at least for the
documentation.

Javier

--Apple-Mail=_177F3E6F-DF3D-47B7-B084-DB3B34483843
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIcBAEBCgAGBQJXVcYsAAoJEDxGAX0tJXjgYH8P/jtedIS5EqPagIbEU0B9PXGd
Lox5G3W98y/gu9GXRNWr+5JinHGyKBDr1eI9bytbFwMq3zFCgy7sbUDeMCJXk+Gv
MilG41IRf3V7Pq3mK+GWwQkRhqrVsF9E6qQDHodmjGbd4M7x8PsO6fdOh9mHRpLY
DM4boaCHgfIMgRsFW9d1XBQkBtG3GcHhD3sLYGesAaarQq7bT6cVJAYMhoS4vYoQ
KFLn+KDLGUHu62hVjx3WvVsbw+KC2fvrb3xTlD+Gr314kxT+hUTYt1qogNotAJTs
R5vUQPAxxhW+Y6Sv6apvBtJ/dxwrQUxd3bDSn/nBcQdtHDMAjInYHNJt94EMy6o4
ctC/lt7mlbemWI8IhHudO6wLF04SC1CjkR1F1WMWa3K8Y9BOLfoJNWUcUz3X00o/
K/tiarTng8aM/q26xXp64IT7dizEm0g18q1SzBW270GfrCseFoq8wP/AfDJbq70/
HKqADgAqQ5lYgb/a04i6hVct2cWyWLp5LnJpVxAoxZKkXmGPEVhg42nJ+Rt7CN+U
Muj2h9RKcpI4O+1WrOErYt+ggZSvbc/zsk3dlPYQrkQhZFaubuIwQhxLYOih1MOx
pSNsLDMGpK/71HiRLYYfg5YThOaZyG29vkjf1KzljmM/TdmwnPWOZ3xSBsPIqCb1
Lbp72R+IaO0Mk1uASnM9
=uBX5
-----END PGP SIGNATURE-----

--Apple-Mail=_177F3E6F-DF3D-47B7-B084-DB3B34483843--

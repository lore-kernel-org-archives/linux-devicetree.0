From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v7 0/4] generic TEE subsystem
Date: Sun, 7 Feb 2016 22:51:42 -0800
Message-ID: <20160208065142.GA23170@kroah.com>
References: <1454318140-7962-1-git-send-email-jens.wiklander@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1454318140-7962-1-git-send-email-jens.wiklander@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, valentin.manea@huawei.com, jean-michel.delorme@st.com, emmanuel.michel@st.com, javier@javigon.com, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Mark Rutland <mark.rutland@arm.com>, Michal Simek <michal.simek@xilinx.com>, Rob Herring <robh+dt@kernel.org>, Will Deacon <will.deacon@arm.com>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 01, 2016 at 10:15:36AM +0100, Jens Wiklander wrote:
> Hi,
>=20
> This patch set introduces a generic TEE subsystem. The TEE subsystem =
will
> contain drivers for various TEE implementations. A TEE (Trusted Execu=
tion
> Environment) is a trusted OS running in some secure environment, for
> example, TrustZone on ARM CPUs, or a separate secure co-processor etc=
=2E
>=20
> Regarding use cases, TrustZone has traditionally been used for
> offloading secure tasks to the secure world. Examples include:=20
> - Secure key handling where the OS may or may not have direct access =
to key
>   material.
> - E-commerce and payment technologies. Credentials, credit card numbe=
rs etc
>   could be stored in a more secure environment.
> - Trusted User Interface (TUI) to ensure that no-one can snoop PIN-co=
des
>   etc.
> - Secure boot to ensure that loaded binaries haven=E2=80=99t been tam=
pered with.
>   It=E2=80=99s not strictly needed for secure boot, but you could enh=
ance security
>   by leveraging a TEE during boot.
> - Digital Rights Management (DRM), the studios provides content with
>   different resolution depending on the security of the device. Highe=
r
>   security means higher resolution.
>=20
> A TEE could also be used in existing and new technologies. For exampl=
e IMA
> (Integrity Measurement Architecture) which has been in the kernel for=
 quite
> a while. Today you can enhance security by using a TPM-chip to sign t=
he IMA
> measurement list. This is something that you also could do by leverag=
ing a
> TEE.
>=20
> Another example could be in 2-factor authentication which is becoming
> increasingly more important. FIDO (https://fidoalliance.org) for exam=
ple
> are using public key cryptography in their 2-factor authentication st=
andard
> (U2F). With FIDO, a private and public key pair will be generated for=
 every
> site you visit and the private key should never leave the local devic=
e.
> This is an example where you could use secure storage in a TEE for th=
e
> private key.
>=20
> Today you will find a quite a few different out of tree implementatio=
ns of
> TEE drivers which tends to fragment the TEE ecosystem and development=
=2E We
> think it would be a good idea to have a generic TEE driver integrated=
 in
> the kernel which would serve as a base for several different TEE solu=
tions,
> no matter if they are on-chip like TrustZone or if they are on a sepa=
rate
> crypto co-processor.
>=20
> To develop this TEE subsystem we have been using the open source TEE =
called
> OP-TEE (https://github.com/OP-TEE/optee_os) and therefore this would =
be the
> first TEE solution supported by this new subsystem. OP-TEE is a
> GlobalPlatform compliant TEE, however this TEE subsystem is not limit=
ed to
> only GlobalPlatform TEEs, instead we have tried to design it so that =
it
> should work with other TEE solutions also.
>=20
> "tee: generic TEE subsystem" brings in the generic TEE subsystem whic=
h
> helps when writing a driver for a specific TEE, for example, OP-TEE.
>=20
> "tee: add OP-TEE driver" is an OP-TEE driver which uses the subsystem=
 to do
> its work.
>=20
> This patch set has been prepared in cooperation with Javier Gonz=C3=A1=
lez who
> proposed "Generic TrustZone Driver in Linux Kernel" patches 28 Nov 20=
14,
> https://lwn.net/Articles/623380/ . We've since then changed the scope=
 to
> TEE instead of TrustZone.
>=20
> We have discussed the design on tee-dev@lists.linaro.org (archive at
> https://lists.linaro.org/pipermail/tee-dev/) with people from other
> companies, including Valentin Manea <valentin.manea@huawei.com>,
> Emmanuel MICHEL <emmanuel.michel@st.com>,
> Jean-michel DELORME <jean-michel.delorme@st.com>,
> and Joakim Bech <joakim.bech@linaro.org>. Our main concern has been t=
o
> agree on something that is generic enough to support many different
> TEEs while still keeping the interface together.
>=20
> v7:
> * Rebased on v4.5-rc2
> * Moved the ARM SMC Calling Convention support into a separate patch
>   set, which is now merged

Given this breaks the build on x86-64, I can't take this :(

Please fix up and do a basic bit of build testing...

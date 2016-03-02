From: Andreas Dannenberg <dannenberg-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v8 0/4] generic TEE subsystem
Date: Wed, 2 Mar 2016 05:15:48 -0600
Message-ID: <20160302111548.GB6660@borg.dal.design.ti.com>
References: <1455210877-15748-1-git-send-email-jens.wiklander@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1455210877-15748-1-git-send-email-jens.wiklander-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jens Wiklander <jens.wiklander-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, valentin.manea-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, jean-michel.delorme-qxv4g6HH51o@public.gmane.org, emmanuel.michel-qxv4g6HH51o@public.gmane.org, javier-5MUHepqpBA1BDgjK7y7TUQ@public.gmane.org, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 11, 2016 at 06:14:33PM +0100, Jens Wiklander wrote:
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
> We have discussed the design on tee-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org (archive at
> https://lists.linaro.org/pipermail/tee-dev/) with people from other
> companies, including Valentin Manea <valentin.manea-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>,
> Emmanuel MICHEL <emmanuel.michel-qxv4g6HH51o@public.gmane.org>,
> Jean-michel DELORME <jean-michel.delorme-qxv4g6HH51o@public.gmane.org>,
> and Joakim Bech <joakim.bech-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>. Our main concern has been t=
o
> agree on something that is generic enough to support many different
> TEEs while still keeping the interface together.
>=20
> v8:
> * Rebased on v4.5-rc3
> * dt/bindings: add bindings for optee
>   Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> * Fixes build error for X86
> * Fixes spell error in "dt/bindings: add bindings for optee"

Jens,
thanks for the updated series and the continued work on this. I've
recently starting testing/experimenting with this in the context of
Kernel 4.4 (will try latest Kernel as a next step) and have not found a=
ny
issues so far. This is an ongoing effort and I'll provide feedback as I
encounter anything notable.

But I also wanted to use this opportunity to express that from a TI and
TI customer point of view (and probably beyond that) this TEE subsystem
support is seen as an important building block for a number real-world
use cases involving security.


Acked-by: Andreas Dannenberg <dannenberg-l0cyMroinI0@public.gmane.org>


Regards,

--
Andreas Dannenberg
Texas Instruments Inc

>=20
> v7:
> * Rebased on v4.5-rc2
> * Moved the ARM SMC Calling Convention support into a separate patch
>   set, which is now merged
>=20
> v6:
> * Rebased on v4.3-rc7
> * Changed smccc interface to let the compiler marshal most of the
>   parameters
> * Added ARCH64 capability for smccc interface
> * Changed the PSCI firmware calls (both arm and arm64) to use the new
>   generic smccc interface instead instead of own assembly functions.
> * Move optee DT bindings to below arm/firmware
> * Defines method for OP-TEE driver to call secure world in DT, smc or=
 hvc
> * Exposes implementation id of a TEE driver in sysfs
>   to easily spawn corresponding tee-supplicant when device is ready
> * Update OP-TEE Message Protocol to better cope with fragmented physi=
cal
>   memory
> * Read time directly from OP-TEE driver instead of forwarding the RPC
>   request to tee-supplicant
>=20
> v5:
> * Replaced kref reference counting for the device with a size_t inste=
ad as
>   the counter is always protected by a mutex
>=20
> v4:
> * Rebased on 4.1
> * Redesigned the synchronization around entry exit of normal SMC
> * Replaced rwsem on the driver instance with kref and completion sinc=
e
>   rwsem wasn't intended to be used in this way
> * Expanded the TEE_IOCTL_PARAM_ATTR_TYPE_MASK to make room for
>   future additional parameter types
> * Documents TEE subsystem and OP-TEE driver
> * Replaced TEE_IOC_CMD with TEE_IOC_OPEN_SESSION, TEE_IOC_INVOKE,
>   TEE_IOC_CANCEL and TEE_IOC_CLOSE_SESSION
> * DT bindings in a separate patch
> * Assembly parts moved to arch/arm and arch/arm64 respectively, in a
>   separate patch
> * Redefined/clarified the meaning of OPTEE_SMC_SHM_CACHED
> * Removed CMA usage to limit the scope of the patch set
>=20
> v3:
> * Rebased on 4.1-rc3 (dma_buf_export() API change)
> * A couple of small sparse fixes
> * Documents bindings for OP-TEE driver
> * Updated MAINTAINERS
>=20
> v2:
> * Replaced the stubbed OP-TEE driver with a real OP-TEE driver
> * Removed most APIs not needed by OP-TEE in current state
> * Update Documentation/ioctl/ioctl-number.txt with correct path to te=
e.h
> * Rename tee_shm_pool_alloc_cma() to tee_shm_pool_alloc()
> * Moved tee.h into include/uapi/linux/
> * Redefined tee.h IOCTL macros to be directly based on _IOR and frien=
ds
> * Removed version info on the API to user space, a data blob which
>   can contain an UUID is left for user space to be able to tell which
>   protocol to use in TEE_IOC_CMD
> * Changed user space exposed structures to only have types with __ pr=
efix
> * Dropped THIS_MODULE from tee_fops
> * Reworked how the driver is registered and ref counted:
>   - moved from using an embedded struct miscdevice to an embedded str=
uct
>     device.
>   - uses an struct rw_semaphore as synchronization for driver detachm=
ent
>   - uses alloc/register pattern from TPM
>=20
> Thanks,
> Jens
>=20
>=20
>=20
> Jens Wiklander (4):
>   dt/bindings: add bindings for optee
>   tee: generic TEE subsystem
>   tee: add OP-TEE driver
>   Documentation: tee subsystem and op-tee driver
>=20
>  Documentation/00-INDEX                             |   2 +
>  .../bindings/arm/firmware/linaro,optee-tz.txt      |  31 +
>  .../devicetree/bindings/vendor-prefixes.txt        |   1 +
>  Documentation/ioctl/ioctl-number.txt               |   1 +
>  Documentation/tee.txt                              | 117 +++
>  MAINTAINERS                                        |  13 +
>  drivers/Kconfig                                    |   2 +
>  drivers/Makefile                                   |   1 +
>  drivers/tee/Kconfig                                |  19 +
>  drivers/tee/Makefile                               |   4 +
>  drivers/tee/optee/Kconfig                          |   8 +
>  drivers/tee/optee/Makefile                         |   5 +
>  drivers/tee/optee/call.c                           | 400 ++++++++++
>  drivers/tee/optee/core.c                           | 522 +++++++++++=
+
>  drivers/tee/optee/optee_msg.h                      | 423 ++++++++++
>  drivers/tee/optee/optee_private.h                  | 146 ++++
>  drivers/tee/optee/optee_smc.h                      | 418 ++++++++++
>  drivers/tee/optee/rpc.c                            | 322 ++++++++
>  drivers/tee/optee/supp.c                           | 212 +++++
>  drivers/tee/tee.c                                  | 873 +++++++++++=
++++++++++
>  drivers/tee/tee_private.h                          |  80 ++
>  drivers/tee/tee_shm.c                              | 324 ++++++++
>  drivers/tee/tee_shm_pool.c                         | 133 ++++
>  include/linux/tee_drv.h                            | 299 +++++++
>  include/uapi/linux/tee.h                           | 383 +++++++++
>  25 files changed, 4739 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/firmware/li=
naro,optee-tz.txt
>  create mode 100644 Documentation/tee.txt
>  create mode 100644 drivers/tee/Kconfig
>  create mode 100644 drivers/tee/Makefile
>  create mode 100644 drivers/tee/optee/Kconfig
>  create mode 100644 drivers/tee/optee/Makefile
>  create mode 100644 drivers/tee/optee/call.c
>  create mode 100644 drivers/tee/optee/core.c
>  create mode 100644 drivers/tee/optee/optee_msg.h
>  create mode 100644 drivers/tee/optee/optee_private.h
>  create mode 100644 drivers/tee/optee/optee_smc.h
>  create mode 100644 drivers/tee/optee/rpc.c
>  create mode 100644 drivers/tee/optee/supp.c
>  create mode 100644 drivers/tee/tee.c
>  create mode 100644 drivers/tee/tee_private.h
>  create mode 100644 drivers/tee/tee_shm.c
>  create mode 100644 drivers/tee/tee_shm_pool.c
>  create mode 100644 include/linux/tee_drv.h
>  create mode 100644 include/uapi/linux/tee.h
>=20
> --=20
> 1.9.1
>=20
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

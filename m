From: Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v10 0/4] generic TEE subsystem
Date: Wed,  1 Jun 2016 14:41:24 +0200
Message-ID: <1464784888-19854-1-git-send-email-jens.wiklander@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Al Viro <viro@ZenIV.linux.org.uk>, Andreas Dannenberg <dannenberg@ti.com>, valentin.manea@huawei.com, jean-michel.delorme@st.com, emmanuel.michel@st.com, javier@javigon.com, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Mark Rutland <mark.rutland@arm.com>, Michal Simek <michal.simek@xilinx.com>, Rob Herring <robh+dt@kernel.org>, Will Deacon <will.deacon@arm.com>, Arnd Bergmann <arnd@arndb.de>, Nishanth Menon <nm@ti.com>, Jens Wiklander <jens.wiklander@linaro.org>
List-Id: devicetree@vger.kernel.org

Hi,

[TL;DR; This patch set needs more review, if you're using OP-TEE please
help reviewing.]

This patch set introduces a generic TEE subsystem. The TEE subsystem wi=
ll
contain drivers for various TEE implementations. A TEE (Trusted Executi=
on
Environment) is a trusted OS running in some secure environment, for
example, TrustZone on ARM CPUs, or a separate secure co-processor etc.

Regarding use cases, TrustZone has traditionally been used for
offloading secure tasks to the secure world. Examples include:=20
- Secure key handling where the OS may or may not have direct access to=
 key
  material.
- E-commerce and payment technologies. Credentials, credit card numbers=
 etc
  could be stored in a more secure environment.
- Trusted User Interface (TUI) to ensure that no-one can snoop PIN-code=
s
  etc.
- Secure boot to ensure that loaded binaries haven=E2=80=99t been tampe=
red with.
  It=E2=80=99s not strictly needed for secure boot, but you could enhan=
ce security
  by leveraging a TEE during boot.
- Digital Rights Management (DRM), the studios provides content with
  different resolution depending on the security of the device. Higher
  security means higher resolution.

A TEE could also be used in existing and new technologies. For example =
IMA
(Integrity Measurement Architecture) which has been in the kernel for q=
uite
a while. Today you can enhance security by using a TPM-chip to sign the=
 IMA
measurement list. This is something that you also could do by leveragin=
g a
TEE.

Another example could be in 2-factor authentication which is becoming
increasingly more important. FIDO (https://fidoalliance.org) for exampl=
e
are using public key cryptography in their 2-factor authentication stan=
dard
(U2F). With FIDO, a private and public key pair will be generated for e=
very
site you visit and the private key should never leave the local device.
This is an example where you could use secure storage in a TEE for the
private key.

Today you will find a quite a few different out of tree implementations=
 of
TEE drivers which tends to fragment the TEE ecosystem and development. =
We
think it would be a good idea to have a generic TEE driver integrated i=
n
the kernel which would serve as a base for several different TEE soluti=
ons,
no matter if they are on-chip like TrustZone or if they are on a separa=
te
crypto co-processor.

To develop this TEE subsystem we have been using the open source TEE ca=
lled
OP-TEE (https://github.com/OP-TEE/optee_os) and therefore this would be=
 the
first TEE solution supported by this new subsystem. OP-TEE is a
GlobalPlatform compliant TEE, however this TEE subsystem is not limited=
 to
only GlobalPlatform TEEs, instead we have tried to design it so that it
should work with other TEE solutions also.

"tee: generic TEE subsystem" brings in the generic TEE subsystem which
helps when writing a driver for a specific TEE, for example, OP-TEE.

"tee: add OP-TEE driver" is an OP-TEE driver which uses the subsystem t=
o do
its work.

This patch set has been prepared in cooperation with Javier Gonz=C3=A1l=
ez who
proposed "Generic TrustZone Driver in Linux Kernel" patches 28 Nov 2014=
,
https://lwn.net/Articles/623380/ . We've since then changed the scope t=
o
TEE instead of TrustZone.

We have discussed the design on tee-dev@lists.linaro.org (archive at
https://lists.linaro.org/pipermail/tee-dev/) with people from other
companies, including Valentin Manea <valentin.manea@huawei.com>,
Emmanuel MICHEL <emmanuel.michel@st.com>,
Jean-michel DELORME <jean-michel.delorme@st.com>,
and Joakim Bech <joakim.bech@linaro.org>. Our main concern has been to
agree on something that is generic enough to support many different
TEEs while still keeping the interface together.

v10:
* Rebased on v4.7-rc1
* Addressed private review comments from Nishanth Menon
* Optee driver only accepts one supplicant process on the privileged de=
vice
* Optee driver avoids long delayed releases of shm objects
* Added more comments on functions and structs

v9:
* Rebased on v4.6-rc1
* Acked-by: Andreas Dannenberg <dannenberg@ti.com>
* Addressed comments from Al Viro how file descriptors are passed to
  user space
* Addressed comments from Randy Dunlap on documentation
* Changed license for include/uapi/linux/tee.h

v8:
* Rebased on v4.5-rc3
* dt/bindings: add bindings for optee
  Acked-by: Rob Herring <robh@kernel.org>
* Fixes build error for X86
* Fixes spell error in "dt/bindings: add bindings for optee"

v7:
* Rebased on v4.5-rc2
* Moved the ARM SMC Calling Convention support into a separate patch
  set, which is now merged

v6:
* Rebased on v4.3-rc7
* Changed smccc interface to let the compiler marshal most of the
  parameters
* Added ARCH64 capability for smccc interface
* Changed the PSCI firmware calls (both arm and arm64) to use the new
  generic smccc interface instead instead of own assembly functions.
* Move optee DT bindings to below arm/firmware
* Defines method for OP-TEE driver to call secure world in DT, smc or h=
vc
* Exposes implementation id of a TEE driver in sysfs
  to easily spawn corresponding tee-supplicant when device is ready
* Update OP-TEE Message Protocol to better cope with fragmented physica=
l
  memory
* Read time directly from OP-TEE driver instead of forwarding the RPC
  request to tee-supplicant

v5:
* Replaced kref reference counting for the device with a size_t instead=
 as
  the counter is always protected by a mutex

v4:
* Rebased on 4.1
* Redesigned the synchronization around entry exit of normal SMC
* Replaced rwsem on the driver instance with kref and completion since
  rwsem wasn't intended to be used in this way
* Expanded the TEE_IOCTL_PARAM_ATTR_TYPE_MASK to make room for
  future additional parameter types
* Documents TEE subsystem and OP-TEE driver
* Replaced TEE_IOC_CMD with TEE_IOC_OPEN_SESSION, TEE_IOC_INVOKE,
  TEE_IOC_CANCEL and TEE_IOC_CLOSE_SESSION
* DT bindings in a separate patch
* Assembly parts moved to arch/arm and arch/arm64 respectively, in a
  separate patch
* Redefined/clarified the meaning of OPTEE_SMC_SHM_CACHED
* Removed CMA usage to limit the scope of the patch set

v3:
* Rebased on 4.1-rc3 (dma_buf_export() API change)
* A couple of small sparse fixes
* Documents bindings for OP-TEE driver
* Updated MAINTAINERS

v2:
* Replaced the stubbed OP-TEE driver with a real OP-TEE driver
* Removed most APIs not needed by OP-TEE in current state
* Update Documentation/ioctl/ioctl-number.txt with correct path to tee.=
h
* Rename tee_shm_pool_alloc_cma() to tee_shm_pool_alloc()
* Moved tee.h into include/uapi/linux/
* Redefined tee.h IOCTL macros to be directly based on _IOR and friends
* Removed version info on the API to user space, a data blob which
  can contain an UUID is left for user space to be able to tell which
  protocol to use in TEE_IOC_CMD
* Changed user space exposed structures to only have types with __ pref=
ix
* Dropped THIS_MODULE from tee_fops
* Reworked how the driver is registered and ref counted:
  - moved from using an embedded struct miscdevice to an embedded struc=
t
    device.
  - uses an struct rw_semaphore as synchronization for driver detachmen=
t
  - uses alloc/register pattern from TPM

Thanks,
Jens

Jens Wiklander (4):
  dt/bindings: add bindings for optee
  tee: generic TEE subsystem
  tee: add OP-TEE driver
  Documentation: tee subsystem and op-tee driver

 Documentation/00-INDEX                             |   2 +
 .../bindings/arm/firmware/linaro,optee-tz.txt      |  31 +
 .../devicetree/bindings/vendor-prefixes.txt        |   1 +
 Documentation/ioctl/ioctl-number.txt               |   1 +
 Documentation/tee.txt                              | 118 +++
 MAINTAINERS                                        |  13 +
 drivers/Kconfig                                    |   2 +
 drivers/Makefile                                   |   1 +
 drivers/tee/Kconfig                                |  19 +
 drivers/tee/Makefile                               |   4 +
 drivers/tee/optee/Kconfig                          |   8 +
 drivers/tee/optee/Makefile                         |   5 +
 drivers/tee/optee/call.c                           | 422 ++++++++++
 drivers/tee/optee/core.c                           | 553 +++++++++++++
 drivers/tee/optee/optee_msg.h                      | 435 ++++++++++
 drivers/tee/optee/optee_private.h                  | 181 +++++
 drivers/tee/optee/optee_smc.h                      | 418 ++++++++++
 drivers/tee/optee/rpc.c                            | 401 ++++++++++
 drivers/tee/optee/supp.c                           | 241 ++++++
 drivers/tee/tee.c                                  | 877 +++++++++++++=
++++++++
 drivers/tee/tee_private.h                          | 125 +++
 drivers/tee/tee_shm.c                              | 347 ++++++++
 drivers/tee/tee_shm_pool.c                         | 155 ++++
 include/linux/tee_drv.h                            | 273 +++++++
 include/uapi/linux/tee.h                           | 400 ++++++++++
 25 files changed, 5033 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/firmware/lina=
ro,optee-tz.txt
 create mode 100644 Documentation/tee.txt
 create mode 100644 drivers/tee/Kconfig
 create mode 100644 drivers/tee/Makefile
 create mode 100644 drivers/tee/optee/Kconfig
 create mode 100644 drivers/tee/optee/Makefile
 create mode 100644 drivers/tee/optee/call.c
 create mode 100644 drivers/tee/optee/core.c
 create mode 100644 drivers/tee/optee/optee_msg.h
 create mode 100644 drivers/tee/optee/optee_private.h
 create mode 100644 drivers/tee/optee/optee_smc.h
 create mode 100644 drivers/tee/optee/rpc.c
 create mode 100644 drivers/tee/optee/supp.c
 create mode 100644 drivers/tee/tee.c
 create mode 100644 drivers/tee/tee_private.h
 create mode 100644 drivers/tee/tee_shm.c
 create mode 100644 drivers/tee/tee_shm_pool.c
 create mode 100644 include/linux/tee_drv.h
 create mode 100644 include/uapi/linux/tee.h

--=20
1.9.1

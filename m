From: Jens Wiklander <jens.wiklander-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH V3 0/2] generic TEE subsystem
Date: Fri, 15 May 2015 08:34:25 +0200
Message-ID: <1431671667-11219-1-git-send-email-jens.wiklander@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, javier-5MUHepqpBA1BDgjK7y7TUQ@public.gmane.org, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Herbert Xu <herbert-lOAM2aK0SrRLBo1qDEOMRrpzq4S04n8Q@public.gmane.org>, tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, valentin.manea-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, jean-michel.delorme-qxv4g6HH51o@public.gmane.org, emmanuel.michel-qxv4g6HH51o@public.gmane.org, Jens Wiklander <jens.wiklander-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

This patch set introduces a generic TEE subsystem. The TEE subsystem wi=
ll be
able contain drivers for various TEE implementations. A TEE (Trusted
Execution Environment) is a trusted OS running in some secure environme=
nt,
for example, TrustZone on ARM cpus, or a separate secure co-processor e=
tc.

Regarding use cases, TrustZone has traditionally been used for
offloading secure tasks to the secure world. Examples include banking
applications, Digital Rights Management (DRM), or specific secure
solutions.

This TEE subsystem can serve a TEE driver for a Global Platform complia=
nt
TEE, but it's not limited to only Global Platform TEEs.  One reason why=
 I'm
doing this to be able to get an OP-TEE (https://github.com/OP-TEE/optee=
_os)
driver upstream.

The first patch brings in the generic TEE subsystem which helps when
writing a driver for a specific TEE, for example, OP-TEE.

The second patch is an OP-TEE driver which uses the subsystem to do its
work.

Javier is also working on a driver for another TEE so we will soon have=
 at
least two TEE drivers under the TEE subsystem.

Questions:
* Where should we put this in the tree? I'm proposing drivers/tee
  Another place could be drivers/firmware/tee. I don't have a strong
  opinion on either place.

* What should we have in the .compatible field in FDT for the OP-TEE dr=
iver?
  I'm proposing "optee,optee-tz" as OP-TEE doesn't really have a vendor=
=2E
  OP-TEE isn't limited to TrustZone, it can run in other environments t=
oo so
  "optee-tz" could be a way of keeping different options apart. Does it
  make sense or should I use some other scheme?

* Who will maintain this? I'm willing to do it together with Javier.

This patch set has been prepared in cooperation with Javier Gonz=C3=A1l=
ez who
proposed "Generic TrustZone Driver in Linux Kernel" patches 28 Nov 2014=
,
https://lwn.net/Articles/623380/ . We've since then changed the scope t=
o
TEE instead of TrustZone.

We have discussed the design on tee-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org (archive at
https://lists.linaro.org/pipermail/tee-dev/) with people from other
companies, including Valentin Manea <valentin.manea-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>,
Emmanuel MICHEL <emmanuel.michel-qxv4g6HH51o@public.gmane.org>,
Jean-michel DELORME <jean-michel.delorme-qxv4g6HH51o@public.gmane.org>,
and Joakim Bech <joakim.bech-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>. Our main concern has been to
agree on something that is generic enough to support many different
TEEs while still keeping the interface together.

Open issues from previous review (on v1):
* Comment from Arnd Bergmann on several empty dma-buf callbacks:
  I haven't planned fill in more in those functions for this patch set.
  Fixing those empty bma-buf callbacks requires changes in dma-buf, can=
 we
  take that outside this patch set?

* There has been some concerns about TEE_IOC_CMD, hopefully the
  OP-TEE driver will make the purpose more clear now.

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

Regards,
Jens

Jens Wiklander (2):
  tee: generic TEE subsystem
  tee: add OP-TEE driver

 Documentation/devicetree/bindings/optee/optee.txt  |  17 +
 .../devicetree/bindings/vendor-prefixes.txt        |   1 +
 Documentation/ioctl/ioctl-number.txt               |   1 +
 MAINTAINERS                                        |  14 +
 drivers/Kconfig                                    |   2 +
 drivers/Makefile                                   |   1 +
 drivers/tee/Kconfig                                |  18 +
 drivers/tee/Makefile                               |   4 +
 drivers/tee/optee/Kconfig                          |  19 +
 drivers/tee/optee/Makefile                         |  13 +
 drivers/tee/optee/call.c                           | 294 ++++++++++++
 drivers/tee/optee/core.c                           | 509 +++++++++++++=
+++++++
 drivers/tee/optee/optee_private.h                  | 138 ++++++
 drivers/tee/optee/optee_smc.h                      | 510 +++++++++++++=
++++++++
 drivers/tee/optee/rpc.c                            | 282 ++++++++++++
 drivers/tee/optee/smc_a32.S                        |  30 ++
 drivers/tee/optee/smc_a64.S                        |  37 ++
 drivers/tee/optee/supp.c                           | 327 +++++++++++++
 drivers/tee/tee.c                                  | 338 +++++++++++++=
+
 drivers/tee/tee_private.h                          |  74 +++
 drivers/tee/tee_shm.c                              | 327 +++++++++++++
 drivers/tee/tee_shm_pool.c                         | 246 ++++++++++
 include/linux/tee_drv.h                            | 281 ++++++++++++
 include/uapi/linux/optee_msg.h                     | 368 +++++++++++++=
++
 include/uapi/linux/tee.h                           | 118 +++++
 25 files changed, 3969 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/optee/optee.txt
 create mode 100644 drivers/tee/Kconfig
 create mode 100644 drivers/tee/Makefile
 create mode 100644 drivers/tee/optee/Kconfig
 create mode 100644 drivers/tee/optee/Makefile
 create mode 100644 drivers/tee/optee/call.c
 create mode 100644 drivers/tee/optee/core.c
 create mode 100644 drivers/tee/optee/optee_private.h
 create mode 100644 drivers/tee/optee/optee_smc.h
 create mode 100644 drivers/tee/optee/rpc.c
 create mode 100644 drivers/tee/optee/smc_a32.S
 create mode 100644 drivers/tee/optee/smc_a64.S
 create mode 100644 drivers/tee/optee/supp.c
 create mode 100644 drivers/tee/tee.c
 create mode 100644 drivers/tee/tee_private.h
 create mode 100644 drivers/tee/tee_shm.c
 create mode 100644 drivers/tee/tee_shm_pool.c
 create mode 100644 include/linux/tee_drv.h
 create mode 100644 include/uapi/linux/optee_msg.h
 create mode 100644 include/uapi/linux/tee.h

--=20
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

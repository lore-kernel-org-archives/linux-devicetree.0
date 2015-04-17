From: Jens Wiklander <jens.wiklander-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [RFC PATCH 0/2] generic TEE subsystem
Date: Fri, 17 Apr 2015 09:50:55 +0200
Message-ID: <1429257057-7935-1-git-send-email-jens.wiklander@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, javier-5MUHepqpBA1BDgjK7y7TUQ@public.gmane.org
Cc: Herbert Xu <herbert-lOAM2aK0SrRLBo1qDEOMRrpzq4S04n8Q@public.gmane.org>, tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, valentin.manea-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, jean-michel.delorme-qxv4g6HH51o@public.gmane.org, emmanuel.michel-qxv4g6HH51o@public.gmane.org, Jens Wiklander <jens.wiklander-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

This patch set introduces a generic TEE subsystem. The TEE subssytem wi=
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

The second patch is a mostly stubbed OP-TEE driver which shows briefly =
how
a specific TEE driver uses the subsystem to register etc.

I've tested this with a more complete OP-TEE driver, but I don't want t=
o
post that yet in the current shape. I will submit a complete OP-TEE dri=
ver
when it's ready. Javier is also working on a driver for another TEE so =
we
will soon have at least two TEE drivers under the TEE subsystem.

Questions:
* Where should we put this in the tree? I'm proposing drivers/tee and
  include/linux/tee here. Another place could be drivers/firmware/tee. =
I
  don't have a strong opinion on either place.

* What should we have in the .compatible field in FDT for the OP-TEE dr=
iver?
  I'm proposing "optee,optee-tz" as OP-TEE doesn't really have a vendor=
=2E
  OP-TEE isn't limited to TrustZone, it can run in other environments t=
oo so
  "optee-tz" could be a way of keeping different options apart. I need
  advice here.

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

Regards,
Jens

Jens Wiklander (2):
  tee: generic TEE subsystem
  tee: add OP-TEE driver

 Documentation/ioctl/ioctl-number.txt |   1 +
 drivers/Kconfig                      |   2 +
 drivers/Makefile                     |   1 +
 drivers/tee/Kconfig                  |  18 ++
 drivers/tee/Makefile                 |   4 +
 drivers/tee/optee/Kconfig            |   7 +
 drivers/tee/optee/Makefile           |   2 +
 drivers/tee/optee/core.c             | 192 ++++++++++++++++++++
 drivers/tee/tee.c                    | 253 +++++++++++++++++++++++++++
 drivers/tee/tee_private.h            |  64 +++++++
 drivers/tee/tee_shm.c                | 330 +++++++++++++++++++++++++++=
++++++++
 drivers/tee/tee_shm_pool.c           | 246 ++++++++++++++++++++++++++
 include/linux/tee/tee.h              | 180 +++++++++++++++++++
 include/linux/tee/tee_drv.h          | 271 +++++++++++++++++++++++++++=
+
 14 files changed, 1571 insertions(+)
 create mode 100644 drivers/tee/Kconfig
 create mode 100644 drivers/tee/Makefile
 create mode 100644 drivers/tee/optee/Kconfig
 create mode 100644 drivers/tee/optee/Makefile
 create mode 100644 drivers/tee/optee/core.c
 create mode 100644 drivers/tee/tee.c
 create mode 100644 drivers/tee/tee_private.h
 create mode 100644 drivers/tee/tee_shm.c
 create mode 100644 drivers/tee/tee_shm_pool.c
 create mode 100644 include/linux/tee/tee.h
 create mode 100644 include/linux/tee/tee_drv.h

--=20
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

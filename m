From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v4 0/4] st33zp24 new architecture proposal and st33zp24 spi driver
Date: Sun, 25 Jan 2015 22:11:29 +0100
Message-ID: <1422220293-21005-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: PeterHuewe-Mmb7MZpHnFY@public.gmane.org
Cc: ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org, tpmdd-yWjUBOtONefk1uMJSBkQmQ@public.gmane.org, tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, jean-luc.blanc-qxv4g6HH51o@public.gmane.org, benoit.houyere-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org, jarkko.sakkinen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

The following patchset:
- propose a new architecture allowing to share a core st33zp24 data management
layer with different phy (i2c & spi). For st33zp24 both phy have a proprietary transport
protocol. Both are relying on the TCG TIS protocol. At the end, it simplifies the maintenance.
- Add an spi phy allowing to support st33zp24 using with an SPI bus.

The complete solution got tested in polling and interrupt mode successfully with i2c & spi phy.
This patchset applies on top of Peter's tree https://github.com/PeterHuewe/linux-tpmdd.git for-james branch
on top of:
d4989d9f693b9502f9288da5db279c2f8c2e50be tpm/tpm_tis: Add missing ifdef CONFIG_ACPI for pnp_acpi_device

I confirm also Jarkko Sakkinen's changes are working with this product with both phy's.

- v2 takes into account feedbacks from Jason Gunthorpe.
- v3 is reduced to 4 patches as 6 out of 10 got accepted for 3.20. Also compare to v2:
        * Fix build issue with patch v2 04/10 "Replace access to io_lpcpd from struct st33zp24_platform_data to tpm_stm_dev"
        * Fix link issue with patch v2 08/10 "Split tpm_i2c_tpm_st33 in 2 layers (core + phy)" when building as a module.
        The symbols wasn't exported in st33zp24.c.
        * Add missing MODULE_LICENSE in patch v2 09/10 "Add st33zp24 spi phy"
        * Fix node example in dts spi documentation in patch v2 10/10 "Add dts documentation for st33zp24 spi phy"
        * Fix typo on Jason Gunthorpe first name. Sorry for that :(...
	* Change contact email address as tpmsupport-qxv4g6HH51o@public.gmane.org is no more valid
- v4 adds missing module_license in st33zp24

Best Regards
Christophe

Christophe Ricard (4):
  tpm/tpm_i2c_stm_st33: Replace access to io_lpcpd from struct
    st33zp24_platform_data to tpm_stm_dev
  tpm/tpm_i2c_stm_st33: Split tpm_i2c_tpm_st33 in 2 layers (core + phy)
  tpm/st33zp24/spi: Add st33zp24 spi phy
  tpm/st33zp24/dts/st33zp24-spi: Add dts documentation for st33zp24 spi
    phy

 .../bindings/security/tpm/st33zp24-spi.txt         |  34 +
 drivers/char/tpm/Kconfig                           |  11 +-
 drivers/char/tpm/Makefile                          |   2 +-
 drivers/char/tpm/st33zp24/Kconfig                  |  30 +
 drivers/char/tpm/st33zp24/Makefile                 |  12 +
 drivers/char/tpm/st33zp24/i2c.c                    | 278 +++++++
 drivers/char/tpm/st33zp24/spi.c                    | 386 +++++++++
 drivers/char/tpm/st33zp24/st33zp24.c               | 691 ++++++++++++++++
 drivers/char/tpm/st33zp24/st33zp24.h               |  34 +
 drivers/char/tpm/tpm_i2c_stm_st33.c                | 911 ---------------------
 include/linux/platform_data/st33zp24.h             |  28 +
 include/linux/platform_data/tpm_stm_st33.h         |  39 -
 12 files changed, 1495 insertions(+), 961 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/security/tpm/st33zp24-spi.txt
 create mode 100644 drivers/char/tpm/st33zp24/Kconfig
 create mode 100644 drivers/char/tpm/st33zp24/Makefile
 create mode 100644 drivers/char/tpm/st33zp24/i2c.c
 create mode 100644 drivers/char/tpm/st33zp24/spi.c
 create mode 100644 drivers/char/tpm/st33zp24/st33zp24.c
 create mode 100644 drivers/char/tpm/st33zp24/st33zp24.h
 delete mode 100644 drivers/char/tpm/tpm_i2c_stm_st33.c
 create mode 100644 include/linux/platform_data/st33zp24.h
 delete mode 100644 include/linux/platform_data/tpm_stm_st33.h

-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

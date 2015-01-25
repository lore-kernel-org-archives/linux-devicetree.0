From: Peter =?iso-8859-15?q?H=FCwe?= <PeterHuewe-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: [PATCH v3 0/4] st33zp24 new architecture proposal and st33zp24 spi driver
Date: Sun, 25 Jan 2015 20:23:17 +0100
Message-ID: <201501252023.26828.PeterHuewe@gmx.de>
References: <1422200097-9869-1-git-send-email-christophe-h.ricard@st.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1422200097-9869-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org, tpmdd-yWjUBOtONefk1uMJSBkQmQ@public.gmane.org, tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, jean-luc.blanc-qxv4g6HH51o@public.gmane.org, benoit.houyere-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org, jarkko.sakkinen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Sonntag, 25. Januar 2015, 16:34:53 schrieb Christophe Ricard:
> Hi,
> 
> The following patchset:
> - propose a new architecture allowing to share a core st33zp24 data
> management layer with different phy (i2c & spi). For st33zp24 both phy
> have a proprietary transport protocol. Both are relying on the TCG TIS
> protocol. At the end, it simplifies the maintenance. - Add an spi phy
> allowing to support st33zp24 using with an SPI bus.
> 
> The complete solution got tested in polling and interrupt mode successfully
> with i2c & spi phy. This patchset applies on top of Peter's tree
> https://github.com/PeterHuewe/linux-tpmdd.git for-james branch on top of:
> d4989d9f693b9502f9288da5db279c2f8c2e50be tpm/tpm_tis: Add missing ifdef
> CONFIG_ACPI for pnp_acpi_device
> 
> I confirm also Jarkko Sakkinen's changes are working with this product with
> both phy's.
> 
> - v2 takes into account feedbacks from Jason Gunthorpe.
> - v3 is reduced to 4 patches as 6 out of 10 got accepted for 3.20. Also
> compare to v2: * Fix build issue with patch v2 04/10 "Replace access to
> io_lpcpd from struct st33zp24_platform_data to tpm_stm_dev" * Fix link
> issue with patch v2 08/10 "Split tpm_i2c_tpm_st33 in 2 layers (core +
> phy)" when building as a module. The symbols wasn't exported in
> st33zp24.c.
> 	* Add missing MODULE_LICENSE in patch v2 09/10 "Add st33zp24 spi phy"
> 	* Fix node example in dts spi documentation in patch v2 10/10 "Add dts
> documentation for st33zp24 spi phy" * Fix typo on Jason Gunthorpe first
> name. Sorry for that :(...

[169760.443732] tpm_st33zp24: module license 'unspecified' taints kernel.

:(

Peter
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

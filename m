From: Peter =?iso-8859-15?q?H=FCwe?= <PeterHuewe-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: [PATCH v2 00/10]  st33zp24 new architecture proposal and st33zp24 spi driver
Date: Sat, 17 Jan 2015 15:08:36 +0100
Message-ID: <201501171508.38660.PeterHuewe@gmx.de>
References: <1421187198-8503-1-git-send-email-christophe-h.ricard@st.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1421187198-8503-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org, tpmdd-yWjUBOtONefk1uMJSBkQmQ@public.gmane.org, tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, jean-luc.blanc-qxv4g6HH51o@public.gmane.org, benoit.houyere-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org, jarkko.sakkinen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Dienstag, 13. Januar 2015, 23:13:08 schrieb Christophe Ricard:
> Hi,
> 
> The following patchset:
> - clean the current tpm_i2c_stm_st33 driver
> - propose a new architecture allowing to share a core st33zp24 data
> management layer with different phy (i2c & spi). For st33zp24 both phy
> have a proprietary transport protocol. Both are relying on the TCG TIS
> protocol. At the end, it simplifies the maintenance. - Add an spi phy
> allowing to support st33zp24 using with an SPI bus.
> 
> The complete solution got tested in polling and interrupt mode successfully
> with i2c & spi phy. This patchset applies on top of Peter's tree
> https://github.com/PeterHuewe/linux-tpmdd.git for-james branch on top of:
> tpm: TPM 2.0 FIFO Interface 2c71d9fb22289a196a4b51d6158cf0d2f9abcfb9
> 
> I confirm also Jarkko Sakkinen's changes are working with this product with
> both phy's.
> 
> v2 takes into account feedbacks from Jason Gunthorpe.
> 
> Best Regards
> Christophe
> 
> Christophe Ricard (10):
>   tpm/tpm_i2c_stm_st33: Remove sparse spaces
Applied
>   tpm/tpm_i2c_stm_st33: Sanity cleanup
Applied
>   tpm/tpm_i2c_stm_st33: Replace remaining r by ret
Applied
>   tpm/tpm_i2c_stm_st33: Replace access to io_lpcpd from struct 
st33zp24_platform_data to tpm_stm_dev
please fix
>    
>   tpm/tpm_i2c_stm_st33: Change tpm_i2c_stm_st33.h to tpm_stm_st33.h
Applied

>   tpm/tpm_i2c_stm_st33: Add status check when reading data on the FIFO
Applied, marked as stable

>   tpm/tpm_i2c_stm_st33/dts/st33zp24-i2c: Rename st33zp24 dts
>     documentation
Applied

>   tpm/tpm_i2c_stm_st33: Split tpm_i2c_tpm_st33 in 2 layers (core + phy)
Please fix
>   tpm/st33zp24/spi: Add st33zp24 spi phy
N/A
>   tpm/st33zp24/dts/st33zp24-spi: Add dts documentation for st33zp24 spi
>     phy
N/A

Also fixed the Jasob typo :)

The applied stuff will be included in the pull request.


Peter

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

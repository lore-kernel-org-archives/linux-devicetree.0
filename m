From: Peter =?iso-8859-15?q?H=FCwe?= <PeterHuewe-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: [PATCH v2 09/10] tpm/st33zp24/spi: Add st33zp24 spi phy
Date: Sat, 17 Jan 2015 14:29:25 +0100
Message-ID: <201501171429.27517.PeterHuewe@gmx.de>
References: <1421187198-8503-1-git-send-email-christophe-h.ricard@st.com> <1421187198-8503-10-git-send-email-christophe-h.ricard@st.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1421187198-8503-10-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org, tpmdd-yWjUBOtONefk1uMJSBkQmQ@public.gmane.org, tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, jean-luc.blanc-qxv4g6HH51o@public.gmane.org, benoit.houyere-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org, jarkko.sakkinen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Dienstag, 13. Januar 2015, 23:13:17 schrieb Christophe Ricard:
> st33zp24 TIS 1.2 support also SPI. It is using a proprietary protocol to
> transport TIS data.
> 
> Reviewed-by: Jasob Gunthorpe <jason.gunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
> Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>

> +
> +MODULE_AUTHOR("Christophe Ricard (tpmsupport-qxv4g6HH51o@public.gmane.org)");
> +MODULE_DESCRIPTION("STM TPM 1.2 SPI ST33 Driver");
> +MODULE_VERSION("1.3.0");

Missing MODULE_LICENSE!

WARNING: modpost: missing MODULE_LICENSE() in 
drivers/char/tpm/st33zp24/tpm_st33zp24_spi.o

--> does not compile.
Judging from the header, can I add 
MODULE_LICENSE("GPL") 
?
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

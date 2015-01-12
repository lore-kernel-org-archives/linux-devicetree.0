From: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Subject: Re: [PATCH v1 00/10] st33zp24 new architecture proposal and st33zp24
 spi driver
Date: Mon, 12 Jan 2015 11:26:38 -0700
Message-ID: <20150112182638.GB11295@obsidianresearch.com>
References: <1420888831-17491-1-git-send-email-christophe-h.ricard@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1420888831-17491-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: PeterHuewe-Mmb7MZpHnFY@public.gmane.org, ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org, tpmdd-yWjUBOtONefk1uMJSBkQmQ@public.gmane.org, tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, jean-luc.blanc-qxv4g6HH51o@public.gmane.org, benoit.houyere-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jarkko.sakkinen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Jan 10, 2015 at 12:20:21PM +0100, Christophe Ricard wrote:
> Hi,
> 
> The following patchset:
> - clean the current tpm_i2c_stm_st33 driver
> - propose a new architecture allowing to share a core st33zp24 data management
> layer with different phy (i2c & spi). For st33zp24 both phy have a proprietary transport
> protocol. Both are relying on the TCG TIS protocol. At the end, it simplifies the maintenance.
> - Add an spi phy allowing to support st33zp24 using with an SPI bus.

I read through this and not much stood out, just one comment on patch 8

Patch 4 and 6 do not seem to be part of this series and seem to be
bug fixes, the should be seperated so Peter can fast track them
into the kernel.

So excluding patch 8:

Reviewed-By: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>

Jason
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

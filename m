From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH v3 0/4] dra7: Add PCIe support
Date: Tue, 22 Jul 2014 17:47:39 +0530
Message-ID: <53CE5663.3020100@ti.com>
References: <1405587643-13808-1-git-send-email-kishon@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1405587643-13808-1-git-send-email-kishon@ti.com>
Sender: linux-doc-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-pci@vger.kernel.org, jg1.han@samsung.com, bhelgaas@google.com, mohit.kumar@st.com, linux-kernel@vger.kernel.org
Cc: grant.likely@linaro.org
List-Id: devicetree@vger.kernel.org

Hi Bjorn,

On Thursday 17 July 2014 02:30 PM, Kishon Vijay Abraham I wrote:
> Changes from v2:
> * Added myself as MAINTAINER of pcie dra7xx driver
> 
> Changes from v1:
> * fixed dw_pcie_prog_viewport_io_outbound() to use untranslated address
> * split dra7xx patch into driver part and documentation part
> 
> [1] is split into separate series in order for individual subsystem
> Maintainers to pick up the patches. This series handles the PCIe
> support for DRA7.
> 
> Rebased to pci -next.
> 
> [1] -> https://lkml.org/lkml/2014/5/29/258

I tried to get Acks for the DT documentation from DT maintainers but couldn't.
I'd assume they would have reverted if they had any concerns. Moreover the dt
documentation for DRA7xx is just an extension of the dt documentation for
designware. And since Pratyush, Jingoo, Mohit seems to be okay with this patch
series, can we get this series merged?

Cheers
Kishon

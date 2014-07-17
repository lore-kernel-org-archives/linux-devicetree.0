From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v2 0/4] Support for Qualcomm QPNP PMIC's
Date: Thu, 17 Jul 2014 16:10:22 -0700
Message-ID: <53C857DE.7030507@codeaurora.org>
References: <1405613855-27572-1-git-send-email-svarbanov@mm-sol.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1405613855-27572-1-git-send-email-svarbanov@mm-sol.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stanimir Varbanov <svarbanov@mm-sol.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Lee Jones <lee.jones@linaro.org>, Samuel Ortiz <sameo@linux.intel.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Grant Likely <grant.likely@linaro.org>, Courtney Cavin <courtney.cavin@sonymobile.com>, Bjorn Andersson <bjorn.andersson@sonymobile.com>, Josh Cartwright <joshc@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On 07/17/14 09:17, Stanimir Varbanov wrote:
> Hello everyone,
>
> Here is the continuation of patch sets sent recently about Qualcomm
> QPNP SPMI PMICs.
>
> The previous version of the patch set can be found at [1].
>
> Changes since v1:
>  - removed completely custom *of* parser
>  - renamed the mfd driver from qpnp-spmi to pm8xxx-spmi
>  - now MFD_PM8XXX_SPMI Kconfig option depends on SPMI
>
> Removing of the custom *of* parser leads to that that the *reg* devicetree
> property cannot exist and therefore cannot be parsed to get PMIC peripheral
> resources. I took this step aside because no one from mfd drivers does this
> parsing. This will lead to inconvenience in the peripheral drivers to define
> internally the SPMI base addresses depending on the compatible property
> i.e. PMIC version. 

We should teach the of platform layer to translate reg properties up
until the point that they can't be translated anymore. If they can't be
translated all the way back to cpu addresses we can make the resource
have IORESOURCE_REG instead of IORESOURCE_MEM and then said pmic
platform drivers can use platform_get_resource() with IORESOURCE_REG
instead of IORESOURCE_MEM to get the addresses.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation

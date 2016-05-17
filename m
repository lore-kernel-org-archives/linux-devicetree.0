From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH 1/3] ARM: dts: NSP: Add MSI support on PCI
Date: Tue, 17 May 2016 12:29:57 -0700
Message-ID: <573B7135.2050604@gmail.com>
References: <1462490972-13566-1-git-send-email-jonmason@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1462490972-13566-1-git-send-email-jonmason@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Mason <jonmason@broadcom.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org

On 05/05/2016 04:29 PM, Jon Mason wrote:
> Add MSI support to the PCI driver of the Northstar Plus SoC.  This uses
> the existing pcie-iproc driver.  So, all that is needed is device tree
> entries in the DTS.
> 
> Signed-off-by: Jon Mason <jonmason@broadcom.com>

All applied, thanks! Just for next time, can you include a cover letter
for multi series patches?
-- 
Florian

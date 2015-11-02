From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH RESEND v4 0/2] ARM: dts: bcm5301x: Add SVK DT files and
 docs
Date: Mon, 02 Nov 2015 10:45:57 -0800
Message-ID: <5637AF65.5020905@gmail.com>
References: <1446489293-25088-1-git-send-email-jonmason@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1446489293-25088-1-git-send-email-jonmason@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Mason <jonmason@broadcom.com>, Hauke Mehrtens <hauke@hauke-m.de>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org

On 02/11/15 10:34, Jon Mason wrote:
> Resending due to lack of any response to the original v4 series
> 
> Changes in v4:
> * Changed bootargs to stdout-path, per Sudeep Holla
> 
> Changes in v3:
> * Updated the DT documentation compat strings
> * Modified the include files and compat strings for the SVK DT files,
>   per Hauke Mehrtens
> 
> Changes in v2:
> * Reorder the patches to add the DT binding documentation prior to the
>   new DT files
> * Removed the DT documentation compat strings to only the SoCs, not the
>   individual boards
> * Fixed the compat strings in the individual device tree files
> * Added the memory node and removed the "mem=" from the bootargs

Series applied to devicetree/next, thanks Jon!
-- 
Florian

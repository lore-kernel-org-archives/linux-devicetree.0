From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH 0/2] arm64: dts: NS2: Add sdio1, PCI phys
Date: Mon, 21 Nov 2016 11:27:47 -0800
Message-ID: <4c9d5d1a-bd4d-7e21-2076-da95af383e05@gmail.com>
References: <1479425103-2119-1-git-send-email-jon.mason@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1479425103-2119-1-git-send-email-jon.mason@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Mason <jon.mason@broadcom.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Florian Fainelli <f.fainelli@gmail.com>
Cc: devicetree@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 11/17/2016 03:25 PM, Jon Mason wrote:
> The second SDIO seems to have been forgotten to be enabled in the
> Northstar2 SVK dts.  Also, the PCI PHY entries are missing from the PCI
> bus device tree entries.

Series applied, thanks Jon
-- 
Florian

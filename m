From: santosh shilimkar <santosh.shilimkar@oracle.com>
Subject: Re: [PATCH v2 0/3] ARM: keystone: add ecc error interrupt handling
Date: Thu, 25 Jun 2015 08:04:43 -0700
Message-ID: <558C188B.5060107@oracle.com>
References: <1435242710-31346-1-git-send-email-vitalya@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1435242710-31346-1-git-send-email-vitalya@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vitaly Andrianov <vitalya@ti.com>, ssantosh@kernel.org, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 6/25/2015 7:31 AM, Vitaly Andrianov wrote:
> This patch series adds support for arm L1/L2 ecc and ddr3 ecc error handling
> for Keystone devices
>
> Change Log
>
> v2:
> - removing unused and sorting headers of keystone.c are moved to a separate
>    patch.
> - l1l2 ecc and ddr3 ecc error handling are split it to separate patches
> - removed unused headers from keystone_ecc.c
> - platsmp.c removed from the patch.
> - return IRQ_HANDLED for 1 bit error in l1l2 ecc handler
> - checked and handled existing ecc error before enabling ddr3 interrupt
> - 1 bit ddr3 interrupt is disabled, because it is handled by hardware and
>    there is no reason to handle it by software
>
This version looks good to me. As already commented, I would have liked
the patch 2/3(L2 ECC) code in ARM generic code so will give some more 
time for others to come back. Otherwise I will queue this up for next
window.

Thanks for follow up Vitaly.

Regards,
Santosh

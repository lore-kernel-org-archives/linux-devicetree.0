From: Nishanth Menon <nm@ti.com>
Subject: Re: [PATCH 0/3] ARM: dts: AM43x: Fix DCDC3 regulator voltage
Date: Thu, 6 Nov 2014 07:45:00 -0600
Message-ID: <545B7B5C.8040506@ti.com>
References: <1415271004-10935-1-git-send-email-j-keerthy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <1415271004-10935-1-git-send-email-j-keerthy@ti.com>
Sender: linux-omap-owner@vger.kernel.org
To: Keerthy <j-keerthy@ti.com>, tony@atomide.com, linux-omap@vger.kernel.org
Cc: devicetree@vger.kernel.org, galak@codeaurora.org, mark.rutland@arm.com, pawel.moll@arm.com
List-Id: devicetree@vger.kernel.org

On 11/06/2014 04:50 AM, Keerthy wrote:
> Fix DCDC3 volatge to 1.5V which is the right value to be supplied by
> DCDC3 for all the boards.
> 
> Keerthy (3):
>   ARM: dts: AM43x-EPOS-EVM: Fix DCDC3 voltage
>   ARM: dts: AM437x-GP-EVM: Fix DCDC3 voltage
>   ARM: dts: AM437x-SK-EVM: Fix DCDC3 voltage
> 
>  arch/arm/boot/dts/am437x-gp-evm.dts  |    4 ++--
>  arch/arm/boot/dts/am437x-sk-evm.dts  |    4 ++--
>  arch/arm/boot/dts/am43x-epos-evm.dts |    4 ++--
>  3 files changed, 6 insertions(+), 6 deletions(-)
> 
If Tony suggests, we might want to squash these to a single patch
since it hits every AM437x evm platform... but anyways..

Acked-by: Nishanth Menon <nm@ti.com>

-- 
Regards,
Nishanth Menon

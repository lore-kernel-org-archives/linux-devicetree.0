Return-Path: <SRS0=yM5v=F4=gmail.com=f.fainelli@kernel.org>
Subject: Re: [PATCH 0/3] MIPS: BMIPS: Add Broadcom STB device nodes
References: <20171117021944.894-1-jaedon.shin@gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <56e80e5d-8cdd-3b32-c0f5-ac33c45346b8@gmail.com>
Date: Mon, 5 Mar 2018 16:06:30 -0800
MIME-Version: 1.0
In-Reply-To: <20171117021944.894-1-jaedon.shin@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Jaedon Shin <jaedon.shin@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, James Hogan <james.hogan@mips.com>, Rob Herring <robh+dt@kernel.org>
Cc: Kevin Cernekee <cernekee@gmail.com>, Mark Rutland <mark.rutland@arm.com>, linux-mips@linux-mips.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 11/16/2017 06:19 PM, Jaedon Shin wrote:
> This series adds power and memory management related devie tree nodes for
> Broadcom STB platforms.
> 
> Jaedon Shin (3):
>   MIPS: BMIPS: Add Broadcom STB power management nodes
>   MIPS: BMIPS: Add Broadcom STB wake-up timer nodes
>   MIPS: BMIPS: Add Broadcom STB watchdog nodes

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>

Thanks!

> 
>  arch/mips/boot/dts/brcm/bcm7125.dtsi      |  7 +++
>  arch/mips/boot/dts/brcm/bcm7346.dtsi      | 62 +++++++++++++++++++++
>  arch/mips/boot/dts/brcm/bcm7358.dtsi      | 17 ++++++
>  arch/mips/boot/dts/brcm/bcm7360.dtsi      | 62 +++++++++++++++++++++
>  arch/mips/boot/dts/brcm/bcm7362.dtsi      | 62 +++++++++++++++++++++
>  arch/mips/boot/dts/brcm/bcm7420.dtsi      |  7 +++
>  arch/mips/boot/dts/brcm/bcm7425.dtsi      | 89 +++++++++++++++++++++++++++++++
>  arch/mips/boot/dts/brcm/bcm7435.dtsi      | 89 +++++++++++++++++++++++++++++++
>  arch/mips/boot/dts/brcm/bcm97125cbmb.dts  |  4 ++
>  arch/mips/boot/dts/brcm/bcm97346dbsmb.dts |  8 +++
>  arch/mips/boot/dts/brcm/bcm97358svmb.dts  |  8 +++
>  arch/mips/boot/dts/brcm/bcm97360svmb.dts  |  8 +++
>  arch/mips/boot/dts/brcm/bcm97362svmb.dts  |  8 +++
>  arch/mips/boot/dts/brcm/bcm97420c.dts     |  4 ++
>  arch/mips/boot/dts/brcm/bcm97425svmb.dts  |  8 +++
>  arch/mips/boot/dts/brcm/bcm97435svmb.dts  |  8 +++
>  16 files changed, 451 insertions(+)
> 


-- 
Florian

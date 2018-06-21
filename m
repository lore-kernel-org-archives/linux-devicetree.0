From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH 0/5] arm64: Initial support Texas Instrument's AM654
 Platform
Date: Wed, 20 Jun 2018 22:40:10 -0700
Message-ID: <20180621054010.GE112168@atomide.com>
References: <20180619194253.27288-1-nm@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180619194253.27288-1-nm@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nishanth Menon <nm@ti.com>
Cc: Will Deacon <will.deacon@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, Santosh Shilimkar <ssantosh@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Tero Kristo <t-kristo@ti.com>, Sekhar Nori <nsekhar@ti.com>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Sudeep Holla <sudeep.holla@arm.com>
List-Id: devicetree@vger.kernel.org

* Nishanth Menon <nm@ti.com> [180619 19:46]:
> Hi,
> This is an update from RFC posted earlier:
>         https://marc.info/?l=linux-arm-kernel&m=152817866312732&w=2
> 
> The following series enables support for newest addition in TI's SoC
> portfolio - AM654 SoC.
> 
> The series is based off v4.18-rc1, also available here:
> https://github.com/nmenon/linux-2.6-playground/tree/upstream/v4.18-rc1/k3-1-am6-base
> 
> Key changes since RFC are indicated in respective patches:
> * dt bindings updates (from review comments)
> * device tree is split up to incorporate ranges and bus segments
> * Cosmetic fixes including renaming the base dts to prevent confusion
> * UART has been split out

Other than the cbass to interrconnect naming, looks good to me now:

Reviewed-by: Tony Lindgren <tony@atomide.com>

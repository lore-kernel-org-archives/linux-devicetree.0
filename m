From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH 0/7] ARM32/64: DT overlay build support
Date: Wed, 29 Aug 2018 11:40:58 -0700
Message-ID: <f9562e36-ef04-fb14-74a1-6a67feaa97a8@gmail.com>
References: <1535459532-17211-1-git-send-email-t-kristo@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1535459532-17211-1-git-send-email-t-kristo@ti.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Tero Kristo <t-kristo@ti.com>, catalin.marinas@arm.com, will.deacon@arm.com, linux@armlinux.org.uk, robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

+ Mark Rutland, just in case he is interested

On 08/28/18 05:32, Tero Kristo wrote:
> Hi,
> 
> This series introduces devicetree overlay building support for ARM
> platforms. The .dtbo target is introduced globally, then makefile
> changes for both arm32/64 for supporting the .dtbo target, changes
> to support sub-dir makefile flags, and finally adding the DTC flags
> override for TI platforms, as that is where we want to introduce
> the DT overlay support initially.
> 
> The ARM makefile changes for supporting DTS sub-makefiles don't look
> too clean, but that was the only way I could figure out how to
> get it done.
> 
> -Tero
> 
> --
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
> 

This series does three unrelated things:

(1) create a ti specific dts subdirectory arch/arm/boot/dts/ti/

(2) create a rule for creating a .dtbo from a .dtso

(3) add a dtc compile flag to add phandle symbol information to
    all .dtb files created from arch/arm/boot/dts/ti/ and
    arch/arm64/boot/dts/ti/

Please split the patches into three independent series so that
each of the three concepts can be discussed separately.

Thanks,

Frank

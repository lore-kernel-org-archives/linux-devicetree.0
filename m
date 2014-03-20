From: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
Subject: Re: [PATCH 0/2] Disable subpage write for k2hk-evm
Date: Thu, 20 Mar 2014 15:34:43 +0200
Message-ID: <532AEE73.4090904@ti.com>
References: <1395267345-27795-1-git-send-email-ivan.khoronzhuk@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1395267345-27795-1-git-send-email-ivan.khoronzhuk@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: santosh.shilimkar@ti.com
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, grygorii.strashko@ti.com
List-Id: devicetree@vger.kernel.org

Please ignore this series

On 03/20/2014 12:15 AM, Ivan Khoronzhuk wrote:
> These patches disable subpage write for k2hk-evm.
>
> Based on linux-next
> tag: next-20140319
>
> Ivan Khoronzhuk (2):
>    mtd: davinci-nand: add dts property for NAND_NO_SUBPAGE_WRITE option
>    ARM: dts: keystone: disable subpage write for davinci nand device
>
>   Documentation/devicetree/bindings/mtd/davinci-nand.txt | 2 ++
>   arch/arm/boot/dts/k2hk-evm.dts                         | 1 +
>   drivers/mtd/nand/davinci_nand.c                        | 3 +++
>   3 files changed, 6 insertions(+)
>

-- 
Regards,
Ivan Khoronzhuk

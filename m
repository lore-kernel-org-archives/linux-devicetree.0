From: santosh shilimkar <santosh.shilimkar@oracle.com>
Subject: Re: [PATCH v4 0/3]
Date: Wed, 14 Oct 2015 08:41:06 -0700
Message-ID: <561E7792.409@oracle.com>
References: <1444832235-15263-1-git-send-email-m-karicheri2@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1444832235-15263-1-git-send-email-m-karicheri2@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Murali Karicheri <m-karicheri2@ti.com>, corbet@lwn.net, ssantosh@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, devicetree@vger.kernel.org, arnd@arndb.de
List-Id: devicetree@vger.kernel.org

10/14/2015 7:17 AM, Murali Karicheri wrote:
> This patch series enable accumulator queue support for K2 SoCs. Accumulator
> queues are a type of qmss queue that is monitored by the PDSP firmware and
> accumulated. Host is interrupted by PDSP firmware when packets become
> available in a ring buffer shared between the host and PDSP.
>
> There was an issue raised when merging the original patch set at
>   (1) https://lkml.org/lkml/2015/9/4/681
> 	[PATCH v1 1/2] soc: ti: display firmware file name as part of boot log
>   (2) https://lkml.org/lkml/2015/9/4/680
> 	[PATCH v1 2/2] ARM: dts: keystone: enable accumulator channels
>
> This series fixes the issues raised against v3. Maintainer, could you please
> apply this series to v4.4 next please at your earliest opportunity.
>
I have picked up the series. Thanks for quick turnaround.

Regards,
Santosh

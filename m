From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH v3 2/2] rtc: Add ASPEED RTC driver
Date: Wed, 27 Mar 2019 11:37:34 +0100
Message-ID: <20190327103734.GB3682@piout.net>
References: <20190327010215.10231-1-joel@jms.id.au>
 <20190327010215.10231-3-joel@jms.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190327010215.10231-3-joel@jms.id.au>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Joel Stanley <joel@jms.id.au>
Cc: Mark Rutland <mark.rutland@arm.com>, Alessandro Zummo <a.zummo@towertech.it>, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 27/03/2019 11:32:15+1030, Joel Stanley wrote:
> Read and writes the time to the non-battery backed RTC in the ASPEED BMC
> system on chip families.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
> v3:
>  - Use %ptR
>  - Remove spinlock, as callback happen under the rtc_device.ops_lock
> v2: Address review from Alexandre
>  - Use devm_rtc_allocate_device
>  - Fill in range_min
>  - Direcly fill in tm struct
>  - Return EINVAL when RTC is not enabled
> 
> v1: https://lore.kernel.org/linux-arm-kernel/20181003133155.27494-2-joel@jms.id.au/
> 
> Update kconfig text
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  drivers/rtc/Kconfig      |  11 ++++
>  drivers/rtc/Makefile     |   1 +
>  drivers/rtc/rtc-aspeed.c | 138 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 150 insertions(+)
>  create mode 100644 drivers/rtc/rtc-aspeed.c
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

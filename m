From: Anatolij Gustschin <agust@denx.de>
Subject: Re: [PATCH v4 1/3] lib: add bitrev8x4()
Date: Thu, 1 Dec 2016 23:45:23 +0100
Message-ID: <20161201234523.3bed63dc@crub>
References: <cover.1480551148.git.stillcompiling@gmail.com>
 <bc92eb1507448731163ae67fc888668d327f9168.1480551148.git.stillcompiling@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <bc92eb1507448731163ae67fc888668d327f9168.1480551148.git.stillcompiling@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Joshua Clayton <stillcompiling@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Moritz Fischer <moritz.fischer@ettus.com>, devicetree@vger.kernel.org, Alan Tull <atull@opensource.altera.com>, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu,  1 Dec 2016 09:04:50 -0800
Joshua Clayton stillcompiling@gmail.com wrote:
...
>diff --git a/arch/arm/include/asm/bitrev.h b/arch/arm/include/asm/bitrev.h
>index ec291c3..6d2e9ca 100644
>--- a/arch/arm/include/asm/bitrev.h
>+++ b/arch/arm/include/asm/bitrev.h
>@@ -17,4 +17,9 @@ static __always_inline __attribute_const__ u8 __arch_bitrev8(u8 x)
> 	return __arch_bitrev32((u32)x) >> 24;
> }
> 
>+static __always_inline __attribute_const__ u32 __arch_bitrev8x4(u32 x)
>+{
>+	__asm__ ("rbit %0, %1; rev %0, %0" : "=r" (x) : "r" (x));

	return x;
>+}

otherwise you get

In function '__arch_bitrev8x4':
warning: no return statement in function returning non-void [-Wreturn-type]

--
Anatolij

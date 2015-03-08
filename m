From: Jason Cooper <jason@lakedaemon.net>
Subject: Re: [PATCH v3 0/8] irqchip: New driver for ST's SysCfg controlled IRQs
Date: Sun, 8 Mar 2015 04:02:38 +0000
Message-ID: <20150308040238.GC21207@io.lakedaemon.net>
References: <1424272444-16230-1-git-send-email-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1424272444-16230-1-git-send-email-lee.jones@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Lee Jones <lee.jones@linaro.org>
Cc: devicetree@vger.kernel.org, tglx@linutronix.de, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@stlinux.com
List-Id: devicetree@vger.kernel.org

Lee,

On Wed, Feb 18, 2015 at 03:13:56PM +0000, Lee Jones wrote:
> Rebased (again) and resending.
>  
> This driver enables IRQs which are controlled using System Configuration
> registers.  Without it Performance Monitoring, Core Sight Tracing and some
> L2 Caches will fail to function.
>  
> v2 => v3:
>  - Removed filename from header as suggested by Thomas
> 
> v1 => v2:
>  - Fixed up Jason's review comments
> 
> Lee Jones (8):
>   dt: bindings: Supply shared ST IRQ defines
>   irqchip: Supply new driver for STi based devices
>   irqchip: irq-st: Add documentation for STi based syscfg IRQs
...
>  .../interrupt-controller/st,sti-irq-syscfg.txt     |  35 ++++
...
>  drivers/irqchip/Kconfig                            |   7 +
>  drivers/irqchip/Makefile                           |   1 +
>  drivers/irqchip/irq-st.c                           | 206 +++++++++++++++++++++
>  include/dt-bindings/interrupt-controller/irq-st.h  |  30 +++
...
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/st,sti-irq-syscfg.txt
>  create mode 100644 drivers/irqchip/irq-st.c
>  create mode 100644 include/dt-bindings/interrupt-controller/irq-st.h

Patches 1-3 applied to irqchip/st several days ago.  Sorry for not letting you
know earlier.  I'm just getting things back in order from hardware failures in
my build machine *and* my mailserver.  It's been a rough week.  :-/

Let me know if you'd like to use that branch as a stable base.

thx,

Jason.

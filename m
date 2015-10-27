Return-Path: <caesar.upstream@gmail.com>
Subject: Re: [PATCH 2/3] mailbox: rockchip: Add Rockchip mailbox driver
References: <1442228798-15191-1-git-send-email-wxt@rock-chips.com>
 <1442228798-15191-3-git-send-email-wxt@rock-chips.com>
 <CABb+yY3K+fZH5cBK3YvD6r_amZHq2d5xaaDR5_xuiNxWXTFPvA@mail.gmail.com>
From: Caesar Wang <caesar.upstream@gmail.com>
Message-ID: <562F39C2.5080702@gmail.com>
Date: Tue, 27 Oct 2015 16:45:54 +0800
MIME-Version: 1.0
In-Reply-To: <CABb+yY3K+fZH5cBK3YvD6r_amZHq2d5xaaDR5_xuiNxWXTFPvA@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------020808030901030908090409"
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Caesar Wang <wxt@rock-chips.com>, Mark Rutland <mark.rutland@arm.com>, Devicetree List <devicetree@vger.kernel.org>, =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>, Pawel Moll <pawel.moll@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, frank.wang@rock-chips.com, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, "olof@lixom.net" <olof@lixom.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-ID: <devicetree@vger.kernel.org>

This is a multi-part message in MIME format.
--------------020808030901030908090409
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Jassi,

Thanks for your comments.

在 2015年10月06日 19:35, Jassi Brar 写道:
> On Mon, Sep 14, 2015 at 4:36 PM, Caesar Wang <wxt@rock-chips.com> wrote:
>> This driver is found on RK3368 SoCs.
>>
>> The Mailbox module is a simple APB peripheral that allows both
>> the Cortex-A53 MCU system to communicate by writing operation to
>> generate interrupt.
>> The registers are accessible by both CPU via APB interface.
>>
>> The Mailbox has the following main features:
>>
>> @ Support dual-core system: Cortex-A53 and MCU.
>> @ Support APB interface.
>> @ Support four mailbox elements, each element includes one data word, one
>>    command word register and one flag bit that can represent one interrupt.
>> @ Four interrupts to Cortex-A53.
>> @ Four interrupts to MCU.
>> @ Provide 32 lock registers for software to use to indicate whether mailbox
>>    is occupied.
>>
>> Signed-off-by: Caesar Wang <wxt@rock-chips.com>
>> ---
>>
>>   drivers/mailbox/Kconfig            |   9 ++
>>   drivers/mailbox/Makefile           |   2 +
>>   drivers/mailbox/rockchip-mailbox.c | 317 +++++++++++++++++++++++++++++++++++++
>>   3 files changed, 328 insertions(+)
>>   create mode 100644 drivers/mailbox/rockchip-mailbox.c
>>
>> diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
>> index bbec500..a548d700 100644
>> --- a/drivers/mailbox/Kconfig
>> +++ b/drivers/mailbox/Kconfig
>> @@ -43,6 +43,15 @@ config OMAP_MBOX_KFIFO_SIZE
>>            This can also be changed at runtime (via the mbox_kfifo_size
>>            module parameter).
>>
>> +config ROCKCHIP_MBOX
>> +       bool "Rockchip Soc Intergrated Mailbox Support"
>> +       depends on ARCH_ROCKCHIP
>> +       help
>> +         This driver provides support for inter-processor communication
>> +         between CPU cores and MCU processor on Some Rockchip SOCs.
>> +         Please check it that the Soc you use have Mailbox hardware.
>> +         Say Y here if you want to use the Rockchip Mailbox support.
>> +
>>   config PCC
>>          bool "Platform Communication Channel Driver"
>>          depends on ACPI
>> diff --git a/drivers/mailbox/Makefile b/drivers/mailbox/Makefile
>> index 8e6d822..730cb5d 100644
>> --- a/drivers/mailbox/Makefile
>> +++ b/drivers/mailbox/Makefile
>> @@ -8,6 +8,8 @@ obj-$(CONFIG_PL320_MBOX)        += pl320-ipc.o
>>
>>   obj-$(CONFIG_OMAP2PLUS_MBOX)   += omap-mailbox.o
>>
>> +obj-$(CONFIG_ROCKCHIP_MBOX)    += rockchip-mailbox.o
>> +
>>   obj-$(CONFIG_PCC)              += pcc.o
>>
>>   obj-$(CONFIG_ALTERA_MBOX)      += mailbox-altera.o
>> diff --git a/drivers/mailbox/rockchip-mailbox.c b/drivers/mailbox/rockchip-mailbox.c
>> new file mode 100644
>> index 0000000..715ab96
>> --- /dev/null
>> +++ b/drivers/mailbox/rockchip-mailbox.c
>> @@ -0,0 +1,317 @@
>> +/*
>> + * Copyright (c) 2015, Fuzhou Rockchip Electronics Co., Ltd
>> + *
>> + * Authors:    Addy Ke <addy.ke@rock-chips.com>
>> + *             Caesar Wang <wxt@rock-chips.com>
>> + *
>> + * This program is free software; you can redistribute it and/or modify it
>> + * under the terms and conditions of the GNU General Public License,
>> + * version 2, as published by the Free Software Foundation.
>> + *
>> + * This program is distributed in the hope it will be useful, but WITHOUT
>> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
>> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
>> + * more details.
>> + */
>> +
>> +#include <linux/clk.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/io.h>
>> +#include <linux/kernel.h>
>> +#include <linux/mailbox_controller.h>
>> +#include <linux/module.h>
>> +#include <linux/of_device.h>
>> +#include <linux/platform_device.h>
>> +
>> +#define MAILBOX_A2B_INTEN              0x00
>> +#define MAILBOX_A2B_STATUS             0x04
>> +#define MAILBOX_A2B_CMD(x)             (0x08 + (x) * 8)
>> +#define MAILBOX_A2B_DAT(x)             (0x0c + (x) * 8)
>> +
>> +#define MAILBOX_B2A_INTEN              0x28
>> +#define MAILBOX_B2A_STATUS             0x2C
>> +#define MAILBOX_B2A_CMD(x)             (0x30 + (x) * 8)
>> +#define MAILBOX_B2A_DAT(x)             (0x34 + (x) * 8)
>> +
>> +#define MAILBOX_ATOMIC_LOCK(x)         (0x100 + (x) * 8)
>> +
>> +/* A2B: 0 - 2k */
>> +#define A2B_BUF(size, idx)             ((idx) * (size))
>> +
>> +/* B2A: 2k - 4k */
>> +#define B2A_BUF(size, idx)             (((idx) + 4) * (size))
>> +
>> +struct rockchip_mbox_msg {
>> +       u32 cmd;
>> +       int tx_size;
>> +       void *tx_buf;
>> +       int rx_size;
>> +       void *rx_buf;
>> +       void *cl_data;
>> +};
>> +
>> +struct rockchip_mbox_data {
>> +       int num_chans;
>> +};
>> +
>> +struct rockchip_mbox_chan {
>> +       int idx;
>> +       int irq;
>> +       struct rockchip_mbox_msg *msg;
>> +       struct rockchip_mbox *mb;
>> +};
>> +
>> +struct rockchip_mbox {
>> +       struct mbox_controller mbox;
>> +       struct clk *pclk;
>> +       void __iomem *mbox_base;
>> +
>> +       /* The base address of share memory to transfer data */
>> +       void __iomem *buf_base;
>> +
>> +       /* The maximum size of buf for each channel */
>> +       u32 buf_size;
>> +
>> +       struct rockchip_mbox_chan *chans;
>> +};
>> +
>> +static inline int chan_to_idx(struct rockchip_mbox *mb,
>> +                             struct mbox_chan *chan)
>> +{
>> +       return (chan - mb->mbox.chans);
>> +}
> perhaps you intended rockchip_mbox_chan.idx for this purpose?
>

Done,
Fixed in next version v1.

>> +static int rockchip_mbox_send_data(struct mbox_chan *chan, void *data)
>> +{
>> +       struct rockchip_mbox *mb = dev_get_drvdata(chan->mbox->dev);
>> +       struct rockchip_mbox_msg *msg = data;
>> +       int idx = chan_to_idx(mb, chan);
>> +
>> +       if (!msg)
>> +               return -EINVAL;
>> +
>> +       if ((msg->tx_size > mb->buf_size) ||
>> +           (msg->rx_size > mb->buf_size)) {
>> +               dev_err(mb->mbox.dev, "Transmit size over buf size(%d)\n",
>> +                       mb->buf_size);
>> +               return -EINVAL;
>> +       }
>> +
>> +       dev_dbg(mb->mbox.dev, "Chan[%d]: A2B message, cmd 0x%08x\n",
>> +               idx, msg->cmd);
>> +
>> +       mb->chans[idx].msg = msg;
>> +
>> +       if (msg->tx_buf)
>> +               memcpy(mb->buf_base + A2B_BUF(mb->buf_size, idx),
>> +                      msg->tx_buf, msg->tx_size);
>> +
> as I said on the bindings patch, this should be done by client driver
> in tx_prepare() callback.

Okay, so I should do that in client driver since I'm ready sent the 
client driver with scpi protocol,
I found the similar driver in LKML.

mailbox: add support for System Control and Power Interface(SCPI) protocol
https://patchwork.kernel.org/patch/6279371/

I will pick up this driver with my client driver for later or another 
patchs.


>> +       writel_relaxed(msg->cmd, mb->mbox_base + MAILBOX_A2B_CMD(idx));
>> +       writel_relaxed(msg->rx_size, mb->mbox_base + MAILBOX_A2B_DAT(idx));
>> +
> Usually length of payload is not specified via mailbox registers but
> we have to live with what your protocol does... so maybe keep rx_size
> in rockchip_mbox_msg but remove  tx_size, tx_buf, void *rx_buf, and
> cl_data

Done.


>
>> +       return 0;
>> +}
>> +
>> +static int rockchip_mbox_startup(struct mbox_chan *chan)
>> +{
>> +       return 0;
>> +}
> maybe request the channel irq in startup and release in shutdown ?

Here, I think the devm_request_threaded_irq() can also put in probe(),
And I change the enable/disable interrupts for startup/shundown.

> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip


-- 
Thanks,
Caesar


--------------020808030901030908090409
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    Hi Jassi,<br>
    <br>
    Thanks for your comments.<br>
    <br>
    <div class="moz-cite-prefix">在 2015年10月06日 19:35, Jassi Brar 写道:<br>
    </div>
    <blockquote
cite="mid:CABb+yY3K+fZH5cBK3YvD6r_amZHq2d5xaaDR5_xuiNxWXTFPvA@mail.gmail.com"
      type="cite">
      <pre wrap="">On Mon, Sep 14, 2015 at 4:36 PM, Caesar Wang <a class="moz-txt-link-rfc2396E" href="mailto:wxt@rock-chips.com">&lt;wxt@rock-chips.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">This driver is found on RK3368 SoCs.

The Mailbox module is a simple APB peripheral that allows both
the Cortex-A53 MCU system to communicate by writing operation to
generate interrupt.
The registers are accessible by both CPU via APB interface.

The Mailbox has the following main features:

@ Support dual-core system: Cortex-A53 and MCU.
@ Support APB interface.
@ Support four mailbox elements, each element includes one data word, one
  command word register and one flag bit that can represent one interrupt.
@ Four interrupts to Cortex-A53.
@ Four interrupts to MCU.
@ Provide 32 lock registers for software to use to indicate whether mailbox
  is occupied.

Signed-off-by: Caesar Wang <a class="moz-txt-link-rfc2396E" href="mailto:wxt@rock-chips.com">&lt;wxt@rock-chips.com&gt;</a>
---

 drivers/mailbox/Kconfig            |   9 ++
 drivers/mailbox/Makefile           |   2 +
 drivers/mailbox/rockchip-mailbox.c | 317 +++++++++++++++++++++++++++++++++++++
 3 files changed, 328 insertions(+)
 create mode 100644 drivers/mailbox/rockchip-mailbox.c

diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
index bbec500..a548d700 100644
--- a/drivers/mailbox/Kconfig
+++ b/drivers/mailbox/Kconfig
@@ -43,6 +43,15 @@ config OMAP_MBOX_KFIFO_SIZE
          This can also be changed at runtime (via the mbox_kfifo_size
          module parameter).

+config ROCKCHIP_MBOX
+       bool "Rockchip Soc Intergrated Mailbox Support"
+       depends on ARCH_ROCKCHIP
+       help
+         This driver provides support for inter-processor communication
+         between CPU cores and MCU processor on Some Rockchip SOCs.
+         Please check it that the Soc you use have Mailbox hardware.
+         Say Y here if you want to use the Rockchip Mailbox support.
+
 config PCC
        bool "Platform Communication Channel Driver"
        depends on ACPI
diff --git a/drivers/mailbox/Makefile b/drivers/mailbox/Makefile
index 8e6d822..730cb5d 100644
--- a/drivers/mailbox/Makefile
+++ b/drivers/mailbox/Makefile
@@ -8,6 +8,8 @@ obj-$(CONFIG_PL320_MBOX)        += pl320-ipc.o

 obj-$(CONFIG_OMAP2PLUS_MBOX)   += omap-mailbox.o

+obj-$(CONFIG_ROCKCHIP_MBOX)    += rockchip-mailbox.o
+
 obj-$(CONFIG_PCC)              += pcc.o

 obj-$(CONFIG_ALTERA_MBOX)      += mailbox-altera.o
diff --git a/drivers/mailbox/rockchip-mailbox.c b/drivers/mailbox/rockchip-mailbox.c
new file mode 100644
index 0000000..715ab96
--- /dev/null
+++ b/drivers/mailbox/rockchip-mailbox.c
@@ -0,0 +1,317 @@
+/*
+ * Copyright (c) 2015, Fuzhou Rockchip Electronics Co., Ltd
+ *
+ * Authors:    Addy Ke <a class="moz-txt-link-rfc2396E" href="mailto:addy.ke@rock-chips.com">&lt;addy.ke@rock-chips.com&gt;</a>
+ *             Caesar Wang <a class="moz-txt-link-rfc2396E" href="mailto:wxt@rock-chips.com">&lt;wxt@rock-chips.com&gt;</a>
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ */
+
+#include &lt;linux/clk.h&gt;
+#include &lt;linux/interrupt.h&gt;
+#include &lt;linux/io.h&gt;
+#include &lt;linux/kernel.h&gt;
+#include &lt;linux/mailbox_controller.h&gt;
+#include &lt;linux/module.h&gt;
+#include &lt;linux/of_device.h&gt;
+#include &lt;linux/platform_device.h&gt;
+
+#define MAILBOX_A2B_INTEN              0x00
+#define MAILBOX_A2B_STATUS             0x04
+#define MAILBOX_A2B_CMD(x)             (0x08 + (x) * 8)
+#define MAILBOX_A2B_DAT(x)             (0x0c + (x) * 8)
+
+#define MAILBOX_B2A_INTEN              0x28
+#define MAILBOX_B2A_STATUS             0x2C
+#define MAILBOX_B2A_CMD(x)             (0x30 + (x) * 8)
+#define MAILBOX_B2A_DAT(x)             (0x34 + (x) * 8)
+
+#define MAILBOX_ATOMIC_LOCK(x)         (0x100 + (x) * 8)
+
+/* A2B: 0 - 2k */
+#define A2B_BUF(size, idx)             ((idx) * (size))
+
+/* B2A: 2k - 4k */
+#define B2A_BUF(size, idx)             (((idx) + 4) * (size))
+
+struct rockchip_mbox_msg {
+       u32 cmd;
+       int tx_size;
+       void *tx_buf;
+       int rx_size;
+       void *rx_buf;
+       void *cl_data;
+};
+
+struct rockchip_mbox_data {
+       int num_chans;
+};
+
+struct rockchip_mbox_chan {
+       int idx;
+       int irq;
+       struct rockchip_mbox_msg *msg;
+       struct rockchip_mbox *mb;
+};
+
+struct rockchip_mbox {
+       struct mbox_controller mbox;
+       struct clk *pclk;
+       void __iomem *mbox_base;
+
+       /* The base address of share memory to transfer data */
+       void __iomem *buf_base;
+
+       /* The maximum size of buf for each channel */
+       u32 buf_size;
+
+       struct rockchip_mbox_chan *chans;
+};
+
+static inline int chan_to_idx(struct rockchip_mbox *mb,
+                             struct mbox_chan *chan)
+{
+       return (chan - mb-&gt;mbox.chans);
+}
</pre>
      </blockquote>
      <pre wrap="">perhaps you intended rockchip_mbox_chan.idx for this purpose?

</pre>
    </blockquote>
    <br>
    Done,<br>
    Fixed in next version v1.<br>
    <br>
    <blockquote
cite="mid:CABb+yY3K+fZH5cBK3YvD6r_amZHq2d5xaaDR5_xuiNxWXTFPvA@mail.gmail.com"
      type="cite">
      <pre wrap="">
</pre>
      <blockquote type="cite">
        <pre wrap="">+static int rockchip_mbox_send_data(struct mbox_chan *chan, void *data)
+{
+       struct rockchip_mbox *mb = dev_get_drvdata(chan-&gt;mbox-&gt;dev);
+       struct rockchip_mbox_msg *msg = data;
+       int idx = chan_to_idx(mb, chan);
+
+       if (!msg)
+               return -EINVAL;
+
+       if ((msg-&gt;tx_size &gt; mb-&gt;buf_size) ||
+           (msg-&gt;rx_size &gt; mb-&gt;buf_size)) {
+               dev_err(mb-&gt;mbox.dev, "Transmit size over buf size(%d)\n",
+                       mb-&gt;buf_size);
+               return -EINVAL;
+       }
+
+       dev_dbg(mb-&gt;mbox.dev, "Chan[%d]: A2B message, cmd 0x%08x\n",
+               idx, msg-&gt;cmd);
+
+       mb-&gt;chans[idx].msg = msg;
+
+       if (msg-&gt;tx_buf)
+               memcpy(mb-&gt;buf_base + A2B_BUF(mb-&gt;buf_size, idx),
+                      msg-&gt;tx_buf, msg-&gt;tx_size);
+
</pre>
      </blockquote>
      <pre wrap="">as I said on the bindings patch, this should be done by client driver
in tx_prepare() callback.
</pre>
    </blockquote>
    <br>
    Okay, so I should do that in client driver since I'm ready sent the
    client driver with scpi protocol,<br>
    I found the similar driver in LKML. <br>
    <br>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    mailbox: add support for System Control and Power Interface(SCPI)
    protocol<br>
    <a href="https://patchwork.kernel.org/patch/6279371/">https://patchwork.kernel.org/patch/6279371/</a><br>
    <br>
    I will pick up this driver with my client driver for later or
    another patchs.<br>
    <br>
    <br>
    <blockquote
cite="mid:CABb+yY3K+fZH5cBK3YvD6r_amZHq2d5xaaDR5_xuiNxWXTFPvA@mail.gmail.com"
      type="cite">
      <pre wrap="">
</pre>
      <blockquote type="cite">
        <pre wrap="">+       writel_relaxed(msg-&gt;cmd, mb-&gt;mbox_base + MAILBOX_A2B_CMD(idx));
+       writel_relaxed(msg-&gt;rx_size, mb-&gt;mbox_base + MAILBOX_A2B_DAT(idx));
+
</pre>
      </blockquote>
      <pre wrap="">Usually length of payload is not specified via mailbox registers but
we have to live with what your protocol does... so maybe keep rx_size
in rockchip_mbox_msg but remove  tx_size, tx_buf, void *rx_buf, and
cl_data
</pre>
    </blockquote>
    <br>
    Done.<br>
    <br>
    <br>
    <blockquote
cite="mid:CABb+yY3K+fZH5cBK3YvD6r_amZHq2d5xaaDR5_xuiNxWXTFPvA@mail.gmail.com"
      type="cite">
      <pre wrap="">

</pre>
      <blockquote type="cite">
        <pre wrap="">+       return 0;
+}
+
+static int rockchip_mbox_startup(struct mbox_chan *chan)
+{
+       return 0;
+}
</pre>
      </blockquote>
      <pre wrap="">maybe request the channel irq in startup and release in shutdown ?
</pre>
    </blockquote>
    <br>
    Here, I think the devm_request_threaded_irq() can also put in
    probe(),<br>
    And I change the enable/disable interrupts for startup/shundown.<br>
    <br>
    <blockquote
cite="mid:CABb+yY3K+fZH5cBK3YvD6r_amZHq2d5xaaDR5_xuiNxWXTFPvA@mail.gmail.com"
      type="cite">
      <pre wrap="">
_______________________________________________
Linux-rockchip mailing list
<a class="moz-txt-link-abbreviated" href="mailto:Linux-rockchip@lists.infradead.org">Linux-rockchip@lists.infradead.org</a>
<a class="moz-txt-link-freetext" href="http://lists.infradead.org/mailman/listinfo/linux-rockchip">http://lists.infradead.org/mailman/listinfo/linux-rockchip</a>
</pre>
    </blockquote>
    <br>
    <br>
    <pre class="moz-signature" cols="72">-- 
Thanks,
Caesar</pre>
  </body>
</html>

--------------020808030901030908090409--

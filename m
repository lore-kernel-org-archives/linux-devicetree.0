From: Richard Zhao <linuxzsc@gmail.com>
Subject: Re: [PATCH v7 08/14] USB: Chipidea: add ci13xxx device id management
Date: Mon, 25 Jun 2012 18:03:39 +0800
Message-ID: <513f64cb-8eac-4e51-81f7-e3824d96d870@email.android.com>
References: <1340607391-16380-1-git-send-email-richard.zhao@freescale.com>
 <1340607391-16380-9-git-send-email-richard.zhao@freescale.com>
 <4FE833EB.3050503@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1448874026131290461=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <4FE833EB.3050503@pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Marc Kleine-Budde <mkl@pengutronix.de>, Richard Zhao <richard.zhao@freescale.com>
Cc: marex@denx.de, B20596@freescale.com, dong.aisheng@linaro.org, fabio.estevam@freescale.com, alexander.shishkin@linux.intel.com, B29397@freescale.com, devicetree-discuss@lists.ozlabs.org, linux-usb@vger.kernel.org, balbi@ti.com, stern@rowland.harvard.edu, kernel@pengutronix.de, gregkh@linuxfoundation.org, shawn.guo@linaro.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

--===============1448874026131290461==
Content-Type: multipart/alternative; boundary="----8LI5RGCFT9HLNVQCC7NK2DJR9NADS2"

------8LI5RGCFT9HLNVQCC7NK2DJR9NADS2
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 8bit

Could you use my USB test branch? 
-- 
Sent from my Android phone with K-9 Mail. Please excuse my brevity.

Marc Kleine-Budde <mkl@pengutronix.de> wrote:

On 06/25/2012 08:56 AM, Richard Zhao wrote:
> We use ida_simple_get and ida_simple_remove to manage the ids.
> 
> Signed-off-by: Richard Zhao <richard.zhao@freescale.com>
> Reviewed-by: Felipe Balbi <balbi@ti.com>
> Signed-off-by: Alexander Shishkin <alexander.shishkin@linux.intel.com>

Removing the "ci13xxx_imx" module doesn't work as expected:

ci_hdrc ci_hdrc.0: remove, state 1
usb usb1: USB disconnect, device number 1
ci_hdrc ci_hdrc.0: USB bus 1 deregistered
Unable to handle kernel NULL pointer dereference at virtual address 0000006c
pgd = c6bb8000
[0000006c] *pgd=46a7e831, *pte=00000000, *ppte=00000000
Internal error: Oops: 17 [#1] PREEMPT ARM
Modules linked in: ci13xxx_imx(-) ci_hdrc
CPU: 0 Not tainted (3.5.0-rc4-00055-g35d73a8-dirty #80)
PC is at ida_remove+0xa0/0x110
LR is at ida_simple_remove+0x30/0x60
pc : [<c0154294>] lr : [<c01544f4>] psr: a0000093
sp : c6be3ed0 ip : 80000000 fp : 0092f008
r10: d9a22647 r9 : c6be2000 r8 : 08421085
r7 : 00000001 r6 : 0000034b r5 : bf00a3a8 r4 : 00000000
r3 : c087d6b0 r2 : 001bb89f r1 : 6b6b6b6b r0 : 00000068
Flags: NzCv IRQs off FIQs on Mode SVC_32 ISA ARM Segment user
Control: 0005317f Table: 46bb8000 DAC: 00000015
Process rmmod (pid: 136, stack limit = 0xc6be2270)
Stack: (0xc6be3ed0 to 0xc6be4000)
3ec0: c6be2000 20000013 6b6b6b6b bf00a3a8
3ee0: c6be2000 c0009408 00000000 c01544f4 c6ad5430 c7865980 bf01562c bf01501c
3f00: bf015000 c7865988 bf01562c c018dad8 c018dac4 c018c5e0 bf01562c c7865988
3f20: c78659bc c018cdbc c6b78040 bf015680 bf01562c c0e670d0 0092f0b8 c018c438
3f40: bf015680 c6be2000 00000000 c004c56c c74ca308 33316963 5f787878 00786d69
3f60: 0092f008 c00a5088 c7812138 c6b5b388 00000000 c6b79860 c6b5b388 c0088648
3f80: 00000003 c6b79860 c6be2000 00088730 00002002 00000001 0092f088 be82fe5c
3fa0: 00000081 c0009260 00000001 0092f088 0092f0b8 00000800 b6eb865c be82fc00
3fc0: 00000001 0092f088 be82fe5c 00000081 0092f088 00000000 00000800 0092f008
3fe0: b6e7cbc0 be82fc04 b6ef65f8 b6e7cbcc 60000010 0092f0b8 00000000 00000000
[<c0154294>] (ida_remove+0xa0/0x110) from [<c01544f4>] (ida_simple_remove+0x30/0x60)
[<c01544f4>] (ida_simple_remove+0x30/0x60) from [<bf01501c>] (ci13xxx_imx_remove+0x1c/0x84 [ci13xxx_imx])
[<bf01501c>] (ci13xxx_imx_remove+0x1c/0x84 [ci13xxx_imx]) from [<c018dad8>] (platform_drv_remove+0x14/0x18)
[<c018dad8>] (platform_drv_remove+0x14/0x18) from [<c018c5e0>] (__device_release_driver+0x58/0xa8)
[<c018c5e0>] (__device_release_driver+0x58/0xa8) from [<c018cdbc>] (driver_detach+0xcc/0xd8)
[<c018cdbc>] (driver_detach+0xcc/0xd8) from [<c018c438>] (bus_remove_driver+0x7c/0xc0)
[<c018c438>] (bus_remove_driver+0x7c/0xc0) from [<c004c56c>] (sys_delete_module+0x180/0x23c)
[<c004c56c>] (sys_delete_module+0x180/0x23c) from [<c0009260>] (ret_fast_syscall+0x0/0x2c)
Code: e0416286 e5904004 e1a002c6 e0840100 (e5908004)
---[ end trace 7d882a2086a6a3d8 ]---
note: rmmod[136] exited with preempt_count 1

Marc
-- 
Pengutronix e.K. | Marc Kleine-Budde |
Industrial Linux Solutions | Phone: +49-231-2826-924 |
Vertretung West/Dortmund | Fax: +49-5121-206917-5555 |
Amtsgericht Hildesheim, HRA 2686 | http://www.pengutronix.de |


------8LI5RGCFT9HLNVQCC7NK2DJR9NADS2
Content-Type: text/html;
 charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head></head><body>Could you use my USB test branch? <br>
-- <br>
Sent from my Android phone with K-9 Mail. Please excuse my brevity.<br><br><div class="gmail_quote">Marc Kleine-Budde &lt;mkl@pengutronix.de&gt; wrote:<blockquote class="gmail_quote" style="margin: 0pt 0pt 0pt 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">
<pre style="white-space: pre-wrap; word-wrap:break-word; font-family: monospace">On 06/25/2012 08:56 AM, Richard Zhao wrote:<br />&gt; We use ida_simple_get and ida_simple_remove to manage the ids.<br />&gt; <br />&gt; Signed-off-by: Richard Zhao &lt;richard.zhao@freescale.com&gt;<br />&gt; Reviewed-by: Felipe Balbi &lt;balbi@ti.com&gt;<br />&gt; Signed-off-by: Alexander Shishkin &lt;alexander.shishkin@linux.intel.com&gt;<br /><br />Removing the "ci13xxx_imx" module doesn't work as expected:<br /><br />ci_hdrc ci_hdrc.0: remove, state 1<br />usb usb1: USB disconnect, device number 1<br />ci_hdrc ci_hdrc.0: USB bus 1 deregistered<br />Unable to handle kernel NULL pointer dereference at virtual address 0000006c<br />pgd = c6bb8000<br />[0000006c] *pgd=46a7e831, *pte=00000000, *ppte=00000000<
 br />Internal error: Oops: 17 [#1] PREEMPT ARM<br />Modules linked in: ci13xxx_imx(-) ci_hdrc<br />CPU: 0    Not tainted  (3.5.0-rc4-00055-g35d73a8-dirty #80)<br />PC is at ida_remove+0xa0/0x110<br
/>LR is at ida_simple_remove+0x30/0x60<br />pc : [&lt;c0154294&gt;]    lr : [&lt;c01544f4&gt;]    psr: a0000093<br />sp : c6be3ed0  ip : 80000000  fp : 0092f008<br />r10: d9a22647  r9 : c6be2000  r8 : 08421085<br />r7 : 00000001  r6 : 0000034b  r5 : bf00a3a8  r4 : 00000000<br />r3 : c087d6b0  r2 : 001bb89f  r1 : 6b6b6b6b  r0 : 00000068<br />Flags: NzCv  IRQs off  FIQs on  Mode SVC_32  ISA ARM  Segment user<br />Control: 0005317f  Table: 46bb8000  DAC: 00000015<br />Process rmmod (pid: 136, stack limit = 0xc6be2270)<br />Stack: (0xc6be3ed0 to 0xc6be4000)<br />3ec0:                                     c6be2000 20000013 6b6b6b6b bf00a3a8<br />3ee0: c6be2000 c0009408 00000000 c01544f4 c6ad5430 c7865980 bf01562c bf01501c<br />3f00: bf015000 c7865988 bf01562c c018dad8 c018dac4 c018c5e0 bf01562c 
 c7865988<br />3f20: c78659bc c018cdbc c6b78040 bf015680 bf01562c c0e670d0 0092f0b8 c018c438<br />3f40: bf015680 c6be2000 00000000 c004c56c c74ca308 33316963 5f787878 00786d69<br />3f60: 0092f008
c00a5088 c7812138 c6b5b388 00000000 c6b79860 c6b5b388 c0088648<br />3f80: 00000003 c6b79860 c6be2000 00088730 00002002 00000001 0092f088 be82fe5c<br />3fa0: 00000081 c0009260 00000001 0092f088 0092f0b8 00000800 b6eb865c be82fc00<br />3fc0: 00000001 0092f088 be82fe5c 00000081 0092f088 00000000 00000800 0092f008<br />3fe0: b6e7cbc0 be82fc04 b6ef65f8 b6e7cbcc 60000010 0092f0b8 00000000 00000000<br />[&lt;c0154294&gt;] (ida_remove+0xa0/0x110) from [&lt;c01544f4&gt;] (ida_simple_remove+0x30/0x60)<br />[&lt;c01544f4&gt;] (ida_simple_remove+0x30/0x60) from [&lt;bf01501c&gt;] (ci13xxx_imx_remove+0x1c/0x84 [ci13xxx_imx])<br />[&lt;bf01501c&gt;] (ci13xxx_imx_remove+0x1c/0x84 [ci13xxx_imx]) from [&lt;c018dad8&gt;] (platform_drv_remove+0x14/0x18)<br />[&lt;c018dad8&gt;] (platform_drv_remove+0x14/0x18)
  from [&lt;c018c5e0&gt;] (__device_release_driver+0x58/0xa8)<br />[&lt;c018c5e0&gt;] (__device_release_driver+0x58/0xa8) from [&lt;c018cdbc&gt;] (driver_detach+0xcc/0xd8)<br />[&lt;c018cdbc&gt;]
(driver_detach+0xcc/0xd8) from [&lt;c018c438&gt;] (bus_remove_driver+0x7c/0xc0)<br />[&lt;c018c438&gt;] (bus_remove_driver+0x7c/0xc0) from [&lt;c004c56c&gt;] (sys_delete_module+0x180/0x23c)<br />[&lt;c004c56c&gt;] (sys_delete_module+0x180/0x23c) from [&lt;c0009260&gt;] (ret_fast_syscall+0x0/0x2c)<br />Code: e0416286 e5904004 e1a002c6 e0840100 (e5908004)<br />---[ end trace 7d882a2086a6a3d8 ]---<br />note: rmmod[136] exited with preempt_count 1<br /><br />Marc<br />-- <br />Pengutronix e.K.                  | Marc Kleine-Budde           |<br />Industrial Linux Solutions        | Phone: +49-231-2826-924     |<br />Vertretung West/Dortmund          | Fax:   +49-5121-206917-5555 |<br />Amtsgericht Hildesheim, HRA 2686  | <a href="http://www.pengutronix.de">http://www.pengutronix.de</a>   |<br 
 /><br /></pre></blockquote></div></body></html>
------8LI5RGCFT9HLNVQCC7NK2DJR9NADS2--



--===============1448874026131290461==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============1448874026131290461==--

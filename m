From: Yi Zhang <yizhang@marvell.com>
Subject: Re: [PATCH V2 1/2] mfd: add Marvell 88pm88x description
Date: Fri, 26 Jun 2015 11:43:07 +0800
Message-ID: <20150626034307.GB32229@yizhang>
References: <1434098601-3498-1-git-send-email-yizhang@marvell.com>
 <1434098601-3498-2-git-send-email-yizhang@marvell.com>
 <CAL_JsqKjNdtp1A7LqqnjAnGPmCu-fwum6D9EPOoaVF0C=DacTw@mail.gmail.com>
 <55897129.1060500@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <55897129.1060500@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Vaibhav Hiremath <vaibhav.hiremath@linaro.org>
Cc: Rob Herring <robherring2@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Paul Bolle <pebolle@tiscali.nl>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Qiao Zhou <zhouqiao@marvell.com>, zhenzh@marvell.com
List-Id: devicetree@vger.kernel.org

On Tue, Jun 23, 2015 at 08:16:01PM +0530, Vaibhav Hiremath wrote:
> 
> 
> On Tuesday 23 June 2015 08:01 PM, Rob Herring wrote:
> >On Fri, Jun 12, 2015 at 3:43 AM, Yi Zhang <yizhang@marvell.com> wrote:
> >>88pm880 and 88pm886 are two combo PMIC chips, most of the function and the
> >>register mapping are the same
> >
> >How do they compare to 80x/822/860 PMICs?
> >
> 
> Zhang,
> 
> Sorry, I missed this patch-series.
> 
> Is there any way we can get access to datahsheets of all these devices?

  Hi, Vaibhav:

  https://extranet.marvell.com/ is a useful place to access to them
> 
> >>
> >>Signed-off-by: Yi Zhang <yizhang@marvell.com>
> >>---
> >>  Documentation/devicetree/bindings/mfd/88pm88x.txt | 33 +++++++++++++++++++++++
> >>  1 file changed, 33 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/mfd/88pm88x.txt
> >>
> >>diff --git a/Documentation/devicetree/bindings/mfd/88pm88x.txt b/Documentation/devicetree/bindings/mfd/88pm88x.txt
> >>new file mode 100644
> >>index 0000000..72e741c
> >>--- /dev/null
> >>+++ b/Documentation/devicetree/bindings/mfd/88pm88x.txt
> >>@@ -0,0 +1,33 @@
> >>+Marvell 88pm88x combo PMIC chip
> >>+
> >>+This series of chip integrates regulator, rtc, onkey, switch charger,
> >>+fuelgauge, gpadc and a range of I/O pins.
> >>+
> >>+88pm886 and 88pm880 are two very similar chips, most of the registers mapping
> >>+and functions are the same, the main difference is the latter has a separate
> >>+i2c slave address to cover BUCK related setting
> >>+
> >>+Required properties:
> >>+- compatible: one of the strings for a specific chip:
> >>+  "marvell,88pm886"
> >>+  "marvell,88pm880"
> >>+- reg: the i2c address
> >>+- interrupt-controller: it works as an interrupt controller managing its irqs
> >>+- interrupt-cells: this value is 1
> >>+
> >>+Optional properties:
> >>+- marvell,88pm88x-irq-write-clear: the interrupt ack method
> >
> >The 80x/860 binding needs the same property. Please coordinate this
> >with Vaibhav.
> >
> 
> Please refer to the patch
> 
> https://lkml.org/lkml/2015/6/17/545

  Thanks;
> 
> Thanks,
> Vaibhav

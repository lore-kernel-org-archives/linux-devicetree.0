From: Brian Masney <masneyb@onstation.org>
Subject: Re: [PATCH] ARM: dts: msm8974-FP2: add reboot-mode node
Date: Fri, 21 Jun 2019 21:43:02 -0400
Message-ID: <20190622014302.GA20947@onstation.org>
References: <20190620225824.2845-1-luca@z3ntu.xyz>
 <20190621000122.GA13036@onstation.org>
 <4607058.UzJteFJyig@g550jk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4607058.UzJteFJyig@g550jk>
Sender: linux-kernel-owner@vger.kernel.org
To: Luca Weiss <luca@z3ntu.xyz>
Cc: linux-arm-msm@vger.kernel.org, ~martijnbraam/pmos-upstream@lists.sr.ht, Andy Gross <agross@kernel.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Jun 21, 2019 at 09:25:17PM +0200, Luca Weiss wrote:
> On Freitag, 21. Juni 2019 02:01:22 CEST you wrote:
> > I think that it makes sense to put this snippet in qcom-msm8974.dtsi
> > with a status of disabled, and then enable it in
> > qcom-msm8974-fairphone-fp2.dts like so:
> > 
> > imem@fe805000 {
> > 	status = "ok";
> > };
> 
> Do you want me to put the whole node in the the dtsi file? Even though these 
> values are the same, there are also custom vendor-specified values for specific 
> phones.

mach-msm in the downstream hammerhead sources has those addresses:
https://github.com/AICP/kernel_lge_hammerhead/blob/n7.1/arch/arm/mach-msm/restart.c#L271
This lead me to think that it applies to other msm8974-based systems as
well.

I tried your device tree snippet on the Nexus 5 and it reboots the phone
for me.

/ # ./reboot-mode normal
[   85.088556] reboot: Restarting system with command 'normal'

The recovery and bootloader modes reboot the phone but into normal mode.
Oddly, the bootloader shows different power on reasons after the
"welcome to hammerhead bootloader" message.

normal = [10] Power on reason 20001
recovery = [10] Power on reason 1
bootloader = [10] Power on reason 20001

> On the Linux kernel side, it has bootloader (0x77665500), recovery 
> (0x77665502), rtc (0x77665503), oem-* (0x6f656d00 | somevalue), edl (some 
> other addresses), and the else statements writes the 0x77665501 value in my 
> patch.

The downstream hammerhead sources have the oem-*, and emergency download
modes (edl) listed as well.

I'm not sure on your other questions.

Brian

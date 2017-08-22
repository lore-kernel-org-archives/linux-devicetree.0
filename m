From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH V2] spmi: pmic-arb: Enforce the ownership check optionally
Date: Tue, 22 Aug 2017 16:55:43 +0800
Message-ID: <20170822085541.GB3685@dragon>
References: <1503070110-15018-1-git-send-email-kgunda@codeaurora.org>
 <e0af96c3-208b-abfc-8b2a-4ea1cc810ec7@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <e0af96c3-208b-abfc-8b2a-4ea1cc810ec7@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Kiran Gunda <kgunda@codeaurora.org>, gregkh@linuxfoundation.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Abhijeet Dharmapurikar <adharmap@codeaurora.org>, David Collins <collinsd@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-arm-msm-owner@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Aug 21, 2017 at 04:18:58PM -0700, Stephen Boyd wrote:
> On 08/18/2017 08:28 AM, Kiran Gunda wrote:
> > The peripheral ownership check is not necessary on single master
> > platforms. Hence, enforce the peripheral ownership check optionally.
> >
> > Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
> > Tested-by: Shawn Guo <shawnguo@kernel.org>
> > ---
> 
> This sounds like a band-aid. Isn't the gpio driver going to keep probing
> all the pins that are not supposed to be accessed due to security
> constraints? What exactly is failing in the gpio case?

There is a platform_irq_count() call in pinctrl-spmi-gpio probe
function.  Due to the owner check in spmi-pmic-arb IRQ domain
qpnpint_irq_domain_dt_translate() function, the call will return irq
number as zero and cause pmic_gpio_probe() fail with -EINVAL error.

[    1.608516] [<ffff00000860e51c>] qpnpint_irq_domain_dt_translate+0x168/0x194
[    1.613557] [<ffff000008117040>] irq_create_fwspec_mapping+0x17c/0x2d8
[    1.620672] [<ffff000008117200>] irq_create_of_mapping+0x64/0x74
[    1.627008] [<ffff0000087b4fac>] of_irq_get+0x54/0x64
[    1.633169] [<ffff00000856b824>] platform_get_irq+0x20/0x150
[    1.638117] [<ffff00000856b97c>] platform_irq_count+0x28/0x44
[    1.643850] [<ffff0000083cf12c>] pmic_gpio_probe+0x50/0x544

Shawn

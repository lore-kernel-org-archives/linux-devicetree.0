From: Grant Likely <grant.likely@linaro.org>
Subject: Re: [PATCH] of: Export of_irq_count for using in modules
Date: Thu, 6 Jun 2013 12:55:47 +0100
Message-ID: <CACxGe6synO5mksUPF4bG3NGnkS7HB47m8u_O+WVb6GG-0153Yw@mail.gmail.com>
References: <6aa29b1d109a46278a7f37b598defe07d6edfe60.1369921774.git.michal.simek@xilinx.com>
 <20130530201714.GE19834@game.jcrosoft.org> <51A85BEE.4000009@monstr.eu>
 <20130531110045.GF19834@game.jcrosoft.org> <51A8AC4B.906@monstr.eu>
 <20130531151601.GG19834@game.jcrosoft.org> <51A8D3A3.5030200@monstr.eu>
 <20130606082941.GH19834@game.jcrosoft.org> <51B04AA9.4070803@monstr.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <51B04AA9.4070803@monstr.eu>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Simek <monstr@monstr.eu>
Cc: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, Michal Simek <michal.simek@xilinx.com>, devicetree-discuss <devicetree-discuss@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rob Herring <rob.herring@calxeda.com>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 6, 2013 at 9:39 AM, Michal Simek <monstr@monstr.eu> wrote:
> On 06/06/2013 10:29 AM, Jean-Christophe PLAGNIOL-VILLARD wrote:
>> On 18:45 Fri 31 May     , Michal Simek wrote:
>>> ok. good to know. Btw: Let's return to my origin point why not to
>>> export of_irq_count for modules?
>>> Or opposite question if platform_get_resource is correct way
>>> why to export of_irq_to_resource for modules?
>>
>> for old ppc drivers that are not converted yet to pdev
>>
>> if you can do so just use pdev resource I should have fix the pb or irq_domain
>> hopefully for 3.11
>
> ok. It means it is currently deprecated.
> I just wanted to be sure that I understand it correctly.

It's deprecated for platform_devices, but should still be used for
other bus types that don't provide the device driver with a list of
irqs. For platform devices it is best to use the platform_bus irq
table since that is portable regardless of how the device is
instantiated.

As for not exporting of_irq_count(), I don't have a problem with it,
but only if there is a user. It sounds like with the rework you
discussed with Jean-Christophe that it is no longer the case.

g.

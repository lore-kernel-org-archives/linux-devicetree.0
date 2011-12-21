From: Kay Sievers <kay.sievers@vrfy.org>
Subject: Re: [PATCH V3 4/7] cpufreq: add generic cpufreq driver
Date: Wed, 21 Dec 2011 12:44:57 +0100
Message-ID: <CAPXgP10FCrqdTg++46m4+xxM9tw1ZrKc8wz=JkKjCHJ0hQPtng@mail.gmail.com>
References: <1324264903-15395-1-git-send-email-richard.zhao@linaro.org>
 <20111221012046.GE15863@b20223-02.ap.freescale.net>
 <20111221092739.GI15863@b20223-02.ap.freescale.net>
 <201112210943.34310.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <201112210943.34310.arnd@arndb.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linaro-dev@lists.linaro.org, catalin.marinas@arm.com, eric.miao@linaro.org, grant.likely@secretlab.ca, rdunlap@xenotime.net, jamie@jamieiles.com, linux@arm.linux.org.uk, cpufreq@vger.kernel.org, Greg KH <greg@kroah.com>, davidb@codeaurora.org, patches@linaro.org, marc.zyngier@arm.com, devicetree-discuss@lists.ozlabs.org, rob.herring@calxeda.com, davej@redhat.com, Richard Zhao <richard.zhao@linaro.org>, linux-arm-kernel@lists.infradead.org, mark.langsdorf@calxeda.com, Mark Brown <broonie@opensource.wolfsonmicro.com>, bryanh@codeaurora.org, Richard Zhao <richard.zhao@freescale.com>, kernel@pengutronix.de, shawn.guo@linaro.org
List-Id: devicetree@vger.kernel.org

On Wed, Dec 21, 2011 at 10:43, Arnd Bergmann <arnd@arndb.de> wrote:
> On Wednesday 21 December 2011, Richard Zhao wrote:
>> On Wed, Dec 21, 2011 at 09:20:46AM +0800, Richard Zhao wrote:
>
>> > > > > You also need to define how the core supplies get looked up.
>> > >
>> > > > It's pure software. platform uses this driver have to define "cpu" consumer.
>> > >
>> > > You still need to define this in the binding.
>> > You mean regulator DT binding? already in ? I'll check it.
>> Mark, cpu node is not a struct device, sys_device instead. I can not find
>> regulator via device/dt node. Can I still use the string to get regulator
>> after converting to DT?
>
> I believe Kay and Greg have the plan to unify "class" and "bus" in sysfs, which
> implies turning sys_device into a derived class of device instead of kobject.
> If that understanding is correct, we might as well do that now so we can
> attach a device_node to a sys_device.
>
> Kay, does this make sense?

Yes, it's all converted already:
  http://git.kernel.org/?p=linux/kernel/git/kay/patches.git;a=tree

The sysdev stuff will entirely go away, the devices are just 'struct
device' and the sysdev classes are all converted to buses.

We will convert all classes to buses over time time, and have a single
type of device and a single type of subsystem.

Kay

From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH] of: base: upgrade initcall level of of_init from core
 to pure
Date: Wed, 13 May 2015 15:50:18 +0100
Message-ID: <555364AA.7030703@arm.com>
References: <1431452282-10207-1-git-send-email-sudeep.holla@arm.com> <CAL_JsqJ19OfTJjtrZ9vs_9VYRHzOyF=GZdz4ftHT=nonEVWWgw@mail.gmail.com> <55532186.5060803@arm.com> <CAL_JsqL_pEZ0qMgk3j7fwuWLTVZEm2UpPR=e4jAMN4shHAtNnA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqL_pEZ0qMgk3j7fwuWLTVZEm2UpPR=e4jAMN4shHAtNnA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "grant.likely@linaro.org" <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: devicetree@vger.kernel.org



On 13/05/15 14:46, Rob Herring wrote:
> On Wed, May 13, 2015 at 5:03 AM, Sudeep Holla <sudeep.holla@arm.com> wrote:
>>
>>
>> On 12/05/15 23:55, Rob Herring wrote:
>>>
>>> On Tue, May 12, 2015 at 12:38 PM, Sudeep Holla <sudeep.holla@arm.com>
>>> wrote:
>>>>
>>>> Commit 5590f3196b29 ("drivers/core/of: Add symlink to device-tree from
>>>> devices with an OF node") adds the symlink `of_node` for each device
>>>> pointing to it's device tree node while creating/initialising it.
>>>>
>>>> However the devicetree sysfs is created and setup in of_init which is
>>>> executed at core_initcall level. For all the devices created at the core
>>>> initcall before of_init, the following error is thrown:
>>>>           "Error -2(-ENOENT) creating of_node link"
>>>
>>>
>>> What devices have you seen the problem with? I'd rather see if those
>>> devices could now be moved later.
>>>
>>
>> Yes that's exactly what I attempted first after seeing the issue, but
>> failed miserably due to the dependency mentioned below.
>>
>> It's on vexpress platforms with the following initcall sequence:
>> 1. core - vexpress system control registers block(sysreg)
>> 2. postcore - vexpress configuration controllers(config-bridge)
>> 3. arch - customize_machine->of_platform_populate
>
> I'd argue we should move this later, but that's a big hammer.
>

I agree and have tried it, but felt that was too invasive.

Alternatively tried to play around _initcal_sync option: move all
core_initcall to postcore_initcall and postcore_initcall to
postcore_initcall_sync. But not sure if that's again kind of misuse of
"sync" version of initcall

>> of_platform_populate creates amba_devices which need clocks and
>> depend on the vexpress-config and clocks which in turn depends on
>> vexpress-sysreg
>
> Personally, I think all this stuff is overly complicated and perhaps
> too much stuff in DT. vexpress-config and vexpress-sysreq are tightly
> coupled and perhaps should be handled with 1 driver. Also, calling
> vexpress-config a bus is a bit of an abuse.
>

Yes, but by the virtue of it's design vexpress system control registers
block and configuration controllers didn't fit well into driver model.
Pawel came up with the best possible solution which was mostly fine
with multiple subsystem maintainers.

>> I would like to know if with commit 5590f3196b29 are we mandating
>> all the device creation to be done only after core_initcall or
>> is it OK get the errors mentioned above and ignore them as harmless
>> as the comment in the code states:
>> "An error here doesn't warrant bringing down the device"
>
> I don't think it really changed with that commit, but there has to be
> some mechanism for core/infrastructure to initialize before
> drivers/devices.
>

Yes

>>>> Since the core_initcall is the earliest point where devices get
>>>> registered, push initcall level of of_init from core to pure so that
>>>> the devicetree sysfs is ready before any devices are registered.
>>>
>>>
>>> Read the definition of pure:
>>>
>>>    * A "pure" initcall has no dependencies on anything else, and purely
>>>    * initializes variables that couldn't be statically initialized.
>>>
>>
>> Yes I read and was bit hesitant initially to do this change, but found
>> no better way. I posted mainly to discuss other possibilities to solve
>> the issue.
>
> Perhaps of_init should not be an initcall at all and it should go into
> driver_init().

That seems ideal place to me as most of kset and kobjects are created
there. Something like below patch ? However found that PPC had a
function with same name which can conflict and we need to rename one of
these two.

--->8

diff --git a/drivers/base/init.c b/drivers/base/init.c
index da033d3bab3c..fa149c7678d2 100644
--- a/drivers/base/init.c
+++ b/drivers/base/init.c
@@ -8,6 +8,7 @@
  #include <linux/device.h>
  #include <linux/init.h>
  #include <linux/memory.h>
+#include <linux/of.h>

  #include "base.h"

@@ -34,4 +35,5 @@ void __init driver_init(void)
  	cpu_dev_init();
  	memory_dev_init();
  	container_dev_init();
+	of_init();
  }
diff --git a/drivers/of/base.c b/drivers/of/base.c
index 8c3d6b04c585..927800548b75 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -189,7 +189,7 @@ int __of_attach_node_sysfs(struct device_node *np)
  	return 0;
  }

-static int __init of_init(void)
+int __init of_init(void)
  {
  	struct device_node *np;

@@ -210,7 +210,6 @@ static int __init of_init(void)

  	return 0;
  }
-pure_initcall(of_init);

  static struct property *__of_find_property(const struct device_node *np,
  					   const char *name, int *lenp)
diff --git a/include/linux/of.h b/include/linux/of.h
index ddeaae6d2083..7b68e9248722 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -121,6 +121,8 @@ extern struct device_node *of_stdout;
  extern raw_spinlock_t devtree_lock;

  #ifdef CONFIG_OF
+extern int of_init(void);
+
  static inline bool is_of_node(struct fwnode_handle *fwnode)
  {
  	return fwnode && fwnode->type == FWNODE_OF;
@@ -376,6 +378,10 @@ bool of_console_check(struct device_node *dn, char 
*name, int index);

  #else /* CONFIG_OF */

+static int of_init(void)
+{
+	return 0;
+}
  static inline bool is_of_node(struct fwnode_handle *fwnode)
  {
  	return false;

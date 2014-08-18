From: Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] Removes OF_SELFTEST dependency on OF_DYNAMIC config symbol
Date: Mon, 18 Aug 2014 09:15:36 -0700
Message-ID: <CA+rpMbJsJNnpnpQEaGh4+k9sEgQFgCx72M=RyfEVVDWDyDYfhg@mail.gmail.com>
References: <1408244589-16930-1-git-send-email-gaurav.minocha.os@gmail.com>
	<20140817135145.6AE99C41205@trevor.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140817135145.6AE99C41205-WNowdnHR2B42iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Aug 17, 2014 at 6:51 AM, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Sat, 16 Aug 2014 20:03:09 -0700, Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> This patch is used to remove the selftests dependency on
>> OF_DYNAMIC config flag. Now, it selectively builds
>> only the functions required by the selftests.
>>
>> Tested with and without OF_DYNAMIC enabled.
>
> Alright, so this /works/ but it isn't really what we want. It still
> builds in the dynamic.c file which I definitely do no want when
> !CONFIG_OF_DYNAMIC. The dynamic functions were split into that file to
> make it really clear which functions are only used by CONFIG_OF_DYNAMIC.
>
> Instead what I want is to disable testcases the test OF_DYNAMIC features
> when OF_DYNAMIC is disabled. Of course, the one hiccup is that selftest
> uses some dynamic features to load in the testcase data. Some of that
> functionality will need to be duplicated or put into a separate file.
>
> Regardless, this is the end of your project, so I'm not going to ask you
> to do extra work. (I'd be thrilled if you did, but I don't consider it
> part of you GSoC project anymore). The work you've done has been
> fantastic, and I'm happy to have been able to work with you on it.
>
> Cheers,
> g.
>

Thanks Grant! It was a wonderful experience working with you, I will
get back to you with a corrected patch soon.

>>
>> Signed-off-by: Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>  drivers/of/Kconfig   |    1 -
>>  drivers/of/Makefile  |    2 +-
>>  drivers/of/dynamic.c |    4 ++++
>>  include/linux/of.h   |    2 +-
>>  4 files changed, 6 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/of/Kconfig b/drivers/of/Kconfig
>> index 5160c4e..1fe3805 100644
>> --- a/drivers/of/Kconfig
>> +++ b/drivers/of/Kconfig
>> @@ -10,7 +10,6 @@ menu "Device Tree and Open Firmware support"
>>  config OF_SELFTEST
>>       bool "Device Tree Runtime self tests"
>>       depends on OF_IRQ && OF_EARLY_FLATTREE
>> -     select OF_DYNAMIC
>>       help
>>         This option builds in test cases for the device tree infrastructure
>>         that are executed once at boot time, and the results dumped to the
>> diff --git a/drivers/of/Makefile b/drivers/of/Makefile
>> index 2b6a7b1..5e1d493 100644
>> --- a/drivers/of/Makefile
>> +++ b/drivers/of/Makefile
>> @@ -6,7 +6,7 @@ obj-$(CONFIG_OF_PROMTREE) += pdt.o
>>  obj-$(CONFIG_OF_ADDRESS)  += address.o
>>  obj-$(CONFIG_OF_IRQ)    += irq.o
>>  obj-$(CONFIG_OF_NET) += of_net.o
>> -obj-$(CONFIG_OF_SELFTEST) += of_selftest.o
>> +obj-$(CONFIG_OF_SELFTEST) += dynamic.o of_selftest.o
>>  of_selftest-objs := selftest.o testcase-data/testcases.dtb.o
>>  obj-$(CONFIG_OF_MDIO)        += of_mdio.o
>>  obj-$(CONFIG_OF_PCI) += of_pci.o
>> diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
>> index 54fecc4..37ca6af 100644
>> --- a/drivers/of/dynamic.c
>> +++ b/drivers/of/dynamic.c
>> @@ -82,6 +82,7 @@ int of_reconfig_notify(unsigned long action, void *p)
>>       return notifier_to_errno(rc);
>>  }
>>
>> +#ifdef CONFIG_OF_DYNAMIC
>>  int of_property_notify(int action, struct device_node *np,
>>                      struct property *prop, struct property *oldprop)
>>  {
>> @@ -96,6 +97,7 @@ int of_property_notify(int action, struct device_node *np,
>>       pr.old_prop = oldprop;
>>       return of_reconfig_notify(action, &pr);
>>  }
>> +#endif
>>
>>  void __of_attach_node(struct device_node *np)
>>  {
>> @@ -200,6 +202,7 @@ int of_detach_node(struct device_node *np)
>>       return rc;
>>  }
>>
>> +#ifdef CONFIG_OF_DYNAMIC
>>  /**
>>   * of_node_release() - release a dynamically allocated node
>>   * @kref: kref element of the node to be released
>> @@ -658,3 +661,4 @@ int of_changeset_action(struct of_changeset *ocs, unsigned long action,
>>       list_add_tail(&ce->node, &ocs->entries);
>>       return 0;
>>  }
>> +#endif
>> diff --git a/include/linux/of.h b/include/linux/of.h
>> index 6c4363b..ccc3f80 100644
>> --- a/include/linux/of.h
>> +++ b/include/linux/of.h
>> @@ -93,7 +93,7 @@ static inline int of_node_is_attached(struct device_node *node)
>>       return node && node->kobj.state_in_sysfs;
>>  }
>>
>> -#ifdef CONFIG_OF_DYNAMIC
>> +#if defined(CONFIG_OF_DYNAMIC) || defined(CONFIG_OF_SELFTEST)
>>  extern struct device_node *of_node_get(struct device_node *node);
>>  extern void of_node_put(struct device_node *node);
>>  #else /* CONFIG_OF_DYNAMIC */
>> --
>> 1.7.9.5
>>
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

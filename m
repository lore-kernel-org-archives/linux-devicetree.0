From: Chen Yu <chenyu56@huawei.com>
Subject: Re: [PATCH v1 08/12] usb: roles: Add usb role switch notifier.
Date: Tue, 4 Dec 2018 09:07:08 +0800
Message-ID: <fd1e34c9-51f3-1cf7-61d2-3df56e2f2a70@huawei.com>
References: <20181203034515.91412-1-chenyu56@huawei.com>
 <20181203034515.91412-9-chenyu56@huawei.com>
 <20181203123824.GE24338@kuha.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181203123824.GE24338@kuha.fi.intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: wangbinghui@hisilicon.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, suzhuangluan@hisilicon.com, kongfei@hisilicon.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, John Stultz <john.stultz@linaro.org>
List-Id: devicetree@vger.kernel.org



On 2018/12/3 20:38, Heikki Krogerus wrote:
> On Mon, Dec 03, 2018 at 11:45:11AM +0800, Yu Chen wrote:
>> This patch adds notifier for drivers want to be informed of the usb role switch.
> 
> I think in this case it would be good to explain a little for what we
> need the notifier for.
> 
>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
>> Cc: Hans de Goede <hdegoede@redhat.com>
>> Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
>> Cc: John Stultz <john.stultz@linaro.org>
>> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
>> Signed-off-by: Yu Chen <chenyu56@huawei.com>
>>
>> --
>> v0:
>> The patch is provided by Heikki Krogerus. I modified and test it
>> on Hikey960 platform.
> 
> I don't think I actually made a "patch" for this. The "diff" I made
> showing the idea does not count, so you should not sign off the patch
> with my address.
> 
> In this case I believe something like "Suggested-by" should be used
> instead of SoB tag:
> 
>         Suggested-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> 
> Side note: If this was from me, then there should be "from" line with
> my address as well.
> 

OK. Thanks！
>> --
>> ---
>>  drivers/usb/common/roles.c | 20 +++++++++++++++++++-
>>  include/linux/usb/role.h   | 46 ++++++++++++++++++++++++++++++++++++++++++++++
>>  2 files changed, 65 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/usb/common/roles.c b/drivers/usb/common/roles.c
>> index 0f48090c5c30..bfd7a988b64c 100644
>> --- a/drivers/usb/common/roles.c
>> +++ b/drivers/usb/common/roles.c
>> @@ -21,6 +21,7 @@ struct usb_role_switch {
>>  	struct device dev;
>>  	struct mutex lock; /* device lock*/
>>  	enum usb_role role;
>> +	struct blocking_notifier_head nh;
>>  
>>  	/* From descriptor */
>>  	struct device *usb2_port;
>> @@ -50,8 +51,10 @@ int usb_role_switch_set_role(struct usb_role_switch *sw, enum usb_role role)
>>  	mutex_lock(&sw->lock);
>>  
>>  	ret = sw->set(sw->dev.parent, role);
>> -	if (!ret)
>> +	if (!ret) {
>>  		sw->role = role;
>> +		blocking_notifier_call_chain(&sw->nh, role, NULL);
>> +	}
>>  
>>  	mutex_unlock(&sw->lock);
>>  
>> @@ -59,6 +62,20 @@ int usb_role_switch_set_role(struct usb_role_switch *sw, enum usb_role role)
>>  }
>>  EXPORT_SYMBOL_GPL(usb_role_switch_set_role);
>>  
>> +int usb_role_switch_register_notifier(struct usb_role_switch *sw,
>> +				      struct notifier_block *nb)
>> +{
>> +	return blocking_notifier_chain_register(&sw->nh, nb);
>> +}
>> +EXPORT_SYMBOL_GPL(usb_role_switch_register_notifier);
>> +
>> +int usb_role_switch_unregister_notifier(struct usb_role_switch *sw,
>> +					struct notifier_block *nb)
>> +{
>> +	return blocking_notifier_chain_unregister(&sw->nh, nb);
>> +}
>> +EXPORT_SYMBOL_GPL(usb_role_switch_unregister_notifier);
>> +
>>  /**
>>   * usb_role_switch_get_role - Get the USB role for a switch
>>   * @sw: USB role switch
>> @@ -297,6 +314,7 @@ usb_role_switch_register(struct device *parent,
>>  		return ERR_PTR(-ENOMEM);
>>  
>>  	mutex_init(&sw->lock);
>> +	BLOCKING_INIT_NOTIFIER_HEAD(&sw->nh);
>>  
>>  	sw->allow_userspace_control = desc->allow_userspace_control;
>>  	sw->usb2_port = desc->usb2_port;
>> diff --git a/include/linux/usb/role.h b/include/linux/usb/role.h
>> index edc51be4a77c..c97d4be91ada 100644
>> --- a/include/linux/usb/role.h
>> +++ b/include/linux/usb/role.h
>> @@ -40,6 +40,8 @@ struct usb_role_switch_desc {
>>  	bool allow_userspace_control;
>>  };
>>  
>> +
>> +#if IS_ENABLED(CONFIG_USB_ROLE_SWITCH)
>>  int usb_role_switch_set_role(struct usb_role_switch *sw, enum usb_role role);
>>  enum usb_role usb_role_switch_get_role(struct usb_role_switch *sw);
>>  struct usb_role_switch *usb_role_switch_get(struct device *dev);
>> @@ -49,5 +51,49 @@ struct usb_role_switch *
>>  usb_role_switch_register(struct device *parent,
>>  			 const struct usb_role_switch_desc *desc);
>>  void usb_role_switch_unregister(struct usb_role_switch *sw);
>> +int usb_role_switch_register_notifier(struct usb_role_switch *sw,
>> +				      struct notifier_block *nb);
>> +int usb_role_switch_unregister_notifier(struct usb_role_switch *sw,
>> +					struct notifier_block *nb);
>> +#else
>> +static inline int usb_role_switch_set_role(struct usb_role_switch *sw,
>> +		enum usb_role role)
>> +{
>> +	return 0;
>> +}
>> +
>> +static inline enum usb_role usb_role_switch_get_role(struct usb_role_switch *sw)
>> +{
>> +	return USB_ROLE_NONE;
>> +}
>> +
>> +static inline struct usb_role_switch *usb_role_switch_get(struct device *dev)
>> +{
>> +	return ERR_PTR(-ENODEV);
>> +}
>> +
>> +static inline void usb_role_switch_put(struct usb_role_switch *sw) { }
>> +
>> +static inline struct usb_role_switch *
>> +usb_role_switch_register(struct device *parent,
>> +			 const struct usb_role_switch_desc *desc)
>> +{
>> +	return ERR_PTR(-ENODEV);
>> +}
>> +
>> +static inline void usb_role_switch_unregister(struct usb_role_switch *sw) { }
>> +
>> +static int usb_role_switch_register_notifier(struct usb_role_switch *sw,
>> +				      struct notifier_block *nb)
>> +{
>> +	return -ENODEV;
>> +}
>> +
>> +static int usb_role_switch_unregister_notifier(struct usb_role_switch *sw,
>> +					struct notifier_block *nb)
>> +{
>> +	return -ENODEV;
>> +}
>> +#endif
>>  
>>  #endif /* __LINUX_USB_ROLE_H */
>> -- 
>> 2.15.0-rc2
> 
> thanks,
> 

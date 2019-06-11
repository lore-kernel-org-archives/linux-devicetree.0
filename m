From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [RESEND PATCH v1 1/5] of/platform: Speed up
 of_find_device_by_node()
Date: Tue, 11 Jun 2019 08:18:41 -0700
Message-ID: <570474f4-8749-50fd-5f72-36648ed44653@gmail.com>
References: <20190604003218.241354-1-saravanak@google.com>
 <20190604003218.241354-2-saravanak@google.com>
 <CAL_JsqLWfNUJm23x+doJDwyuMLOvqWAnLKGQYcgVct-AyWb9LQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqLWfNUJm23x+doJDwyuMLOvqWAnLKGQYcgVct-AyWb9LQ@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Saravana Kannan <saravanak@google.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, David Collins <collinsd@codeaurora.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Android Kernel Team <kernel-team@android.com>
List-Id: devicetree@vger.kernel.org

Hi Saravana,

On 6/10/19 10:36 AM, Rob Herring wrote:
> Why are you resending this rather than replying to Frank's last
> comments on the original?

Adding on a different aspect...  The independent replies from three different
maintainers (Rob, Mark, myself) pointed out architectural issues with the
patch series.  There were also some implementation issues brought out.
(Although I refrained from bringing up most of my implementation issues
as they are not relevant until architecture issues are resolved.)

When three maintainers say the architecture has issues, you should step
back and think hard.  (Not to say maintainers are always correct...)

My suggestion at this point is that you need to go back to the drawing board
and re-think how to address the use case.

-Frank

> 
> On Mon, Jun 3, 2019 at 6:32 PM Saravana Kannan <saravanak@google.com> wrote:
>>
>> Add a pointer from device tree node to the device created from it.
>> This allows us to find the device corresponding to a device tree node
>> without having to loop through all the platform devices.
>>
>> However, fallback to looping through the platform devices to handle
>> any devices that might set their own of_node.
>>
>> Signed-off-by: Saravana Kannan <saravanak@google.com>
>> ---
>>  drivers/of/platform.c | 20 +++++++++++++++++++-
>>  include/linux/of.h    |  3 +++
>>  2 files changed, 22 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
>> index 04ad312fd85b..1115a8d80a33 100644
>> --- a/drivers/of/platform.c
>> +++ b/drivers/of/platform.c
>> @@ -42,6 +42,8 @@ static int of_dev_node_match(struct device *dev, void *data)
>>         return dev->of_node == data;
>>  }
>>
>> +static DEFINE_SPINLOCK(of_dev_lock);
>> +
>>  /**
>>   * of_find_device_by_node - Find the platform_device associated with a node
>>   * @np: Pointer to device tree node
>> @@ -55,7 +57,18 @@ struct platform_device *of_find_device_by_node(struct device_node *np)
>>  {
>>         struct device *dev;
>>
>> -       dev = bus_find_device(&platform_bus_type, NULL, np, of_dev_node_match);
>> +       /*
>> +        * Spinlock needed to make sure np->dev doesn't get freed between NULL
>> +        * check inside and kref count increment inside get_device(). This is
>> +        * achieved by grabbing the spinlock before setting np->dev = NULL in
>> +        * of_platform_device_destroy().
>> +        */
>> +       spin_lock(&of_dev_lock);
>> +       dev = get_device(np->dev);
>> +       spin_unlock(&of_dev_lock);
>> +       if (!dev)
>> +               dev = bus_find_device(&platform_bus_type, NULL, np,
>> +                                     of_dev_node_match);
>>         return dev ? to_platform_device(dev) : NULL;
>>  }
>>  EXPORT_SYMBOL(of_find_device_by_node);
>> @@ -196,6 +209,7 @@ static struct platform_device *of_platform_device_create_pdata(
>>                 platform_device_put(dev);
>>                 goto err_clear_flag;
>>         }
>> +       np->dev = &dev->dev;
>>
>>         return dev;
>>
>> @@ -556,6 +570,10 @@ int of_platform_device_destroy(struct device *dev, void *data)
>>         if (of_node_check_flag(dev->of_node, OF_POPULATED_BUS))
>>                 device_for_each_child(dev, NULL, of_platform_device_destroy);
>>
>> +       /* Spinlock is needed for of_find_device_by_node() to work */
>> +       spin_lock(&of_dev_lock);
>> +       dev->of_node->dev = NULL;
>> +       spin_unlock(&of_dev_lock);
>>         of_node_clear_flag(dev->of_node, OF_POPULATED);
>>         of_node_clear_flag(dev->of_node, OF_POPULATED_BUS);
>>
>> diff --git a/include/linux/of.h b/include/linux/of.h
>> index 0cf857012f11..f2b4912cbca1 100644
>> --- a/include/linux/of.h
>> +++ b/include/linux/of.h
>> @@ -48,6 +48,8 @@ struct property {
>>  struct of_irq_controller;
>>  #endif
>>
>> +struct device;
>> +
>>  struct device_node {
>>         const char *name;
>>         phandle phandle;
>> @@ -68,6 +70,7 @@ struct device_node {
>>         unsigned int unique_id;
>>         struct of_irq_controller *irq_trans;
>>  #endif
>> +       struct device *dev;             /* Device created from this node */
>>  };
>>
>>  #define MAX_PHANDLE_ARGS 16
>> --
>> 2.22.0.rc1.257.g3120a18244-goog
>>
> .
> 

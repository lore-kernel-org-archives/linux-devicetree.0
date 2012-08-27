From: "ABRAHAM, KISHON VIJAY" <kishon-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 2/3] usb: otg: add device tree support to otg library
Date: Mon, 27 Aug 2012 11:02:25 +0530
Message-ID: <CAAe_U6KaEBLmLpu_VcJsk4Le_xDiKWrU_xWBFFBybk9ZXSiFZg@mail.gmail.com>
References: <1345742574-19088-1-git-send-email-mkl@pengutronix.de>
 <1345742574-19088-3-git-send-email-mkl@pengutronix.de>
 <20120824064628.GP4011@b20223-02.ap.freescale.net>
 <503915E6.2020508@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <503915E6.2020508-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Devicetree Discussions <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, mgr-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On Sat, Aug 25, 2012 at 11:43 PM, Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
> On 08/24/2012 08:46 AM, Richard Zhao wrote:
>> Did you try both enableing and disabing DT pass build?
>
> Impossible on mx28 :) The platform always selects USE_DT, but on imx it
> builds without DT support.
>
>> On Thu, Aug 23, 2012 at 07:22:53PM +0200, Marc Kleine-Budde wrote:
>>> From: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
>>>
>>> This patch adds an API to get usb phy by passing a device node phandle value.
>>> The new added devm_usb_get_phy_by_phandle() function will return a pointer to
>>> the phy on success, -EPROBE_DEFER if there is a device_node for the phandle,
>>> but the phy has not been added, or a ERR_PTR() otherwise.
>>>
>>> Since it's possible to obtain a phy by phandle, the checks in usb_add_phy() for
>>> a valid phy type is removed (now it's just a debug message if a user tries to
>>> add a phy with undefined type). This also allows to add multiple phys of same
>>> type.
>>>
>>> Cc: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>>> Cc: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
>>> Signed-off-by: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
>>> Signed-off-by: Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>>> ---
>>>  drivers/usb/otg/otg.c   |   96 ++++++++++++++++++++++++++++++++++++++++-------
>>>  include/linux/usb/otg.h |    8 ++++
>>>  2 files changed, 90 insertions(+), 14 deletions(-)
>>>
>>> diff --git a/drivers/usb/otg/otg.c b/drivers/usb/otg/otg.c
>>> index 98c430e..23618de 100644
>>> --- a/drivers/usb/otg/otg.c
>>> +++ b/drivers/usb/otg/otg.c
>>> @@ -15,6 +15,7 @@
>>>  #include <linux/device.h>
>>>  #include <linux/module.h>
>>>  #include <linux/slab.h>
>>> +#include <linux/of.h>
>>>
>>>  #include <linux/usb/otg.h>
>>>
>>> @@ -36,6 +37,21 @@ static struct usb_phy *__usb_find_phy(struct list_head *list,
>>>      return ERR_PTR(-ENODEV);
>>>  }
>>>
>>> +static struct usb_phy *__of_usb_find_phy(struct list_head *list,
>>> +    struct device_node *node)
>>> +{
>>> +    struct usb_phy  *phy;
>>> +
>>> +    list_for_each_entry(phy, list, head) {
>>> +            if (node != phy->dev->of_node)
>>> +                    continue;
>>> +
>>> +            return phy;
>>> +    }
>>> +
>>> +    return ERR_PTR(-ENODEV);
>>> +}
>>> +
>>>  static void devm_usb_phy_release(struct device *dev, void *res)
>>>  {
>>>      struct usb_phy *phy = *(struct usb_phy **)res;
>>> @@ -112,6 +128,66 @@ err0:
>>>  EXPORT_SYMBOL(usb_get_phy);
>>>
>>>  /**
>>> + * devm_usb_get_phy_by_phandle - find the USB PHY by phandle
>>> + * @dev - device that requests this phy
>>> + * @phandle - name of the property holding the phy phandle value
>>> + *
>>> + * Returns the phy driver associated with the given phandle value,
>>> + * after getting a refcount to it, -ENODEV if there is no such phy or
>>> + * -EPROBE_DEFER if there is a phandle to the phy, but the device is
>>> + * not yet loaded. While at that, it also associates the device with
>>> + * the phy using devres. On driver detach, release function is invoked
>>> + * on the devres data, then, devres data is freed.
>>> + *
>>> + * For use by USB host and peripheral drivers.
>>> + */
>>> +struct usb_phy *devm_usb_get_phy_by_phandle(struct device *dev,
>>> +    const char *phandle)
>
>> Since it's already a common function, we may give phandler property
>> a common name too. So we will not need phandle argument.
>> Please also don't forget to document the devm_xxx and dt binding.
>
> Good point. This is the device tree snippet from imx28.dtsi:
>
>>         usb0: usb@80080000 {
>>                 compatible = "fsl,imx28-usb", "fsl,imx27-usb";
>>                 reg = <0x80080000 0x10000>;
>>                 interrupts = <93>;
>>                 fsl,usbphy = <&usbphy0>;
>                   ^^^^
>
> What about removing the "fsl,", so it just would be "usbphy".
>
>>                 status = "disabled";
>>         };
>
>>> +{
>>> +    struct usb_phy  *phy = NULL, **ptr;
>>> +    unsigned long   flags;
>>> +    struct device_node *node;
>>> +
>>> +    if (!dev->of_node) {
>>> +            dev_dbg(dev, "device does not have a device node entry\n");
>>> +            return ERR_PTR(-EINVAL);
>>> +    }
>>> +
>>> +    node = of_parse_phandle(dev->of_node, phandle, 0);
>>> +    if (!node) {
>>> +            dev_dbg(dev, "failed to get %s phandle in %s node\n", phandle,
>>> +                    dev->of_node->full_name);
>>> +            return ERR_PTR(-ENODEV);
>>> +    }
>>> +
>>> +    ptr = devres_alloc(devm_usb_phy_release, sizeof(*ptr), GFP_KERNEL);
>>> +    if (!ptr) {
>>> +            dev_dbg(dev, "failed to allocate memory for devres\n");
>>> +            return ERR_PTR(-ENOMEM);
>>> +    }
>>> +
>>> +    spin_lock_irqsave(&phy_lock, flags);
>>> +
>>> +    phy = __of_usb_find_phy(&phy_list, node);
>>> +    if (IS_ERR(phy) || !try_module_get(phy->dev->driver->owner)) {
>>> +            phy = ERR_PTR(-EPROBE_DEFER);
>>> +            devres_free(ptr);
>>> +            goto err0;
>>> +    }
>>> +
>>> +    *ptr = phy;
>>> +    devres_add(dev, ptr);
>>> +
>>> +    get_device(phy->dev);
>>> +
>>> +err0:
>>> +    spin_unlock_irqrestore(&phy_lock, flags);
>>> +
>>> +    return phy;
>>> +}
>>> +EXPORT_SYMBOL(devm_usb_get_phy_by_phandle);
>>> +
>>> +/**
>>>   * devm_usb_put_phy - release the USB PHY
>>>   * @dev - device that wants to release this phy
>>>   * @phy - the phy returned by devm_usb_get_phy()
>>> @@ -158,32 +234,24 @@ EXPORT_SYMBOL(usb_put_phy);
>>>   */
>>>  int usb_add_phy(struct usb_phy *x, enum usb_phy_type type)
>>>  {
>>> -    int             ret = 0;
>>>      unsigned long   flags;
>>>      struct usb_phy  *phy;
>>>
>>> -    if (x && x->type != USB_PHY_TYPE_UNDEFINED) {
>>> -            dev_err(x->dev, "not accepting initialized PHY %s\n", x->label);
>>> -            return -EINVAL;
>
>> why do you remove re-intialize check? Maybe you can add a
>> USB_PHY_TYPE_DT and below logic will be more clear.
>
> I don't know why this check is removed in Kishon's original patch. From
> my point of view all these checks can be removed. Kishon can you explain
> the rationale behind this?

I dint remove the check actually. I just avoided the function from
returning -EINVAL if the phy type is UNDEFINED since now the phy can
be obtained by phandle (even if it has undefined phy type). I still
have the check to *warn* if the phy type is undefined (see below).
>
> regards, Marc
>
>>> -    }
>>> +    if (x && x->type != USB_PHY_TYPE_UNDEFINED)
>>> +            dev_dbg(x->dev, "add a phy with undefined type %s\n", x->label);
>>>
>>>      spin_lock_irqsave(&phy_lock, flags);
>>>
>>> -    list_for_each_entry(phy, &phy_list, head) {
>>> -            if (phy->type == type) {
>>> -                    ret = -EBUSY;
>>> -                    dev_err(x->dev, "transceiver type %s already exists\n",
>>> +    list_for_each_entry(phy, &phy_list, head)
>>> +            if (phy->type == type)
>>> +                    dev_dbg(x->dev, "transceiver type %s already exists\n",
>>>                                              usb_phy_type_string(type));
>>> -                    goto out;
>>> -            }
>>> -    }
>>>
>>>      x->type = type;
>>>      list_add_tail(&x->head, &phy_list);
>>>
>>> -out:
>>>      spin_unlock_irqrestore(&phy_lock, flags);
>>> -    return ret;
>>> +    return 0;
>>>  }
>>>  EXPORT_SYMBOL(usb_add_phy);
>>>
>>> diff --git a/include/linux/usb/otg.h b/include/linux/usb/otg.h
>>> index 45824be..602d6b4 100644
>>> --- a/include/linux/usb/otg.h
>>> +++ b/include/linux/usb/otg.h
>>> @@ -190,6 +190,8 @@ usb_phy_shutdown(struct usb_phy *x)
>>>  extern struct usb_phy *usb_get_phy(enum usb_phy_type type);
>>>  extern struct usb_phy *devm_usb_get_phy(struct device *dev,
>>>      enum usb_phy_type type);
>>> +extern struct usb_phy *devm_usb_get_phy_by_phandle(struct device *dev,
>>> +    const char *phandle);
>>>  extern void usb_put_phy(struct usb_phy *);
>>>  extern void devm_usb_put_phy(struct device *dev, struct usb_phy *x);
>>>  extern const char *otg_state_string(enum usb_otg_state state);
>>> @@ -205,6 +207,12 @@ static inline struct usb_phy *devm_usb_get_phy(struct device *dev,
>>>      return NULL;
>>>  }
>>>
>>> +static inline struct usb_phy *devm_usb_get_phy_by_phandle(struct device *dev,
>>> +    const char *phandle)
>>> +{
>>> +    return NULL;
>>> +}
>>> +
>>>  static inline void usb_put_phy(struct usb_phy *x)
>>>  {
>>>  }
>>
>> Thanks
>> Richard
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-usb" in
>> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
>
>
> --
> Pengutronix e.K.                  | Marc Kleine-Budde           |
> Industrial Linux Solutions        | Phone: +49-231-2826-924     |
> Vertretung West/Dortmund          | Fax:   +49-5121-206917-5555 |
> Amtsgericht Hildesheim, HRA 2686  | http://www.pengutronix.de   |
>

Thanks
Kishon

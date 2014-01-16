From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: Re: [PATCH] ARM: sunxi: Add driver for sunxi usb phy
Date: Thu, 16 Jan 2014 15:07:18 +0800
Message-ID: <CAGb2v65rSc7iAKCcPMYaQZ+q=m85RcSE2dmpgE6MoeXNgRCwfg@mail.gmail.com>
References: <1389740305-6993-1-git-send-email-hdegoede@redhat.com>
 <52D6A27A.4090600@ti.com> <52D6ADEA.1050900@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-sunxi+bncBCMILY6JWQBBBO4K32LAKGQEYVTTSBQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <52D6ADEA.1050900-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Hans De Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-usb <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Hans,

On Wed, Jan 15, 2014 at 11:48 PM, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> Hi,
>
>
> On 01/15/2014 04:00 PM, Kishon Vijay Abraham I wrote:
>>
>> On Wednesday 15 January 2014 04:28 AM, Hans de Goede wrote:
[...]
>>> +static int sun4i_usb_phy_init(struct phy *_phy)
>>> +{
>>> +       struct sun4i_usb_phy *phy = phy_get_drvdata(_phy);
>>> +       struct sun4i_usb_phy_data *data = to_sun4i_usb_phy_data(phy);
>>> +       int ret;
>>> +
>>> +       ret = clk_prepare_enable(data->clk);
>>> +       if (ret)
>>> +               return ret;
>>> +
>>> +       ret = reset_control_deassert(phy->reset);
>>> +       if (ret) {
>>> +               clk_disable_unprepare(data->clk);
>>> +               return ret;
>>> +       }
>>> +
>>> +       /* Adjust PHY's magnitude and rate */
>>> +       sun4i_usb_phy_write(phy, 0x20, 0x14, 5);
>>
>>
>> No magic values. Use macros instead.
>
>
> We don't have docs, these values come from the Android code (and the comment
> above has been translated from Chinese). I can make up some random
> macros for this, but seems counter-productive, it seems best to just leave
> this as magic until the day we actually have documentation and thus can use
> defines with the proper register names, etc.

We have some names for the registers from Allwinner code:
https://github.com/linux-sunxi/linux-sunxi/blob/lichee-3.0.8-sun4i/drivers/usb/sun4i_usb/usbc/usbc_phy.c#L39

And the comments in the file also suggests valid values for some of them,
though the actual code in the sunxi usb drivers (not the otg one) don't
seem to match.

[...]

Cheers
ChenYu

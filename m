From: John Stultz <john.stultz@linaro.org>
Subject: Re: [PATCH v5 09/13] usb: roles: Add usb role switch notifier.
Date: Thu, 11 Apr 2019 20:59:17 -0700
Message-ID: <CALAqxLWf0_73spYd68-bnYZp5evLNjcFwBqevVdHCoziG9paBA@mail.gmail.com>
References: <20190329041409.70138-1-chenyu56@huawei.com> <20190329041409.70138-10-chenyu56@huawei.com>
 <CALAqxLUQW03waz0LETcnYpc7qhm=RG6RfwbGVZ7MQz00jTZSWQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CALAqxLUQW03waz0LETcnYpc7qhm=RG6RfwbGVZ7MQz00jTZSWQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yu Chen <chenyu56@huawei.com>
Cc: Linux USB List <linux-usb@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, Zhuangluan Su <suzhuangluan@hisilicon.com>, Kongfei <kongfei@hisilicon.com>, "Liuyu (R)" <liuyu712@hisilicon.com>, wanghu17@hisilicon.com, butao <butao@hisilicon.com>, chenyao11@huawei.com, fangshengzhou@hisilicon.com, Li Pengcheng <lipengcheng8@huawei.com>, songxiaowei@hisilicon.com, YiPing Xu <xuyiping@hisilicon.com>, xuyoujun4@huawei.com, Yudongbin <yudongbin@hisilicon.com>, Zang Leigang <zangleigang@hisilicon.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy.shevchenko@gmail.com>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 11, 2019 at 6:12 PM John Stultz <john.stultz@linaro.org> wrote:
>
> On Thu, Mar 28, 2019 at 9:14 PM Yu Chen <chenyu56@huawei.com> wrote:
> >
> > This patch adds notifier for drivers want to be informed of the usb role
> > switch.
> >
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > Cc: Hans de Goede <hdegoede@redhat.com>
> > Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
> > Cc: John Stultz <john.stultz@linaro.org>
> > Suggested-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > Signed-off-by: Yu Chen <chenyu56@huawei.com>
>
> Hey Yu Chen!
>    Thanks again for sending this patch out! As mentioned in my
> comments with the other patches, I've got one proposal I wanted to
> share to try to avoid  state initialization races that I've seen with
> this patchset.
>
> > diff --git a/drivers/usb/roles/class.c b/drivers/usb/roles/class.c
> > index f45d8df5cfb8..e2caaa665d6e 100644
> > --- a/drivers/usb/roles/class.c
> > +++ b/drivers/usb/roles/class.c
> > @@ -58,6 +61,20 @@ int usb_role_switch_set_role(struct usb_role_switch *sw, enum usb_role role)
> >  }
> >  EXPORT_SYMBOL_GPL(usb_role_switch_set_role);
> >
> > +int usb_role_switch_register_notifier(struct usb_role_switch *sw,
> > +                                     struct notifier_block *nb)
> > +{
> > +       return blocking_notifier_chain_register(&sw->nh, nb);
> > +}
> > +EXPORT_SYMBOL_GPL(usb_role_switch_register_notifier);
>
> As noted earlier, one issue I've seen is that the hisi_hikey_usb
> driver's notifier may not get called early enough to receive
> notification of the initial usb state.
>
> It seems like on registration here, we should take the lock, read the
> role state and immediately call the notifier to properly initialize
> it? I suspect that should close the window for any state races around
> driver probe timings and
>
> Does that make sense? I have roughly prototyped this but need to do
> additional testing.

So these seem to be working ok.
First, the notifier call on register change:
  https://git.linaro.org/people/john.stultz/android-dev.git/commit/?h=dev/hikey960-mainline-WIP&id=1d312db9763c2449c3cf5b3383b1f33390f8ce7b

Second, the current_dr_role change for dwc3:
  https://git.linaro.org/people/john.stultz/android-dev.git/commit/?h=dev/hikey960-mainline-WIP&id=b80b536de76eb80f7df0846aa54ac22e2b4ffe4e

Feel free to fold/rework those changes into your patch set.

thanks
-john

From: Sven Van Asbroeck <thesven73@gmail.com>
Subject: Re: [PATCH anybus v3 4/6] bus: support HMS Anybus-S bus
Date: Mon, 12 Nov 2018 11:23:30 -0500
Message-ID: <CAGngYiW0Xm5C=_zKgDPSJaeDwR1bHOzLkpL8pDg5otBawvGPGw@mail.gmail.com>
References: <20181104155501.14767-1-TheSven73@googlemail.com>
 <20181104155501.14767-5-TheSven73@googlemail.com> <CAK8P3a3DnKcRxL5dG_pvBVTngFh5eDL2JdEqZzgL0RXJy5dZGw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK8P3a3DnKcRxL5dG_pvBVTngFh5eDL2JdEqZzgL0RXJy5dZGw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Sven Van Asbroeck <svendev@arcx.com>, robh+dt@kernel.org, Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee.jones@linaro.org>, mark.rutland@arm.com, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, treding@nvidia.com, David Lechner <david@lechnology.com>, noralf@tronnes.org, johan@kernel.org, Michal Simek <monstr@monstr.eu>, michal.vokac@ysoft.com, gregkh@linuxfoundation.org, john.garry@huawei.com, geert+renesas@glider.be, robin.murphy@arm.com, paul.gortmaker@windriver.com, sebastien.bourdelin@savoirfairelinux.com, icenowy@aosc.io, Stuart Yoder <stuyoder@gmail.com>, maxime.ripard@bootlin.com, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 8, 2018 at 9:07 AM Arnd Bergmann <arnd@arndb.de> wrote:
>
>
> > +struct anybuss_host {
> > +       struct device *dev;
> > +       struct anybuss_client *client;
> > +       struct reset_control *reset;
> > +       struct regmap *regmap;
> > +       int irq;
> > +       struct task_struct *qthread;
> > +       wait_queue_head_t wq;
> > +       struct completion card_boot;
> > +       atomic_t ind_ab;
> > +       spinlock_t qlock;
> > +       struct kmem_cache *qcache;
> > +       struct kfifo qs[3];
> > +       struct kfifo *powerq;
> > +       struct kfifo *mboxq;
> > +       struct kfifo *areaq;
> > +       bool power_on;
> > +       bool softint_pending;
> > +       atomic_t dc_event;
> > +       wait_queue_head_t dc_wq;
> > +       atomic_t fieldbus_online;
> > +       struct kernfs_node *fieldbus_online_sd;
> > +};
>
> Similarly, should that anybuss_host sturcture maybe be based on
> a 'struct device' itself? What is the hierarchy of devices in sysfs?
>

The anybus host 'is-a' platform device. The dev member in struct anybuss_host is
actually &pdev->dev.

The host's platform device shows up in sysfs under
/sys/bus/platform/devices/anybuss-host.0.auto
where .0 is the first anybus slot on the bridge, .1 the second slot.
If there is more than one bridge, we'll see .2, .3 etc.

Here are the virtual files in that dir:

drwxr-xr-x    3 root     root             0 Nov 12 11:02
anybuss-host.0.auto.card0
lrwxrwxrwx    1 root     root             0 Nov 12 11:11 driver ->
../../../../../../../bus/platform/drivers/anybuss-host
-rw-r--r--    1 root     root          4096 Nov 12 11:11 driver_override
drwxr-xr-x    3 root     root             0 Nov 12 11:02 misc
-r--r--r--    1 root     root          4096 Nov 12 11:11 modalias
drwxr-xr-x    2 root     root             0 Nov 12 11:11 power
-r--r--r--    1 root     root          4096 Nov 12 11:11 state
lrwxrwxrwx    1 root     root             0 Nov 12 11:11 subsystem ->
../../../../../../../bus/platform
-rw-r--r--    1 root     root          4096 Nov 12 11:02 uevent

Where
anybuss-host.0.auto.card0 just points to the detected anybus card, if any.
Nothing to see there, it's just an artefact of the bus/device abstraction.
misc points to the detected anybus card driver (which is implemented as a
misc class device).

This sysfs hierarchy makes sense to me. Is there something I should be
doing (or not doing) ?

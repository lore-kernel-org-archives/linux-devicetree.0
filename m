From: Andre Kalb <Andre.Kalb@sma.de>
Subject: [PATCH v2] of: __of_update_property_sysfs only call
 __of_sysfs_remove_bin_file if of_node_is_attached
Date: Wed, 19 Sep 2018 09:25:32 +0000
Message-ID: <DB7PR04MB5243B43ED321F828C5094DA8FC1C0@DB7PR04MB5243.eurprd04.prod.outlook.com>
References: <AM6PR04MB52394FDB1266388BCE1374E3FC030@AM6PR04MB5239.eurprd04.prod.outlook.com>
 <c0bcc2c1-3058-db4d-ca4d-4e56c502891b@gmail.com>
 <DB7PR04MB5243B6ADEBCB4B53B5A161F8FC050@DB7PR04MB5243.eurprd04.prod.outlook.com>
 <CAL_JsqKc1-Rz6iBJ_dpDrEDoFRpTaLR+1voXdTgiJjjG65druA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqKc1-Rz6iBJ_dpDrEDoFRpTaLR+1voXdTgiJjjG65druA@mail.gmail.com>
Content-Language: de-DE
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

I have used an other hardware to check the patch. I hope it doesn't matter. I added few lines at the untitest.c. All existing unittest use an attached sysfs, therefore the bug isn't detectable.

The patch of the unittest is posted: https://lore.kernel.org/patchwork/patch/985738/

------------[ cut here ]------------
WARNING: CPU: 0 PID: 1 at fs/kernfs/dir.c:1481 kernfs_remove_by_name_ns+0x9c/0xa4
kernfs: can not remove '(null)', no directory
Modules linked in:
CPU: 0 PID: 1 Comm: swapper Not tainted 4.18.7 #3
Hardware name: Freescale i.MX6 Ultralite (Device Tree)
[<c010f338>] (unwind_backtrace) from [<c010cefc>] (show_stack+0x10/0x14)
[<c010cefc>] (show_stack) from [<c0122004>] (__warn+0xe0/0xf8)
[<c0122004>] (__warn) from [<c0122060>] (warn_slowpath_fmt+0x44/0x68)
[<c0122060>] (warn_slowpath_fmt) from [<c02c6540>] (kernfs_remove_by_name_ns+0x9c/0xa4)
[<c02c6540>] (kernfs_remove_by_name_ns) from [<c055a704>] (__of_update_property_sysfs+0x38/0x50)
[<c055a704>] (__of_update_property_sysfs) from [<c0557b94>] (of_update_property+0xc0/0x104)
[<c0557b94>] (of_update_property) from [<c09521bc>] (of_unittest+0x1b8/0x28d4)
[<c09521bc>] (of_unittest) from [<c0102d88>] (do_one_initcall+0x40/0x218)
[<c0102d88>] (do_one_initcall) from [<c090101c>] (kernel_init_freeable+0x24c/0x2e4)
[<c090101c>] (kernel_init_freeable) from [<c06a1f6c>] (kernel_init+0x8/0x110)
[<c06a1f6c>] (kernel_init) from [<c01010e8>] (ret_from_fork+0x14/0x2c)
Exception stack(0xcc099fb0 to 0xcc099ff8)
9fa0:                                     00000000 00000000 00000000 00000000
9fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
9fe0: 00000000 00000000 00000000 00000000 00000013 00000000
---[ end trace 4522f69e0760e4d5 ]---

Best regards
Andre Kalb

> -----Ursprüngliche Nachricht-----
> Von: Rob Herring [mailto:robh+dt@kernel.org]
> Gesendet: Montag, 10. September 2018 15:47
> An: Andre Kalb
> Cc: Frank Rowand; devicetree@vger.kernel.org; linux-kernel@vger.kernel.org
> Betreff: Re: [PATCH v2] of: __of_update_property_sysfs only call
> __of_sysfs_remove_bin_file if of_node_is_attached
>
> On Mon, Sep 10, 2018 at 4:51 AM Andre Kalb <Andre.Kalb@sma.de> wrote:
> >
> > Hi Frank,
> >
> > > -----Ursprüngliche Nachricht-----
> > > Von: Frank Rowand [mailto:frowand.list@gmail.com]
> > > Gesendet: Freitag, 7. September 2018 22:01
> > > An: Andre Kalb; robh+dt@kernel.org; devicetree@vger.kernel.org;
> > > linux- kernel@vger.kernel.org
> > > Betreff: Re: [PATCH v2] of: __of_update_property_sysfs only call
> > > __of_sysfs_remove_bin_file if of_node_is_attached
> > >
> > > Hi Andred,
> > >
> > > On 09/04/18 08:51, Andre Kalb wrote:
> > > > To prevent warning "kernfs: can not remove '(null)', no directory"
> > > > if an overlay
> > > isn't applied to the active devicetree.
> > > >
> > > > Using of_remove_property and then of_add_property doesn't show the
> > > warning.
>
> [...]
>
> > > What is the calling path that results in the warning?
> > >
> > > -Frank
> >
> > There is the callstack of the warning.
> >
> > [   10.782830] ------------[ cut here ]------------
> > [   10.830357] WARNING: CPU: 0 PID: 170 at /linux-4.x/fs/kernfs/dir.c:1276
> kernfs_remove_by_name_ns+0x30/0x80()
> > [   10.928997] kernfs: can not remove '(null)', no directory
> > [   10.993107] Modules linked in: module_capemgr(+)
> > [   11.045750] CPU: 0 PID: 170 Comm: systemd-udevd Not tainted 4.4.143-
> 00158-g8e5ca65ec7ee-dirty #114
>
> 158 patches on top of an almost 3 year old kernel...
>
> > [   12.011373] [<bf0000e4>] (module_capemgr_slot_scan [module_capemgr])
> from [<bf0007bc>] (module_capemgr_probe+0x3c/0x58 [module_capemgr])
>
> And a driver that's not upstream.
>
> Not saying the fix isn't valid, but please reproduce on recent mainline. Add a
> unittest if you have to.
>
> Rob

___________________________________________________

SMA Solar Technology AG
Aufsichtsrat: Dr. Erik Ehrentraut (Vorsitzender)
Vorstand: Ulrich Hadding, Dr.-Ing. Juergen Reinert, Pierre-Pascal Urbon
Handelsregister: Amtsgericht Kassel HRB 3972
Sitz der Gesellschaft: 34266 Niestetal
USt-ID-Nr. DE 113 08 59 54
WEEE-Reg.-Nr. DE 95881150
___________________________________________________

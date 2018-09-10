From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2] of: __of_update_property_sysfs only call
 __of_sysfs_remove_bin_file if of_node_is_attached
Date: Mon, 10 Sep 2018 08:46:48 -0500
Message-ID: <CAL_JsqKc1-Rz6iBJ_dpDrEDoFRpTaLR+1voXdTgiJjjG65druA@mail.gmail.com>
References: <AM6PR04MB52394FDB1266388BCE1374E3FC030@AM6PR04MB5239.eurprd04.prod.outlook.com>
 <c0bcc2c1-3058-db4d-ca4d-4e56c502891b@gmail.com> <DB7PR04MB5243B6ADEBCB4B53B5A161F8FC050@DB7PR04MB5243.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <DB7PR04MB5243B6ADEBCB4B53B5A161F8FC050@DB7PR04MB5243.eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andre.Kalb@sma.de
Cc: Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 10, 2018 at 4:51 AM Andre Kalb <Andre.Kalb@sma.de> wrote:
>
> Hi Frank,
>
> > -----Urspr=C3=BCngliche Nachricht-----
> > Von: Frank Rowand [mailto:frowand.list@gmail.com]
> > Gesendet: Freitag, 7. September 2018 22:01
> > An: Andre Kalb; robh+dt@kernel.org; devicetree@vger.kernel.org; linux-
> > kernel@vger.kernel.org
> > Betreff: Re: [PATCH v2] of: __of_update_property_sysfs only call
> > __of_sysfs_remove_bin_file if of_node_is_attached
> >
> > Hi Andred,
> >
> > On 09/04/18 08:51, Andre Kalb wrote:
> > > To prevent warning "kernfs: can not remove '(null)', no directory" if=
 an overlay
> > isn't applied to the active devicetree.
> > >
> > > Using of_remove_property and then of_add_property doesn't show the
> > warning.

[...]

> > What is the calling path that results in the warning?
> >
> > -Frank
>
> There is the callstack of the warning.
>
> [   10.782830] ------------[ cut here ]------------
> [   10.830357] WARNING: CPU: 0 PID: 170 at /linux-4.x/fs/kernfs/dir.c:127=
6 kernfs_remove_by_name_ns+0x30/0x80()
> [   10.928997] kernfs: can not remove '(null)', no directory
> [   10.993107] Modules linked in: module_capemgr(+)
> [   11.045750] CPU: 0 PID: 170 Comm: systemd-udevd Not tainted 4.4.143-00=
158-g8e5ca65ec7ee-dirty #114

158 patches on top of an almost 3 year old kernel...

> [   12.011373] [<bf0000e4>] (module_capemgr_slot_scan [module_capemgr]) f=
rom [<bf0007bc>] (module_capemgr_probe+0x3c/0x58 [module_capemgr])

And a driver that's not upstream.

Not saying the fix isn't valid, but please reproduce on recent
mainline. Add a unittest if you have to.

Rob

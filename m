Return-Path: <SRS0=1HNp=KL=renesas.com=yoshihiro.shimoda.uh@kernel.org>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: RE: [PATCH v6] usb: gadget: udc: renesas_usb3: Add register of usb
 role switch
Date: Fri, 27 Jul 2018 01:49:36 +0000
Message-ID: 
 <OSBPR01MB2293E0BE5E19D74A80F615DBD82A0@OSBPR01MB2293.jpnprd01.prod.outlook.com>
References: 
 <1527747093-1674-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <87r2jq1cxd.fsf@linux.intel.com>
In-Reply-To: <87r2jq1cxd.fsf@linux.intel.com>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Felipe Balbi <balbi@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>, "hdegoede@redhat.com" <hdegoede@redhat.com>, "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Felipe-san,

> From: Felipe Balbi, Sent: Thursday, July 26, 2018 7:58 PM
>=20
> Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com> writes:
>=20
> > This patch adds role switch support for R-Car SoCs into the USB 3.0
> > peripheral driver. Some R-Car SoCs (e.g. R-Car H3) have USB 3.0
> > dual-role device controller which has the USB 3.0 xHCI host and
> > Renesas USB 3.0 peripheral.
> >
> > Unfortunately, the mode change register (DRD_CON) contains
> > the USB 3.0 peripheral controller side only. So, this renesas_usb3
> > driver manages the DRD_CON now. However, in peripheral mode, the host
> > should stop. Also the host hardware needs to reinitialize its own
> > registers when the mode changes from peripheral to host mode.
> > Otherwise, the host cannot work correctly (e.g. detect a device
> > as high-speed).
> >
> > To achieve this reinitialization by a driver, this driver also
> > registers a role switch driver to manage the DRD_CON and get
> > a device pointer of usb 3.0 host from "companion" property of OF.
> > Then, when the usb role is changed, renesas_usb3_role_switch_set()
> > will attach/release the xhci-plat driver to reinitialize the host
> > hardware.
> >
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>=20
> unfortunately doesn't apply:

Oops!
I will rebase this patch and submit a patch as v7 soon.

Best regards,
Yoshihiro Shimoda

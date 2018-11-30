From: Pawel Laszczak <pawell@cadence.com>
Subject: RE: [RFC PATCH v2 07/15] usb:cdns3: Adds Device mode support -
 initialization.
Date: Fri, 30 Nov 2018 06:29:31 +0000
Message-ID: <BYAPR07MB470997B0FBAAE31DABC61A22DDD30@BYAPR07MB4709.namprd07.prod.outlook.com>
References: <1542535751-16079-1-git-send-email-pawell@cadence.com>
 <1542535751-16079-8-git-send-email-pawell@cadence.com>
 <5BFE7D2E.7030702@ti.com> <87pnupzaz1.fsf@linux.intel.com>
 <VI1PR04MB5327227A807B92DDA62CF9038BD30@VI1PR04MB5327.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <VI1PR04MB5327227A807B92DDA62CF9038BD30@VI1PR04MB5327.eurprd04.prod.outlook.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: PETER CHEN <peter.chen@nxp.com>, Felipe Balbi <balbi@kernel.org>, Roger Quadros <rogerq@ti.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alan Douglas <adouglas@cadence.com>, "jbergsagel@ti.com" <jbergsagel@ti.com>, "nsekhar@ti.com" <nsekhar@ti.com>, "nm@ti.com" <nm@ti.com>, Suresh Punnoose <sureshp@cadence.com>, Pawel Jez <pjez@cadence.com>, Rahul Kumar <kurahul@cadence.com>
List-Id: devicetree@vger.kernel.org

Hi,

>> Roger Quadros <rogerq@ti.com> writes:
>> >> +static void cdns3_gadget_config(struct cdns3_device *priv_dev) {
>> >> +	struct cdns3_usb_regs __iomem *regs =3D priv_dev->regs;
>> >> +
>> >> +	cdns3_ep0_config(priv_dev);
>> >> +
>> >> +	/* enable interrupts for endpoint 0 (in and out) */
>> >> +	writel(EP_IEN_EP_OUT0 | EP_IEN_EP_IN0, &regs->ep_ien);
>> >> +
>> >> +	/* enable generic interrupt*/
>> >> +	writel(USB_IEN_INIT, &regs->usb_ien);
>> >> +	writel(USB_CONF_CLK2OFFDS | USB_CONF_L1DS, &regs->usb_conf);
>> >> +	writel(USB_CONF_DMULT, &regs->usb_conf);
>> >> +	writel(USB_CONF_DEVEN, &regs->usb_conf);
>> >
>> > If you are enabling interrupts in this patch you should handle them in=
 the ISR.
>>
>> Frankly, I don't understand why this is a series. It's a single driver a=
nd splitting it into
>> a series just makes it more difficult to review, actually.
>>
>> Sure, a single patch will be large, but there's no way to have a functio=
nal driver until
>> all patches are applied, anyway.
>>
>
>Yes, I agree with Felipe. Pawel, you could remove the "RFC" prefix, and se=
nd the whole
>one as one patch. I will test it at my hardware.

Ok, I will prepare such single patch. =20
Peter I know that you have little different platform.=20
Probably you should made some additional changes for your platform.=20

I assume that core.c should be common file.=20
Probably we should add also some platform specific file.=20

Thanks. =20

Pawel.

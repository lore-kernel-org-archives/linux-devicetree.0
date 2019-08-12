From: Peter Chen <peter.chen@nxp.com>
Subject: RE: [PATCH v9 5/6] usb:cdns3 Add Cadence USB3 DRD Driver
Date: Mon, 12 Aug 2019 01:55:35 +0000
Message-ID: <VI1PR04MB53279117788B7D7CC3080B398BD30@VI1PR04MB5327.eurprd04.prod.outlook.com>
References: <1562324238-16655-1-git-send-email-pawell@cadence.com>
 <1562324238-16655-6-git-send-email-pawell@cadence.com>
 <877e8tm25r.fsf@linux.intel.com>
 <BYAPR07MB4709152CB29B6B027ABEB688DDCF0@BYAPR07MB4709.namprd07.prod.outlook.com>
 <8736idnu0q.fsf@gmail.com>
 <BYAPR07MB4709B0A4FADFB76183D651DCDDD10@BYAPR07MB4709.namprd07.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <BYAPR07MB4709B0A4FADFB76183D651DCDDD10@BYAPR07MB4709.namprd07.prod.outlook.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pawel Laszczak <pawell@cadence.com>, Felipe Balbi <felipe.balbi@linux.intel.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "hdegoede@redhat.com" <hdegoede@redhat.com>, "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "rogerq@ti.com" <rogerq@ti.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "jbergsagel@ti.com" <jbergsagel@ti.com>, "nsekhar@ti.com" <nsekhar@ti.com>, "nm@ti.com" <nm@ti.com>, Suresh Punnoose <sureshp@cadence.com>, Jayshri Dajiram Pawar <jpawar@cadence.com>, Rahul Kumar <kurahul@cadence.com>
List-Id: devicetree@vger.kernel.org

 =20
>=20
> Yes, driver frees not used buffers here.
> I think that it's the safest place for this purpose.
>=20
> >
> >>>> +				dma_free_coherent(priv_dev->sysdev, buf-
> >size,
> >>>> +						  buf->buf,
> >>>> +						  buf->dma);
> >>>> +				spin_lock_irqsave(&priv_dev->lock, flags);
> >>>> +
> >>>> +				kfree(buf);
> >>>
> >>>why do you even need this "garbage collector"?
> >>
> >> I need to free not used memory. The once allocated buffer will be
> >> associated with request, but if request.length will be increased in
> >> usb_request then driver will must allocate the  bigger buffer. As I
> >> remember I couldn't call dma_free_coherent in interrupt context so I
> >> had to move it to thread handled. This flag was used to avoid going th=
rough
> whole  aligned_buf_list  every time.
> >> In most cases this part will never called int this place
> >
> >Did you try, btw, setting the quirk flag which tells gadget drivers to
> >always allocate buffers aligned to MaxPacketSize? Wouldn't that be enoug=
h?
>=20
> If found only  quirk_ep_out_aligned_size flag, but it align only buffer s=
ize.
>=20
> DMA used by this controller must have buffer address aligned to 8.
> I think that on most architecture kmalloc should guarantee such aligned.
> The problem was detected on NXP testing board.
> On my board all buffer address are alignment at least to 8.
>=20
=20
This un-aligned request buffer address for 8 occurs for Ethernet Gadget (eg=
, NCM),
it allocates socket buffer with NET_IP_ALIGN, so the last byte of buffer ad=
dress
is always 2. Although this can be workaround by setting quirk_avoids_skb_re=
serve,
but we are not sure if all gadget request buffers can be 8 or Max Packet Si=
ze aligned.

Peter

From: Chen Peter-B29397 <B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: RE: [PATCH v4] usb: ehci-hcd: notify phy when connect change
Date: Thu, 7 Jun 2012 03:14:04 +0000
Message-ID: <F281D0F91ED19E4D8E63A7504E8A649803BDB9EE@039-SN2MPN1-023.039d.mgd.msft.net>
References: <1338946190-19105-1-git-send-email-richard.zhao@freescale.com>
 <Pine.LNX.4.44L0.1206061017210.1788-100000@iolanthe.rowland.org>
 <F281D0F91ED19E4D8E63A7504E8A649803BDB929@039-SN2MPN1-023.039d.mgd.msft.net>
 <20120607024328.GB5566@b20223-02.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120607024328.GB5566-iWYTGMXpHj9ITqJhDdzsOjpauB2SiJktrE5yTffgRl4@public.gmane.org>
Content-Language: en-US
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zhao Richard-B20223 <B20223-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Li Frank-B20596 <B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "marex-ynQEQJNshbs@public.gmane.org" <marex-ynQEQJNshbs@public.gmane.org>, "shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org" <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Estevam Fabio-R49496 <r49496-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linuxzsc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <linuxzsc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "balbi-l0cyMroinI0@public.gmane.org" <balbi-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> > >
> > > > +			/* FIXME:
> > > > +			 * - it does not work for multi-phy ehci
> > > > +			 * - the best place is after debounce, but I
> can't get
> > > > +			 *   phy there
> > > > +			 */
> > > > +			if (unlikely(ehci->transceiver &&
> > > > +					(pstatus & PORT_CSC))) {
> > >
> > > A new thought...  If you move the transceiver pointer from struct
> > > ehci_hcd to struct usb_hcd, then you _will_ be able to get at it from
> > > within the debouncing routine.
> > >
> > Good suggestion, after that the driver can add PHY operation(quirk or
> not)
> > during the whole usb host life periods.
> Since it makes it more generic, I'm considering:
>  - change variable name from transceiver to phy
>  - Do we need considering phy on hub? I prefer HCD phy only.
>  - Do we need supporting multi-phy for one hcd? I don't know multi-phy
>    case, so I prefer one phy one hcd.
> 
I suggest that you can do it at next patchset.
This patchset is just add phy notify to ehci hcd interrupt handler.
At next patchset, you can refine and improve PHY operation at the whole hcd.

I am not sure Alan's suggestion.

 

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

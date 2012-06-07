From: Chen Peter-B29397 <B29397@freescale.com>
Subject: RE: [PATCH v4] usb: ehci-hcd: notify phy when connect change
Date: Thu, 7 Jun 2012 02:04:00 +0000
Message-ID: <F281D0F91ED19E4D8E63A7504E8A649803BDB929@039-SN2MPN1-023.039d.mgd.msft.net>
References: <1338946190-19105-1-git-send-email-richard.zhao@freescale.com>
 <Pine.LNX.4.44L0.1206061017210.1788-100000@iolanthe.rowland.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <Pine.LNX.4.44L0.1206061017210.1788-100000@iolanthe.rowland.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Alan Stern <stern@rowland.harvard.edu>, Zhao Richard-B20223 <B20223@freescale.com>
Cc: "marex@denx.de" <marex@denx.de>, Li Frank-B20596 <B20596@freescale.com>, "dong.aisheng@linaro.org" <dong.aisheng@linaro.org>, "alexander.shishkin@linux.intel.com" <alexander.shishkin@linux.intel.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "balbi@ti.com" <balbi@ti.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Estevam Fabio-R49496 <r49496@freescale.com>, "shawn.guo@linaro.org" <shawn.guo@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linuxzsc@gmail.com" <linuxzsc@gmail.com>
List-Id: devicetree@vger.kernel.org

 
> 
> > It still has below limitations:
> > - it does not work for multi-phy ehci
> > - the best place is after debounce, but I can't get
> >   phy there
> 
> > +			/* FIXME:
> > +			 * - it does not work for multi-phy ehci
> > +			 * - the best place is after debounce, but I can't get
> > +			 *   phy there
> > +			 */
> > +			if (unlikely(ehci->transceiver &&
> > +					(pstatus & PORT_CSC))) {
> 
> A new thought...  If you move the transceiver pointer from struct
> ehci_hcd to struct usb_hcd, then you _will_ be able to get at it from
> within the debouncing routine.
> 
Good suggestion, after that the driver can add PHY operation(quirk or not)
during the whole usb host life periods.

> Or if you prefer, leave the pointer where it is and add a method to
> struct hc_driver for retrieving the pointer.
> 
> Alan Stern
> 

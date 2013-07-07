From: =?UTF-8?B?QWxleGFuZGVyIFNoaXlhbg==?= <shc_work@mail.ru>
Subject: =?UTF-8?B?UmVbMl06IFtQQVRDSF0gQVJNOiBkdHM6IGlteDI3IHBoeUNBUkQtUyByZW1v?=
 =?UTF-8?B?dmUgd3JvbmcgSTJDIFJUQw==?=
Date: Sun, 07 Jul 2013 14:31:41 +0400
Message-ID: <1373193101.622550139@f60.mail.ru>
References: <1372782469.486055292@f129.mail.ru>
 <1373100718.107651915@f159.i.mail.ru>
 <20130707102207.GI16871@s25.your-server.de>
Reply-To: =?UTF-8?B?QWxleGFuZGVyIFNoaXlhbg==?= <shc_work@mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20130707102207.GI16871@s25.your-server.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: =?UTF-8?B?TWFya3VzIFBhcmdtYW5u?= <mpa@pengutronix.de>
Cc: =?UTF-8?B?RmFiaW8gRXN0ZXZhbQ==?= <fabio.estevam@freescale.com>, devicetree-discuss@lists.ozlabs.org, =?UTF-8?B?U2hhd24gR3Vv?= <shawn.guo@linaro.org>, =?UTF-8?B?U2FzY2hhIEhhdWVy?= <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

> On Sat, Jul 06, 2013 at 12:51:58PM +0400, Alexander Shiyan wrote:
> > > Fixup of commit 7874d595b78e431f0f661d2fe47625649308a52e
> > > "ARM: dts: Add device tree support for phycard pca100".
> > > 
> > > Remove wrong I2C RTC node.
> > > 
> > > Signed-off-by: Markus Pargmann <mpa@pengutronix.de>
> > > ---
> > > 
> > > Thanks, Alexander, you are right. I2C2 has no RTC.
> > ...
> > 
> > There are a couple of comments on this file.
> > 
> > I think that the OWIRE should be moved to the RDK.
> 
> I moved OWIRE and i2c1 to RDK. Both are not used on the SOM.
> 
> > ioexpander must contain "gpio-controller" at least, and for use it further,
> > it is necessary to define the label for this node.
> 
> I checked all I2C devices in the board schematics. There is actually no
> ioexpander. I don't know why it was added. I will send some I2C patches
> later.

Perhaps the chip is mounted on the camera module.
A similar IC is exist on PCM-970 camera addon device.
If so, the device should also be moved to RDK.

---

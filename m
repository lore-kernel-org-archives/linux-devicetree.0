From: Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: imx27 phyCARD-S remove wrong I2C RTC
Date: Sun, 7 Jul 2013 12:44:52 +0200
Message-ID: <20130707104452.GJ16871@s25.your-server.de>
References: <1372782469.486055292@f129.mail.ru>
 <1373100718.107651915@f159.i.mail.ru>
 <20130707102207.GI16871@s25.your-server.de>
 <1373193101.622550139@f60.mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1373193101.622550139-eIdt71DVXYQox3rIn2DAYQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>
Cc: Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, Jul 07, 2013 at 02:31:41PM +0400, Alexander Shiyan wrote:
> > On Sat, Jul 06, 2013 at 12:51:58PM +0400, Alexander Shiyan wrote:
> > > > Fixup of commit 7874d595b78e431f0f661d2fe47625649308a52e
> > > > "ARM: dts: Add device tree support for phycard pca100".
> > > > 
> > > > Remove wrong I2C RTC node.
> > > > 
> > > > Signed-off-by: Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> > > > ---
> > > > 
> > > > Thanks, Alexander, you are right. I2C2 has no RTC.
> > > ...
> > > 
> > > There are a couple of comments on this file.
> > > 
> > > I think that the OWIRE should be moved to the RDK.
> > 
> > I moved OWIRE and i2c1 to RDK. Both are not used on the SOM.
> > 
> > > ioexpander must contain "gpio-controller" at least, and for use it further,
> > > it is necessary to define the label for this node.
> > 
> > I checked all I2C devices in the board schematics. There is actually no
> > ioexpander. I don't know why it was added. I will send some I2C patches
> > later.
> 
> Perhaps the chip is mounted on the camera module.
> A similar IC is exist on PCM-970 camera addon device.
> If so, the device should also be moved to RDK.

Yes that's possible. But in that case I think the ioexpander should be
removed from both dts files because the Phytec phyCARD-S RDK does not
include a camera module.

Regards,

Markus

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

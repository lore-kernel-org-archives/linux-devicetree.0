From: Amitkumar Karwar <akarwar-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Subject: RE: [PATCH v3 1/3] mwifiex: register platform specific driver
Date: Tue, 9 Feb 2016 13:44:16 +0000
Message-ID: <5ef981436ee64f67beef7ca1e2470c69@SC-EXCH04.marvell.com>
References: <1454926528-17480-1-git-send-email-akarwar@marvell.com>
 <8264177.UI5sMC7XWi@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <8264177.UI5sMC7XWi@wuerfel>
Content-Language: en-US
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: "linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Nishant Sarmukadam <nishants-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, "wnhuang-F7+t8E8rja9Wk0Htik3J/w@public.gmane.org" <wnhuang-F7+t8E8rja9Wk0Htik3J/w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Xinming Hu <huxm-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Cathy Luo <cluo-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Arnd,

Thanks for your review.

> From: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org [mailto:linux-wireless-
> owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org] On Behalf Of Arnd Bergmann
> Sent: Monday, February 08, 2016 5:40 PM
> To: Amitkumar Karwar
> Cc: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Nishant Sarmukadam;
> wnhuang-F7+t8E8rja9Wk0Htik3J/w@public.gmane.org; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Xinming Hu
> Subject: Re: [PATCH v3 1/3] mwifiex: register platform specific driver
> 
> On Monday 08 February 2016 02:15:26 Amitkumar Karwar wrote:
> > diff --git a/Documentation/devicetree/bindings/mwifiex.txt
> > b/Documentation/devicetree/bindings/mwifiex.txt
> > new file mode 100644
> > index 0000000..39b6a74
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mwifiex.txt
> > @@ -0,0 +1,29 @@
> > +mwifiex
> > +------
> > +
> > +Required properties:
> > +
> > +  - name : must be "mwifiex"
> 
> This is a very unusual requirement.
> 
> Can you use one of the standard device names instead?
> 

We will make use of marvell-sd8xxx in updated version as per Rob Herring's suggestions.
It includes vendor name and a chipset/device name.


> > +  - compatible : must be "marvell,mwifiex"
> > +
> > +Optional properties:
> > +
> > +  - mwifiex,caldata* : A series of properties with marvell,caldata
> prefix,
> > +                     represent Calibration data downloaded to the
> device during
> > +                     initialization. This is an array of unsigned
> values.
> > +
> > +
> > +Example:
> > +
> > +Tx power limit calibration data is configured in below example.
> > +The calibration data is an array of unsigned values, the length can
> > +vary between hw versions.
> > +
> > +mwifiex {
> > +       compatible = "marvell,mwifiex";
> > +
> > +       mwifiex,caldata_00_txpwrlimit_2g_cfg_set = /bits/ 8 <
> > +0x01 0x00 0x06 0x00 0x08 0x02 0x89 0x01 ...>;
> > +
> > +};
> 
> Should we list the mac-address here as well, or is there always an
> eeprom for that but not the calibration data?

Yes. we do get MAC address along with other info from EEPROM.

Regards,
Amitkumar Karwar
--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

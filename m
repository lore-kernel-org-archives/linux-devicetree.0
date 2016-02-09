From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v3 1/3] mwifiex: register platform specific driver
Date: Tue, 09 Feb 2016 15:18:18 +0100
Message-ID: <6131181.bluDODkWmt@wuerfel>
References: <1454926528-17480-1-git-send-email-akarwar@marvell.com> <8264177.UI5sMC7XWi@wuerfel> <5ef981436ee64f67beef7ca1e2470c69@SC-EXCH04.marvell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5ef981436ee64f67beef7ca1e2470c69-uAViF8V/CPOq90oVIqnETxL4W9x8LtSr@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Amitkumar Karwar <akarwar-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Cc: "linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Nishant Sarmukadam <nishants-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, "wnhuang-F7+t8E8rja9Wk0Htik3J/w@public.gmane.org" <wnhuang-F7+t8E8rja9Wk0Htik3J/w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Xinming Hu <huxm-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Cathy Luo <cluo-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tuesday 09 February 2016 13:44:16 Amitkumar Karwar wrote:
> > > index 0000000..39b6a74
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/mwifiex.txt
> > > @@ -0,0 +1,29 @@
> > > +mwifiex
> > > +------
> > > +
> > > +Required properties:
> > > +
> > > +  - name : must be "mwifiex"
> > 
> > This is a very unusual requirement.
> > 
> > Can you use one of the standard device names instead?
> > 
> 
> We will make use of marvell-sd8xxx in updated version as per Rob Herring's suggestions.
> It includes vendor name and a chipset/device name.

I meant the node name, not the compatible string. This should be something
like "ethernet" or "wlan".

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

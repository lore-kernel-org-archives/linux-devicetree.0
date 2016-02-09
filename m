From: Amitkumar Karwar <akarwar-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Subject: RE: [PATCH v3 1/3] mwifiex: register platform specific driver
Date: Tue, 9 Feb 2016 14:27:07 +0000
Message-ID: <f6882d2b077748eba10617d114da36f2@SC-EXCH04.marvell.com>
References: <1454926528-17480-1-git-send-email-akarwar@marvell.com>
 <8264177.UI5sMC7XWi@wuerfel>
 <5ef981436ee64f67beef7ca1e2470c69@SC-EXCH04.marvell.com>
 <6131181.bluDODkWmt@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <6131181.bluDODkWmt@wuerfel>
Content-Language: en-US
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: "linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Nishant Sarmukadam <nishants-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, "wnhuang-F7+t8E8rja9Wk0Htik3J/w@public.gmane.org" <wnhuang-F7+t8E8rja9Wk0Htik3J/w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Xinming Hu <huxm-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Cathy Luo <cluo-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> From: Arnd Bergmann [mailto:arnd-r2nGTMty4D4@public.gmane.org]
> Sent: Tuesday, February 09, 2016 7:48 PM
> To: Amitkumar Karwar
> Cc: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Nishant Sarmukadam;
> wnhuang-F7+t8E8rja9Wk0Htik3J/w@public.gmane.org; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Xinming Hu; Cathy Luo
> Subject: Re: [PATCH v3 1/3] mwifiex: register platform specific driver
> 
> On Tuesday 09 February 2016 13:44:16 Amitkumar Karwar wrote:
> > > > index 0000000..39b6a74
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/mwifiex.txt
> > > > @@ -0,0 +1,29 @@
> > > > +mwifiex
> > > > +------
> > > > +
> > > > +Required properties:
> > > > +
> > > > +  - name : must be "mwifiex"
> > >
> > > This is a very unusual requirement.
> > >
> > > Can you use one of the standard device names instead?
> > >
> >
> > We will make use of marvell-sd8xxx in updated version as per Rob
> Herring's suggestions.
> > It includes vendor name and a chipset/device name.
> 
> I meant the node name, not the compatible string. This should be
> something like "ethernet" or "wlan".

Thanks for clarification. I will name the node as "wlan"

Regards,
Amitkumar Karwar
--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

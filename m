From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] USB: isp1362: Add devicetree support
Date: Sat, 6 Aug 2011 02:47:10 -0700
Message-ID: <CAJaTeTrCn8ZCDmYYZg01w+FWqGiMMMJP_1KefhqWeicudK=YTw@mail.gmail.com>
References: <1312292961-18309-1-git-send-email-tklauser@distanz.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1312292961-18309-1-git-send-email-tklauser-93Khv+1bN0NyDzI6CaY1VQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tobias Klauser <tklauser-93Khv+1bN0NyDzI6CaY1VQ@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-l3A5Bk7waGM@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Aug 2, 2011 at 06:49, Tobias Klauser wrote:
> @@ -2755,12 +2805,31 @@ static int __devinit isp1362_probe(struct pla=
tform_device *pdev)
> =A0 =A0 =A0 =A0INIT_LIST_HEAD(&isp1362_hcd->periodic);
> =A0 =A0 =A0 =A0INIT_LIST_HEAD(&isp1362_hcd->isoc);
> =A0 =A0 =A0 =A0INIT_LIST_HEAD(&isp1362_hcd->remove_list);
> - =A0 =A0 =A0 isp1362_hcd->board =3D pdev->dev.platform_data;
> +
> + =A0 =A0 =A0 pdata =3D pdev->dev.platform_data;
> +
> + =A0 =A0 =A0 /* If no platform data is available, try to get it from=
 device tree */
> + =A0 =A0 =A0 if (!pdata) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pdata =3D kzalloc(sizeof(struct isp1362=
_platform_data), GFP_KERNEL);

sizeof(*pdata)

the rest of the non-of code looks fine to me.  as for of, i havent
used it before, so i have no feedback on it as long as it's behind
CONFIG_OF (which it is).

Acked-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
-mike
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

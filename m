From: Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 23/23] phy: Add support for Qualcomm's USB HS phy
Date: Thu, 20 Oct 2016 16:20:38 -0700
Message-ID: <147700563857.2550.16732518381302920183@sboyd-linaro>
References: <20161018015636.11701-1-stephen.boyd@linaro.org>
 <20161018015636.11701-24-stephen.boyd@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161018015636.11701-24-stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Peter Chen <peter.chen-3arQi8VN3Tc@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Quoting Stephen Boyd (2016-10-17 18:56:36)
> +
> +static int
> +qcom_usb_hs_phy_vbus_notifier(struct notifier_block *nb, unsigned long e=
vent,
> +                             void *ptr)
> +{
> +       struct qcom_usb_hs_phy *uphy;
> +       int is_host;
> +       u8 addr;
> +
> +       uphy =3D container_of(nb, struct qcom_usb_hs_phy, vbus_notify);
> +       is_host =3D extcon_get_cable_state_(uphy->id_edev, EXTCON_USB_HOS=
T);

Please don't apply this patch. This call now deadlocks on v4.9-rc1
because of how extcon_get_cable_state_() now grabs a lock that is
already held here when we're inside the notifier. It's not really
required that we grab the lock in extcon there, but this has exposed a
flaw in the logic anyway. We don't know if the id pin is going to toggle
before or after this function is called, so we should really keep track
of both vbus and id state in this driver and then do the same ulpi
writes from two different notifiers for both vbus and id pin. We would
be duplicating work sometimes, but that's pretty much the best solution
I can come up with. Otherwise it's racy.

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

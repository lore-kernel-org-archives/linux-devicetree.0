From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v5 0/5] Add ARM Mali Midgard device tree bindings and gpu node for rk3288
Date: Mon, 08 May 2017 18:27:02 +0200
Message-ID: <12996903.t3AZceNVOh@diego>
References: <cover.1493804968.git.guillaume.tucker@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1493804968.git.guillaume.tucker-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guillaume Tucker <guillaume.tucker-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Sjoerd Simons <sjoerd.simons-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, John Reitan <john.reitan-5wv7dgnIgG8@public.gmane.org>, Wookey <wookey-Xpnwy/r4z8dg9hUCZPvPmw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Mittwoch, 3. Mai 2017, 10:56:24 CEST schrieb Guillaume Tucker:
> The ARM Mali Midgard GPU kernel driver is only available
> out-of-tree and is not going to be merged in its current form.
> However, it would be useful to have its device tree bindings
> merged.  In particular, this would enable distributions to create
> working driver packages (dkms...) without having to patch the
> kernel.
> 
> The bindings for the earlier Mali Utgard GPU family have already
> been merged, so this is essentially the same scenario but for
> newer GPUs (Mali-T604 ~ Mali-T880).
> 
> This series of patches first imports the bindings from the latest
> driver release with some clean-up then adds a gpu node for the
> rk3288 SoC.  This was successfully tested on Radxa Rock2 Square,
> Firefly, Veyron Minnie and Jerry boards using Mali kernel driver
> r16p0 and r12p0 user-space binary.

The actual devicetree parts are all Rockchip-specific, so I guess I'll just
pick up the whole series, including the binding doc, after the merge
window if nobody complains before that :-)


Heiko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

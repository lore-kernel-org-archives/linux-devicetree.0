From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] mfd: core: introduce of_node_name for mfd sub devices
Date: Thu, 19 Sep 2013 13:00:51 +0100
Message-ID: <20130919120051.GG22389@lee--X1>
References: <1379579392-1794-1-git-send-email-ldewangan@nvidia.com>
 <20130919083050.GH16984@lee--X1>
 <20130919115501.GM21013@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130919115501.GM21013-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 19 Sep 2013, Mark Brown wrote:

> On Thu, Sep 19, 2013 at 09:30:50AM +0100, Lee Jones wrote:
>=20
> > I'm not entirely sure this is what Mark was saying. I think he was
> > complaining about the existence of the sub-nodes rather than how th=
e
> > MFD Core assigns their of_node. My take is that the chip is really =
a
> > single device which provides different bits of functionality. To br=
eak
> > that functionality up and disperse the drivers into various subsyst=
ems
> > is a Linuxisum. By providing each functional block with its own nod=
e
> > you're describing how we do things in Linux, rather than specifying=
 a
> > single node for the AS3722 which would probably be the norm.
>=20
> Yes, that's exactly what I was thinking of.
>=20
> > Do the sub-nodes have their own properties? If so, it would be wort=
h
> > breaking them up as other OSes could reuse the specifics. If they d=
o,
> > then you need so put them in the binding. If they don't, then you d=
o
> > not require sub-nodes. The MFD core will ensure the sub-devices are
> > probed and there is no requirement for the of_node to be assigned.
>=20
> You do see some reusable IP blocks (like the regualtors on the wm831x
> PMICs for example, they're repeated blocks) which can be reused but
> generally they have a register base as part of the binding.  Personal=
ly
> if it's just a property or two I'd probably just put them on the root
> node for the device.

Agreed. Besides, there doesn't seem to be *any* sub-device properties
defined in the binding document. So what are you trying to achieve
with the child nodes?

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

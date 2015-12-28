From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v1 0/6] misc: add reboot mode driver
Date: Mon, 28 Dec 2015 17:09:03 +0100
Message-ID: <6304362.XcrazqMAeC@wuerfel>
References: <1450774949-23901-1-git-send-email-andy.yan@rock-chips.com>
 <3460735.DIRnhNBgbJ@wuerfel> <3171716.cOpneyGyL8@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <3171716.cOpneyGyL8@diego>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, jun.nie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Monday 28 December 2015 16:56:12 Heiko St=FCbner wrote:
> Am Montag, 28. Dezember 2015, 16:28:55 schrieb Arnd Bergmann:
> > On Wednesday 23 December 2015 17:31:45 Andy Yan wrote:
> > > +        { .compatible =3D "rockchip,reboot-mode-nvram",
> > > +                .data =3D (void *)&reboot-mode-nvram },
> > > +        {},
> > > +};
> > =

> > nvram is a complex topic by itself, because there are so many ways to d=
o it.
> > I think what you are referring to here is a battery-backed memory that =
uses
> > one or more bytes at a fixed offset to store a particular piece of
> > information, as the drivers/char/nvram.c driver does. Maybe we should p=
ut
> > the reboot mode into that driver then?
> > =

> > There are other nvram drivers at various places in the kernel, and each=
 may
> > be slightly different, or completely different, like the EFIVARs driver=
 on
> > UEFI firmware or the key/value store on Open Firmware, these probably n=
eed
> > their own methods and not share the generic driver.
> =

> actually we now have drivers/nvmem/* that does that byte-wise addressing =
for =

> eeproms, efuses, etc in a generic way.

Good point, so some of the reboot-reason users will be able to use that
framework, but some will not:

- drivers/nvmem only works for fixed-length data in a fixed location, but
  not for key/value pairs, TLVs etc.

- Coming back to an earlier problem I pointed out, a lot of the things
  stored in an nvram need a consistent user interface. This includes stuff
  like kernel command line, boot image name, boot device, console
  configuration, network mac address. We probably want the reboot reason
  to fit into the wider framework for these, and drivers/nvmem doesn't
  (currently) look like a good place for that.

	Arnd

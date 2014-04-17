From: Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/4] mfd: bcm590xx: add support for second i2c slave
 address space
Date: Thu, 17 Apr 2014 18:26:16 -0400
Message-ID: <20140417222616.GK23695@beef>
References: <1397501428-8857-1-git-send-email-mporter@linaro.org>
 <1397501428-8857-3-git-send-email-mporter@linaro.org>
 <20140416110603.GA19671@lee--X1>
 <20140416213141.GD12304@sirena.org.uk>
 <20140417065753.GC28725@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140417065753.GC28725@lee--X1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Tim Kryger <tim.kryger-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Markus Mayer <markus.mayer-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux ARM Kernel List <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 17, 2014 at 07:57:53AM +0100, Lee Jones wrote:
> > > s/regmap/Regmap
> >=20
> > It's consistently written regmap in all the documentation and so on=
 :)
>=20
> Furry muff; but the comments still stand for the acronyms.
>=20
> > > addmap{0,1} doesn't quite sit right with me.
> >=20
> > > REVISIT: Ah, it's address-map, rather than add map. Okay, not as =
bad
> > > as I first thought, but still, is there a better naming conventio=
n you
> > > could use?
> >=20
> > addrmap or something?
>=20
> Right, that was what I was thinking. However, I prefer something alon=
g
> the lines of 'i2c' and 'i2c_sec' or 'client' and 'client_slv' etc.

=46WIW, the reason it's addmap{0,1} is that the datasheet has documents
ADDMAP=3D0 and the first bank of registers and ADDMAP=3D1 as the second=
 bank
of registers. I adopted that to match the docs for the part.

I guess we could do i2c and i2c_sec, I'll just have to put a comment
correlating it to the h/w. Calling it 'slv' implies something else
so we should avoid that here. The notion of a "secondary" i2c device
is completely a Linux I2C subsystem fabrication which wouldn't exist
if it allowed multiple slave addresses per device. From a h/w
perspective there is really no primary and secondary relationship.

I'm fine with i2c/i2c_sec or addrmap0/1 and I will just comment to
correlate with the datasheet..pick one.

-Matt
>=20
> --=20
> Lee Jones
> Linaro STMicroelectronics Landing Team Lead
> Linaro.org =E2=94=82 Open source software for ARM SoCs
> Follow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

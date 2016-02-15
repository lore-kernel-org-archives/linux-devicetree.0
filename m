From: Antony Pavlov <antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 05/10] MIPS: dts: qca: ar9132_tl_wr1043nd_v1.dts: drop
 unused alias node
Date: Mon, 15 Feb 2016 12:54:08 +0300
Message-ID: <20160215125408.8aa7386cf9ace5125fbb6579@gmail.com>
References: <1455400697-29898-1-git-send-email-antonynpavlov@gmail.com>
	<1455400697-29898-6-git-send-email-antonynpavlov@gmail.com>
	<56C0851D.5090105@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56C0851D.5090105-ynQEQJNshbs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Alban Bedel <albeu-GANU6spQydw@public.gmane.org>, Wills Wang <wills.wang-EMRzualFZlQ@public.gmane.org>, Daniel Schwierzeck <daniel.schwierzeck-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Daney <ddaney.cavm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, 14 Feb 2016 14:46:05 +0100
Marek Vasut <marex-ynQEQJNshbs@public.gmane.org> wrote:

> On 02/13/2016 10:58 PM, Antony Pavlov wrote:
> > The TP-LINK TL-WR1043ND board has only one serial port,
> > so replacing the default of 0 with 0 does nothing useful.
>=20
> I'd suggest to keep the aliases node, since it can be used by other
> non-Linux systems to access the serial port 0 . This might be useful =
in
> case you add some additional UART chip(s) too.
>=20
> [...]

I have already submitted the patch which keeps the aliases node:

   https://www.linux-mips.org/archives/linux-mips/2016-01/msg00306.html


It was David Daney who proposed to drop unused aliases node:

   https://www.linux-mips.org/archives/linux-mips/2016-01/msg00353.html

--=A0
Best regards,
=A0 Antony Pavlov
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

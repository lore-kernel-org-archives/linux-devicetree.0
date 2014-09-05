From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: MVEBU: Netgear RN102: Use Hardware BCH ECC
Date: Fri, 5 Sep 2014 12:41:40 -0300
Message-ID: <20140905154140.GA1377@arch.hh.imgtec.org>
References: <1409898233-9273-1-git-send-email-klightspeed@killerwolves.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1409898233-9273-1-git-send-email-klightspeed-aslSrjg9ejhWX4hkXwHRhw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: klightspeed-aslSrjg9ejhWX4hkXwHRhw@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

(Fixing Cc list: dropping devicetree guys, and adding Brian and MTD ins=
tead)

On 05 Sep 04:23 PM, klightspeed-aslSrjg9ejhWX4hkXwHRhw@public.gmane.org wrote:
> The bootloader on the Netgear ReadyNAS RN102 uses Hardware BCH ECC
> (strength =3D 4), while the pxa3xx NAND driver by default uses=20
> Hamming ECC (strength =3D 1).
>=20

Hm, I guess the device (Hynix H27U1G8F2BTR) does not support ONFI,
and the kernel is just taking the legacy ECC. The flash specs makes no
mention to ONFI, so probably no ONFI here.

> This patch changes the ECC mode on these machines to match that
> of the bootloader and of the stock firmware, so that for example
> updating the kernel is possible without requiring a serial
> connection.
>=20
> This patch depends on commit 5b3e507 (mtd: nand: pxa3xx: Use ECC
> strength and step size devicetree binding)
>=20
> Signed-off-by: Ben Peddell <klightspeed-aslSrjg9ejhWX4hkXwHRhw@public.gmane.org>

Looks good to me, since Arnaud reports this is the correct ECC scheme:
http://natisbad.org/NAS2/index.html#hw-nand

Acked-by: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Thanks for the fix,
--=20
Ezequiel Garc=EDa, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH v2 0/2] Add macb support for SiFive FU540-C000
Date: Mon, 17 Jun 2019 20:26:14 -0700 (PDT)
Message-ID: <alpine.DEB.2.21.9999.1906172019040.15057@viisi.sifive.com>
References: <1560745167-9866-1-git-send-email-yash.shah@sifive.com>  <mvmtvco62k9.fsf@suse.de>  <alpine.DEB.2.21.9999.1906170252410.19994@viisi.sifive.com>  <mvmpnnc5y49.fsf@suse.de>  <alpine.DEB.2.21.9999.1906170305020.19994@viisi.sifive.com>
 <mvmh88o5xi5.fsf@suse.de>  <alpine.DEB.2.21.9999.1906170419010.19994@viisi.sifive.com>  <F48A4F7F-0B0D-4191-91AD-DC51686D1E78@sifive.com> <d2836a90b92f3522a398d57ab8555d08956a0d1f.camel@wdc.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1540646092-1560828374=:15057"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d2836a90b92f3522a398d57ab8555d08956a0d1f.camel@wdc.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alistair Francis <Alistair.Francis@wdc.com>
Cc: "troy.benjegerdes@sifive.com" <troy.benjegerdes@sifive.com>, "jamez@wit.com" <jamez@wit.com>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "davem@davemloft.net" <davem@davemloft.net>, "schwab@suse.de" <schwab@suse.de>, "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "sachin.ghadi@sifive.com" <sachin.ghadi@sifive.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "ynezz@true.cz" <ynezz@true.cz>, "palmer@sifive.com" <palmer@sifive.com>, "yash.shah@sifive.com" <yash.shah@sifive.com>, "robh+dt@kernel.org" <robh+dt>
List-Id: devicetree@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1540646092-1560828374=:15057
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 17 Jun 2019, Alistair Francis wrote:

> > The legacy M-mode U-boot handles the phy reset already, and I=E2=80=99v=
e been
> > able to load upstream S-mode uboot as a payload via TFTP, and then=20
> > load and boot a 4.19 kernel.=20
> >=20
> > It would be nice to get this all working with 5.x, however there are
> > still
> > several missing pieces to really have it work well.
>=20
> Let me know what is still missing/doesn't work and I can add it. At the
> moment the only known issue I know of is a missing SD card driver in U-
> Boot.

The DT data has changed between the non-upstream data that people=20
developed against previously, vs. the DT data that just went upstream=20
here:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
id=3D72296bde4f4207566872ee355950a59cbc29f852

and

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
id=3Dc35f1b87fc595807ff15d2834d241f9771497205

So Upstream U-Boot is going to need several patches to get things working=
=20
again.  Clock identifiers and Ethernet are two known areas.


- Paul
--8323329-1540646092-1560828374=:15057--

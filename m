From: Michal Nazarewicz <mina86@mina86.com>
Subject: Re: [PATCH v4 3/4] drivers: of: add initialization code for dma
 reserved memory
Date: Tue, 06 Aug 2013 17:07:21 +0200
Message-ID: <xa1ttxj2luxi.fsf@mina86.com>
References: <1375275119-12787-1-git-send-email-m.szyprowski@samsung.com>
 <1375275119-12787-4-git-send-email-m.szyprowski@samsung.com>
 <CAL_JsqK7FNeqbx2DFHou5xeU08L4Stn+NrHUmFjap_A1pEq9JQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-=-="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAL_JsqK7FNeqbx2DFHou5xeU08L4Stn+NrHUmFjap_A1pEq9JQ@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robherring2@gmail.com>, Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, Sascha Hauer <s.hauer@pengutronix.de>, Arnd Bergmann <arnd@arndb.de>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Nishanth Peethambaran <nishanth.p@gmail.com>, linaro-mm-sig@lists.linaro.org, Marc <marc.ceeeee@gmail.com>, Kyungmin Park <kyungmin.park@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Olof Johansson <olof@lixom.net>, Laura Abbott <lauraa@codeaurora.org>, Tomasz Figa <t.figa@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 06 2013, Rob Herring wrote:
>> +static void reserved_mem_release_device_from_dt(struct device *dev)
>> +{
>> +       struct reserved_mem *region =3D get_dma_memory_region(dev);
>> +       if (!region)
>> +               return;
>> +       if (!region->cma)
>
> if (region && !region->cma)

!region case is handled two lines above, so no need to check if region
is not null.

>> +               dma_release_declared_memory(dev);
>> +}

--=20
Best regards,                                         _     _
.o. | Liege of Serenely Enlightened Majesty of      o' \,=3D./ `o
..o | Computer Science,  Micha=C5=82 =E2=80=9Cmina86=E2=80=9D Nazarewicz   =
 (o o)
ooo +----<email/xmpp: mpn@google.com>--------------ooO--(_)--Ooo--
--=-=-=
Content-Type: multipart/signed; boundary="==-=-=";
	micalg=pgp-sha1; protocol="application/pgp-signature"

--==-=-=
Content-Type: text/plain


--==-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJSAREpAAoJECBgQBJQdR/04ZIP+QHzAKxgVm1sNBOGO7x+zZVy
0jR8rumUvXD+0kcoMzV01CayQVssHeLsLOM8LwJs8VPiGi8rvu8UHpjNsuj6VYoq
FCTyWksd5BZ3waSW9trniKUjzqTpVy+gsOSXpvvgAWHJiOtlRI1+rv6UL419v00a
NPOTP1sFMkJio8fLu260ZL3LksLfJ543duF5RLEuwp5PE1VgUoqozcBKMjOHVjS/
vnLvlGYniSSZLJbiAxKfLO45OEfRk+rudIa9OiZAy8e6xoz3oVBTCP1ToSPxssrL
Jkd+//qJ7YVip4SE+5924cgBexCOuVoKypgCwVtpWRT3Mb+wtUh1YfMYkf4A7aOC
RCdvQKyNE3U79VkUEOJ5YEowcCzfu6pLKBoB1WGg4/fOdoZj1Yi+Je5XK/hBNJ2W
ua/DUqxx/2qOSShHDXdukRRTkBD09mADTDnUeaS5iEv2MnzFoZlp7zhALewGUA5V
e2LkoK+NA7BQtan51N3PxENBTzduE8ZvZMYsNnEalqpeSmOxDGAJ9wawifFsXDKe
ACdaktqe6UiN4PDKELQ+050o7XwMyUTU7HF75ouLkHP24n657niHRBOALFdnKHD6
8ywIEQPYwBtQ1dwLWatBryO9rJWR+SkboAKvceAOYIVsOF3pTBJiNOGm4NpJ5Zhe
ocxXVE47urRpASw8TjtA
=x656
-----END PGP SIGNATURE-----
--==-=-=--

--=-=-=
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--=-=-=--

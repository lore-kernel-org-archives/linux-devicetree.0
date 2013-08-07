From: Michal Nazarewicz <mina86@mina86.com>
Subject: Re: [PATCH v4 3/4] drivers: of: add initialization code for dma
 reserved memory
Date: Wed, 07 Aug 2013 14:38:06 +0200
Message-ID: <xa1ta9kt1xsh.fsf@mina86.com>
References: <1375275119-12787-1-git-send-email-m.szyprowski@samsung.com>
 <1375275119-12787-4-git-send-email-m.szyprowski@samsung.com>
 <CAL_JsqK7FNeqbx2DFHou5xeU08L4Stn+NrHUmFjap_A1pEq9JQ@mail.gmail.com>
 <xa1ttxj2luxi.fsf@mina86.com> <5201172F.5050803@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-=-="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <5201172F.5050803@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, Sascha Hauer <s.hauer@pengutronix.de>, Arnd Bergmann <arnd@arndb.de>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Nishanth Peethambaran <nishanth.p@gmail.com>, linaro-mm-sig@lists.linaro.org, Marc <marc.ceeeee@gmail.com>, Kyungmin Park <kyungmin.park@samsung.com>, Olof Johansson <olof@lixom.net>, Laura Abbott <lauraa@codeaurora.org>, Tomasz Figa <t.figa@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 06 2013, Sylwester Nawrocki wrote:
> On 08/06/2013 05:07 PM, Michal Nazarewicz wrote:
>> On Tue, Aug 06 2013, Rob Herring wrote:
>>>> >> +static void reserved_mem_release_device_from_dt(struct device *dev)
>>>> >> +{
>>>> >> +       struct reserved_mem *region =3D get_dma_memory_region(dev);
>>>> >> +       if (!region)
>>>> >> +               return;
>>>> >> +       if (!region->cma)
>>> >
>>> > if (region && !region->cma)
>>
>> !region case is handled two lines above, so no need to check if region
>> is not null.
>
> I think Rob's suggestion was to replace two 'if' statements with a single
> one, which makes sense.

Ah, yes, silly me...

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

iQIcBAEBAgAGBQJSAj+uAAoJECBgQBJQdR/03nwP/iHROUWM+8qvFkR3mowijtO+
BexFNOfL+JEa0UhalpiWBfyLKmR3V3q6SJlzryhRS5eyrW5T1YgwQt3FooWa86S5
nxz6YBM0Abm5I75IWs/83UdFHcnEW/C2lzPEhpKeSqP9UP9L2enAMSj39e0qCDjx
CsTg5F6sXp1KbCkA83ZftwUBE0GCDzLOgZx2kttSKwQHqW4ODfEOYTUiXJGxCOf1
VDtwFYTLdjB/BomUuEUga+O4we0DxDcgZGjAUpzDsxkTLDoPqrkEj6KpE+P7uOYc
YIlg4hzlv54Ya3bAcOOcagRnurJZzVmKva/XGE+bKstRm+v4m4pJrwS46o9Fy8LY
BhYXtnRzckGnnvc516CEAwFrDz+jMBM3AMmE01CO8AXJf3gl3zc/q03fpTWtH5e/
KpdNPYeiQAWoCod2e3jf4qrGSaAV6unzOqQpi/1GJrz9L3B5VvitR3VQjOQIBcM4
tFlMzIM8YMJ2Y/wS5m1XQUlQ2vlkozSGeIbPoKIH1Tplwe88NvIs5h6M2YCUkPaq
rvvaZD02iZI4D1tGxjAvuriqmD+nk2Jgcy+Oy+KFlBtveYvq+uraK4o5umIWIqvn
yCZiowXJqzgFRxN1KlmELZnyYA62w9aiGDXh87NxrjT/p5qJ0QmWdx8P+1mIEBG8
O6BgEMTeCDsR+/FujXRZ
=3vrO
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

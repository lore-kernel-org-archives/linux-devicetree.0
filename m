From: Dave Martin <dave.martin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 0/5] Versatile Express DT support
Date: Wed, 30 Nov 2011 10:48:43 +0000
Message-ID: <20111130104842.GA2045@localhost.localdomain>
References: <1322579473-8804-1-git-send-email-pawel.moll@arm.com>
 <20111129170013.GD2829@localhost.localdomain>
 <1322587019.3164.111.camel@hornet.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="dDRMvlgZJXvWKvBx"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1322587019.3164.111.camel-okZbbLrgpR/YkXV2EHHjLW3o5bpOHsLO@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--dDRMvlgZJXvWKvBx
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 29, 2011 at 05:16:59PM +0000, Pawel Moll wrote:
> On Tue, 2011-11-29 at 17:00 +0000, Dave Martin wrote:
> > I'm trying to build... what tree are you basing on?
>=20
> v3.2-rc3:
>=20
> $ git log --oneline HEAD...v3.2-rc3~
> 3b9df1e ARM: vexpress: DT-based support for CoreTiles Express A5x2 and =
A9x4
> 5a1c565 ARM: vexpress: Initial RS1 memory map support
> 9355e8a ARM: vexpress: Add DT support in v2m
> 0529bd6 ARM: vexpress: Get rid of MMIO_P2V
> 68118cc ARM: versatile: Add missing ENDPROC to headsmp.S
> caca6a0 Linux 3.2-rc3
>=20
> > With v3.2-rc3 or next, I get OF header failures like the following:
> >=20
> > arch/arm/kernel/devtree.c: In function =E2=80=98arm_dt_memblock_reser=
ve=E2=80=99:
> > arch/arm/kernel/devtree.c:41:7: error: =E2=80=98initial_boot_params=E2=
=80=99 undeclared (first use in this function)
> > arch/arm/kernel/devtree.c:41:7: note: each undeclared identifier is r=
eported only once for each function it appears in
> [...]
>=20
> Can you send me your config, please?

Attached.  It's just vexpress_defconfig, plus ARCH_VEXPRESS_V2P_CA5S_CA9=3D=
y

OK, I'll pull that in too.

Cheers
---Dave

--dDRMvlgZJXvWKvBx
Content-Type: application/octet-stream
Content-Disposition: attachment; filename="defconfig.gz"
Content-Transfer-Encoding: base64

H4sIAHcA1k4CA31WS3PbOAy+91d4svfYilM32RkfIIqSWPNVkpLtXjizbbrNbBtnGu+j/34h
2bFIme7FMj4AJN4gUbJklacbTQ0TVDrgy59vfpuQA84VAd5SY5mSHhqnJo8vk6fdfvLysH9z
lLFb2zJNUO0IsNXhzznitVGBIFeVz5vS25qVbpndvuKkMqrRdhAkurHU2dCyxlkvbWjOiYXG
XGLhMeYST7PiEktSN2IdGTlf+YK2nknmTDEYjH6WjDMZxEAdMDogQhUNp3YM+EZyBUWUhryA
MmnZqwG5rdKxUJbUtEAZKNAe+kshUn5I+AiG1L7FCjHUBsZGsCdwv7m9xGxvNAq87aVCt+xa
eyoaDo6m6kro4cBWWM2Z8zdBRIFCzgbyY66U80YJ7+jGLWf/zc45OXoQMIjog7K8+rHb7ZfT
zw//TJ++oCFfXnogm11n14v76/nv0393P/6aHvHJ4/Py89dPz5NPu6eX3beH5X7/EwTMJt8f
vi+zmztxdbK6DFyQVMnQe6IM9UUjNCanhIY7T3npa0wU9lsiHliEQYEBWYV0I9km6LdIlmmv
pR7TvqjJOdhFSodWdkd5btSFTmsXScaaGYqlnXKjoS2OGfST48hBP1y9vJq+/PH4NP262z9/
+/vPU/SECzoKidd0oZJxdsSqwcRIjrNrNRIq2RmADjo0dePOOSAKG5nALOmajREajSJLLOsn
my9/NSNscabE1ZpjOHiq6xxE4kh7LXS6LgajTr1jyX2WbcIj1hxkQp1J3WDptXhGdCHuA9X9
amVcqjt7PogcViKIKqcVkK3Xbov13Uic6otQA3iv4jWfZVlg7piFytKqflieLKrX3oAslEhW
XL0WKuVemQ/XlDkOJkE4CZJaGhAUl1CJxThcOiwoFa/DSnkswWaDs1qmeyKQaSvIFqnYYWQC
E+yIwELboDUqnLYdrIk4gkOWEC4Ma9MTo+OiwwAkyFDNOhWolDTM0hivtgYc68dUgLo1kzWM
QOlMuOE7SIN0NTVchZuwZ1B8VmzlJkYtCNvI0RlWye0IaaTmjR0ZaiiVYBmMZAVOhvdqe67g
lLaUjuxytWmsE2AdNTHnIzUqPqSxeUR4kBLTSCj23zo1FTqZA+wJh/QoRBERRrsDmNXZu8XM
12GVdgzrFKYtfD8IEhFdrvET5No4crg8hgrTdm02DzoQB+ANjq8ImB+Ak0c9dNxVFiPqMdHU
0CLZBkd9vwHnTML3tgQXXeiEDsn3ZWljiwh2akhLPH1Mt/PA027py0iC4xNEFVRjGP3t/F3M
YVbd3b2990FUBFSMdA9c82EACxwXVXTzAVlRIykPUUcJLjqsce/AruLpf3iUoV4iNofzmCzV
+I7u/TrGeHAnBcNx+hpcatF9xGw1JgwkLh2ijUw/Fo9S9Trk/g/ZD7qhIgwAAA==

--dDRMvlgZJXvWKvBx
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--dDRMvlgZJXvWKvBx--

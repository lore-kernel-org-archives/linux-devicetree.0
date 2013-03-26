From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 2/3] mfd: db8500-prcmu: Fetch the PRCMU TCDM base address
 from Device Tree
Date: Tue, 26 Mar 2013 10:19:44 +0000
Message-ID: <20130326101944.GA15177@gmail.com>
References: <1364223758-17621-1-git-send-email-lee.jones@linaro.org>
 <CACRpkdZxU197moM_00UQr-tHdip4b50c+CfYkR5OK+MbwsE-aw@mail.gmail.com>
 <20130326094848.GA14151@gmail.com>
 <201303261000.33615.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <201303261000.33615.arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linus.walleij@stericsson.com
List-Id: devicetree@vger.kernel.org

On Tue, 26 Mar 2013, Arnd Bergmann wrote:

> On Tuesday 26 March 2013, Lee Jones wrote:
> > Bit for information for you.=20
> >=20
> > I have confirmed that the address locations are the same for
> > all SoCs are the same. However, the size of the TCDM changes from 4=
k
> > on the db8500 to 12k on the db8540.
> >=20
> > Is there a way we can increase the size for the db8540 without
> > creating an entire new DTS file? Seems overkill.
>=20
> You can always override a property by setting it again, like
>=20
> 	soc {
> 		prcmu: db8500-prcmu@abcd0000 {
> 			reg =3D <0xabcd0000 0x1000>;
> 		};
> 	};
>=20
> ...
>=20
>=20
> 	&prcmu {
> 		reg =3D <0xabcd0000 0x3000>;
> 	}

Perfect, thanks.

--=20
Lee Jones
Linaro ST-Ericsson Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog

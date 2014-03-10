From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 4/5] ARM: dts: Add STiH407 SoC support
Date: Mon, 10 Mar 2014 16:16:11 +0000
Message-ID: <20140310161611.GF13661@lee--X1>
References: <1394203251-25361-1-git-send-email-maxime.coquelin@st.com>
 <1394203251-25361-5-git-send-email-maxime.coquelin@st.com>
 <20140310122830.GT14976@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140310122830.GT14976@lee--X1>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime COQUELIN <maxime.coquelin@st.com>
Cc: Rob Landley <rob@landley.net>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Srinivas Kandagatla <srinivas.kandagatla@st.com>, Stuart Menefy <stuart.menefy@st.com>, Linus Walleij <linus.walleij@linaro.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@stlinux.com
List-Id: devicetree@vger.kernel.org

> > +		CLK_EXT2F_A9: clockgenC0@13 {
>=20
> s/@/@0x

<snip>

> > +			PIO0: gpio@09610000 {
>=20
> s/@/@0x
>=20
> I won't mention this particular point again, but it needs to be
> propagated throughout the patch.

Whoops, I'm actually completely wrong on this point! There is to be
_no_ 0x prefix prior to the address, as per the following commits:=20

`git log --author=3D"Lee Jones" --grep=3D"0x" mainline/master -- arch/a=
rm/boot/dts/`

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog

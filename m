From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 0/4] Add reset controllers for STiH407 SoC
Date: Thu, 3 Jul 2014 10:33:48 +0100
Message-ID: <20140703093348.GA32208@lee--X1>
References: <1404310129-14667-1-git-send-email-peter.griffin@linaro.org>
 <1404317194.4109.13.camel@paszta.hi.pengutronix.de>
 <20140702165924.GB17665@lee--X1>
 <53B50EFD.2070007@st.com>
 <1404379248.18039.31.camel@paszta.hi.pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1404379248.18039.31.camel@paszta.hi.pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Maxime Coquelin <maxime.coquelin@st.com>, Peter Griffin <peter.griffin@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, srinivas.kandagatla@gmail.com, patrice.chotard@st.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, 03 Jul 2014, Philipp Zabel wrote:

> Hi,
>=20
> Am Donnerstag, den 03.07.2014, 10:06 +0200 schrieb Maxime Coquelin:
> > I will queue patch 4 to STi DT branch for v3.17.
> > For now, no nodes uses reset for STiH407, so we don't need the=20
> > dt-bindings header file in the STi tree.
> >=20
> > If we have a DT node using a reset line before my pull-request, I m=
ight=20
> > have to integrate the series in the STi DT branch.
> > Philipp, does that sound reasonable?
>=20
> Patch 4 depends on patch 1 for the header. My tree is still empty, ho=
w
> about I take the first two, and you merge that branch and then take 3
> and 4 on top?
>=20
>     git://git.pengutronix.de/git/pza/linux.git reset/for_v3.17
>=20
> Lee, shall I also add your Ack to the documentation patch?

I don't think there's anything to contentious in there:

  Acked-by: Lee Jones <lee.jones@linaro.org>

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog

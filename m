From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 4/6] ARM: DT: STi: STiH407: Add dwc3 usb3 DT node.
Date: Wed, 25 Feb 2015 15:50:05 +0000
Message-ID: <20150225155005.GE6688@x1>
References: <1424871377-1795-1-git-send-email-peter.griffin@linaro.org>
 <1424871377-1795-5-git-send-email-peter.griffin@linaro.org>
 <20150225151229.GE5132@x1>
 <20150225152201.GA14329@griffinp-ThinkPad-X1-Carbon-2nd>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150225152201.GA14329@griffinp-ThinkPad-X1-Carbon-2nd>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Griffin <peter.griffin@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, srinivas.kandagatla@gmail.com, maxime.coquelin@st.com, patrice.chotard@st.com, kishon@ti.com, balbi@ti.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, 25 Feb 2015, Peter Griffin wrote:

> Hi Lee,
>=20
> On Wed, 25 Feb 2015, Lee Jones wrote:
>=20
> > > +			resets		=3D <&powerdown STIH407_USB3_POWERDOWN>,
> > > +					  <&softreset STIH407_MIPHY2_SOFTRESET>;
> > > +			reset-names	=3D "powerdown",
> > > +					  "softreset";
> >=20
> > Nit: What's the purpose of having these on separate lines?
>=20
> The only reason was to stay aligned with the example in
> Documentation/devicetree/bindings/usb/dwc3-st.txt.

But didn't you author that too? :)

I would change them both.  No need to force a line wrap if it's not req=
uired.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog

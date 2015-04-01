From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 1/6] phy: miphy365x: Use the generic phy type
 constants in dt-bindings/phy/phy.h
Date: Wed, 1 Apr 2015 08:15:01 +0100
Message-ID: <20150401071501.GS9447@x1>
References: <1427728632-10846-1-git-send-email-peter.griffin@linaro.org>
 <1427728632-10846-2-git-send-email-peter.griffin@linaro.org>
 <551A2D4D.1010601@ti.com>
 <20150331074027.GH9447@x1>
 <551ABD99.2000503@ti.com>
 <551AC37E.70503@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <551AC37E.70503@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Coquelin <maxime.coquelin@st.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Peter Griffin <peter.griffin@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, srinivas.kandagatla@gmail.com, patrice.chotard@st.com, balbi@ti.com, devicetree@vger.kernel.org, robherring2@gmail.com
List-Id: devicetree@vger.kernel.org

On Tue, 31 Mar 2015, Maxime Coquelin wrote:

> Hi Kishon,
> On 03/31/2015 05:30 PM, Kishon Vijay Abraham I wrote:
> >Maxime,
> >
> >On Tuesday 31 March 2015 01:10 PM, Lee Jones wrote:
> >>On Tue, 31 Mar 2015, Kishon Vijay Abraham I wrote:
> >>
> >>>Hi Patrice, Maxime,
> >>>
> >>>On Monday 30 March 2015 08:47 PM, Peter Griffin wrote:
> >>>>Now there are generic phy type constants declared in phy.h,
> >>>>migrate over to
> >>>>using them rather than defining our own. This change has
> >>>>been done as one
> >>>>atomic commit to be bisectable.
> >>>>
> >>>>Note: The values of the defines are the same, so there is no
> >>>>ABI breakage
> >>>>with this patch.
> >>>>
> >>>>Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> >>>>Acked-by: Rob Herring <robh@kernel.org>
> >>>>Acked-by: Lee Jones <lee.jones@linaro.org>
> >>>
> >>>Are you okay for this patch to go via PHY tree? It modifies
> >>>arch/arm/boot/dts
> >>>/stih416.dtsi.
> >>
> >>These files need to be changed simultaneously in order to prevent
> >>breakage during bisection and the like.  I think the best bet movin=
g
> >>forward is to pull this into its own branch, tag it and send Maxime=
 a
> >>pull-request to the immutable branch.  It's the best way to minimis=
e
> >>merge conflicts during the v4.1 merge window.
> >
> >okay. I still need an Ack from Maxime.
>=20
> You have my Ack.
>=20
> I haven't sent a pull request for STi DT files for v4.1 now, and it
> is too late to send one.
> So creating an immutable tag is not even needed in my opinion, you
> can just take the DT patch.

Kishon,

I saw that you took the MAINTAINERS patch, but not this one.  If it's
because you are still unsure about it, I agree with Maxime, you can
just take this patch without fear of conflict.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog

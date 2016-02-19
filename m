From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v3 5/6] dts: ipq4019: Add support for IPQ4019 DK01 board
Date: Thu, 18 Feb 2016 18:43:50 -0800
Message-ID: <20160219024350.GQ4847@codeaurora.org>
References: <1447975173-29485-1-git-send-email-mmcclint@qca.qualcomm.com>
 <1447975173-29485-6-git-send-email-mmcclint@qca.qualcomm.com>
 <20160208224328.GB10791@codeaurora.org>
 <59152C1B-683F-417D-9C23-C6E3F53D7096@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <59152C1B-683F-417D-9C23-C6E3F53D7096-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthew McClintock <mmcclint-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Matthew McClintock <mmcclint-A+ZNKFmMK5xy9aJCnZT0Uw@public.gmane.org>, Andy Gross <agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, qca-upstream.external-A+ZNKFmMK5xy9aJCnZT0Uw@public.gmane.org, Senthilkumar N L <snlakshm-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Varadarajan Narayanan <varada-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 02/16, Matthew McClintock wrote:
> On Feb 8, 2016, at 4:43 PM, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote=
:
> >=20
> > On 11/19, Matthew McClintock wrote:
> >> +
> >> +/ {
> >> +	model =3D "Qualcomm Technologies, Inc. IPQ4019/AP-DK01.1";
> >> +	compatible =3D "qcom,ipq4019";
> >> +
> >> +	clocks {
> >> +                xo: xo {
> >> +                        compatible =3D "fixed-clock";
> >> +                        clock-frequency =3D <48000000>;
> >> +                        #clock-cells =3D <0>;
> >> +                };
> >> +	};
> >=20
> > Is there a reason the xo is here and the sleep clk is in the SoC
> > dtsi file? Both are board clocks so I would think they would be
> > added in the same place.
>=20
> I=E2=80=99m a little bit confused and I wanted to confirm. I can see =
the xo clock is on the board itself. However, the sleep_clk is not, can=
 you clarify why they would both be in the same place?
>=20

The sleep clk is typically a pin on the SoC package. Look at your
schematic. Same goes for the XO.

--=20
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

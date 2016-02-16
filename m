From: Matthew McClintock <mmcclint@codeaurora.org>
Subject: Re: [PATCH v3 5/6] dts: ipq4019: Add support for IPQ4019 DK01 board
Date: Tue, 16 Feb 2016 14:43:18 -0600
Message-ID: <59152C1B-683F-417D-9C23-C6E3F53D7096@codeaurora.org>
References: <1447975173-29485-1-git-send-email-mmcclint@qca.qualcomm.com> <1447975173-29485-6-git-send-email-mmcclint@qca.qualcomm.com> <20160208224328.GB10791@codeaurora.org>
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20160208224328.GB10791@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Matthew McClintock <mmcclint@qca.qualcomm.com>, Andy Gross <agross@codeaurora.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, qca-upstream.external@qca.qualcomm.com, Senthilkumar N L <snlakshm@codeaurora.org>, Varadarajan Narayanan <varada@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Feb 8, 2016, at 4:43 PM, Stephen Boyd <sboyd@codeaurora.org> wrote:
>=20
> On 11/19, Matthew McClintock wrote:
>> +
>> +/ {
>> +	model =3D "Qualcomm Technologies, Inc. IPQ4019/AP-DK01.1";
>> +	compatible =3D "qcom,ipq4019";
>> +
>> +	clocks {
>> +                xo: xo {
>> +                        compatible =3D "fixed-clock";
>> +                        clock-frequency =3D <48000000>;
>> +                        #clock-cells =3D <0>;
>> +                };
>> +	};
>=20
> Is there a reason the xo is here and the sleep clk is in the SoC
> dtsi file? Both are board clocks so I would think they would be
> added in the same place.

I=E2=80=99m a little bit confused and I wanted to confirm. I can see th=
e xo clock is on the board itself. However, the sleep_clk is not, can y=
ou clarify why they would both be in the same place?

-M--
To unsubscribe from this list: send the line "unsubscribe linux-arm-msm=
" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

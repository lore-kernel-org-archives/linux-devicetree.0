From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2] arm64: dts: rockchip: Add dts for Leez RK3399 P710 SBC
Date: Thu, 8 Aug 2019 08:24:12 -0600
Message-ID: <CAL_Jsq+1KVVube322GZXetVWdthrtWG=QiOTSnUg5aLbXjBuWg@mail.gmail.com>
References: <20190805124037.10597-1-andyshrk@gmail.com> <CAL_JsqJ6_J1pR-MYK5kmUN5Q+tX32UNFqLW81tmBf=pYxtAmjg@mail.gmail.com>
 <CANbgqATvVSo_D-n_mW2hK2KEK_8cs3374ddB6C8GcZZwjMSoRQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CANbgqATvVSo_D-n_mW2hK2KEK_8cs3374ddB6C8GcZZwjMSoRQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Yan <andyshrk@gmail.com>
Cc: "heiko@sntech.de" <heiko@sntech.de>, devicetree@vger.kernel.org, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 7, 2019 at 12:14 AM Andy Yan <andyshrk@gmail.com> wrote:
>
> Hi Rob:
>
> Rob Herring <robh+dt@kernel.org> =E4=BA=8E2019=E5=B9=B48=E6=9C=886=E6=97=
=A5=E5=91=A8=E4=BA=8C =E4=B8=8B=E5=8D=8810:48=E5=86=99=E9=81=93=EF=BC=9A
>>
>> On Mon, Aug 5, 2019 at 6:40 AM Andy Yan <andyshrk@gmail.com> wrote:
>> >
>> > P710 is a RK3399 based SBC, designed by Leez [0].
>> >
>> > Specification
>> > - Rockchip RK3399
>> > - 4/2GB LPDDR4
>> > - TF sd scard slot
>> > - eMMC
>> > - M.2 B-Key for 4G LTE
>> > - AP6256 for WiFi + BT
>> > - Gigabit ethernet
>> > - HDMI out
>> > - 40 pin header
>> > - USB 2.0 x 2
>> > - USB 3.0 x 1
>> > - USB 3.0 Type-C x 1
>> > - TYPE-C Power supply
>> >
>> > [0]https://leez.lenovo.com
>>
>> I'm not really convinced Leez is a vendor. Looks like branding to me.
>> We have enough with company names changing, we don't need changing
>> brands too. Use 'lenovo'.
>>
>
> I had checked with Leez people before V1, they said Leez will run as an i=
ndependent company, so they don't want to
> give a lenovo label for this board.

Okay.

Reviewed-by: Rob Herring <robh@kernel.org>

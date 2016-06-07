From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH v3 1/2] Documentation: bindings: add DT documentation for Rockchip USB2PHY
Date: Tue, 07 Jun 2016 09:59:46 +0200
Message-ID: <15428827.HfoQlKAJKr@diego>
References: <1465204804-31161-1-git-send-email-frank.wang@rock-chips.com> <2b3e9b0b-f17e-063b-6eb0-2390bd87901b@rock-chips.com> <9a34e448-2b4d-4797-2e6b-c7a36c03b597@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <9a34e448-2b4d-4797-2e6b-c7a36c03b597@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Wang <frank.wang@rock-chips.com>
Cc: Mark Rutland <mark.rutland@arm.com>, dianders@chromium.org, linux@roeck-us.net, groeck@chromium.org, jwerner@chromium.org, kishon@ti.com, robh+dt@kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-rockchip@lists.infradead.org, xzy.xu@rock-chips.com, kever.yang@rock-chips.com, huangtao@rock-chips.com, william.wu@rock-chips.com
List-Id: devicetree@vger.kernel.org

Hi Frank,

Am Dienstag, 7. Juni 2016, 11:31:59 schrieb Frank Wang:
> On 2016/6/7 10:59, Frank Wang wrote:
> > On 2016/6/6 20:33, Heiko St=FCbner wrote:
> >> Am Montag, 6. Juni 2016, 12:27:54 schrieb Mark Rutland:
> >>> On Mon, Jun 06, 2016 at 05:20:03PM +0800, Frank Wang wrote:
> >>>> Signed-off-by: Frank Wang <frank.wang@rock-chips.com>
> >>>> ---
> >>>>=20
> >>>> Changes in v3:
> >>>>   - Added 'clocks' and 'clock-names' optional properties.
> >>>>   - Specified 'otg-port' and 'host-port' as the sub-node name.
> >>>>=20
> >>>> Changes in v2:
> >>>>   - Changed vbus_host optional property from gpio to regulator.
> >>>>   - Specified vbus_otg-supply optional property.
> >>>>   - Specified otg_id and otg_bvalid property.
> >>>>  =20
> >>>>     .../bindings/phy/phy-rockchip-inno-usb2.txt        | 60
> >>>>  =20
> >>>>   ++++++++++++++++++++ 1 file changed, 60 insertions(+)
> >>>>   create mode 100644
> >>>>=20
> >>>> Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.txt=
>
> >>>> diff --git
> >>>> a/Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.t=
xt
> >>>> b/Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.t=
xt new
> >>>> file mode 100644
> >>>> index 0000000..0b4bbbb
> >>>> --- /dev/null
> >>>> +++ b/Documentation/devicetree/bindings/phy/phy-rockchip-inno-us=
b2.txt
> >>>> @@ -0,0 +1,60 @@
> >>>> +ROCKCHIP USB2.0 PHY WITH INNO IP BLOCK
> >>>> +
> >>>> +Required properties (phy (parent) node):
> >>>> + - compatible : should be one of the listed compatibles:
> >>>> +    * "rockchip,rk3366-usb2phy"
> >>>> +    * "rockchip,rk3399-usb2phy"
> >>>> + - #clock-cells : should be 0.
> >>>> + - clock-output-names : specify the 480m output clock name.
> >>>> +
> >>>> +Optional properties:
> >>>> + - clocks : phandle + phy specifier pair, for the input clock o=
f phy.
> >>>> + - clock-names : input clock name of phy, must be "phyclk".
> >>>> + - vbus_host-supply : phandle to a regulator that supplies host=
 vbus.
> >>>> + - vbus_otg-supply : phandle to a regulator that supplies otg v=
bus.
> >>>=20
> >>> Nit: s/_/-/ here.
> >>=20
> >> Something I only stumbled over yesterday for the first time on my
> >> rk3288-
> >> popmetal: The phy subnodes seem to be able to use a generic phy-su=
pply
> >> property from inside the phy-core itself, see:
> >>=20
> >> https://github.com/mmind/linux-rockchip/commit/93739f521fc65f44524=
b00c9aa
> >> f6db46bca94e02#diff-ddf3e45ebb753d6debf57022003a1a57R597
> >>=20
> >>=20
> >> for my WIP code for that other board.
> >=20
> > Ah, good comments! I will try later, if it is practicable, I shall
> > correct it into the next patches (patch v4).
>=20
> I am sorry to tell you that seems unworkable, because we have two
> sub-nodes (phy-ports) in one parent-node (phy),
> what is more, the 'phy-supply' property can only put into parent-node=
, I
> believe it can not be differentiated types of ports.
> I mean vbus for host and otg are separately.

I would disagree ;-)

If you look in phy-core.c phy_create(), you can see that the struct phy=
 that
gets created, contains its own struct device instance, which then gets =
the
phys of_node (the host+otg subnodes in this context) attached to it.

The regulator_get_optional then runs on this struct device, thus making=
 lookup
on the subnode. And that works just nicely on my rk3288-popmetal, with =
its 3
phy subnodes and debugfs/regulator/regulator_summary prints that nicely=
:

 vcc_sys                          0   12      0  5000mV     0mA  5000mV=
  5000mV=20
    vcc_host_5v                   1    1      0  5000mV     0mA  5000mV=
  5000mV=20
       phy-phy.2                                                    0mV=
     0mV
    vcc_otg_5v                    1    1      0  5000mV     0mA  5000mV=
  5000mV=20
       phy-phy.0                                                    0mV=
     0mV
    vcc_sata_5v                   2    1      0  5000mV     0mA  5000mV=
  5000mV=20
       phy-phy.1                                                    0mV=
     0mV


Heiko

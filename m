From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v6 02/13] dt-bindings: misc: Add bindings for HiSilicon
 usb hub and data role switch functionality on HiKey960
Date: Wed, 1 May 2019 11:27:01 -0500
Message-ID: <CAL_Jsq+Xf===cii0me0pwjZ2mcxXmYXDjNH7UpOftUphHCxd1w@mail.gmail.com>
References: <20190420064019.57522-1-chenyu56@huawei.com> <20190420064019.57522-3-chenyu56@huawei.com>
 <20190425213532.GA32028@bogus> <f925304a-17ef-1574-b671-77d4ad0331d8@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <f925304a-17ef-1574-b671-77d4ad0331d8@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chen Yu <chenyu56@huawei.com>
Cc: liuyu712@hisilicon.com, Linux USB List <linux-usb@vger.kernel.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, John Stultz <john.stultz@linaro.org>, Suzhuangluan <suzhuangluan@hisilicon.com>, kongfei@hisilicon.com, wanghu17@hisilicon.com, butao@hisilicon.com, chenyao11@huawei.com, fangshengzhou@hisilicon.com, Li Pengcheng <lipengcheng8@huawei.com>, Song Xiaowei <songxiaowei@hisilicon.com>, Yiping Xu <xuyiping@hisilicon.com>, xuyoujun4@huawei.com, yudongbin@hisilicon.com, zangleigang <zangleigang@hisilicon.com>, Kishon Vijay Abraham I <kishon@ti.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Mark Rutland <mark.rutland@arm.com>, Binghui Wang <wangbinghui@hisilicon.com>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 30, 2019 at 1:08 AM Chen Yu <chenyu56@huawei.com> wrote:
>
> Hi Rob,
>
> On 2019/4/26 5:35, Rob Herring wrote:
> > On Sat, Apr 20, 2019 at 02:40:08PM +0800, Yu Chen wrote:
> >> This patch adds binding documentation to support usb hub and usb
> >> data role switch of Hisilicon HiKey960 Board.
> >
> > Sorry I've been slow to really review this, but I needed to look at the
> > schematics to see what exactly is going on here.
> >
> > I think this needs some changes to better reflect the h/w and utilize
> > existing bindings. It should really be designed ignoring the muxing to
> > start with. Define the binding for the TypeC connector and then the host
> > hub and make sure they can coexist. Then overlay what you need to switch
> > between the 2 modes which AFAICT is just a single GPIO.
> >
> >>
> >> Cc: Kishon Vijay Abraham I <kishon@ti.com>
> >> Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> >> Cc: Rob Herring <robh+dt@kernel.org>
> >> Cc: Mark Rutland <mark.rutland@arm.com>
> >> Cc: John Stultz <john.stultz@linaro.org>
> >> Cc: Binghui Wang <wangbinghui@hisilicon.com>
> >> Signed-off-by: Yu Chen <chenyu56@huawei.com>
> >> ---
> >> v1:
> >> * Fix some format errors as suggested by Sergei.
> >> * Modify gpio description to use gpiod API.
> >> v2:
> >> * Remove information about Hikey.
> >> * Fix gpio description.
> >> * Remove device_type of endpoint.
> >> v3:
> >> * Remove property typec-vbus-enable-val.
> >> * Add description of pinctrl-names.
> >> * Add example for "hisilicon,gpio-hubv1"
> >> * Add flag in gpiod properties.
> >> ---
> >> ---
> >>  .../bindings/misc/hisilicon-hikey-usb.txt          | 52 ++++++++++++++++++++++
> >>  1 file changed, 52 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/misc/hisilicon-hikey-usb.txt
> >>
> >> diff --git a/Documentation/devicetree/bindings/misc/hisilicon-hikey-usb.txt b/Documentation/devicetree/bindings/misc/hisilicon-hikey-usb.txt
> >> new file mode 100644
> >> index 000000000000..422e844df719
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/misc/hisilicon-hikey-usb.txt
> >> @@ -0,0 +1,52 @@
> >> +Support usb hub and usb data role switch of Hisilicon HiKey960 Board.
> >> +
> >> +-----------------------------
> >> +
> >> +Required properties:
> >> +- compatible: "hisilicon,gpio-hubv1","hisilicon,hikey960-usb"
> >> +- typec-vbus-gpios: gpio to control the vbus of typeC port
> >
> > This should be a gpio regulator and then connected to 'vbus-supply' in a
> > usb-connector node (see .../bindings/connectors/usb-connector.txt).
> Currently usb-connector node has no "vbus-supply" property and
> I do not find process that handles vbus-supply in RT1711H TypeC driver.

The patch[1] adding that is posted to the list and may not have landed yet.

Whether the RT1711H TypeC driver handles it or not is not a binding problem.

> > Then you also need the RT1711HWSC TypeC controller in DT. That is
> > typically the parent device of the connector node.
> >
> >> +- otg-switch-gpios: gpio to switch DP & DM between the hub and typeC port
> >
> > This probably belongs in USB controller node.
> >
> The otg-switch-gpios controls a mux like fsusb30mux. It is related to
> the board design of HiKey960. And the state of the mux is decided by
> the typeC port state. So I think it is not so good to make it belongs
> in USB controller node.

Let me put it this way. The gpio property belongs wherever the mux is
represented. In this case, I would expect the graph port representing
the HS port to have 2 endpoints representing the 2 mux outputs. We
don't generally put properties in the endpoint or port nodes, but the
parent nodes.

> >> +- hub-vdd33-en-gpios: gpio to enable the power of hub
> >
> > This too should be a gpio regulator and then in a hub node. We have 2
> > ways to represent hubs. Either as an I2C device or as a child of the
> > host controller. The latter is preferred, but I'm not too sure how the
> > OF graph connection linking the controller to the TypeC connector will
> > work with the usb bus binding.
> >
> There is no particular code except the power control for the hub.
> The i2c on the hub is not used. So it can not be an I2C device.
> Is there such an example that make the hub as a child of the host controller
> and control its power?

Yes, bindings/usb/usb-device.txt.

Rob

[1] https://www.spinics.net/lists/kernel/msg3089136.html

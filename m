From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH v4] extcon: gpio: Add the support for Device tree bindings
Date: Wed, 1 Jun 2016 20:19:39 +0530
Message-ID: <574EF603.2020408@nvidia.com>
References: <1464263265-20187-1-git-send-email-vreddytalla@nvidia.com> <CGME20160527152945epcas1p4de3d2d43f94a20e3f93676b6c4f78244@epcas1p4.samsung.com> <20160527152934.GB12024@rob-hp-laptop> <574D32D7.2090902@samsung.com> <574D3EA7.9080907@samsung.com> <CAL_JsqLpWMX3X77xyVH=5+AtEaRiY9ShkEo0TdHOphqE654OXg@mail.gmail.com> <574D9556.9080200@nvidia.com> <CAL_JsqJ+WBRj0DTREezp1JaanS2EQqSfefQGyPO4BGFVcwqwnw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqJ+WBRj0DTREezp1JaanS2EQqSfefQGyPO4BGFVcwqwnw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, Venkat Reddy Talla <vreddytalla@nvidia.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kumar Gala <galak@codeaurora.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


On Tuesday 31 May 2016 09:18 PM, Rob Herring wrote:
> On Tue, May 31, 2016 at 8:44 AM, Laxman Dewangan <ldewangan@nvidia.com> wrote:
>> Hi Rob,
>>
>> On Tuesday 31 May 2016 07:05 PM, Rob Herring wrote:
>>> On Tue, May 31, 2016 at 2:35 AM, Chanwoo Choi <cw00.choi@samsung.com>
>>> wrote:
>>>> The extcon-gpio.c driver can separate the kind of external connector
>>>> by using the 'extcon-id' property.
>>> This use of DT is just broken. Come up with another way.
>>>
>>>
>>
>> Can we have the DT binding very similar to IIO, clock, reset etc?
> In what way? I'm guessing you mean to describe what controller a
> connector is associated with. Certainly, some sort of phandle
> reference will be needed. However. the node it points to is what needs
> a lot of work first.

Here, we just need to define that controller support how many different 
cable? It does not say anything that which cable is what and all its on 
platform dependent.

So for gpio-extcon, it will just say 1 cable. the name is not decided by 
driver but it is by platform.


>> Here is details for extcon-jack DT binding and its client:
>>
>> The client can get the cable information through its node or extcon name
>> and once cable information is available, it can register for notification
>> when state gets changed.
>>
>> The typical dt nodes are:
>>
>>      Extcon-driver node:
>>
>>          extcon: arizona-extcon {
>>                  compatible = "wlf,arizona-extcon";
>>                  #extcon-cells = <1>;
>>          };
>>
>>
>>
>>      Driver need to specify the cable ID as
> Unless you have cables hardwired to a board, please stop describing
> cables in DT. Connectors!

If some controller only support cable with names then we need to do it. 
Like palmas extcon, it detect VBUS, ID_GND, RIDA, RIDB, RIDC. So for 
these cases, driver need to define cables.
Driver can specify that cable index 0 is for VBUS, 1 is for ID-GND etc.


>
>>       Cable                      ID
>>       ----------------------------
>>        Mechanical                0
>>        Microphone               1
>>        Headphone               2
>>        Line-out                    3
> No, please don't create some made up some number space. I don't see
> why you need this. You should just need the phandle to "the microphone
> jack" node.

I am thinking that I will need the phandle of extcon nodes with index 
for cable ID.


>>      Here #extcon-cells is must and specifies the size of extcon cells. The
>> client need to provide the driver specific information as argument along
>> with handle.
>>
>>
>> Extcon Client node:
>>
>>          audio-controller@b0000 {
>>                 ::::
>>                  extcon-cables = <&extcon 1>, <&extcon 3>;
>>                  extcon-cable-names = "Microphone", "Line-out";
>>          };
>>
>> and client driver can register the cable by passing the cable name
>> as above along with its node.
>>
>> struct extcon_cable {
>>      struct extcon_dev *edev,
>>      int cable_id;
>> };
> If you are showing driver details to explain the binding, something is wrong.


I have USB OTG driver which need the notification when VBUS or ID 
detected. For this, it can get the phandle of extcon and cable ID from 
that driver for  "id" and "vbus".


I have platform like follows:
I have 2 gpios which detect the ID and VBUS.
Both are independent. My USB driver get the extcon handle from the DT:

extcon_vbus: extcon@0 {
         comptaible = "extcon-gpio";
         gpio = <&gpio JETSON_VBUS_GPIO 0>;
         #extcon-cells = <1>;
};



extcon_id: extcon@1 {
         comptaible = "extcon-gpio";
         gpio = <&gpio JETSON_ID_GPIO 0>;
         #extcon-cells = <1>;
};

usb-otg {
::
         extcon-cable = <&extcon_vbus 0 &extcon_d 0>;
         extcon-cable-names = "id", "vbus";
::
};




>> edev_mic_cable = extcon_get_extcon_cable(dev, "Microphone");
>> extcon_register_notification(edev_mic_cable, notifier);
>>
>> edev_line_out_cable = extcon_get_extcon_cable(dev, "Line-out");
>> extcon_register_notification(edev_line_out_cable, notifier);
> Just remember that "*-names" should be optional (nor am I a fan of
> adding -names everywhere). This can be defined as first entry is mic
> and 2nd entry is line-out.
>
> Rob

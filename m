Return-Path: <SRS0=4Uh3=ER=rock-chips.com=wulf@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: phy: phy-rockchip-typec: add usb3 otg
 reset
References: <1515751704-13213-1-git-send-email-william.wu@rock-chips.com>
 <1515751704-13213-2-git-send-email-william.wu@rock-chips.com>
 <20180117220715.GA112833@google.com>
 <CAFqH_52KiHQzEeaX5rFN66pMqAuVVKeWJhxnS5L4hY4XiVG8mw@mail.gmail.com>
 <20180118174748.GA63108@google.com>
 <20180119214916.fegrzgcmbbdiesyz@rob-hp-laptop>
From: wlf <wulf@rock-chips.com>
Message-ID: <d05fb977-cd6c-4875-25be-9212e75b7e39@rock-chips.com>
Date: Mon, 22 Jan 2018 19:33:05 +0800
MIME-Version: 1.0
In-Reply-To: <20180119214916.fegrzgcmbbdiesyz@rob-hp-laptop>
Content-Type: multipart/alternative;
 boundary="------------3A80C245B8C828B3245428F8"
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Brian Norris <briannorris@chromium.org>
Cc: Enric Balletbo Serra <eballetbo@gmail.com>, William Wu <william.wu@rock-chips.com>, Kishon Vijay Abraham I <kishon@ti.com>, =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>, linux-kernel <linux-kernel@vger.kernel.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Frank Wang <frank.wang@rock-chips.com>, huangtao@rock-chips.com, Doug Anderson <dianders@google.com>, Guenter Roeck <groeck@google.com>, daniel.meng@rock-chips.com, John.Youn@synopsys.com, lin.huang@rock-chips.com, Enric Balletbo i Serra <enric.balletbo@collabora.com>
List-ID: <devicetree@vger.kernel.org>

This is a multi-part message in MIME format.
--------------3A80C245B8C828B3245428F8
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Rob,

在 2018年01月20日 05:49, Rob Herring 写道:
> On Thu, Jan 18, 2018 at 09:47:50AM -0800, Brian Norris wrote:
>> On Thu, Jan 18, 2018 at 06:20:09PM +0100, Enric Balletbo Serra wrote:
>>> As Brian said commit 06c47e6286d5 'usb: dwc3: of-simple: Add support
>>> to get resets for the device' introduced the support to get the resets
>>> from dwc3-of-simple and the queued commit 'b7e63d95c14d arm64: dts:
>>> rockchip: add reset property for dwc3 controllers on rk3399' started
>>> using it. Without the latest I get errors like this doing bind/unbind
>>> tests.
>>>
>>>     dwc3: probe of fe900000.dwc3 failed with error -110
>>>
>>> I just tested these series on top of mainline, I reverted my patch
>>> because otherwise two drivers are requesting the same reset and fails,
>>> and I did some of the bind/unbind test. They just worked fine, and
>>> seems that this is right way, so this makes me think some questions.
>> Actually, this was intended to coexist with DWC3 optionally controlling
>> the same reset. It was written before the reset framework was rewritten
>> to have shared and exclusive resets. Should this be rewritten to use
>> shared resets? We'd have to modify both dwc3 core and the PHY driver.
> Seems like abuse of DT to me. If you need to control the controller's
> reset from the phy driver, then get the reset out of the controller
> node. The phy node should describe the connections to the phy.
I try to get the reset out of the controller, but I don't find a good
way to get the reset ofthe controller associated with the given phy
device node.  Is there an API like theof_usb_get_dr_mode_by_phy() to
get 'dr_mode' of the controller?

And we're trying to find another method to fix the RK3399 tcphy power
on fail issue.If we get another proper method, we may not need these
phy patch series.

Best regards,
     wulf
>
> Rob
>
>
>


--------------3A80C245B8C828B3245428F8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><tt>Dear Rob,</tt><br>
    </p>
    <div class="moz-cite-prefix">在 2018年01月20日 05:49, Rob Herring 写道:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20180119214916.fegrzgcmbbdiesyz@rob-hp-laptop">
      <pre wrap="">On Thu, Jan 18, 2018 at 09:47:50AM -0800, Brian Norris wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">On Thu, Jan 18, 2018 at 06:20:09PM +0100, Enric Balletbo Serra wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="">As Brian said commit 06c47e6286d5 'usb: dwc3: of-simple: Add support
to get resets for the device' introduced the support to get the resets
from dwc3-of-simple and the queued commit 'b7e63d95c14d arm64: dts:
rockchip: add reset property for dwc3 controllers on rk3399' started
using it. Without the latest I get errors like this doing bind/unbind
tests.

   dwc3: probe of fe900000.dwc3 failed with error -110

I just tested these series on top of mainline, I reverted my patch
because otherwise two drivers are requesting the same reset and fails,
and I did some of the bind/unbind test. They just worked fine, and
seems that this is right way, so this makes me think some questions.
</pre>
        </blockquote>
        <pre wrap="">
Actually, this was intended to coexist with DWC3 optionally controlling
the same reset. It was written before the reset framework was rewritten
to have shared and exclusive resets. Should this be rewritten to use
shared resets? We'd have to modify both dwc3 core and the PHY driver.
</pre>
      </blockquote>
      <pre wrap="">
Seems like abuse of DT to me. If you need to control the controller's 
reset from the phy driver, then get the reset out of the controller 
node. The phy node should describe the connections to the phy.</pre>
    </blockquote>
    <tt>I try to get the reset out of the controller, but I don't find a
      good<br>
      way to get the reset of</tt><tt> the controller associated with
      the given phy<br>
      device node.  Is there an API like the</tt><tt>
      of_usb_get_dr_mode_by_phy() to<br>
      get 'dr_mode' of the controller?</tt><tt><br>
    </tt><tt><br>
    </tt><tt>And we're trying to find another method to fix the RK3399
      tcphy power<br>
      on fail issue.</tt><tt> If we get another proper method, we may
      not need these<br>
      phy patch series.</tt><tt><br>
    </tt><tt><br>
    </tt><tt>Best regards,</tt><tt><br>
    </tt><tt><span style="color: rgb(51, 51, 51); font-size: 14px;
        font-style: normal; font-variant-ligatures: normal;
        font-variant-caps: normal; font-weight: 400; letter-spacing:
        normal; text-align: left; text-indent: 0px; text-transform:
        none; white-space: normal; word-spacing: 0px;
        -webkit-text-stroke-width: 0px; background-color: rgb(249, 249,
        249); text-decoration-style: initial; text-decoration-color:
        initial; display: inline ! important; float: none;"></span></tt><tt>
          wulf</tt><br>
    <blockquote type="cite"
      cite="mid:20180119214916.fegrzgcmbbdiesyz@rob-hp-laptop">
      <pre wrap="">

Rob



</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------3A80C245B8C828B3245428F8--

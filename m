From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH v6 1/5] phy: add a driver for the Rockchip SoC internal
 USB2.0 PHY
Date: Fri, 12 Dec 2014 11:17:01 +0530
Message-ID: <548A8155.8080809@ti.com>
References: <1418291722-25448-1-git-send-email-lyz@rock-chips.com>	<1418291722-25448-2-git-send-email-lyz@rock-chips.com>	<548971AF.1020506@ti.com>
 <CAD=FV=XTYmzxvteNip2gtuDSSEWph-vY=BOPejHa1Z5KS2Kf6Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAD=FV=XTYmzxvteNip2gtuDSSEWph-vY=BOPejHa1Z5KS2Kf6Q@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Doug Anderson <dianders@chromium.org>
Cc: Tao Huang <huangtao@rock-chips.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, =?UTF-8?B?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chris <zyw@rock-chips.com>, Eddie Cai <cf@rock-chips.com>, Rob Herring <robh+dt@kernel.org>, Yunzhi Li <lyz@rock-chips.com>, Olof Johansson <olof@lixom.net>, jwerner@chromium.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Grant Likely <grant.likely@linaro.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Friday 12 December 2014 12:11 AM, Doug Anderson wrote:
> Kishon,
> 
> On Thu, Dec 11, 2014 at 2:27 AM, Kishon Vijay Abraham I <kishon@ti.com> wrote:
>> I didn't mean that. You can get rid of this entire xlate stuff if you use
>> something like below
>>
>> phy@xxx {
>>         compatible = "";
>>         phy1:usb_phy {
>>         }
>>         phy2:usb_phy {
>>         };
>> };
>>
>>
>> usb@xx {
>>         compatible = "";
>>         phys = <&phy1>; //doesn't need xlate
>>         /* this needs xlate
>>            phys = <&phy 1>;
>>         */
>>         phy-names = "phy";
>> };
> 
> Is the syntax you proposed really better?  Are you saying that you
> advocate never using "#phy-cells" other than 0 for new bindings?  Is

No. It can still be used for configuring the PHY. For example, in the case of
PIPE3 PHY we configure it to USB PHY, SATA PHY or PCIE PHY depending on to
which controller the PHY is connected to.

I feel using phy-cells just for differentiating the PHY is pointless when you
have a separate node for each PHY.

Thanks
Kishon

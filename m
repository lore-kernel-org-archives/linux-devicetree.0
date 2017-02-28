From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 4/6] arm64: dts: rockchip: add Gru/Kevin DTS
Date: Tue, 28 Feb 2017 14:54:33 -0800
Message-ID: <CAD=FV=VS6YBjUQsix=nHteKG6jt=+LGWpDSqrP4VRu5LxOVc3A@mail.gmail.com>
References: <20170210010521.78872-1-briannorris@chromium.org>
 <20170210010521.78872-5-briannorris@chromium.org> <6978416.eyJmBK6ozI@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <6978416.eyJmBK6ozI@phil>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Brian Norris <briannorris@chromium.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Stephen Barber <smbarber@chromium.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, Chris Zhong <zyw@rock-chips.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Caesar Wang <wxt@rock-chips.com>
List-Id: devicetree@vger.kernel.org

Hi,

On Tue, Feb 28, 2017 at 2:00 PM, Heiko Stuebner <heiko@sntech.de> wrote:
>> +     pp3300_wifi_bt: pp3300-wifi-bt {
>> +             compatible = "regulator-fixed";
>> +             regulator-name = "pp3300_wifi_bt";
>> +             /* NOTE: wlan_module_pd_l pinctrl in pp1800_pcie */
>> +
>> +             enable-active-high;
>> +
>> +             /* NOTE: this GPIO also used in pp1800_pcie */
>
> does the gpio subsystem like this double usage?

Yes, see commit f19b00da8ed3 ("regulator: core: support shared enable
GPIO concept").  ...but there's no great place to put the pinctrl node
though, unfortunately.  It's either randomly pick one of the two or
add it as a system-level hog.

-Doug

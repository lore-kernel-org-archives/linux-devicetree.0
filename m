From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH v3 0/3] usb/phy: Add Amlogic Meson8b and GXBB USB support
Date: Wed, 19 Oct 2016 16:22:54 +0530
Message-ID: <58075086.3040105@ti.com>
References: <20160904213152.25837-1-martin.blumenstingl@googlemail.com>
 <20161001121900.1168-1-martin.blumenstingl@googlemail.com>
 <CAFBinCCoVOxyVYdNxeNyUhAK+T1+gBW0d1oDUgVpOZZHBjN9Wg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAFBinCCoVOxyVYdNxeNyUhAK+T1+gBW0d1oDUgVpOZZHBjN9Wg@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, khilman@baylibre.com
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, johnyoun@synopsys.com, robh+dt@kernel.org, carlo@caione.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi,

On Friday 14 October 2016 01:57 AM, Martin Blumenstingl wrote:
> Hi Kishon,
> 
> On Sat, Oct 1, 2016 at 2:18 PM, Martin Blumenstingl
> <martin.blumenstingl@googlemail.com> wrote:
>> Martin Blumenstingl (3):
>>   Documentation: dt-bindings: update the meson-usb2-phy example
>>   Documentation: dt-bindings: rename meson-usb2-phy to meson8b-usb2-phy
> these two already got an ACK by the devicetree maintainers
> 
>>   phy: meson: add USB2 PHY support for Meson8b and GXBB
> did you already have time to review the USB2 PHY driver from patch 3/3?
> please let me know if there's something we have to change, then I'll
> take care of it
> 
> would you like to get all patches through the PHY tree or should Kevin
> take some of these?

while I have merged the patches to linux-phy -next, please update the
MAINTAINER for meson phy driver.

Thanks
Kishon

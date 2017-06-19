From: Philippe CORNU <philippe.cornu@st.com>
Subject: Re: [PATCH v3 2/6] dt-bindings: display: Add Synopsys DW MIPI DSI DRM
 bridge driver
Date: Mon, 19 Jun 2017 16:51:56 +0000
Message-ID: <c939ea5e-1c45-72af-0a0b-1f89fffa8c87@st.com>
References: <1496414235-20098-1-git-send-email-philippe.cornu@st.com>
 <1496414235-20098-3-git-send-email-philippe.cornu@st.com>
 <20170608154028.6ck3dos6de2dogrk@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170608154028.6ck3dos6de2dogrk@rob-hp-laptop>
Content-Language: en-US
Content-ID: <ABAECA057032414EA19BB54477EC2D0C@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Eric Anholt <eric@anholt.net>, Thierry Reding <thierry.reding@gmail.com>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, Chris Zhong <zyw@rock-chips.com>, Mickael REULIER <mickael.reulier@st.com>, Archit Taneja <architt@codeaurora.org>, Russell King <linux@armlinux.org.uk>, Fabien DESSENNE <fabien.dessenne@st.com>, Xinliang Liu <xinliang.liu@linaro.org>, Xinwei Kong <kong.kongxinwei@hisilicon.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Alexandre TORGUE <alexandre.torgue@st.com>, Arnd Bergmann <arnd@arndb.de>, Chen Feng <puck.chen@hisilicon.com>, Vincent ABRIOU <vincent.abriou@st.com>, Ludov
List-Id: devicetree@vger.kernel.org

On 06/08/2017 05:40 PM, Rob Herring wrote:
> On Fri, Jun 02, 2017 at 04:37:11PM +0200, Philippe CORNU wrote:
>> This patch adds documentation of device tree bindings for the
>> Synopsys DesignWare MIPI DSI host DRM bridge driver.
>>
>> Signed-off-by: Philippe CORNU <philippe.cornu@st.com>
>> ---
>>   .../bindings/display/bridge/dw_mipi_dsi.txt        | 30 ++++++++++++++++++++++
>>   1 file changed, 30 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/display/bridge/dw_mipi_dsi.txt
>>
>> diff --git a/Documentation/devicetree/bindings/display/bridge/dw_mipi_dsi.txt b/Documentation/devicetree/bindings/display/bridge/dw_mipi_dsi.txt
>> new file mode 100644
>> index 0000000..1d7c438
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/bridge/dw_mipi_dsi.txt
>> @@ -0,0 +1,30 @@
>> +Synopsys DesignWare MIPI DSI host controller
>> +============================================
>> +
>> +This document defines device tree properties for the Synopsys DesignWare MIPI
>> +DSI host controller. It doesn't constitue a device tree binding specification
>> +by itself but is meant to be referenced by platform-specific device tree
>> +bindings.
>> +
>> +When referenced from platform device tree bindings the properties defined in
>> +this document are defined as follows. The platform device tree bindings are
>> +responsible for defining whether each property is required or optional.
>> +
>> +- reg: Memory mapped base address and length of the DWC MIPI DSI
>> +  registers. (mandatory)
>> +
>> +- clocks: References to all the clocks specified in the clock-names property
>> +  as specified in [1]. (mandatory)
>> +
>> +- clock-names: "pclk" is peripheral clock for either AHB and APB. (mandatory)
> 
> Seems strange there's not also a pixel or bit clock? Or this gets driven
> from the phy?
> 
Hi Rob,
And many thanks for your comments :)

There is a "physical" pixel clock entering into the "DSI controller IP" 
but the "DSI controller driver" does not need to control (or read) it 
with the dt because this clock information (the frequency) is also 
available in panel timings and the drm/kms framework will propagate the 
panel timings in the drm/kms "crtc/encoder/bridge&panel/connector..." 
chain. Then, the DSI controller driver will compute phy parameters 
according to these panel timings.
Adding a pixel clock dependency in the dt here is then not necessary as 
the frequency information comes through the panel timings.

Philippe
>> +
>> +- resets: References to all the resets specified in the reset-names property
>> +  as specified in [2]. (optional)
>> +
>> +- reset-names: string reset name, must be "apb" if used. (optional)
>> +
>> +- panel or bridge node: see [3]. (mandatory)
>> +
>> +[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
>> +[2] Documentation/devicetree/bindings/reset/reset.txt
>> +[3] Documentation/devicetree/bindings/display/mipi-dsi-bus.txt
>> -- 
>> 1.9.1
>>

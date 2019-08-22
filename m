From: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH v2 2/4] nvmem: meson-efuse: bindings: Add secure-monitor
 phandle
Date: Thu, 22 Aug 2019 10:59:43 +0200
Message-ID: <1jftltpocg.fsf@starbuckisacylon.baylibre.com>
References: <20190731082339.20163-1-ccaione@baylibre.com>
 <20190731082339.20163-3-ccaione@baylibre.com> <20190821181458.GA2886@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190821181458.GA2886@bogus>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>, Carlo Caione <ccaione@baylibre.com>
Cc: devicetree@vger.kernel.org, narmstrong@baylibre.com, khilman@baylibre.com, srinivas.kandagatla@linaro.org, linux-amlogic@lists.infradead.org, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed 21 Aug 2019 at 13:14, Rob Herring <robh@kernel.org> wrote:

> On Wed, Jul 31, 2019 at 09:23:37AM +0100, Carlo Caione wrote:
>> Add a new property to link the nvmem driver to the secure-monitor. The
>> nvmem driver needs to access the secure-monitor to be able to access the
>> fuses.
>> 
>> Signed-off-by: Carlo Caione <ccaione@baylibre.com>
>> ---
>>  Documentation/devicetree/bindings/nvmem/amlogic-efuse.txt | 6 ++++++
>>  1 file changed, 6 insertions(+)
>> 
>> diff --git a/Documentation/devicetree/bindings/nvmem/amlogic-efuse.txt b/Documentation/devicetree/bindings/nvmem/amlogic-efuse.txt
>> index 2e0723ab3384..f7b3ed74db54 100644
>> --- a/Documentation/devicetree/bindings/nvmem/amlogic-efuse.txt
>> +++ b/Documentation/devicetree/bindings/nvmem/amlogic-efuse.txt
>> @@ -4,6 +4,7 @@ Required properties:
>>  - compatible: should be "amlogic,meson-gxbb-efuse"
>>  - clocks: phandle to the efuse peripheral clock provided by the
>>  	  clock controller.
>> +- secure-monitor: phandle to the secure-monitor node
>>  
>>  = Data cells =
>>  Are child nodes of eFuse, bindings of which as described in
>> @@ -16,6 +17,7 @@ Example:
>>  		clocks = <&clkc CLKID_EFUSE>;
>>  		#address-cells = <1>;
>>  		#size-cells = <1>;
>> +		secure-monitor = <&sm>;
>>  
>>  		sn: sn@14 {
>>  			reg = <0x14 0x10>;
>> @@ -30,6 +32,10 @@ Example:
>>  		};
>>  	};
>>  
>> +	sm: secure-monitor {
>> +		compatible = "amlogic,meson-gxbb-sm";
>> +	};
>
> I guess I acked this a while back, but I'm not sure I would today. It 
> seems incomplete and a node with only a compatible string and no 
> resources doesn't need to be in DT. But that's already done...

It does have ressources (the shared memory) but the mistake (we should maybe think about
fixing) is not expressing these in DT

I think the shared memory is already in our DT, maybe the secure monitor
should get a phandle to it ?

>
> There's no need for 'secure-monitor' anyways. Just do 
> 'of_find_compatible_node(NULL, NULL, "amlogic,meson-gxbb-sm")' or search 
> for the driver directly. It's not like there's more than one secure 
> monitor...

IMO the two methods show different constraints:
- Carlo's proposition show that the efuse driver need a ressource, which
is *a* secure monitor, whatever the variant is.

- Your proposition shows that the efuse driver depends on a particular
  secure monitor variant, which is the one provided by
  "amlogic,meson-gxbb-sm"

Yes, we could make your proposition work by the keeping the
"amlogic,meson-gxbb-sm" last in the compatible list but it isn't great
if a newer variant is actually not compatible with it.

Carlo represent the HW the way it is. It seems more flexible to me,
without adding (unbearable) complexity

>
> Rob

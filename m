From: Tero Kristo <t-kristo@ti.com>
Subject: Re: [PATCH 1/3] dt-bindings: clock: ti,sci-clk: Add support for
 parsing clock info from DT
Date: Tue, 22 Jan 2019 09:33:11 +0200
Message-ID: <7ce7bd25-b5c4-f99d-fda6-0f21376f2204@ti.com>
References: <1546954223-9738-1-git-send-email-t-kristo@ti.com>
 <1546954223-9738-2-git-send-email-t-kristo@ti.com>
 <20190121210449.GB7851@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190121210449.GB7851@bogus>
Content-Language: en-US
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
Cc: devicetree@vger.kernel.org, sboyd@kernel.org, mturquette@baylibre.com, ssantosh@kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 21/01/2019 23:04, Rob Herring wrote:
> On Tue, Jan 08, 2019 at 03:30:21PM +0200, Tero Kristo wrote:
>> By default, the available clock info is queried from firmware, which can
>> be quite a lengthy operation if there is a very large amount of clocks
>> available. Add option for parsing the used clocks from DT instead, and
>> only register these which can improve the boot time of the device quite
>> a lot.
>>
>> Signed-off-by: Tero Kristo <t-kristo@ti.com>
>> ---
>>   Documentation/devicetree/bindings/clock/ti,sci-clk.txt | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/ti,sci-clk.txt b/Documentation/devicetree/bindings/clock/ti,sci-clk.txt
>> index 4e59dc6..c757ae1 100644
>> --- a/Documentation/devicetree/bindings/clock/ti,sci-clk.txt
>> +++ b/Documentation/devicetree/bindings/clock/ti,sci-clk.txt
>> @@ -18,6 +18,13 @@ Required properties:
>>     and clocks IDs for 66AK2G SoC are documented at
>>     http://processors.wiki.ti.com/index.php/TISCI#66AK2G02_Data
>>   
>> +Optional properties:
>> +-------------------
>> +- ti,scan-clocks-from-dt: Scan clock tree info from DT. By default,
>> +  clocks are queried from firmware, which can be rather slow operation,
>> +  especially if there is a really large number of clocks available out
>> +  of which only a handful are ever used by kernel.
> 
> At first, I thought this was an either/or thing. Use firmware or use DT,
> but it is really only get the clocks used in the DT from firmware.
> 
> Why wouldn't you just always do that? I can think of 3 cases:
> reparenting, debug and overlays. This breaks reparenting and overlays,
> right? Debug could be handled with some userspace trigger to get all the
> clocks.

Re-parenting this does not break, as the scan still checks every 
possible parent of a clock scanned. Overlays are broken for sure, as we 
don't know which overlays we would be applying, and what clocks would be 
in them. Debug is kind of broken as we only scan a small portion of the 
clocks.

> 
> Why scan any of the clocks up front? Why not just create the clocks on
> demand? If an unknown clock id is requested, then create the clock and
> query the firmware at that point. That would avoid the DT scan too.
> Maybe there's some issues in the clk framework preventing that, but
> that's not really a DT problem.

The very initial version I did a couple of years back, did scan the 
clocks based on need, and registered them dynamically. Stephen shot down 
this based on the assessment that there might be locking issues with the 
common clock framework with this approach leading into potential 
deadlock situations.

-Tero
--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

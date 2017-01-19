From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Subject: Re: [PATCHv4 1/5] clk: mvebu: support for 98DX3236 SoC
Date: Thu, 19 Jan 2017 03:24:35 +0000
Message-ID: <e9cd1318dfe04d7ca3bad0e2073587d8@svr-chch-ex1.atlnz.lc>
References: <20170113091222.7132-1-chris.packham@alliedtelesis.co.nz>
 <20170113091222.7132-2-chris.packham@alliedtelesis.co.nz>
 <20170118222508.prn5xk63nuc3ocr7@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 19/01/17 11:25, Rob Herring wrote:
> On Fri, Jan 13, 2017 at 10:12:16PM +1300, Chris Packham wrote:
>> The 98DX3236, 98DX3336, 98DX4521 and variants have a different TCLK from
>> the Armada XP (200MHz vs 250MHz). The CPU core clock is fixed at 800MHz.
>>
>> The clock gating options are a subset of those on the Armada XP.
>>
>> The core clock divider is different to the Armada XP also.
>>
>> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
>> ---
>>
>> Notes:
>>     Changes in v2:
>>     - Update devicetree binding documentation for new compatible string
>>     Changes in v3:
>>     - Add 98dx3236 support to mvebu/clk-corediv.c rather than creating a new
>>       driver.
>>     - Document mv98dx3236-corediv-clock binding
>>     Changes in v4:
>>     - None
>>
>>  .../bindings/clock/mvebu-corediv-clock.txt         |  1 +
>>  .../devicetree/bindings/clock/mvebu-cpu-clock.txt  |  1 +
>
> Please add acks when posting new versions.
>
> Acked-by: Rob Herring <robh@kernel.org>
>

Thanks Rob. I must have missed the earlier ack. Will be in v5.

From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH v2 7/7] ARM: dts: sun6i: Add required ahb1 clock parent
 and rates for dma controller
Date: Thu, 9 Oct 2014 11:01:02 +0800
Message-ID: <CAGb2v64TE=gzPdFJwfmJfpwWZcsdZQGONh11SawfBXZkWGFKCg@mail.gmail.com>
References: <1411807795-6575-1-git-send-email-wens@csie.org>
 <1411807795-6575-8-git-send-email-wens@csie.org>
 <20140930155533.GP4081@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20140930155533.GP4081@lukather>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: devicetree <devicetree@vger.kernel.org>, Mike Turquette <mturquette@linaro.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Emilio Lopez <emilio@elopez.com.ar>, Rob Herring <robh+dt@kernel.org>, Grant Likely <grant.likely@linaro.org>, Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 30, 2014 at 11:55 PM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:
> On Sat, Sep 27, 2014 at 04:49:55PM +0800, Chen-Yu Tsai wrote:
>> The DMA controller requires AHB1 bus clock to be clocked from PLL6.
>>
>> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
>> ---
>>  arch/arm/boot/dts/sun6i-a31.dtsi | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/sun6i-a31.dtsi b/arch/arm/boot/dts/sun6i-a31.dtsi
>> index caf879d..d7845d3 100644
>> --- a/arch/arm/boot/dts/sun6i-a31.dtsi
>> +++ b/arch/arm/boot/dts/sun6i-a31.dtsi
>> @@ -353,6 +353,11 @@
>>                       clocks = <&ahb1_gates 6>;
>>                       resets = <&ahb1_rst 6>;
>>                       #dma-cells = <1>;
>> +
>> +                     /* DMA controller requires AHB1 clocked from PLL6 */
>> +                     assigned-clocks = <&ahb1>;
>> +                     assigned-clock-parents = <&pll6 0>;
>> +                     assigned-clock-rates = <200000000>;
>
> Again, I don't think we need the rate change, and that it's the right
> place to put it.

I'll drop it. As you mentioned on IRC, re-parenting to pll6
is still required, so I'll keep that bit.

Hi, Mike,

Is there a recommended way for clock providers to enforce a range
on clock rates? Tomeu's patches seem to be for clock consumers.

Cheers
ChenYu

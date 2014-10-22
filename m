From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCHv3 1/2] ARM: dts: socfpga: Fix SD card detect
Date: Wed, 22 Oct 2014 08:45:08 -0700
Message-ID: <CAD=FV=VP=8XPwWjGnVhS1SibMhsuuqbZOBdRT_GE5JKAL_xbuA@mail.gmail.com>
References: <1413908111-28165-1-git-send-email-dinguyen@opensource.altera.com>
 <1413908111-28165-2-git-send-email-dinguyen@opensource.altera.com>
 <20141021171033.GK10262@pengutronix.de>
 <5446AA87.8070307@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <5446AA87.8070307@opensource.altera.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Dinh Nguyen <dinguyen@opensource.altera.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Dinh Nguyen <dinh.linux@gmail.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "atull@opensource.altera.com" <atull@opensource.altera.com>, Jaehoon Chung <jh80.chung@samsung.com>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Olof Johansson <olof@lixom.net>, Steffen Trumtrar <s.trumtrar@pengutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Dinh,

(without the HTML mail this time, sorry)

On Tue, Oct 21, 2014 at 11:48 AM, Dinh Nguyen
<dinguyen@opensource.altera.com> wrote:
> On 10/21/2014 12:10 PM, Steffen Trumtrar wrote:
>> Hi!
>>
>> On Tue, Oct 21, 2014 at 11:15:10AM -0500, dinguyen@opensource.altera.com wrote:
>>> From: Dinh Nguyen <dinguyen@opensource.altera.com>
>>>
>>> Without this patch, the booting the SOCFPGA platform would hang at the
>>> SDMMC driver loading. The issue, debugged by Doug Anderson, turned out
>>> to be that the GPIO bank used by the SD card-detect was not set to
>>> status="okay".
>>>
>>> Suggested-by: Doug Anderson <dianders@chromium.org>
>>> Signed-off-by: Dinh Nguyen <dinguyen@opensource.altera.com>
>>> ---
>>> v3: Correctly degugged the issue to be a gpio node not having status="okay"
>>> ---
>>>  arch/arm/boot/dts/socfpga_cyclone5_socdk.dts | 6 ++++++
>>>  1 file changed, 6 insertions(+)
>>>
>>> diff --git a/arch/arm/boot/dts/socfpga_cyclone5_socdk.dts b/arch/arm/boot/dts/socfpga_cyclone5_socdk.dts
>>> index d7296a5..03a3745 100644
>>> --- a/arch/arm/boot/dts/socfpga_cyclone5_socdk.dts
>>> +++ b/arch/arm/boot/dts/socfpga_cyclone5_socdk.dts
>>> @@ -37,6 +37,12 @@
>>>               */
>>>              ethernet0 = &gmac1;
>>>      };
>>> +
>>> +    soc {
>>> +            gpio@ff709000 {
>>> +                    status = "okay";
>>> +            };
>>> +    };

I haven't dug into the details you provided about the GPIO
infrastructure of socfpga, but it does seem like it might be nice to
some easier way to reference things in
"arch/arm/boot/dts/socfpga.dtsi".

Looking at other examples they call the "gpio@ff708000" "gpio0" and
the sub node something like "porta".  Given that this is the only
reference to the GPIO, it seems like now would be the time to change
it.

-Doug

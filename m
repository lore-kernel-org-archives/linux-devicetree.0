From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH v3 2/8] ARM: dts: sun7i: Add GMAC clock node
 to sun7i DTSI
Date: Tue, 4 Feb 2014 11:06:24 +0800
Message-ID: <CAGb2v660qoKDC6SKjoD29b-r5y9OwkeKoWZ9PWBF5tC5PgeEYQ@mail.gmail.com>
References: <1391398346-5094-1-git-send-email-wens@csie.org>
 <1391398346-5094-3-git-send-email-wens@csie.org> <20140203193431.GD25625@lukather>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-sunxi+bncBCMILY6JWQBBBRFSYGLQKGQEV22HY3I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20140203193431.GD25625@lukather>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Feb 4, 2014 at 3:34 AM, Maxime Ripard
<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> On Mon, Feb 03, 2014 at 11:32:20AM +0800, Chen-Yu Tsai wrote:
>> The GMAC uses 1 of 2 sources for its transmit clock, depending on the
>> PHY interface mode. Add both sources as dummy clocks, and as parents
>> to the GMAC clock node.
>>
>> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/sun7i-a20.dtsi | 28 ++++++++++++++++++++++++++++
>>  1 file changed, 28 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/sun7i-a20.dtsi b/arch/arm/boot/dts/sun7i-a20.dtsi
>> index 1595e9a..fc7f470 100644
>> --- a/arch/arm/boot/dts/sun7i-a20.dtsi
>> +++ b/arch/arm/boot/dts/sun7i-a20.dtsi
>> @@ -314,6 +314,34 @@
>>               };
>>
>>               /*
>> +              * The following two are dummy clocks, placeholders used
>> +              * on gmac_tx clock. The actual frequency and availability
>> +              * depends on the external PHY, operation mode and link
>> +              * speed.
>> +              */
>
> If it depends on the external PHY, I guess that means it also depends
> on the board, right? Or is the GMAC supposed to always have that clock
> running at 25MHz, no matter what PHY is connected to it?

What I meant in the comment is that we cannot control the actual clock
rate of the TX clock. We can only select the source, and this is what
gmac_tx clock does. It is just a clock mux. The 125MHz and 25MHz clock
rates are used by the clk_set_rate in the stmmac glue layer to do
auto-reparenting.

The board dependent factor is what _type_ of PHY it is using, i.e.
MII, GMII, or RGMII. If it's MII, the PHY should provide the clock.
If it's RGMII, the internal clock would be used. GMII is a mix of
both. The actual clock rate depends on the link speed.

I should rephrase the comment along the lines of:

The following two are dummy clocks, placeholders used in the gmac_tx
clock. The gmac driver will choose one parent depending on the PHY
interface mode, using clk_set_rate auto-reparenting.
The actual TX clock rate is not controlled by the gmac_tx clock.


Cheers
ChenYu

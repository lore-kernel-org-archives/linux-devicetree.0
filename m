From: Code Kipper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/3] ARM: dts: sun6i: Add the SPDIF block to
 the A31
Date: Tue, 20 Dec 2016 15:34:10 +0100
Message-ID: <CAEKpxBn4J0sXVx6b0d_v3LivnNS5WENp9DD6fFE9N6u=J=n7ww@mail.gmail.com>
References: <20161220104038.22532-1-codekipper@gmail.com> <20161220104038.22532-3-codekipper@gmail.com>
 <20161220140709.pxvzcm3osmbromfh@lukather>
Reply-To: codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCHNXO4F7MHBBYUC4XBAKGQENVF6BHI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20161220140709.pxvzcm3osmbromfh@lukather>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 20 December 2016 at 15:07, Maxime Ripard
<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> Hi,
>
> On Tue, Dec 20, 2016 at 11:40:37AM +0100, codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
>> From: Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>
>> Add the SPDIF transceiver controller block to the A31 dtsi.
>>
>> Signed-off-by: Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/sun6i-a31.dtsi | 14 ++++++++++++++
>>  1 file changed, 14 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/sun6i-a31.dtsi b/arch/arm/boot/dts/sun6i-a31.dtsi
>> index 7370ba6c9993..559c53efa7e6 100644
>> --- a/arch/arm/boot/dts/sun6i-a31.dtsi
>> +++ b/arch/arm/boot/dts/sun6i-a31.dtsi
>> @@ -613,6 +613,20 @@
>>                       reg = <0x01c20ca0 0x20>;
>>               };
>>
>> +             spdif: spdif@01c21000 {
>> +                     #sound-dai-cells = <0>;
>> +                     compatible = "allwinner,sun6i-a31-spdif";
>> +                     reg = <0x01c21000 0x400>;
>> +                     interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
>> +                     clocks = <&ccu CLK_APB1_SPDIF>, <&ccu CLK_SPDIF>;
>> +                     resets = <&ccu RST_APB1_SPDIF>;
>> +                     clock-names = "apb", "spdif";
>> +                     dmas = <&dma 2>, <&dma 2>;
>> +                     dma-names = "rx", "tx";
>> +                     spdif-out = "disabled";
>
> That property isn't documented anywhere, and doesn't seem to be used
> in your driver either.
Ooops....do you want me to respin a new patch or will you do your
magic with 'dd'? It fell through the cracks as it was cherry picked
from my dev branch where I was at one time playing with spdif-in. This
has pretty much been relegated to the bottom of my todo/finish list.
>
> On a separate topic, is the channel inversion bug also found on the
> A31?
I have seen this and I'm sure that was also on my A31 hardware but
I've just fired her up and the speaker test worked as expected. I also
repeated the test on my A10 device and didn't hear the issue.
CK
>
> Maxime
>
> --
> Maxime Ripard, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com

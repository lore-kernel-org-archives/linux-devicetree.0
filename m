From: Code Kipper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: dts: sun7i: Add Itead Ibox support
Date: Mon, 14 Dec 2015 08:51:23 +0100
Message-ID: <CAEKpxBmopZ7+SONFSkVE72RGx=ncQHCZvv_bMJsfkWEHJBpnjw@mail.gmail.com>
References: <1449599344-15544-1-git-send-email-codekipper@gmail.com>
	<20151211105930.GM27957@lukather>
Reply-To: codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCHNXO4F7MHBB67JXGZQKGQEFPMJGVQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20151211105930.GM27957@lukather>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 11 December 2015 at 11:59, Maxime Ripard
<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> Hi,
>
> On Tue, Dec 08, 2015 at 07:29:03PM +0100, codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
>> From: Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>
>> The Itead Ibox is a multi board device based on the Allwinner A20 SoC.
>> It contains the A20 Itead Core module and a base board for the external
>> interfaces.
>>
>> The core module comes with 4GB NAND and 1GB DDR RAM.
>>
>> The base board to which the core board is connected provides 3 USB 2.0 Host
>> ports, 1 USB 2.0 OTG, 1 uSD slot, 10/100 Ethernet port, HDMI, IR receiver,
>> SPDIF and a 32-pin GPIO header. This header expands the features of core
>> board by exposing the VGA pins, audio In/Out pins, SATA, SPI, I2C, UARTS,
>> USB-OTG and power.
>>
>> As there is an A10 version of the Itead Core Module and at least one other
>> base board to support then this patch partitions the device tree files with
>> some consideration that these variants may be added later.
>>
>> Signed-off-by: Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/Makefile                     |   1 +
>>  arch/arm/boot/dts/sun7i-a20-itead-core.dtsi    |  83 ++++++++++++++++++
>>  arch/arm/boot/dts/sun7i-a20-itead-ibox.dts     |  98 ++++++++++++++++++++++
>>  arch/arm/boot/dts/sunxi-itead-core-common.dtsi | 111 +++++++++++++++++++++++++
>>  4 files changed, 293 insertions(+)
>>  create mode 100644 arch/arm/boot/dts/sun7i-a20-itead-core.dtsi
>>  create mode 100644 arch/arm/boot/dts/sun7i-a20-itead-ibox.dts
>>  create mode 100644 arch/arm/boot/dts/sunxi-itead-core-common.dtsi
>
> So, it looks like you're doing several things in this patch:
>
> 1) Create a common DTSI for all itead core variants
>    (sunxi-itead-core-common.dtsi)
>
> 2) Create an A20 variant of the itead core
> 3) Add support for a board using the A20 itead core.
>
> Please make three different patches for this, and converting the A10
> itead board would be a good idea too.

Sure, I will split this into four(or five) patches and include the A10
variant. I haven't got a A10 Itead board but I've seen that someone
has just popped on irc asking questions about it. I will ping them to
see if they can verify it for me.
CK
>
> Thanks!
> Maxime
>
> --
> Maxime Ripard, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com

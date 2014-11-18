From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sunxi: Update simplfb nodes so
 that u-boot can find them
Date: Tue, 18 Nov 2014 09:21:45 +0100
Message-ID: <546B0199.2050609@redhat.com>
References: <1416238816-29627-1-git-send-email-hdegoede@redhat.com> <20141117155925.GV6414@lukather>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDRZXY4CYYORBIEDVSRQKGQECTBZCAY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20141117155925.GV6414@lukather>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 11/17/2014 04:59 PM, Maxime Ripard wrote:
> Hi,
> 
> On Mon, Nov 17, 2014 at 04:40:16PM +0100, Hans de Goede wrote:
>> Review of the u-boot sunxi simplefb patches has led to the decision that
>> u-boot should not use a specific path to find the nodes as this goes contrary
>> to how devicetree usually works.
>>
>> Instead a platform specific compatible + properties should be used for this.
>>
>> The simplefb bindings have already been updated to reflect this, this patch
>> brings the sunxi devicetree files in line with the new binding, and the
>> actual u-boot implementation as it is going upstream.
>>
>> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/sun4i-a10.dtsi  | 5 +++--
>>  arch/arm/boot/dts/sun5i-a10s.dtsi | 5 +++--
>>  arch/arm/boot/dts/sun6i-a31.dtsi  | 5 +++--
>>  arch/arm/boot/dts/sun7i-a20.dtsi  | 5 +++--
>>  4 files changed, 12 insertions(+), 8 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/sun4i-a10.dtsi b/arch/arm/boot/dts/sun4i-a10.dtsi
>> index 92d8aa6..bbc366f 100644
>> --- a/arch/arm/boot/dts/sun4i-a10.dtsi
>> +++ b/arch/arm/boot/dts/sun4i-a10.dtsi
>> @@ -32,8 +32,9 @@
>>  		#size-cells = <1>;
>>  		ranges;
>>  
>> -		framebuffer0-hdmi {
>> -			compatible = "simple-framebuffer";
>> +		framebuffer@0 {
>> +			compatible = "sunxi,framebuffer", "simple-framebuffer";
> 
> This compatible isn't following the
> standard. allwinner,sunxi-framebuffer would be more appropriate.

Oh, good catch, I'll respin this patch set and the bindings documentation
patches to change this.

> I must say I'm also a bit concerned that this whole binding thing is
> not stabilizing while we are quite close from the end of the ARM merge
> window.

I understand, it was presumed to be stable when I posted the first set of dts
patches, but then it turned out Ian had some concerns about how we had
decided u-boot would find the prepopulated nodes. Ian and Grant and I discussed
this on irc yesterday and came up with a solution we all like. Unfortunately
we all missed the "sunxi," should be "allwinnner," thing. I'll go and fix that
right away, and then these bindings should be 100% stable.

> I wouldn't be very pleased to merge any more patch modifying again
> this binding.

Understood, and I do not expect there be any such patch.

Regards,

Hans

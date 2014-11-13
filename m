From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 4/7] ARM: dts: sun6i: Add simplefb node
Date: Thu, 13 Nov 2014 18:52:57 +0100
Message-ID: <5464EFF9.9010203@redhat.com>
References: <1415871109-28332-1-git-send-email-hdegoede@redhat.com> <1415871109-28332-4-git-send-email-hdegoede@redhat.com> <20141113164606.GM20972@lukather>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDRZXY4CYYORBAXASORQKGQEYJO72JA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20141113164606.GM20972@lukather>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 11/13/2014 05:46 PM, Maxime Ripard wrote:
> Hi,
> 
> On Thu, Nov 13, 2014 at 10:31:46AM +0100, Hans de Goede wrote:
>> Add a simplefb template node for u-boot to further fill and activate.
>>
>> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/sun6i-a31.dtsi | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/sun6i-a31.dtsi b/arch/arm/boot/dts/sun6i-a31.dtsi
>> index 543f895..438952e 100644
>> --- a/arch/arm/boot/dts/sun6i-a31.dtsi
>> +++ b/arch/arm/boot/dts/sun6i-a31.dtsi
>> @@ -62,6 +62,16 @@
>>  		ethernet0 = &gmac;
>>  	};
>>  
>> +	chosen {
>> +		#address-cells = <1>;
>> +		#size-cells = <1>;
>> +		ranges;
>> +
>> +		framebuffer0 {
>> +			compatible = "simple-framebuffer";
>> +			status = "disabled";
> 
> Aren't we suppose to have clocks in there too?

I deliberately left them out as they are not needed on sun6i, once the blocks
are setup ahb access is not necessary, but it seems that the ahb_gate bits
in sun4i / sun5i / sun7i double as a reset. Toggling them on / off / on breaks
the mode, while toggling module clocks on / off / on only causes a glitch.

Since the sun6i has a separate reset controller, the clock gates seem to really
only control ahb access which is not necessary once the mode has been set up.

Regards,

Hans

From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sun4i: Add simplefb node with
 de_fe0-de_be0-lcd0-hdmi pipeline
Date: Mon, 19 Jan 2015 14:35:41 +0100
Message-ID: <54BD082D.6030905@redhat.com>
References: <1421672477-12978-1-git-send-email-hdegoede@redhat.com> <1421672477-12978-2-git-send-email-hdegoede@redhat.com> <20150119132002.GD4367@lukather>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Return-path: <linux-sunxi+bncBDRZXY4CYYORBNMQ6SSQKGQEY6R4UZY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20150119132002.GD4367@lukather>
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

On 19-01-15 14:20, Maxime Ripard wrote:
> Hi Hans,
>
> On Mon, Jan 19, 2015 at 02:01:17PM +0100, Hans de Goede wrote:
>> Testing has shown that on sun4i the display backend engine does not have
>> deep enough fifo-s causing flickering / tearing in full-hd mode due to
>> fifo underruns. This can be avoided by letting the display frontend engine
>> do the dma from memory, and then letting it feed the data directly into
>> the backend unmodified, as the frontend does have deep enough fifo-s.
>>
>> Note since u-boot-v2015.01 has been released using the de_be0-lcd0-hdmi
>> pipeline on sun4i, we need to keep that one around too (unfortunately).
>>
>> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>> ---
>>   arch/arm/boot/dts/sun4i-a10.dtsi | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/sun4i-a10.dtsi b/arch/arm/boot/dts/sun4i-a10.dtsi
>> index f5e35b5..ccd60e3 100644
>> --- a/arch/arm/boot/dts/sun4i-a10.dtsi
>> +++ b/arch/arm/boot/dts/sun4i-a10.dtsi
>> @@ -44,6 +44,14 @@
>>   				 <&ahb_gates 44>;
>>   			status = "disabled";
>>   		};
>> +
>> +		framebuffer@1 {
>> +			compatible = "allwinner,simple-framebuffer", "simple-framebuffer";
>> +			allwinner,pipeline = "de_fe0-de_be0-lcd0-hdmi";
>> +			clocks = <&pll5 1>, <&ahb_gates 36>, <&ahb_gates 43>,
>> +				 <&ahb_gates 44>, <&ahb_gates 46>;
>> +			status = "disabled";
>> +		};
>
> Thanks for this.
>
> I do have a question though, maybe I'm missing something, but what
> would prevent us from using the existing node already? The output
> pipeline seems to be the same, at least for which output we
> use. Wether we use or not the display frontend looks like an
> implementation detail.

The purpose of having a node per pipeline is to have the rights clocks
listed for the pipeline chosen. So the "de_fe0-de_be0-lcd0-hdmi" node
has one ahb_gates entry more so as to make sure the kernel does not gate
off the frontend.

The idea of having different nodes per pipeline is that when we get
support for more module clocks in place, as a preparation for kms
support, we can add the module clocks to the relevant nodes, to also
ensure the module clocks will not get turned off.

By having this info in the dtb, rather then in u-boot we can update
the clocks list as we add new clock nodes in the dtb, ensuring that
an older u-boot will keep working as we add support for module
clocks, etc.

> That or just having several strings in allwinner,pipeline.
>
> If this simplefb binding is just going to be a collection of all the
> various combinations we have, plus the legacy options, I'm a bit
> worried that this is just going to be a hell to maintain, without any
> way to remove it at compile time (if such feature is ever merged in
> DTC).

I can understand where you're coming from, I wish I could say there
will be no more surprises / additions, but I don't want to make
promises I cannot keep. I do not see u-boot adding support for multiple
displays anytime soon, so things should stay limited to 3 nodes (one for
hdmi, lcd and vga each) or 2 nodes on socs without hdmi.

Except on sun4i where we need 2 for hdmi for compat reasons for a total
of 4.

But my crystal ball is defunct, so I cannot promise things will stay
limited to this.

Regards,

Hans

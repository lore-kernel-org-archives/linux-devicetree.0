From: icenowy-h8G6r0blFSE@public.gmane.org
Subject: Re: [linux-sunxi] Re: [PATCH] nvmem: sunxi-sid: add support for
 A64/H5's SID controller
Date: Tue, 19 Sep 2017 20:19:01 +0800
Message-ID: <a26630ba99845904fadf8356e3cb812a@aosc.io>
References: <20170918154204.54427-1-icenowy@aosc.io>
 <20170919082019.6bopwauso4mbslqo@flea.lan>
 <E5C9EEDA-C24B-4F66-9F8A-1355B44F861F@aosc.io>
 <20170919115502.exfbpdwb3c3eenee@flea.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170919115502.exfbpdwb3c3eenee-ZC1Zs529Oq4@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

在 2017-09-19 19:55，Maxime Ripard 写道：
> On Tue, Sep 19, 2017 at 04:23:14PM +0800, Icenowy Zheng wrote:
>> 
>> 
>> 于 2017年9月19日 GMT+08:00 下午4:20:19, Maxime Ripard 
>> <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> 写到:
>> >On Mon, Sep 18, 2017 at 11:42:04PM +0800, Icenowy Zheng wrote:
>> >> Allwinner A64/H5 SoCs come with a SID controller like the one in H3,
>> >but
>> >> without the silicon bug that makes the initial value at 0x200 wrong,
>> >so
>> >> the value at 0x200 can be directly read.
>> >>
>> >> Add support for this kind of SID controller.
>> >>
>> >> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
>> >> ---
>> >>  Documentation/devicetree/bindings/nvmem/allwinner,sunxi-sid.txt | 1
>> >+
>> >>  drivers/nvmem/sunxi_sid.c                                       | 6
>> >++++++
>> >>  2 files changed, 7 insertions(+)
>> >>
>> >> diff --git
>> >a/Documentation/devicetree/bindings/nvmem/allwinner,sunxi-sid.txt
>> >b/Documentation/devicetree/bindings/nvmem/allwinner,sunxi-sid.txt
>> >> index ef06d061913c..6ea0836939ee 100644
>> >> --- a/Documentation/devicetree/bindings/nvmem/allwinner,sunxi-sid.txt
>> >> +++ b/Documentation/devicetree/bindings/nvmem/allwinner,sunxi-sid.txt
>> >> @@ -5,6 +5,7 @@ Required properties:
>> >>    "allwinner,sun4i-a10-sid"
>> >>    "allwinner,sun7i-a20-sid"
>> >>    "allwinner,sun8i-h3-sid"
>> >> +  "allwinner,sun50i-a64-sid"
>> >>
>> >>  - reg: Should contain registers location and length
>> >>
>> >> diff --git a/drivers/nvmem/sunxi_sid.c b/drivers/nvmem/sunxi_sid.c
>> >> index 0d6648be93b8..3c9fd4fb9207 100644
>> >> --- a/drivers/nvmem/sunxi_sid.c
>> >> +++ b/drivers/nvmem/sunxi_sid.c
>> >> @@ -199,10 +199,16 @@ static const struct sunxi_sid_cfg sun8i_h3_cfg
>> >= {
>> >>  	.need_register_readout = true,
>> >>  };
>> >>
>> >> +static const struct sunxi_sid_cfg sun50i_a64_cfg = {
>> >> +	.value_offset = 0x200,
>> >> +	.size = 0x100,
>> >> +};
>> >> +
>> >
>> >How did you get those values?
>> 
>> In the BSP U-Boot headers.
> 
> This should be mentionned in your commit log then.

P.S. the 0x200 offset is not in the header, but as a proven experience
on new generation SID controllers.

> 
>> >Also, it's reported that the SID can only be accessed in secure
>> >mode, did you test it?
>> 
>> Yes, however the secure is broken again, and this only
>> happen if Secure Boot bit is burned.
> 
> Is broken again, meaning?
> 
> As far as I know, the only breakage we've had is on the A80 / A83T,
> but we don't have anything like it on the A64, do we?

A80/A83T is not the *only* breakage, but the *most serious* breakage,
which affected correctly using SMP in non-secure.

Newer Allwinner SoCs doesn't have the GIC broken, but the TZPC still
doesn't work when not Secure Boot, which means that all peripherals
set to secure-only can still be accessed. Affected SoCs are at least
H3, H5, A64.

It seems that the registers marked as secure-only inside PRCM still
works -- however this still has no meaningful secure/non-secure
seperation, as the secure setting register in PRCM is not
secure-only at least on SoCs without SB enabled.

> 
>> If it's really burned, we will have no clean way to access SID.
> 
> Well, in such a case we shouldn't access it either, so..

We will need the THS calibration data.

Maybe a custom call to ATF can be created, but I consider it dirty.

> 
> Maxime
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [RFC PATCH 3/3] dt-bindings: display: add Amlogic Meson DRM
 Bindings
Date: Mon, 28 Nov 2016 10:56:30 +0100
Message-ID: <534f6d99-a579-27b6-fb54-48584cd1c7aa@baylibre.com>
References: <1480089791-12517-1-git-send-email-narmstrong@baylibre.com>
 <3721857.XEGXu9B51N@avalon>
 <9f32e3bd-531b-0be7-8579-3af52469c421@baylibre.com>
 <2350540.yAeGFdYPK2@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2350540.yAeGFdYPK2@avalon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Xing.Xu-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org, victor.wan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jerry.cao-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Laurent,
On 11/28/2016 10:37 AM, Laurent Pinchart wrote:
> Hi Neil,
> 
> On Monday 28 Nov 2016 10:23:43 Neil Armstrong wrote:
>> On 11/28/2016 09:33 AM, Laurent Pinchart wrote:
>>> On Friday 25 Nov 2016 17:03:11 Neil Armstrong wrote:
>>>> Signed-off-by: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
>>>> ---
>>>>
>>>>  .../bindings/display/meson/meson-drm.txt           | 134 +++++++++++++++
>>>>  1 file changed, 134 insertions(+)
>>>>  create mode 100644
>>>>
>>>> Documentation/devicetree/bindings/display/meson/meson-drm.txt
>>>>
>>>> diff --git
>>>> a/Documentation/devicetree/bindings/display/meson/meson-drm.txt
>>>> b/Documentation/devicetree/bindings/display/meson/meson-drm.txt new file
>>>> mode 100644
>>>> index 0000000..89c1b5f
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/display/meson/meson-drm.txt

[...]

>>>> +
>>>> +VENC CBVS Output
>>>> +----------------------
>>>> +
>>>> +The VENC can output Composite/CVBS output via a decicated VDAC.
>>>> +
>>>> +Required properties:
>>>> +  - compatible: value must be one of:
>>>> + - compatible: value should be different for each SoC family as :
>>> One of those two lines is redundant.
>>
>> Will fix.
>>
>>>> + 	- GXBB (S905) : "amlogic,meson-gxbb-venc-cvbs"
>>>> + 	- GXL (S905X, S905D) : "amlogic,meson-gxl-venc-cvbs"
>>>> + 	- GXM (S912) : "amlogic,meson-gxm-venc-cvbs"
>>>> +	followed by the common "amlogic,meson-gx-venc-cvbs"
>>>> +
>>>
>>> No registers ? Are the encoders registers part of the VPU register space,
>>> intertwined in a way that they can't be specified separately here ?
>>
>> Exact, all the video registers on the Amlogic SoC are part of a long history
>> of fixup/enhance from very old SoCs, it's quite hard to distinguish a Venc
>> registers array since they are mixed with the multiple encoders
>> registers...
> 
> In that case is there really a reason to model the encoders as separate nodes 
> in DT ?

Here, it more the encoder-connector couple that is represented as a node, and
the CVBS output is optional.

> 
>> The only separate registers are the VDAC and HDMI PHY, I may move them to
>> these separate nodes since they are part of the HHI register space.
>>
>> It is a problem if I move them in the next release ? Next release will
>> certainly have HDMI support, and will have these refactorings.
> 
> Given that DT bindings are considered as a stable ABI, I'm afraid it's an 
> issue.

OK, I will add the VDAC/HDMI PHY registers as part if these output nodes.

> 
>>>> +- ports: A ports node with endpoint definitions as defined in
>>>> +  Documentation/devicetree/bindings/media/video-interfaces.txt. The
>>>> +  first port should be the input endpoints, connected ot the VPU node.
>>>> +
>>>> +Example:
>>>> +
>>>> +venc_cvbs: venc-cvbs {
>>>> +	compatible = "amlogic,meson-gxbb-venc-cvbs";
>>>> +	status = "okay";
>>>> +
>>>> +	ports {
>>>> +		#address-cells = <1>;
>>>> +		#size-cells = <0>;
>>>> +
>>>> +		enc_cvbs_in: port@0 {
>>>> +			 #address-cells = <1>;
>>>> +			 #size-cells = <0>;
>>>> +			 reg = <0>;
>>>> +
>>>> +			 venc_cvbs_in_vpu: endpoint@0 {
>>>> +				 reg = <0>;
>>>> +				 remote-endpoint = <&vpu_out_venc_cvbs>;
>>>> +			};
>>>> +		};
>>>> +	};
>>>> +};
>>>> +
>>>> +vpu: vpu@d0100000 {
>>>> +	compatible = "amlogic,meson-gxbb-vpu";
>>>> +	reg = <0x0 0xd0100000 0x0 0x100000>,
>>>> +	      <0x0 0xc883c000 0x0 0x1000>,
>>>> +	      <0x0 0xc8838000 0x0 0x1000>;
>>>> +	reg-names = "base", "hhi", "dmc";
>>>> +	interrupts = <GIC_SPI 3 IRQ_TYPE_EDGE_RISING>;
>>>> +
>>>> +	ports {
>>>> +		#address-cells = <1>;
>>>> +		#size-cells = <0>;
>>>> +
>>>> +		vpu_out: port@1 {
>>>> +			 #address-cells = <1>;
>>>> +			 #size-cells = <0>;
>>>> +			 reg = <1>;
>>>> +
>>>> +			 vpu_out_venc_cvbs: endpoint@0 {
>>>> +				 reg = <0>;
>>>> +				 remote-endpoint = <&venc_cvbs_in_vpu>;
>>>> +			 };
>>>> +		 };
>>>> +	};
>>>> +};
>>
>> Thanks for the review !
> 

Neil
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

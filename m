From: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 3/4] dt-bindings: display: add Amlogic Meson DRM
 Bindings
Date: Wed, 30 Nov 2016 17:04:06 +0100
Message-ID: <ac82b79f-9478-de4c-ba1e-83a5f7fb3e30@baylibre.com>
References: <1480520625-13269-1-git-send-email-narmstrong@baylibre.com>
 <1480520625-13269-4-git-send-email-narmstrong@baylibre.com>
 <13104644.f9boR54smD@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <13104644.f9boR54smD@avalon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: airlied-cv59FeDIM0c@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, victor.wan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org, jerry.cao-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org, Xing.Xu-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, daniel-/w4YWyX8dFk@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Laurent,

On 11/30/2016 04:56 PM, Laurent Pinchart wrote:
> Hi Neil,
> 
> Thank you for the patch.
> 
> On Wednesday 30 Nov 2016 16:43:44 Neil Armstrong wrote:
>> Signed-off-by: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
>> ---
>> .../bindings/display/meson/meson-drm.txt           | 101 ++++++++++++++++++
>> 1 file changed, 101 insertions(+)
>> create mode 100644
>> Documentation/devicetree/bindings/display/meson/meson-drm.txt
>>
>> diff --git a/Documentation/devicetree/bindings/display/meson/meson-drm.txt
>> b/Documentation/devicetree/bindings/display/meson/meson-drm.txt new file
>> mode 100644
>> index 0000000..e52869a
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/meson/meson-drm.txt
>> @@ -0,0 +1,101 @@

[...]

>> +
>> +Device Tree Bindings:
>> +---------------------
>> +
>> +VPU: Video Processing Unit
>> +--------------------------
>> +
>> +Required properties:
>> +- compatible: value should be different for each SoC family as :
>> +	- GXBB (S905) : "amlogic,meson-gxbb-vpu"
>> +	- GXL (S905X, S905D) : "amlogic,meson-gxl-vpu"
>> +	- GXM (S912) : "amlogic,meson-gxm-vpu"
>> +	followed by the common "amlogic,meson-gx-vpu"
>> +- reg: base address and size of he following memory-mapped regions :
>> +	- vpu
>> +	- hhi
>> +	- dmc
>> +- reg-names: should contain the names of the previous memory regions
>> +- interrupts: should contain the VENC Vsync interrupt number
>> +
>> +- ports: A ports node with endpoint definitions as defined in
>> +  Documentation/devicetree/bindings/media/video-interfaces.txt.
>> +  The first port should be connected to a CVBS connector endpoint if
>> available.
> 
> This is a bit vague, I propose clarifying it with a description similar to the 
> one in the renesas,du.txt bindings.
> 
> Required nodes:
> 
> The connections to the VPU output video ports are modeled using the OF graph
> bindings specified in Documentation/devicetree/bindings/graph.txt.
> 
> The following table lists for each supported model the port number
> corresponding to each DU output.
> 
>                 Port 0          Port1           Port2           Port3
> -----------------------------------------------------------------------------
>  R8A7779 (H1)   DPAD 0          DPAD 1          -               -
>  R8A7790 (H2)   DPAD            LVDS 0          LVDS 1          -
>  R8A7791 (M2-W) DPAD            LVDS 0          -               -
>  R8A7792 (V2H)  DPAD 0          DPAD 1          -               -
>  R8A7793 (M2-N) DPAD            LVDS 0          -               -
>  R8A7794 (E2)   DPAD 0          DPAD 1          -               -
>  R8A7795 (H3)   DPAD            HDMI 0          HDMI 1          LVDS
>  R8A7796 (M3-W) DPAD            HDMI            LVDS            -
> 
> (You should obviously replace the table with Amlogic data)
> 
> It doesn't matter if the current driver implementation only supports CVBS, the 
> DT bindings can already document the other ports.
> 

Ok, it's a pretty table ! Will integrate this.

>> +
>> +Example:
>> +
>> +tv: connector {
>> +	compatible = "composite-video-connector";
>> +	label = "cvbs";
> 
> I'd remove the label here, as it doesn't bring any additional information. 
> Unless the board you're using has a label for the connector, in case that 
> label should be used.

Indeed, I already removed it in the dts.

> 
> Apart from that,
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
> 

[...]

Thanks for the review,
Neil

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

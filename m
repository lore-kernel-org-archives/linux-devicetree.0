From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [PATCH 4/5] arm64: dts: renesas: ulcb: Add HDMI output connector
Date: Mon, 10 Jul 2017 22:38:21 +0300
Message-ID: <1965721.tJYYb53Zhd@avalon>
References: <1499394976-14201-1-git-send-email-vladimir.barinov@cogentembedded.com> <2531734.5WngiEmILA@avalon> <fbc99ea5-cfbb-5fcf-9162-7358fe4d667c@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <fbc99ea5-cfbb-5fcf-9162-7358fe4d667c-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vladimir Barinov <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Vladimir,

On Monday 10 Jul 2017 19:28:57 Vladimir Barinov wrote:
> On 10.07.2017 16:09, Laurent Pinchart wrote:
> > On Friday 07 Jul 2017 05:37:36 Vladimir Barinov wrote:
> >> From: Vladimir Barinov <vladimir.barinov+renesas-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
> >> 
> >> The ULCB board has one HDMI output connector.
> >> 
> >> This connector is available on both the H3 and M3-W ULCB boards.
> >> Add this to the ulcb.dtsi file.
> >> 
> >> Signed-off-by: Vladimir Barinov
> >> <vladimir.barinov+renesas-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org> ---
> >> 
> >>   arch/arm64/boot/dts/renesas/ulcb.dtsi | 11 +++++++++++
> >>   1 file changed, 11 insertions(+)
> >> 
> >> diff --git a/arch/arm64/boot/dts/renesas/ulcb.dtsi
> >> b/arch/arm64/boot/dts/renesas/ulcb.dtsi index 6f0a7ca..fc5408d 100644
> >> --- a/arch/arm64/boot/dts/renesas/ulcb.dtsi
> >> +++ b/arch/arm64/boot/dts/renesas/ulcb.dtsi
> >> @@ -34,6 +34,17 @@
> >> 
> >>   		clock-frequency = <11289600>;
> >>   	
> >>   	};
> >> 
> >> +	hdmi0-out {
> >> +		compatible = "hdmi-connector";
> >> +		label = "HDMI0 OUT";
> > 
> > As far as I know there is no "HDMI0 OUT" label on the board or casing. You
> > can remove the label property. Apart from that,
> 
> I was thinking that this is a label on schematic.
> 
> ULCB has similar schematic label as first HDMI connector on Salvator-X
> "HDMI output(HDMI0)", hence I've just copied label name from Salvator-X
> file.
> 
> Right, there is no such name on ULCB pcb or plastic cover.

Yes, that's the difference with the Salvator-X, where the plastic cover has a 
label.

> Is it okay If I resend only one patch with label field removed?

Sure.

-- 
Regards,

Laurent Pinchart

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

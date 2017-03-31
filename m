From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: Device Tree Binding for Intel FPGA Video and Image Processing Suite
Date: Fri, 31 Mar 2017 17:48:52 -0500
Message-ID: <CAL_JsqJa6rdk=fxHVkHdjFrkBx-E6hGUfoZt2cAzaMvq2TJkNw@mail.gmail.com>
References: <1490949905.21575.8.camel@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1490949905.21575.8.camel-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Ong, Hean Loong" <hean.loong.ong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Mar 31, 2017 at 3:50 AM, Ong, Hean Loong
<hean.loong.ong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org> wrote:
> Hi Rob,
>
> I would like to upstream the attached device tree binding patch to the
> community. This is required for the support of framebuffer drivers of
> the Intel FPGA Video and Image Processing Suite intended for the
> Arria10 devkit.
>
> The device tree information includes the maximum width and height
> supported by the framebuffer display. These are fixed parameters
> determined by the use who the Quartus design system to program the
> FPGA in the Arria10 devkit and its variants.

Please read Documentation/devicetree/bindings/submitting-patches.txt.

The first problem is sending the patch as an attachment.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

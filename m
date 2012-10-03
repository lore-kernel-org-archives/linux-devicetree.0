From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v4 04/16] tegra: fdt: Add LCD definitions for Tegra
Date: Wed, 03 Oct 2012 16:54:13 -0600
Message-ID: <506CC215.8060707@wwwdotorg.org>
References: <1348793077-10126-1-git-send-email-sjg@chromium.org>
 <1348793077-10126-5-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1348793077-10126-5-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 09/27/2012 06:44 PM, Simon Glass wrote:
> Add LCD definitions and also a proposed binding for LCD displays.
> 
> The PWM is as per what will likely be committed to linux-next soon.
> 
> The displaymode binding comes from a proposal here:
> 
> http://lists.freedesktop.org/archives/dri-devel/2012-July/024875.html
> 
> The panel binding is new, and fills a need to specify the panel
> timings and other tegra-specific information. Should a binding appear
> that allows the pwm to handle this automatically, we can revisit
> this.

> diff --git a/doc/device-tree-bindings/video/displaymode.txt b/doc/device-tree-bindings/video/displaymode.txt

> +Example:
> +
> +	display@0 {

That should really be "mode" or "timing", since it's describing a
display mode/timing not a display. I believe the latest messages in that
thread indicate a similar change will be made to the proposed Linux binding.

> diff --git a/doc/device-tree-bindings/video/tegra20-dc.txt b/doc/device-tree-bindings/video/tegra20-dc.txt

> +Required properties (rgb) :
> + - nvidia,panel : phandle of LCD panel information
> +
> +
> +The panel node describes the panel itself. This has the properties listed in
> +displaymode.txt as well as:

It should really be a sub-node; like:

panel {
    ... all the panel-specific stuff from this binding ...
    modes {
        default {
            ... all the stuff from displaymode.txt ...
        };
    };
};

Since the panel itself and the (potentially, list of) modes it can
support are separate things.

From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 3/3] pinctrl: imx: move hard-coding data into device tree
Date: Wed, 20 Feb 2013 12:04:58 -0700
Message-ID: <51251E5A.1080806@wwwdotorg.org>
References: <1361344089-16804-1-git-send-email-shawn.guo@linaro.org>
 <1361344089-16804-4-git-send-email-shawn.guo@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1361344089-16804-4-git-send-email-shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
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
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, =?ISO-8859-1?Q?Uwe_Kleine-K=F6?= =?ISO-8859-1?Q?nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Dong Aisheng <dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 02/20/2013 12:08 AM, Shawn Guo wrote:
> Currently, all imx pinctrl drivers maintain a big array of struct
> imx_pin_reg which hard-codes data like register offset and mux mode
> setting for each pin function.  Every time a new imx SoC support is
> added, we need to add such a big mount of data.  With moving to single
> kernel build, it's only matter of time to be blamed on memory consuming.
> 
> With DTC pre-processor support in place, the patch moves all these data
> into device tree by redefining the PIN_FUNC_ID in imxXX-pinfunc.h and
> changing the PIN_FUNC_ID parsing code a little bit.

There are a couple of potential issues with this patch, which I'm in two
minds about:

1)

This is an incompatible change to the DT binding definition. A DT
written to the old specification won't work with a newer kernel and
vice-versa. This isn't supposed to happen with device tree.

Right now I believe we're still being flexible about DT binding changes,
but I've seen hints that this kind of thing will start getting lots of
push-back in the near future...

That all said, I'd also love to change the Tegra pinctrl binding now
that we have CPP, since I could replace all the strings in the current
binding with integers and presumably save some space in the .dtb. Hence,
I'd love to maintain the flexibility to keep changing the .dts and
kernel code in lock-step.

2)

This patch removes a bunch of tables from the kernel. I like having the
tables in the kernel, since in theory it could allow a future debugfs or
sysfs interface to pinctrl that allows manipulation of the pinctrl HW
state at a semantic level. This is only possible if the DT binding
includes details such as "set this pin to this function", and the driver
includes the tables to convert that into details such as register
address and value. I don't think such an "API" could be implemented for
IMX after this patch. Still, given the IMX binding already merged "pin"
and "function" into a single integer in the binding, I'm not sure if IMX
could support that kind of "API" before anyway?

This is part of the reason I pushed hard for the pinctrl APIs to operate
at the semantic pin/group/function level, and that Tegra's pinctrl
drivers explicitly have tables listing all the pins/groups/functions,
rather than just putting a bunch of register values into the DT.

I'm not sure how much of an issue this is, though. LinusW and/or the DT
maintainers should probably chime in here.

I didn't actually read the driver implementation changes in this patch.

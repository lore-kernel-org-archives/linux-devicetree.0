From: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v3] media: i2c: tvp7002: add OF support
Date: Wed, 17 Jul 2013 18:39:52 +0200
Message-ID: <51E6C8D8.4010303@samsung.com>
References: <1374078016-17122-1-git-send-email-prabhakar.csengg@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <1374078016-17122-1-git-send-email-prabhakar.csengg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
To: Prabhakar Lad <prabhakar.csengg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, DLOS <davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>, LMML <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 07/17/2013 06:20 PM, Prabhakar Lad wrote:
> From: "Lad, Prabhakar" <prabhakar.csengg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> 
> add OF support for the tvp7002 driver.
> 
> Signed-off-by: Lad, Prabhakar <prabhakar.csengg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  This patch depends on https://patchwork.kernel.org/patch/2828800/
>  
>  Changes for v3:
>  1: Fixed review comments pointed by Sylwester.
>  
>  .../devicetree/bindings/media/i2c/tvp7002.txt      |   43 +++++++++++++
>  drivers/media/i2c/tvp7002.c                        |   67 ++++++++++++++++++--
>  2 files changed, 103 insertions(+), 7 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/tvp7002.txt
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/tvp7002.txt b/Documentation/devicetree/bindings/media/i2c/tvp7002.txt
> new file mode 100644
> index 0000000..744125f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/tvp7002.txt
> @@ -0,0 +1,43 @@
> +* Texas Instruments TV7002 video decoder
> +
> +The TVP7002 device supports digitizing of video and graphics signal in RGB and
> +YPbPr color space.
> +
> +Required Properties :
> +- compatible : Must be "ti,tvp7002"
> +
> +- hsync-active: HSYNC Polarity configuration for endpoint.
> +
> +- vsync-active: VSYNC Polarity configuration for endpoint.

I woudn't refer to "endpoint" here, perhaps to the specific hardware
bus instead ? So it is clear what part of the device it refers to ?

> +- pclk-sample: Clock polarity of the endpoint.

This description is not very useful, my feeling is that this property
is better described in video-interfaces.txt.

> +- sync-on-green-active: Active state of Sync-on-green signal property of the
> +  endpoint, 0/1 for normal/inverted operation respectively.
> +
> +- field-even-active: Active-high Field ID polarity of the endpoint.

I find it hard to understand what this property is about exactly.
Not sure if you need to repeat detailed description of the signal
polarity properties. Perhaps its sufficient to list which properties
are relevant for this device, but I'm not opposed to having
supplementary description here. I would just make it more specific
to the TVP7002 chip.
Also please note that only 'compatible' property is required, all
other are optional. And it probably makes sense to specify what are
default values for each property when it is not specified.

Otherwise the patch looks good.

--
Thanks,
Sylwester

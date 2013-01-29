From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 1/6] ARM: dts: Update MFC DT binding documentation
Date: Tue, 29 Jan 2013 14:33:17 +0100
Message-ID: <5107CF9D.6000200@samsung.com>
References: <1359432822-23846-1-git-send-email-sachin.kamat@linaro.org>
 <1359432822-23846-2-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-reply-to: <1359432822-23846-2-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, patches@linaro.org, Arun Kumar K <arun.kk@samsung.com>
List-Id: devicetree@vger.kernel.org

Hi Sachin,

On 01/29/2013 05:13 AM, Sachin Kamat wrote:
> Added an example for bindings for illustration and clarity.
> 
> Cc: devicetree-discuss@lists.ozlabs.org
> Cc: Arun Kumar K <arun.kk@samsung.com>
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  .../devicetree/bindings/media/s5p-mfc.txt          |   13 +++++++++++++
>  1 files changed, 13 insertions(+), 0 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/s5p-mfc.txt b/Documentation/devicetree/bindings/media/s5p-mfc.txt
> index 67ec3d4..261c9dc 100644
> --- a/Documentation/devicetree/bindings/media/s5p-mfc.txt
> +++ b/Documentation/devicetree/bindings/media/s5p-mfc.txt
> @@ -21,3 +21,16 @@ Required properties:
>  
>    - samsung,mfc-l : Base address of the second memory bank used by MFC
>  		    for DMA contiguous memory allocation and its size.
> +
> +Example:

Maybe adding a comment that this is a SoC...

> +mfc: codec@13400000 {
> +	compatible = "samsung,mfc-v5";
> +	reg = <0x13400000 0x10000>;
> +	interrupts = <0 94 0>;
> +};

and the board specific part would make it more clear ?

> +codec@13400000 {
> +	samsung,mfc-r = <0x43000000 0x800000>;
> +	samsung,mfc-l = <0x51000000 0x800000>;
> +};

Also please note that in the first node above you need
status = "disabled"; line, so the MFC is disabled by default.
Then in dts files for boards that use the codec it can be
overridden to enable the device as needed.

--

Thanks,
Sylwester

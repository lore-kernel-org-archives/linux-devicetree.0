From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH] of: Documentation: Correct return value from
 of_overlay_fdt_apply
Date: Sun, 7 Apr 2019 18:11:12 -0700
Message-ID: <9bb707be-9cb3-dffc-303f-ee7025090ba9@gmail.com>
References: <20190404022555.29382-1-chris.packham@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190404022555.29382-1-chris.packham@alliedtelesis.co.nz>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Chris Packham <chris.packham@alliedtelesis.co.nz>, pantelis.antoniou@konsulko.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 4/3/19 7:25 PM, Chris Packham wrote:
> The return from of_overlay_fdt_apply() just indicates success or fail.
> The cookie is returned via reference.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
>  Documentation/devicetree/overlay-notes.txt | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/overlay-notes.txt b/Documentation/devicetree/overlay-notes.txt
> index 725fb8d255c1..62f2003d6205 100644
> --- a/Documentation/devicetree/overlay-notes.txt
> +++ b/Documentation/devicetree/overlay-notes.txt
> @@ -88,7 +88,8 @@ Overlay in-kernel API
>  The API is quite easy to use.
>  
>  1. Call of_overlay_fdt_apply() to create and apply an overlay changeset. The
> -return value is an error or a cookie identifying this overlay.
> +return indicates success or failure. A a cookie identifying this overlay is
> +returned via reference on success.
>  
>  2. Call of_overlay_remove() to remove and cleanup the overlay changeset
>  previously created via the call to of_overlay_fdt_apply(). Removal of an
> 

Reviewed-by: Frank Rowand <frank.rowand@sony.com>

From: Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>
Subject: Re: [PATCH v2] ARM:boot:device tree: Allow the device tree binary to
	be appended to zImage
Date: Mon, 21 Mar 2011 18:49:53 -0400 (EDT)
Message-ID: <alpine.LFD.2.00.1103211844500.11889@xanadu.home>
References: <20110321221930.19756.36549.stgit@riker>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <20110321221930.19756.36549.stgit@riker>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 21 Mar 2011, John Bonesio wrote:

> This patch provides the ability to boot using a device tree that is appended
> to the raw binary zImage (e.g. cat zImage <filename>.dtb > zImage_w_dtb).
> 
> Signed-off-by: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>

One minor glitch still...  ;-)

> @@ -288,12 +344,28 @@ wont_overwrite:
>  
>  		/*
>  		 * Relocate all entries in the GOT table.
> +		 * Bump bss entries to _edata + dtb size
>  		 */
>  1:		ldr	r1, [r11, #0]		@ relocate entries in the GOT
> -		add	r1, r1, r0		@ table.  This fixes up the
> -		str	r1, [r11], #4		@ C references.
> +		add	r1, r1, r0		@ This fixes up C references
> +		cmp	r1, r2			@ if entry >= bss_start &&
> +		cmphs	r3, r1			@       bss_end > entry
> +		addhi	r1, lr			@    entry += dtb size

Some toolchains won't accept this shortened version unless you compile 
for Thumb.  You should instead use:

		addhi	r1, r1, lr

Otherwise...

Reviewed-by: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>


Nicolas

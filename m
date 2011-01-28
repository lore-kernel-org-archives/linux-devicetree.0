From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH v2] ARM: map ATAGs when not in first 1MB of RAM
Date: Fri, 28 Jan 2011 14:10:32 +0000
Message-ID: <20110128141031.GB12976@n2100.arm.linux.org.uk>
References: <1296223246-2934-1-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1296223246-2934-1-git-send-email-robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Jan 28, 2011 at 08:00:46AM -0600, Rob Herring wrote:
> @@ -206,11 +206,17 @@ __create_page_tables:
>  #endif
>  
>  	/*
> -	 * Then map first 1MB of ram in case it contains our boot params.
> +	 * Then map boot params address in r2 or
> +	 * the first 1MB of ram if boot params address is not specified.
>  	 */
> -	add	r0, r4, #PAGE_OFFSET >> 18
> -	orr	r6, r7, r8
> -	str	r6, [r0]
> +	mov	r0, r2, lsr #20
> +	movs	r0, r0, lsl #20
> +	moveq	r0, r8
> +	sub	r3, r0, r8
> +	add	r3, r3, #PAGE_OFFSET
> +	add	r3, r4, r3, lsr #18
> +	orr	r6, r7, r0
> +	str	r6, [r3]

Wouldn't:
	str	r6, [r4, r3, lsr #18]
work here?

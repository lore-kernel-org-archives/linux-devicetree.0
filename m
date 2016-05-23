From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 07/54] MAINTAINERS: Add file patterns for bcm2835 device
 tree bindings
Date: Mon, 23 May 2016 09:07:14 -0600
Message-ID: <57431CA2.3020102@wwwdotorg.org>
References: <1463907991-7916-1-git-send-email-geert@linux-m68k.org>
 <1463907991-7916-8-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1463907991-7916-8-git-send-email-geert@linux-m68k.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>, Eric Anholt <eric@anholt.net>, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 05/22/2016 03:05 AM, Geert Uytterhoeven wrote:
> Submitters of device tree binding documentation may forget to CC
> the subsystem maintainer if this is missing.


> @@ -2505,6 +2505,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/rpi/linux-rpi.git
>  S:	Maintained
>  N:	bcm2835
> +F:	Documentation/devicetree/bindings/soc/bcm/

This looks wrong; the kernel supports more Broadcom chips than just the 
bcm283[567]. I'd suggest using a regex to make sure it only matches the 
appropriate chips. Perhaps:

N: bcm283[567]

? That also has the advantage of matching all the bindings in other 
directories in Documentation/devicetree/bindings, and indeed all the 
drivers and DT files too.

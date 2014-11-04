From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 08/17] bus: mvebu-mbus: provide a mechanism to save SDRAM
 window configuration
Date: Tue, 04 Nov 2014 10:17:52 +0100
Message-ID: <545899C0.9030301@free-electrons.com>
References: <1414151970-6626-1-git-send-email-thomas.petazzoni@free-electrons.com> <1414151970-6626-9-git-send-email-thomas.petazzoni@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1414151970-6626-9-git-send-email-thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Thomas,

On 24/10/2014 13:59, Thomas Petazzoni wrote:
> On Marvell EBU platforms, when doing suspend/resume, the SDRAM window
> configuration must be saved on suspend, and restored on
> resume. However, it needs to be restored on resume *before*
> re-entering the kernel, because the SDRAM window configuration defines
> the layout of the memory. For this reason, it cannot simply be done in
> the ->suspend() and ->resume() hooks of the mvebu-mbus driver.
> 
> Instead, it needs to be restored by the bootloader "boot info"
> mechanism used when resuming. This mechanism allows the kernel to
> define a list of (address, value) pairs when suspending, that the
> bootloader will restore on resume before jumping back into the kernel.
> 
> This commit therefore adds a new function to the mvebu-mbus driver,
> called mvebu_mbus_save_cpu_target(), which will be called by the
> platform code to make the mvebu-mbus driver save the SDRAM window
> configuration in a way that can be understood by the bootloader "boot
> info" mechanism.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  drivers/bus/mvebu-mbus.c | 56 ++++++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/mbus.h     |  1 +
>  2 files changed, 57 insertions(+)

Reviewed-by: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>


Thanks,

Gregory


-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

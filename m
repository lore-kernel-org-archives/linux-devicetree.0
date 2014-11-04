From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 09/17] clk: mvebu: add suspend/resume for gatable clocks
Date: Tue, 04 Nov 2014 10:32:26 +0100
Message-ID: <54589D2A.5060807@free-electrons.com>
References: <1414151970-6626-1-git-send-email-thomas.petazzoni@free-electrons.com> <1414151970-6626-10-git-send-email-thomas.petazzoni@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1414151970-6626-10-git-send-email-thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Thomas,

On 24/10/2014 13:59, Thomas Petazzoni wrote:
> This commit adds suspend/resume support for the gatable clock driver
> used on Marvell EBU platforms. When getting out of suspend, the
> Marvell EBU platforms go through the bootloader, which re-enables all
> gatable clocks. However, upon resume, the clock framework will not
> disable again all gatable clocks that are not used.
> 
> Therefore, if the clock driver does not save/restore the state of the
> gatable clocks, all gatable clocks that are not claimed by any device
> driver will remain enabled after a resume. This is why this driver
> saves and restores the state of those clocks.
> 
> Since clocks aren't real devices, we don't have the normal ->suspend()
> and ->resume() of the device model, and have to use the ->suspend()
> and ->resume() hooks of the syscore_ops mechanism. This mechanism has
> the unfortunate idea of not providing a way of passing private data,
> which requires us to change the driver to make the assumption that
> there is only once instance of the gatable clock control structure.

It should be possible to store more than one instance in an array, and
to go trough this array during suspend and resume. However until now we
never had needed more than one instance, so I agree to keep the code simple
with this assumption.

> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> ---
>  drivers/clk/mvebu/common.c | 30 ++++++++++++++++++++++++++++--
>  1 file changed, 28 insertions(+), 2 deletions(-)
> 

Acked-by: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

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

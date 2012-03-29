From: Wolfgang Denk <wd@denx.de>
Subject: Re: [PATCH 1/2] fdt: Avoid early panic() when there is no
	FDT present
Date: Thu, 29 Mar 2012 08:30:15 +0200
Message-ID: <20120329063015.85A59202B18@gemini.denx.de>
References: <1332965305-21151-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
In-reply-to: <1332965305-21151-1-git-send-email-sjg@chromium.org>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: Simon Glass <sjg@chromium.org>
Cc: U-Boot Mailing List <u-boot@lists.denx.de>, Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>, Jerry Van Baren <vanbaren@cideas.com>, Tom Warren <twarren@nvidia.com>
List-Id: devicetree@vger.kernel.org

Dear Simon Glass,

In message <1332965305-21151-1-git-send-email-sjg@chromium.org> you wrote:
> CONFIG_OF_CONTROL requires a valid device tree. However, we cannot call
> panic() before the console is set up since the message does not appear,
> and we get a silent failure.
...
> +int fdtdec_prepare_fdt(void);
> +
> +/**
> + * Checks that we have a valid fdt available to control U-Boot.
> +
> + * However, if not then for the moment nothing is done, since this function
> + * is called too early to panic().
> + *
> + * @returns 0

If the function always returns 0, then it makes no sense to return any
value at all.  Please make it void, then.

> +int fdtdec_check_fdt(void)
> +{
> +	/*
> +	 * We must have an FDT, but we cannot panic() yet since the console
> +	 * is not ready. So for now, just assert(). Boards which need an early
> +	 * FDT (prior to console ready) will need to make their own
> +	 * arrangements and do their own checks.
> +	 */
> +	assert(!fdtdec_prepare_fdt());
> +	return 0;
> +}

Ditto - make that "void fdtdec_check_fdt(void)".

> +int fdtdec_prepare_fdt(void)
...
>  	return 0;
>  }

Ditto - make that "void fdtdec_prepare_fdt(void)".


I have to admit that I do not understand how this patch will help you
anything.  You write "we cannot panic()", but "just assert()".

If the assertion fails, it will call __assert_fail() - which in turn
will just call panic().  So you are out of the frying pan into the
fire.

Best regards,

Wolfgang Denk

-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
Life. Don't talk to me about life.      - Marvin the Paranoid Android

From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 2/3] ARM: msm: Re-organize platsmp to make it extensible
Date: Tue, 4 Jun 2013 10:32:58 +0100
Message-ID: <20130604093258.GS18614@n2100.arm.linux.org.uk>
References: <1370305185-6450-1-git-send-email-rvaswani@codeaurora.org> <1370305185-6450-3-git-send-email-rvaswani@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1370305185-6450-3-git-send-email-rvaswani@codeaurora.org>
Sender: linux-doc-owner@vger.kernel.org
To: Rohit Vaswani <rvaswani@codeaurora.org>
Cc: Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, David Brown <davidb@codeaurora.org>, Daniel Walker <dwalker@fifo99.com>, Bryan Huntsman <bryanh@codeaurora.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Mon, Jun 03, 2013 at 05:19:44PM -0700, Rohit Vaswani wrote:
> +	sc1_base_ptr = of_iomap(dn, 0);
> +	if (sc1_base_ptr) {
> +		writel_relaxed(0, sc1_base_ptr + VDD_SC1_ARRAY_CLAMP_GFS_CTL);
> +		writel_relaxed(0, sc1_base_ptr + SCSS_CPU1CORE_RESET);
> +		writel_relaxed(3, sc1_base_ptr + SCSS_DBG_STATUS_CORE_PWRDUP);
> +		mb();
> +		iounmap(sc1_base_ptr);

If you need to fiddle with power rails and resets for your secondary
core, you don't need any of the pen_release stuff, and you really
should get rid of it.  The pen_release stuff is only there for
platforms where there's no proper way of controlling the secondary
CPUs except by using a software method.

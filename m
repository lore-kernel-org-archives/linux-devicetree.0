From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH] ARM: kbuild: Fix forced rebuild after 'make dtbs'
Date: Tue, 25 Nov 2014 22:41:35 +0100
Message-ID: <5474F78F.2060906@suse.cz>
References: <CACRpkdYmJWy1_vs0tWRA7SvkQnvbXXKqf7pHpH5b5tZ6vR+KJg@mail.gmail.com> <1414961549-31666-1-git-send-email-jason@lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1414961549-31666-1-git-send-email-jason@lakedaemon.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Jason Cooper <jason@lakedaemon.net>, Russell King <linux@arm.linux.org.uk>, Linus Walleij <linus.walleij@linaro.org>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@linaro.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Dne 2.11.2014 v 21:52 Jason Cooper napsal(a):
> After this patch:
> 
>   f4d4ffc03efc kbuild: dtbs_install: new make target
> 
> was added the kernel tree, Linus Walleij noticed that 'make dtbs' forced
> a following 'make zImage' to rebuild the entire tree, even though
> nothing had changed.  His report:
> 
>   After this patch a while back I have observed the following behaviour
>   of the kernel build:
> 
>   make zImage
>   make zImage
>   -> incremental build, just relink
> 
>   make zImage
>   make dtbs
>   make zImage
>   -> The whole kernel gets rebuilt
> 
>   So now if I happen to recompile my device trees, I suddenly want
>   the entire zImage to be rebuilt to? It's by definition not changes
>   that affect the kernel build :-(
> 
>   I noticed this because my build scripts calls make dtbs && make
>   zImage, and started to rebuild absolutely everything all the time.
> 
> To fix this, we make only the dtbs_install target depend on the prepare
> target.  It's needed to make sure KERNELVERSION is calculated prior to
> installing.

If a mere 'make prepare' causes a rebuild of the whole kernel, then
there is something fishy in the ARM Makefiles. However, if you only need
the KERNELRELEASE variable, then you do not need to depend on prepare.
The main Makefile makes sure that silentoldconfig is ran and therefore
KERNELRELEASE set for all targets except make *config.

Michal

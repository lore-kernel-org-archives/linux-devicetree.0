From: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v6 18/18] remoteproc: core: Retry
 rproc_fw_config_virtio() if !rproc->table_ptr
Date: Thu, 7 Jul 2016 11:20:29 +0100
Message-ID: <20160707102029.GA8755@griffinp-ThinkPad-X1-Carbon-2nd>
References: <1467795276-21725-19-git-send-email-peter.griffin@linaro.org>
 <201607070935.iuu6KqiK%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201607070935.iuu6KqiK%fengguang.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: kbuild test robot <lkp-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: kbuild-all-JC7UmRfGjtg@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On Thu, 07 Jul 2016, kbuild test robot wrote:

> Hi,
> 
> [auto build test WARNING on robh/for-next]
> [also build test WARNING on v4.7-rc6 next-20160706]
> [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
> 
> url:    https://github.com/0day-ci/linux/commits/Peter-Griffin/Add-support-for-FDMA-DMA-controller-and-slim-core-rproc-found-on-STi-chipsets/20160706-170304
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
> config: openrisc-allyesconfig (attached as .config)
> compiler: or32-linux-gcc (GCC) 4.5.1-or32-1.0rc1
> reproduce:
>         wget https://git.kernel.org/cgit/linux/kernel/git/wfg/lkp-tests.git/plain/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         make.cross ARCH=openrisc 
> 
> All warnings (new ones prefixed by >>):
> 
> >> drivers/remoteproc/remoteproc_internal.h:52:13: warning: 'rproc_fw_config_virtio_cb' declared 'static' but never defined
> >> drivers/remoteproc/remoteproc_internal.h:53:13: warning:
> >> 'rproc_fw_config_virtio' declared 'static' but never defined

Will fix this in next version.

regards,

Peter.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

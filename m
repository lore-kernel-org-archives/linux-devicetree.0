From: Paolo Pisati <p.pisati-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 0/5] dts patches for qcom tsens support
Date: Wed, 24 Aug 2016 12:22:56 +0200
Message-ID: <20160824102256.GA14048@harukaze>
References: <1471411128-4002-1-git-send-email-rnayak@codeaurora.org>
 <20160817193340.GA18215@hector.attlocal.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160817193340.GA18215-3KkwrOJo9xYlRp7syxWybdHuzzzSOjJt@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rajendra Nayak <rnayak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Aug 17, 2016 at 02:33:40PM -0500, Andy Gross wrote:
> On Wed, Aug 17, 2016 at 10:48:43AM +0530, Rajendra Nayak wrote:
> > Hey Andy,
> > 
> > This is a respin of v2 with some minor fixes pointed out by Rob.
> > Please pull these in for 4.9
> > 
> > Thanks,
> > Rajendra
> 
> I pulled these in.

Did you try to read the content of the qfprom from userspace?

$ uname -a
Linux dragon410c 4.8.0-rc1+ #6 SMP PREEMPT Wed Aug 24 11:11:02 CEST 2016 aarch64
aarch64 aarch64 GNU/Linux
$ lsmod 
Module                  Size  Used by
nvmem_qfprom           16384  0
nvmem_core             24576  1 nvmem_qfprom
$ ls -la /sys/bus/nvmem/devices/                                                                             
total 0
drwxr-xr-x 2 root root 0 Aug 24 10:17 .
drwxr-xr-x 4 root root 0 Aug 24 10:15 ..
lrwxrwxrwx 1 root root 0 Aug 24 10:17 qfprom0 ->
../../../devices/platform/soc/5c000.qfprom/qfprom0
$ cat /sys/bus/nvmem/devices/qfprom0/nvmem 

[spontaneous reboot]

This using agross's for-next tree as of today ("54ba896 Merge branch
'arm64-defconfig-for-4.9' into all-for-4.8") and defconfig.
-- 
bye,
p.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

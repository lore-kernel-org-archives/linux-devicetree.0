From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 2/2] ARM: qcom_defconfig: Enable Qualcomm remoteproc and
 SMP2P drivers
Date: Tue, 7 Mar 2017 12:04:13 +0100
Message-ID: <20170307110413.GD49978@Bjorns-MacBook-Pro-2.local>
References: <20170215045157.11659-1-j.neuschaefer@gmx.net>
 <20170215045157.11659-2-j.neuschaefer@gmx.net>
 <20170304012032.GA1694@minitux>
 <20170305050125.b6lzx2fiest4xmre@latitude>
 <20170305164930.GA49943@Bjorns-MacBook-Pro-2.local>
 <20170307020145.xfqz4wolc3tuqv6x@latitude>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170307020145.xfqz4wolc3tuqv6x@latitude>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Jonathan Neusch?fer <j.neuschaefer@gmx.net>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, Andy Gross <andy.gross@linaro.org>
List-Id: devicetree@vger.kernel.org

On Tue 07 Mar 03:01 CET 2017, Jonathan Neusch?fer wrote:

> On Sun, Mar 05, 2017 at 04:49:30PM +0000, Bjorn Andersson wrote:
> > On Sun 05 Mar 05:01 GMT 2017, Jonathan Neusch?fer wrote:
> [...]
> > > FWIW, I enabled CONFIG_QCOM_SMSM on my test system (an Asus Padfone,
> > > based on MSM8974; I'm using the Sony Xperia Honami DT because it's close
> > > enough), and I think it failed to initialize:
> > > 
> > 
> > Using Honami should work so far, but please do write a patch adding the
> > Padfone, so that we don't accidentally break your HW at some point.
> 
> I can try how far I get, but unfortunately I don't have hardware
> documentation or schematics, because I'm a hobbyist.
> 

If this is something that you will continue to hack on and you think
anyone else will be interested in having then please do submit patches
for it.

> > > [    0.647743] qcom-smsm smsm: no smsm size info, using defaults
> > > [    0.647775] qcom-smsm smsm: unable to allocate shared state entry
> > > 
> > 
> > Could you please confirm where in qcom_smem_alloc_global() we're
> > failing? As far as I can tell we should fail with -EEXIST or if the
> > passed "size" parameter is bogus -ENOMEM (but the default number of
> > entries really should be less than the amount of free SMEM space).
> 
> * qcom_smem_get returns -EPROBE_DEFER:
> 
> 	void *ptr = ERR_PTR(-EPROBE_DEFER);
> 	if (!__smem)
> 		return ptr;
> 
> * smsm_get_size_info prints "no smsm size info, using defaults\n"
> * qcom_smem_alloc also returns -EPROBE_DEFER early.
> 
> 
> BTW, I think smsm_get_size_info is using uninitialized memory here:
> 
>         size_t size;    /* is uninitialized */
>         struct { ... } *info;
> 
>         /* qcom_smem_get returns early without setting size */
>         info = qcom_smem_get(QCOM_SMEM_HOST_ANY, SMEM_SMSM_SIZE_INFO, &size);
> 
>         /*
> 	 * PTR_ERR(info) is not -ENOENT.
>          * size (still uninitialized) is compared with the size of the local
>          * struct defined above.
> 	 */
>         if (PTR_ERR(info) == -ENOENT || size != sizeof(*info)) {
>                 ...
>         }
> 

Thanks for your analysis!

As you say the smsm driver is missing handling of probe deferral - which
is wrong. Could you please propose a patch checking for EPROBE_DEFER and
propagate this error as return value from probe()?  (Without an error
message)

Regards,
Bjorn

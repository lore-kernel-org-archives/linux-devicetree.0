From: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: qcom_defconfig: Enable Qualcomm remoteproc and
 SMP2P drivers
Date: Sun, 5 Mar 2017 16:49:30 +0000
Message-ID: <20170305164930.GA49943@Bjorns-MacBook-Pro-2.local>
References: <20170215045157.11659-1-j.neuschaefer@gmx.net>
 <20170215045157.11659-2-j.neuschaefer@gmx.net>
 <20170304012032.GA1694@minitux>
 <20170305050125.b6lzx2fiest4xmre@latitude>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170305050125.b6lzx2fiest4xmre@latitude>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Neusch?fer <j.neuschaefer-hi6Y0CQ0nG0@public.gmane.org>
Cc: linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun 05 Mar 05:01 GMT 2017, Jonathan Neusch?fer wrote:

> On Fri, Mar 03, 2017 at 05:20:32PM -0800, Bjorn Andersson wrote:
> > On Tue 14 Feb 20:51 PST 2017, Jonathan Neusch?fer wrote:
> > 
> > > Signed-off-by: Jonathan Neuschäfer <j.neuschaefer-hi6Y0CQ0nG0@public.gmane.org>
> > > ---
> > >  arch/arm/configs/qcom_defconfig | 5 +++++
> > >  1 file changed, 5 insertions(+)
> [...]
> > > +CONFIG_QCOM_SMP2P=y
> > 
> > We also need CONFIG_QCOM_SMSM=y here, its currently used to signal state
> > of the ring buffers for WiFi.
> 
> FWIW, I enabled CONFIG_QCOM_SMSM on my test system (an Asus Padfone,
> based on MSM8974; I'm using the Sony Xperia Honami DT because it's close
> enough), and I think it failed to initialize:
> 

Using Honami should work so far, but please do write a patch adding the
Padfone, so that we don't accidentally break your HW at some point.

> [    0.647743] qcom-smsm smsm: no smsm size info, using defaults
> [    0.647775] qcom-smsm smsm: unable to allocate shared state entry
> 

Could you please confirm where in qcom_smem_alloc_global() we're
failing? As far as I can tell we should fail with -EEXIST or if the
passed "size" parameter is bogus -ENOMEM (but the default number of
entries really should be less than the amount of free SMEM space).

> I think CONFIG_QCOM_WCNSS_CTRL may be needed too, but I'll leave that
> for a future patch because I don't understand WCNSS well enough.
> 

Missed that one, when the WCNSS firmware boots the WCNSS_CTRL driver is
probed - it will upload the NV parameter file to the WCNSS "OS" and when
that is done it will probe the WiFi and BT drivers.

So, you need it as well.

> > With the addition of that you have my:
> > 
> > Acked-by: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> 
> I'll send a v2 of this series with your R-b and A-b tags.
> 

Thanks,
Bjorn


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

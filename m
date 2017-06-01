From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v2 2/3] firmware: qcom: scm: Expose download-mode control
Date: Wed, 31 May 2017 23:17:30 -0700
Message-ID: <20170601061730.GM20170@codeaurora.org>
References: <20170527063308.10483-1-bjorn.andersson@linaro.org>
 <20170527063308.10483-2-bjorn.andersson@linaro.org>
 <20170531162726.GZ20170@codeaurora.org>
 <20170531220220.GW12920@tuxbook>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170531220220.GW12920@tuxbook>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, David Brown <david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 05/31, Bjorn Andersson wrote:
> On Wed 31 May 09:27 PDT 2017, Stephen Boyd wrote:
> 
> > On 05/26, Bjorn Andersson wrote:
> > > In order to aid post-mortem debugging the Qualcomm platforms provides a
> > > "memory download mode", where the boot loader will provide an interface
> > > for custom tools to "download" the content of RAM to a host machine.
> > > 
> > > The mode is triggered by writing a magic value somehwere in RAM, that is
> > > read in the boot code path after a warm-restart. Two mechanism for
> > > setting this magic value are supported in modern platforms; a direct SCM
> > > call to enable the mode or through a secure io write of a magic value.
> > > 
> > > In order for a normal reboot not to trigger "download mode" the magic
> > > must be cleared during a clean reboot.
> > > 
> > > Download mode has to be enabled by including qcom_scm.download_mode=1 on
> > > the command line.
> > 
> > Why the kernel command line parameter? If we keep the kernel
> > command line param, perhaps we can also gain a config option to
> > make it default enabled or default disabled so that we don't have
> > to specify it on the commandline to get the feature all the time.
> > 
> 
> I put a command line parameter there because most people will not have
> the tools to catch what's given to them by this. Making it a config
> option definitely makes more sense than forcing certain groups of
> engineers to always slap a kernel parameter in there.

Ok. Sounds good. The commandline will still be nice to have to
override whatever is in the build without having to recompile.
And it sounds like the plan is to have both pieces.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

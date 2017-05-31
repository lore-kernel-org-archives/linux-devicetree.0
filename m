From: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/3] firmware: qcom: scm: Expose download-mode control
Date: Wed, 31 May 2017 15:10:07 -0700
Message-ID: <20170531221007.GX12920@tuxbook>
References: <20170527063308.10483-1-bjorn.andersson@linaro.org>
 <20170527063308.10483-2-bjorn.andersson@linaro.org>
 <20170531193142.xnf5nvnq7iejnuva@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170531193142.xnf5nvnq7iejnuva@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, David Brown <david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed 31 May 12:31 PDT 2017, Rob Herring wrote:

> On Fri, May 26, 2017 at 11:33:07PM -0700, Bjorn Andersson wrote:
> > In order to aid post-mortem debugging the Qualcomm platforms provides a
> > "memory download mode", where the boot loader will provide an interface
> > for custom tools to "download" the content of RAM to a host machine.
> > 
> > The mode is triggered by writing a magic value somehwere in RAM, that is
> > read in the boot code path after a warm-restart. Two mechanism for
> > setting this magic value are supported in modern platforms; a direct SCM
> > call to enable the mode or through a secure io write of a magic value.
> > 
> > In order for a normal reboot not to trigger "download mode" the magic
> > must be cleared during a clean reboot.
> 
> This must be happening somewhere before the kernel is entered? Or 
> warm-restarts are not the norm?
> 

Not sure I'm getting what you're asking here.

We set the flag on boot and clear it on shutdown, that way the early
boot stages will be able to detect if the board restarted uncleanly -
e.g. from accessing a protected register.

> > Download mode has to be enabled by including qcom_scm.download_mode=1 on
> > the command line.
> 
> This looks similar to reboot reason functionality (i.e. boot into mode 
> X). I'd expect this to use that at least for the kernel. Not sure about 
> bindings though.
> 

It's very much like reboot reason except the small detail that we want
to enter this state when the board reboots without the kernels
knowledge.


Thinking about it, it may make sense to not clear the flag if we exit
through the panic handler. But if that's wanted it could be done in a
follow up patch, I only added this to catch an error where the RPM hit
its error handler and reboots the board.

Regards,
Bjorn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

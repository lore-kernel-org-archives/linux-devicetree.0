From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer-hi6Y0CQ0nG0@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: dts: msm8974: Hook up adsp-pil's xo clock
Date: Tue, 21 Feb 2017 17:29:43 +0100
Message-ID: <20170221162943.bpvv3eqf4l2mt74r@latitude>
References: <20170215045157.11659-1-j.neuschaefer@gmx.net>
 <20170220220041.GA3170@hector>
 <20170221054504.GA24291@minitux>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170221054504.GA24291@minitux>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jonathan Neusch?fer <j.neuschaefer-hi6Y0CQ0nG0@public.gmane.org>, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Feb 20, 2017 at 09:45:04PM -0800, Bjorn Andersson wrote:
> On Mon 20 Feb 14:00 PST 2017, Andy Gross wrote:
> 
> > On Wed, Feb 15, 2017 at 05:51:56AM +0100, Jonathan Neuschäfer wrote:
> > > Without this patch (and with CONFIG_QCOM_ADSP_PIL), I get this error:
> > > 
> > > 	[    0.711529] qcom_adsp_pil adsp-pil: failed to get xo clock
> > > 	[    0.711540] remoteproc remoteproc0: releasing adsp-pil
> > > 
> > > With this patch, adsp-pil can initialize correctly.
> > > 
> > > Signed-off-by: Jonathan Neuschäfer <j.neuschaefer-hi6Y0CQ0nG0@public.gmane.org>
> 
> Reviewed-by: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Thanks!

> The ADSP is running off a clock derived from XO, as such a vote for XO
> must be held while the ADSP is running. It's possible the all
> application CPUs hit idle after launching the ADSP, but before the ADSP
> firmware can communicate this need with the RPM, which would result in
> the votes hitting 0 and the RPM might gate the XO.
> 
> To prevent this the ADSP remoteproc driver must hold an extra vote with
> the RPM until the ADSP signals that it has cast its vote.
> 
> Unfortunately there are some issues with nested probe deferral in the
> clock framework, so we can't accurately describe the XO today and as
> we're still missing some last pieces of idle mechanism causing above
> events we can survive by faking it and using xo_board - for a little
> bit longer...

Ok, that makes sense.


Jonathan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

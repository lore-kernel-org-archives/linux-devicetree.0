From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v3 0/6] Add support for PDC Global on SDM845 SoCs
Date: Fri, 5 Oct 2018 11:48:04 -0700
Message-ID: <20181005184804.GA12063@builder>
References: <20180829191215.10071-1-sibis@codeaurora.org>
 <20180903193647.GJ3456@tuxbook-pro>
 <2ae729fe-321b-0918-a06c-d04e43b47101@codeaurora.org>
 <1538729187.3545.2.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1538729187.3545.2.camel@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Sibi Sankar <sibis@codeaurora.org>, mka@chromium.org, robh+dt@kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, tsoni@codeaurora.org
List-Id: devicetree@vger.kernel.org

On Fri 05 Oct 01:46 PDT 2018, Philipp Zabel wrote:

> Hi Sibi, Bjorn,
> 
> On Thu, 2018-10-04 at 23:57 +0530, Sibi Sankar wrote:
> > On 09/04/2018 01:06 AM, Bjorn Andersson wrote:
> [...]
> > > Philipp, there's no compile time dependencies between the PDC and
> > > remoteproc patches in this series. Will you take these two through your
> > > tree and I'll take the remaining four through the remoteproc tree?
> > > 
> > > Regards,
> > > Bjorn
> >
> >Hey Phillip,
> > 
> > Will the PDC driver make the cut for reset/next this time for the
> > 4.20rc?
> 
> I have applied patches 1 and 2 to reset/next. I'll send a pull request
> early next week.
> 

Thanks Philipp, I picked patch 3 through 6 in the rproc-next branch.

Regards,
Bjorn

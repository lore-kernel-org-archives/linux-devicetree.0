From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v3 0/6] Add support for PDC Global on SDM845 SoCs
Date: Fri, 05 Oct 2018 10:46:27 +0200
Message-ID: <1538729187.3545.2.camel@pengutronix.de>
References: <20180829191215.10071-1-sibis@codeaurora.org>
         <20180903193647.GJ3456@tuxbook-pro>
         <2ae729fe-321b-0918-a06c-d04e43b47101@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2ae729fe-321b-0918-a06c-d04e43b47101@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sibi Sankar <sibis@codeaurora.org>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: mka@chromium.org, robh+dt@kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, tsoni@codeaurora.org
List-Id: devicetree@vger.kernel.org

Hi Sibi, Bjorn,

On Thu, 2018-10-04 at 23:57 +0530, Sibi Sankar wrote:
> On 09/04/2018 01:06 AM, Bjorn Andersson wrote:
[...]
> > Philipp, there's no compile time dependencies between the PDC and
> > remoteproc patches in this series. Will you take these two through your
> > tree and I'll take the remaining four through the remoteproc tree?
> > 
> > Regards,
> > Bjorn
>
>Hey Phillip,
> 
> Will the PDC driver make the cut for reset/next this time for the
> 4.20rc?

I have applied patches 1 and 2 to reset/next. I'll send a pull request
early next week.

regards
Philipp

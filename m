From: Brian Norris <briannorris@chromium.org>
Subject: Re: [RFC PATCH] soc: qcom: rmtfs_mem: Control remoteproc from
 rmtfs_mem
Date: Wed, 17 Oct 2018 16:49:56 -0700
Message-ID: <20181017234954.GA179852@rodete-desktop-imager.corp.google.com>
References: <20180925080607.30565-1-bjorn.andersson@linaro.org>
 <20180925172943.GA118699@ban.mtv.corp.google.com>
 <20181002193445.GP2523@minitux>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181002193445.GP2523@minitux>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Sibi Sankar <sibis@codeaurora.org>, Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Bjorn,

Sorry for getting back to this late.

On Tue, Oct 02, 2018 at 12:34:45PM -0700, Bjorn Andersson wrote:
> On Tue 25 Sep 10:29 PDT 2018, Brian Norris wrote:
> For the record; I did consider making the rmtfs implementation the one
> driving the remoteproc state through /sys/class/remoteproc, but that
> would not cope with abnormal termination of the rmtfs implementation.

It could, if you had rmtfs always power cycle the modem on startup. But
we'd be in a bad situation in the meantime, so that might not be great.

> I will work up a patch making the remoteproc driver observe the presence
> of the RMTFS_QMI_SERVICE and see how that looks.

I believe Sibi Sankar already sent a v2 with the rmtfs driver doing this
instead. He also replied to this email with slightly different
suggestions; I'll try to reply to both of those.

Thanks,
Brian

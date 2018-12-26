From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 3/3] soc: qcom: Add AOSS QMP genpd provider
Date: Wed, 26 Dec 2018 12:30:33 -0800
Message-ID: <20181226203032.GF9704@minitux>
References: <20181112080557.22698-1-bjorn.andersson@linaro.org>
 <20181112080557.22698-4-bjorn.andersson@linaro.org>
 <dfd0096c-d1f1-da0e-7c4c-3da916d521dc@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <dfd0096c-d1f1-da0e-7c4c-3da916d521dc@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon 26 Nov 19:31 PST 2018, Sai Prakash Ranjan wrote:

> Hi Bjorn,
> 

Thanks for your review Sai!

> On 11/12/2018 1:35 PM, Bjorn Andersson wrote:
[..]
> > +static int qmp_pd_clock_toggle(struct qmp_pd *res, bool enable)
> > +{
> > +	char buf[96];
> > +	size_t n;
> > +
> > +	n = snprintf(buf, sizeof(buf), "{class: clock, res: %s, val: %d}",
> > +		     res->name, !!enable);
> > +	return qmp_send(res->qmp, buf, n);
> > +}
> > +
> 
> I was trying to get QDSS working with these patches and found one issue
> in qmp_send of qmp_pd_clock_toggle.
> 
> The third return value should be sizeof(buf) instead of n because n just
> returns len as 33 and the below check in qmp send will always fail and
> trigger WARN_ON's.
> 
>          if (WARN_ON(len % sizeof(u32))) {
>                  dev_err(qmp->dev, "message not 32-bit aligned\n");
>                  return -EINVAL;
>          }
> 
> Also I observed that multiple "ucore will not ack channel" messages with
> len being returned n instead of buf size.
> 

I must have been "lucky" when I did my final pass of cleanups and
retests, thanks for spotting this!

> One more thing is do we really require *WARN_ON and dev_err* both because it
> just spams the kernel logs, I think dev_err message is clear
> enough to be able to understand the error condition.
> 

No, that's just unnecessary.

Regards,
Bjorn

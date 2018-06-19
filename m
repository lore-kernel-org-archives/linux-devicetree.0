From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v3 7/7] soc: qcom: rpmpd/rpmhpd: Add a max vote on all
 corners at init
Date: Tue, 19 Jun 2018 15:40:16 +0530
Message-ID: <20180619101016.hbgjvev7d3h4yg7x@vireshk-i7>
References: <20180612044052.4402-1-rnayak@codeaurora.org>
 <20180612044052.4402-8-rnayak@codeaurora.org>
 <414598de-00a1-9ce7-3a7e-4a95fd1bd35d@codeaurora.org>
 <f5014664-1639-c610-a50a-db66484428dc@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <f5014664-1639-c610-a50a-db66484428dc@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rajendra Nayak <rnayak@codeaurora.org>
Cc: David Collins <collinsd@codeaurora.org>, sboyd@kernel.org, andy.gross@linaro.org, ulf.hansson@linaro.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 14-06-18, 12:05, Rajendra Nayak wrote:
> On 06/14/2018 03:58 AM, David Collins wrote:
> > Hello Rajendra,
> > 
> > On 06/11/2018 09:40 PM, Rajendra Nayak wrote:
> >> As we move from no clients/consumers in kernel voting on corners,
> >> to *some* voting and some not voting, we might end up in a situation
> >> where the clients which remove votes can adversly impact others
> > 
> > s/adversly/adversely/
> > 
> >> who still don't have a way to vote.
> >>
> >> To avoid this situation, have a max vote on all corners at init.
> >> This should/can be removed once we have all clients moved to
> >> be able to vote/unvote for themselves.
> > 
> > This change seems like a hack.  Do you intend for it to be merged and then
> > later reverted in Linus's tree?  Could it instead be implemented in a way
> > that does not require reverting and instead is enabled by some DT
> > property?  Alternatively, could this feature be added to the power domain
> > core since it is relatively generic?
> > 
> > 
> >> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> >> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
> >> ---
> >>  drivers/soc/qcom/rpmhpd.c | 12 +++++++++++-
> >>  drivers/soc/qcom/rpmpd.c  |  9 +++++++++
> >>  2 files changed, 20 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/soc/qcom/rpmhpd.c b/drivers/soc/qcom/rpmhpd.c
> >> index 7083ec1590ff..3c753d33aeee 100644
> >> --- a/drivers/soc/qcom/rpmhpd.c
> >> +++ b/drivers/soc/qcom/rpmhpd.c
> >> @@ -329,7 +329,7 @@ static int rpmhpd_update_level_mapping(struct rpmhpd *rpmhpd)
> >>  
> >>  static int rpmhpd_probe(struct platform_device *pdev)
> >>  {
> >> -	int i, ret;
> >> +	int i, ret, max_level;
> >>  	size_t num;
> >>  	struct genpd_onecell_data *data;
> >>  	struct rpmhpd **rpmhpds;
> >> @@ -390,6 +390,16 @@ static int rpmhpd_probe(struct platform_device *pdev)
> >>  		pm_genpd_init(&rpmhpds[i]->pd, NULL, true);
> >>  
> >>  		data->domains[i] = &rpmhpds[i]->pd;
> >> +
> >> +		/*
> >> +		 * Until we have all consumers voting on corners
> >> +		 * just vote the max corner on all PDs
> >> +		 * This should ideally be *removed* once we have
> >> +		 * all (most) consumers being able to vote
> >> +		 */
> >> +		max_level = rpmhpds[i]->level_count - 1;
> >> +		rpmhpd_set_performance(&rpmhpds[i]->pd, rpmhpds[i]->level[max_level]);
> >> +		rpmhpd_power_on(&rpmhpds[i]->pd);
> > 
> > Clearly these calls will result in max level requests being sent for all
> > power domains at probe time.  However, it isn't clear that this will
> > actually help at runtime in these two cases:
> > 
> > 1. A consumer enables and then disables a power domain.
> > 	- It seems like the PD would just be disabled in this case.

So instead of rpmhpd_power_on() we should be doing gepnd_power_on() or whatever
the API is, so the user count stays at 1.

> > 2. A consumer sets a non-max performance state of a power domain.
> > 	- It seems like the PD would just be set to the new lower
> > 	  performance state since the max vote isn't known to the
> > 	  PD core for aggregation purposes.

Right, and that's because the patch isn't implemented properly yet. I asked to
do a fake vote from some user with their dev structure, so the vote always
stays.

> Yes, you are right. I certainly did not seem to have thought through this enough.
> 
> A need for something like this came up at a point where genpd could not deal with
> devices with multiple power domains. So the concern at that point was that if some
> consumers (which only need to vote on one corner) move to using this driver, while 
> some others (which need to vote on multiple corners) cannot, we would end up breaking
> them.
> 
> That does not seem to be true anymore since we do have patches from Ulf which support
> having devices with multiple power domains attached which can be controlled individually.
> So if some consumer voting makes some others break, they should just be fixed and patched
> to vote as well. If all this gets handled centrally from within the clock drivers then we
> most likely won't even end up with a situation like this.
> 
> I think I will just drop this one unless Stephen/Viresh still see an issue with some early
> voters breaking others.

So what if the LCD/DDR/etc are getting used at boot and someone requests a lower
vote?  Wouldn't we just break ?

-- 
viresh

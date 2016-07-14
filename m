From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH v4 4/7] rtc: ac100: Add clk output support
Date: Thu, 14 Jul 2016 11:34:34 +0800
Message-ID: <CAGb2v67ft=EktCcfGFdBN1K4SoOyK+Stz2WuvqScMmRjoBWxfA@mail.gmail.com>
References: <1467302331-9663-1-git-send-email-wens@csie.org>
 <1467302331-9663-5-git-send-email-wens@csie.org> <146800297598.73491.13472152266331488346@resonance>
Reply-To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <rtc-linux+bncBCMILY6JWQBBBYUQTS6AKGQEAXVNBQI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <146800297598.73491.13472152266331488346@resonance>
List-Post: <https://groups.google.com/group/rtc-linux/post>, <mailto:rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:rtc-linux+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/rtc-linux
List-Subscribe: <https://groups.google.com/group/rtc-linux/subscribe>, <mailto:rtc-linux+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+712029733259+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/rtc-linux/subscribe>
To: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Jul 9, 2016 at 2:36 AM, Michael Turquette
<mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> wrote:
> Quoting Chen-Yu Tsai (2016-06-30 08:58:48)
>> +static long ac100_clkout_round_rate(struct clk_hw *hw, unsigned long rate,
>> +                                   unsigned long prate)
>> +{
>> +       unsigned long best_rate = 0, tmp_rate, tmp_prate;
>> +       int i;
>> +
>> +       if (prate == AC100_RTC_32K_RATE)
>> +               return divider_round_rate(hw, rate, &prate, NULL,
>> +                                         AC100_CLKOUT_DIV_WIDTH,
>> +                                         CLK_DIVIDER_POWER_OF_TWO);
>> +
>> +       for (i = 0; ac100_clkout_prediv[i].div; i++) {
>> +               tmp_prate = DIV_ROUND_UP(prate, ac100_clkout_prediv[i].val);
>> +               tmp_rate = divider_round_rate(hw, rate, &tmp_prate, NULL,
>> +                                             AC100_CLKOUT_DIV_WIDTH,
>> +                                             CLK_DIVIDER_POWER_OF_TWO);
>> +
>> +               if (tmp_rate > rate)
>> +                       continue;
>> +               if (rate - tmp_rate < best_rate - tmp_rate)
>> +                       best_rate = tmp_rate;
>> +       }
>> +
>> +       return best_rate;
>> +}
>> +
>> +static int ac100_clkout_determine_rate(struct clk_hw *hw,
>> +                                      struct clk_rate_request *req)
>> +{
>> +       struct clk_hw *best_parent;
>> +       unsigned long best = 0;
>> +       int i, num_parents = clk_hw_get_num_parents(hw);
>> +
>> +       for (i = 0; i < num_parents; i++) {
>> +               struct clk_hw *parent = clk_hw_get_parent_by_index(hw, i);
>> +               unsigned long tmp, prate = clk_hw_get_rate(parent);
>> +
>> +               tmp = ac100_clkout_round_rate(hw, req->rate, prate);
>> +
>> +               if (tmp > req->rate)
>> +                       continue;
>> +               if (req->rate - tmp < req->rate - best) {
>> +                       best = tmp;
>> +                       best_parent = parent;
>> +               }
>> +       }
>> +
>> +       if (!best)
>> +               return -EINVAL;
>> +
>> +       req->best_parent_hw = best_parent;
>> +       req->best_parent_rate = best;
>> +       req->rate = best;
>> +
>> +       return 0;
>> +}
>
> You only need one of the two functions above. Keep the .determine_rate
> callback and drop .round_rate.

Only .round_rate is set in the clk_ops. ac100_clkout_round_rate just
serves to split out some of the calculations done per parent.

> Otherwise the rest of the clk support looks great to me. Feel free to
> add:
>
> Reviewed-by: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>

Thanks!

ChenYu

-- 
You received this message because you are subscribed to "rtc-linux".
Membership options at http://groups.google.com/group/rtc-linux .
Please read http://groups.google.com/group/rtc-linux/web/checklist
before submitting a driver.
--- 
You received this message because you are subscribed to the Google Groups "rtc-linux" group.
To unsubscribe from this group and stop receiving emails from it, send an email to rtc-linux+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

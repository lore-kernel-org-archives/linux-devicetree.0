From: Lina Iyer <ilina@codeaurora.org>
Subject: Re: [PATCH v2 5/6] soc: qcom: rpmh powerdomain driver
Date: Wed, 13 Jun 2018 12:29:00 -0600
Message-ID: <20180613182900.GB22824@codeaurora.org>
References: <20180525100121.28214-1-rnayak@codeaurora.org>
 <20180525100121.28214-6-rnayak@codeaurora.org>
 <215deee5-6472-d587-9a90-f7158162ed82@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <215deee5-6472-d587-9a90-f7158162ed82@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Collins <collinsd@codeaurora.org>
Cc: Rajendra Nayak <rnayak@codeaurora.org>, viresh.kumar@linaro.org, sboyd@kernel.org, andy.gross@linaro.org, ulf.hansson@linaro.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, May 25 2018 at 19:08 -0600, David Collins wrote:
>Hello Rajendra,
>
>On 05/25/2018 03:01 AM, Rajendra Nayak wrote:
>> +
>> +	to_active_sleep(pd, pd->corner, &this_corner, &this_sleep_corner);
>> +
>> +	if (peer && peer->enabled)
>> +		to_active_sleep(peer, peer->corner, &peer_corner,
>> +				&peer_sleep_corner);
>> +
>> +	active_corner = max(this_corner, peer_corner);
>> +
>> +	ret = rpmhpd_send_corner(pd, RPMH_ACTIVE_ONLY_STATE, active_corner);
>> +	if (ret)
>> +		return ret;
>> +
>> +	sleep_corner = max(this_sleep_corner, peer_sleep_corner);
>> +
>> +	return rpmhpd_send_corner(pd, RPMH_SLEEP_STATE, sleep_corner);
>> +}
>
>This aggregation function as well as the rpmhpd_send_corner() calls below
>are not sufficient for RPMh.  There are 3 states that must all be used:
>RPMH_ACTIVE_ONLY_STATE, RPMH_WAKE_ONLY_STATE, and RPMH_SLEEP_STATE.  The
>naming is somewhat confusing as rpmhpd is defining a different concept of
>active-only.
>
>For power domains without active-only or peers, only
>RPMH_ACTIVE_ONLY_STATE should be used.  This instructs RPMh to issue the
>request immediately.
>
>For power domains with active-only, requests will need to be made for all
>three.  active_corner would be sent for both RPMH_ACTIVE_ONLY_STATE (so
>that the request takes effect immediately) and RPMH_WAKE_ONLY_STATE (so
>that the request is inserted into the wake TCS).  sleep_corner would be
>sent for RPMH_SLEEP_STATE (so that the request is inserted into the sleep
>TCS).
>
>You can see how this is handled in the RPMh clock driver in patch [3].
>
>You may be able to get away with using only RPMH_SLEEP_STATE and
>RPMH_ACTIVE_ONLY_STATE assuming that you issue the RPMH_SLEEP_STATE
>request first due to the rpmh driver caching behavior added in the
>cache_rpm_request() function in [4].  However, could you please confirm
>with Lina that this usage will continue to work in the future?  I'm not
>sure what guarantees are made at the rpmh API level.
>
We expect to cache all active values into wake if there was a sleep
value already defined. Expect to continue this behavior in the future
as well. But it would be safer for you to send sleep and wake votes in
addition to active votes. It shouldn't add too much of an overhead.

-- Lina

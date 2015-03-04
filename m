From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH 4/4] regulator: qcom: Rework to single platform device
Date: Tue, 03 Mar 2015 16:01:43 -0800
Message-ID: <54F64B67.9060608@codeaurora.org>
References: <1425356740-26285-1-git-send-email-bjorn.andersson@sonymobile.com> <1425356740-26285-5-git-send-email-bjorn.andersson@sonymobile.com> <54F630FF.60109@codeaurora.org> <20150303223235.GK26334@sonymobile.com> <20150303235209.GG21293@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150303235209.GG21293-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Andy Gross <agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 03/03/15 15:52, Mark Brown wrote:
> On Tue, Mar 03, 2015 at 02:32:35PM -0800, Bjorn Andersson wrote:
>> On Tue 03 Mar 14:09 PST 2015, Stephen Boyd wrote:
>>> How does this work for the case where we may not want to add all the
>>> regulators that a PMIC supports. I'm mostly thinking about the case
>>> where we want to use the pm8xxx-regulator driver for a few regulators
>>> and so we omit them from the DT for the RPM regulators.
>> An empty or non-existing regulator of_node will still be registered, but
>> without REGULATOR_CHANGE_STATUS nor REGULATOR_CHANGE_VOLTAGE; so any
>> operation on this regulator will fail with an -EPERM.
> ...but of course we'd never try any operations on it anyway as there
> would be no consumers.

Yes sounds fine. The only concern is that we're probably wasting memory
with things that won't ever "match" something in DT.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

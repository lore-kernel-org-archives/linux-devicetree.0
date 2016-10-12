From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC V2 PATCH 09/12] arm64: dts: move Huawei Angler (Nexus 6P) to
 qcom directory
Date: Tue, 11 Oct 2016 19:32:36 -0500
Message-ID: <CAL_JsqJPQCVdDWdmLETArnCJ1xYnSRARn2bCRcz=k7pq2=qv6A@mail.gmail.com>
References: <1475375919-618-1-git-send-email-jmcnicol@redhat.com>
 <1475375919-618-10-git-send-email-jmcnicol@redhat.com> <20161009012854.GJ18158@rob-hp-laptop>
 <4611eab0-84b3-3c6f-2df0-87fe21afc8df@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4611eab0-84b3-3c6f-2df0-87fe21afc8df-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jeremy McNicoll <jmcnicol-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, git-LJ92rlH3Dns@public.gmane.org, jeremymc-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-arm-msm <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Oct 10, 2016 at 5:21 PM, Jeremy McNicoll <jmcnicol-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> On 2016-10-08 6:28 PM, Rob Herring wrote:
>>
>> On Sat, Oct 01, 2016 at 07:38:36PM -0700, Jeremy McNicoll wrote:
>>>
>>> Given that this is a MSM SoC and not a specific vendor created
>>> SoC moving associated device tree files to qcom directory.
>>>
>>> Signed-off-by: Jeremy McNicoll <jeremymc-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>>> ---
>>>  arch/arm64/boot/dts/huawei/Makefile                             | 5
>>> -----
>>>  arch/arm64/boot/dts/qcom/Makefile                               | 4 ++--
>>>  arch/arm64/boot/dts/{huawei => qcom}/msm8994-angler-rev-101.dts | 2 +-
>>
>>
>> What tree are you based on? There's no huawei dir in mainline. You need
>> to rebase everything.
>
>
> One change was made to 8/12 and explicitly documented, unfortunately the
> list was getting long.   A way to deal with this situation was discussed on
> IRC with a few people regarding the best way to deal with this, and this is
> how they instructed me to deal with this type of scenario.

You are not changing anything important here. Squash this, maintain
the original author, and just note that you moved the location before
your signoff. No one wants to see the original out of tree code.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: Georgi Djakov <georgi.djakov@linaro.org>
Subject: Re: [RESEND/PATCH v6 3/3] clk: qcom: Add A53 clock driver
Date: Tue, 6 Dec 2016 16:47:55 +0200
Message-ID: <8674bc87-4768-ec93-7bf2-18a07df1cb9a@linaro.org>
References: <20161019132816.31073-4-georgi.djakov@linaro.org>
 <20161028015438.GG16026@codeaurora.org> <20161102205910.GQ25787@tuxbot>
 <20161102225520.GW16026@codeaurora.org> <20161103182834.GR25787@tuxbot>
 <549f87fe-7be9-14b4-8e34-86f7f8dad94e@linaro.org>
 <20161114203426.GN5177@codeaurora.org> <20161205212644.GB30492@tuxbot>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161205212644.GB30492@tuxbot>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

On 12/05/2016 11:26 PM, Bjorn Andersson wrote:
> On Mon 14 Nov 14:21 PST 2016, Stephen Boyd wrote:
>
>> On 11/11, Georgi Djakov wrote:
>>> On 11/03/2016 08:28 PM, Bjorn Andersson wrote:
> [..]
>>>> I'm in favour of us inventing a kicker API and it's found outside out
>>>> use cases as well (e.g. virtio/rpmsg).
>>>>
>>
>> I'd rather we did this kicker API as well. That way we don't need
>> to make a syscon and a simple-mfd to get software to work
>> properly. Don't other silicon vendors need a kicker API as well?
>> How are they kicking remote processors in other places? GPIOs?
>>
>
> In remoteproc I have two of these:
> 1) da8xx_remoteproc ioremaps a register and writes a bit in it (looks
>    similar to the downstream Qualcomm way)
>
> 2) omap_remoteproc acquires a mbox channel, in which it writes a
>    virtqueue id to kick the remote.
>
> So one of the two cases could have used such mechanism.
>

I also see the potential users of such API mostly in the 
remoteproc/rpmgs subsystems.

> We could write up a Qualcomm specific "kicker" and probe the mailing
> list regarding the interest in making that generic (i.e. changing the
> names in the API and DT binding).

Yes, i am planing to do this.

>
> The sucky part is that I believe we have most of our kickers in place
> already so rpm, smd, smp2p, smsm etc would all need to support both
> mechanisms.

Agree.. we have to keep compatibility with existing dtbs.

Thanks,
Georgi

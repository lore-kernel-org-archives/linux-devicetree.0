From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2] of: use hash based search in of_find_node_by_phandle
Date: Mon, 29 Jan 2018 09:10:30 -0600
Message-ID: <CAL_JsqLwRYOYQ3WJ08AznZcN_BpR-udWw859W5q-CPKh=rPNFQ@mail.gmail.com>
References: <1516955496-17236-1-git-send-email-cpandya@codeaurora.org>
 <f08592cf-5e49-e631-c481-e166b741f25e@prevas.dk> <aa84e40d-5032-1d1d-6146-391ca1e5e528@codeaurora.org>
 <CAL_JsqJ=6bmOZCsj=NVthgXsZRRjyhQUDv0-CrngF_1MaYtKqA@mail.gmail.com>
 <20180126213943.7zwijanlbrq3y666@rob-hp-laptop> <b20292f5-e080-2b66-bae6-4a230cb0627a@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <b20292f5-e080-2b66-bae6-4a230cb0627a@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Chintan Pandya <cpandya@codeaurora.org>
Cc: Rasmus Villemoes <rasmus.villemoes@prevas.dk>, Frank Rowand <frowand.list@gmail.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 29, 2018 at 1:34 AM, Chintan Pandya <cpandya@codeaurora.org> wrote:
>
>> I was curious, so I implemented it. It ends up being similar to Rasmus's
>> 1st suggestion. The difference is we don't try to store all entries, but
>> rather implement a hash table that doesn't handle collisions. Relying on
>> the fact that phandles are just linearly allocated from 0, we just mask
>> the high bits of the phandle to get the index.
>
> I think this is most resourceful way.
>>
>> Can you try out on your setup and try different
>> array sizes.
>
> Here are my test results. However, I simply considered overall boot time to
> compare different scenarios because profiling of_find_node_by_phandle() in
> early boot fails.
>
> Scenarios:
> [1] Cache size 1024 + early cache build up [Small change in your cache
> patch,
>     see the patch below]
> [2] Hash 64 approach[my original v2 patch]
> [3] Cache size 64
> [4] Cache size 128
> [5] Cache size 256
> [6] Base build
>
> Result (boot to shell in sec):
> [1] 14.292498 14.370994 14.313537 --> 850ms avg gain
> [2] 14.340981 14.395900 14.398149 --> 800ms avg gain
> [3] 14.546429 14.488783 14.468694 --> 680ms avg gain
> [4] 14.506007 14.497487 14.523062 --> 670ms avg gain
> [5] 14.671100 14.643344 14.731853 --> 500ms avg gain

It's strange that bigger sizes are slower. Based on this data, I'd pick [3].

How many phandles do you have? I thought it was hundreds, so 1024
entries would be more than enough and you should see some curve to a
max gain as cache size approaches # of phandles.

Rob

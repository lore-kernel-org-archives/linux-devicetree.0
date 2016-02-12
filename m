From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] scripts/dtc: dtx_diff - add info to error message
Date: Thu, 11 Feb 2016 19:41:57 -0600
Message-ID: <CAL_JsqL0CpbcACqNjo1u7KYUz_rnKVWj8ZjKuyE2mefNw=Li4A@mail.gmail.com>
References: <56B0FD4B.8080600@gmail.com> <56BD2C6D.6000400@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <56BD2C6D.6000400@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Rowand <frowand.list@gmail.com>
Cc: Grant Likely <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux Kernel list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 11, 2016 at 6:50 PM, Frank Rowand <frowand.list@gmail.com> wrote:
> On 2/2/2016 11:02 AM, Frank Rowand wrote:
>> From: Frank Rowand <frank.rowand@sonymobile.com>
>>
>> If kernel config options are not properly set, "make scripts" will not
>> compile dtc.  Update the unable to find dtc error message to check
>> the kernel config and give better advice on how to create dtc.
>>
>> Reword another error message to increase clarity.
>>
>> Signed-off-by: Frank Rowand <frank.rowand@sonymobile.com>
>
> < snip >
>
> Ping, no reply on original email.

No comment, no reply. I only reply with "applied" when I actually
apply stuff which tends to be at least several weeks. Otherwise, I
might tell you applied and then miss it. :)

Anyway, now applied.

> In the thread about the of ir msi-map patch you mentioned that you have nothing
> else queued for 4.5.  Is dtx_diff (and hopefully this patch) queued up for 4.6?
> If so, could they instead go into 4.5 since they are support tools, and do not
> directly impact the kernel?

It's not a fix either though, so no, it's queued for 4.6 and has been
since -rc1.

Rob

From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH v5 3/3] of: add early boot allocation of
 of_find_node_by_phandle() cache
Date: Mon, 5 Mar 2018 19:12:05 -0800
Message-ID: <c5393057-b0e0-7e9d-041a-96996cf047b2@gmail.com>
References: <1520208889-3908-1-git-send-email-frowand.list@gmail.com>
 <1520208889-3908-4-git-send-email-frowand.list@gmail.com>
 <CAL_Jsq+sD=Hj+3cYy0injRSZ5Dj2M6c+KbiFrrwsO_9pqq8wKg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_Jsq+sD=Hj+3cYy0injRSZ5Dj2M6c+KbiFrrwsO_9pqq8wKg@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Chintan Pandya <cpandya@codeaurora.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 03/05/18 12:26, Rob Herring wrote:
> On Sun, Mar 4, 2018 at 6:14 PM,  <frowand.list@gmail.com> wrote:
>> From: Frank Rowand <frank.rowand@sony.com>
>>
>> The initial implementation of the of_find_node_by_phandle() cache
>> allocates the cache using kcalloc().  Add an early boot allocation
>> of the cache so it will be usable during early boot.  Switch over
>> to the kcalloc() based cache once normal memory allocation
>> becomes available.
> 
> Do we get a lot of lookups early? It makes sense to me to do early,
> but freeing and repopulating seems to add needless complexity.

Hey, that was my argument.  :-)

I would be quite happy leaving off patch 3/3.  And without 3/3,
2/3 becomes not necessary here, but still could go in separately
for completeness.  Though it could go in via Andrew.

-Frank

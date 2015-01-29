From: Paul Walmsley <pwalmsley@nvidia.com>
Subject: Re: [PATCH 01/24] Documentation: DT: document compatible string existence
 requirement
Date: Thu, 29 Jan 2015 10:06:21 -0700
Message-ID: <54CA688D.9070209@nvidia.com>
References: <20150128234935.20644.89300.stgit@dusk.lan>
 <20150128234936.20644.76672.stgit@dusk.lan>
 <54CA6331.3010909@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <54CA6331.3010909@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Paul Walmsley <paul@pwsan.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Hello Javier,

On 01/29/2015 09:43 AM, Javier Martinez Canillas wrote:
> Hello Paul,
>
> On 01/29/2015 12:49 AM, Paul Walmsley wrote:
>> DT maintainers require all compatible strings used in chip or board
>> DTS file to be previously documented somewhere in
>> Documentation/devicetree/bindings, per:
>>
>> http://marc.info/?l=linux-tegra&m=142201349727836&w=2
>>
> I would had preferred if checkpatch.pl didn't warn about the most specific
> variants of the IP blocks tbh.
>
> Since afaiu those were only added to the compatible string as a way to make
> it future proof in case there is going to be needed later. So in that sense
> I thought they were not part of the DT ABI.
>
> Now, dumping the unused specific strings in binding docs only to make
> checkpatch happy, will have the effect of making those unused strings become
> part of the DT ABI. Which mean that couldn't be dropped later if those are
> found to not be needed since there won't be a way to know if an OS following
> the DT binding will be matching those or not.
>
> But since the decision is to warn for all strings in a compatible property
> even if those are not used, I agree with you that it should be documented.
>
> Reviewed-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>

Thanks for the review.

For what it's worth, I agree with almost everything you wrote.

- Paul

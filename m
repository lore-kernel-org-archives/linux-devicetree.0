From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH 2/5] ARM: davinci: Don't append git rev to local version
Date: Wed, 26 Oct 2016 16:24:17 +0530
Message-ID: <47ad8be9-54e0-4e0c-3ff5-31662e6ca4de@ti.com>
References: <1477075018-20176-1-git-send-email-david@lechnology.com>
 <1477075018-20176-3-git-send-email-david@lechnology.com>
 <20f3efba-4f79-3675-d2ce-09efe90fb692@ti.com>
 <bf8cac01-910d-5afa-e840-f0d7ee96d22a@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <bf8cac01-910d-5afa-e840-f0d7ee96d22a@lechnology.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Lechner <david@lechnology.com>, Kevin Hilman <khilman@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Monday 24 October 2016 08:45 PM, David Lechner wrote:
> On 10/24/2016 06:35 AM, Sekhar Nori wrote:
>> On Saturday 22 October 2016 12:06 AM, David Lechner wrote:
>>> In the davinci default configuration, don't append the git revision to
>>> the local kernel version by. This seems like the more desirable default
>>> value.
>>
>> Why? To the contrary I actually quite like the fact that the git commit
>> is appended to version string. Makes it easy for me to cross-check that
>> I am booting the right image.
>>
>>>
>>> Signed-off-by: David Lechner <david@lechnology.com>
>>
>> Thanks,
>> Sekhar
>>
> 
> Each time you make a commit, you get a new version, which installs
> another copy of the kernel modules on the device. This will fill up the
> SD card if you are making many commits.

Right, but thats easily fixable by removing existing modules before
installing new ones.

> Also, if someone wants to build the mainline kernel using the default
> configuration, it seems odd to have a git revision tacked on to the end
> even though you made no revisions.

If you checkout a tag and build, then no commit information is added.
Which I guess is what most end users will do.

I don't see this done in other defconfigs like omap2plus and multi_v7 as
well. I would like to keep it similar for davinci.

Thanks,
Sekhar

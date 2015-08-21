From: Rameshwar Sahu <rsahu@apm.com>
Subject: Re: [PATCH] dmaengine: xgene-dma: Fix holding lock while calling tx
 callback in cleanup path
Date: Fri, 21 Aug 2015 14:20:58 +0530
Message-ID: <CAFd313xZ1ZinER=xRnMDX4e_Z02+AtKDoKYaUaQ7BWGpfBg3iw@mail.gmail.com>
References: <1440066656-15516-1-git-send-email-rsahu@apm.com>
	<20150821083946.GO13546@localhost>
	<CAFd313wEAWjzJa82R1ujh3vyMasDvicQ4nZHq1qqZ5y7D4ixzQ@mail.gmail.com>
	<20150821085146.GP13546@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150821085146.GP13546@localhost>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vinod.koul@intel.com>
Cc: dan.j.williams@intel.com, dmaengine@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, jcm@redhat.com, patches@apm.com
List-Id: devicetree@vger.kernel.org

On Fri, Aug 21, 2015 at 2:21 PM, Vinod Koul <vinod.koul@intel.com> wrote:
> On Fri, Aug 21, 2015 at 02:15:08PM +0530, Rameshwar Sahu wrote:
>> Hi Vinod,
>>
>> On Fri, Aug 21, 2015 at 2:09 PM, Vinod Koul <vinod.koul@intel.com> wrote:
>> > On Thu, Aug 20, 2015 at 04:00:56PM +0530, Rameshwar Prasad Sahu wrote:
>> >> This patch fixes the an locking issue where client callback performs
>> >                 ^^^^^^^^^^^^
>> > ??
>> >
>> >> further submission.
>> > Do you men you are preventing that or fixing for this to be allowed?
>>
>> Fixing lock to allow client to submit further request in there
>> callback routine if they would like.
>
> Okay please fix the changelog to make it clear :)

Okay Vinod

>
> --
> ~Vinod
>
> --
> To unsubscribe from this list: send the line "unsubscribe dmaengine" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

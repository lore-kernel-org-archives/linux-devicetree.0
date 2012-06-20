From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH] of: export of_platform_populate()
Date: Wed, 20 Jun 2012 14:32:53 -0500
Message-ID: <4FE22565.3050807@gmail.com>
References: <1339113456-27089-1-git-send-email-swarren@wwwdotorg.org> <4FD60030.8090700@gmail.com> <4FE20FB8.1020601@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4FE20FB8.1020601@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Grant Likely <grant.likely@secretlab.ca>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 06/20/2012 01:00 PM, Stephen Warren wrote:
> On 06/11/2012 08:26 AM, Rob Herring wrote:
>> On 06/07/2012 06:57 PM, Stephen Warren wrote:
>>> From: Stephen Warren <swarren@nvidia.com>
>>>
>>> Without this, modules can't use this API, leading to build failures.
>>>
>>> Signed-off-by: Stephen Warren <swarren@nvidia.com>
>>> ---
>>
>> Applied for 3.5.
> 
> Thanks.
> 
> Do you know when it will show up in linux-next and/or 3.5 itself? The
> patch hasn't rebased out of my local tree yet.

Unless I missed it, Grant has not yet pulled my pull request with this.
I'm just the maillist patch monkey. :)

Rob

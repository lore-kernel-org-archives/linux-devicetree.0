From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH] of: export of_platform_populate()
Date: Wed, 20 Jun 2012 12:00:24 -0600
Message-ID: <4FE20FB8.1020601@wwwdotorg.org>
References: <1339113456-27089-1-git-send-email-swarren@wwwdotorg.org> <4FD60030.8090700@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4FD60030.8090700@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 06/11/2012 08:26 AM, Rob Herring wrote:
> On 06/07/2012 06:57 PM, Stephen Warren wrote:
>> From: Stephen Warren <swarren@nvidia.com>
>>
>> Without this, modules can't use this API, leading to build failures.
>>
>> Signed-off-by: Stephen Warren <swarren@nvidia.com>
>> ---
> 
> Applied for 3.5.

Thanks.

Do you know when it will show up in linux-next and/or 3.5 itself? The
patch hasn't rebased out of my local tree yet.

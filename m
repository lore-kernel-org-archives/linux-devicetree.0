From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: Re: linux-next: Tree for Apr 10 (media and OF)
Date: Thu, 11 Apr 2013 00:00:35 +0200
Message-ID: <5165E103.3020106@gmail.com>
References: <20130410184852.92a3a02bbe5c3a040be76365@canb.auug.org.au> <5165DB54.90508@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5165DB54.90508@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media <linux-media@vger.kernel.org>, devicetree-discuss@lists.ozlabs.org, Rob Herring <rob.herring@calxeda.com>
List-Id: devicetree@vger.kernel.org

On 04/10/2013 11:36 PM, Randy Dunlap wrote:
> On 04/10/13 01:48, Stephen Rothwell wrote:
>> Hi all,
>>
>> Changes since 20130409:
>>
>
>
> on i386:
>
> ERROR: "of_get_next_parent" [drivers/media/v4l2-core/videodev.ko] undefined!
>
>
> 'of_get_next_parent()' should be exported for use by modules...?

Yes, there was already a patch submitted for this [1]. Hopefully it gets
picked soon so we don't see such errors. That's my oversight, sorry 
about it.

[1] http://www.spinics.net/lists/linux-media/msg61994.html

Thanks,
Sylwester

From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH] ARM: shmobile: porter: add CAN0 DT support
Date: Wed, 28 Oct 2015 01:56:53 +0300
Message-ID: <56300135.703@cogentembedded.com>
References: <1674850.BZpGW9kEud@wasted.cogentembedded.com>
 <5706086.RKBCVZugI4@wasted.cogentembedded.com>
 <20151027224142.GB21745@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <20151027224142.GB21745@verge.net.au>
Sender: linux-sh-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>
Cc: linux-sh@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, magnus.damm@gmail.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 10/28/2015 01:41 AM, Simon Horman wrote:

>> Define the Porter board dependent part of the CAN0 device node.
>>
>> This patch is  analogous to the commit 457acc4a6ce8 (ARM: shmobile:
>> henninger: add CAN0 DT support) as there are no differences between the
>> boards in this respect.
>>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>
> Thanks, I have queued this up for v4.5 after updating the changelog
> as per checkpatch.pl's insight:
>
> ERROR: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit 457acc4a6ce8 ("ARM: shmobile: henninger: add CAN0 DT support")'
> #8:
> This patch is  analogous to the commit 457acc4a6ce8 (ARM: shmobile:

    Oops, sorry, forgot to update the patch description.

MBR, Sergei


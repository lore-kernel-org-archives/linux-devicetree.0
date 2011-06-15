From: David Brown <davidb@codeaurora.org>
Subject: Re: [PATCH] Support multiple MEM tags with atags->fdt conversion
Date: Wed, 15 Jun 2011 13:15:01 -0700
Message-ID: <8ya8vt2am2i.fsf@huya.qualcomm.com>
References: <1308094074-24898-1-git-send-email-davidb@codeaurora.org>
	<alpine.LFD.2.00.1106151540230.2142@xanadu.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <alpine.LFD.2.00.1106151540230.2142@xanadu.home> (Nicolas Pitre's
	message of "Wed, 15 Jun 2011 15:50:37 -0400 (EDT)")
Sender: linux-arm-msm-owner@vger.kernel.org
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>, Shawn Guo <shawn.guo@freescale.com>, Tony Lindgren <tony@atomide.com>, John Bonesio <bones@secretlab.ca>, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Jun 15 2011, Nicolas Pitre wrote:

> On Tue, 14 Jun 2011, David Brown wrote:
>
>> Some targets have multiple memory regions.  Parse up to 8 of these
>> when converting the atags to fdt.
>> 
>> Signed-off-by: David Brown <davidb@codeaurora.org>
>
> I've added your patch to my zImage patch queue.
>
>> With this change, I am able to boot MSM8x60 combining ATAGS and my DT.
>> It seems to work as long as my device tree has placeholders for all of
>> the properties I need.
>
> I think those missing nodes should simply be created if missing.  I 
> however don't see any function in the libfdt API to do that -- there is 
> fdt_add_subnode() but no fdt_add_node().  Any DT expert please?

It does seem to only work if I already have nodes that are large enough
to hold the properties coming from the ATAG.  For example, I have to
have an array of memory reg values large enough, as well as a command
line large enough to hold the one passed from the bootloader.

If the DTB's command line is smaller than the one from ATAG, it just
silently leaves the DTB one in place.

David

-- 
Sent by an employee of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum.

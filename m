From: Santosh Shilimkar <santosh.shilimkar@ti.com>
Subject: Re: [PATCH 2/2] ARM: OMAP2+: Remove dmm device creation
Date: Wed, 20 Mar 2013 11:52:39 +0530
Message-ID: <514955AF.6020406@ti.com>
References: <1363754624-5209-1-git-send-email-andy.gross@ti.com> <1363754624-5209-3-git-send-email-andy.gross@ti.com> <51494F89.4050308@ti.com> <51495441.1000606@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <51495441.1000606@ti.com>
Sender: linux-omap-owner@vger.kernel.org
To: Archit Taneja <archit@ti.com>
Cc: Andy Gross <andy.gross@ti.com>, linux-omap@vger.kernel.org, Benoit Cousson <b-cousson@ti.com>, devicetree-discuss@lists.ozlabs.org, Nishanth Menon <nm@ti.com>
List-Id: devicetree@vger.kernel.org

On Wednesday 20 March 2013 11:46 AM, Archit Taneja wrote:
> On Wednesday 20 March 2013 11:26 AM, Santosh Shilimkar wrote:
>> On Wednesday 20 March 2013 10:13 AM, Andy Gross wrote:
>>> Remove DMM device creation via the hwmod entry.  The DMM device will
>>> now be enumerated as part of the device tree information for the
>>> processor.
>>>
>>> Signed-off-by: Andy Gross <andy.gross@ti.com>
>>> ---
>> OMAP4 is still not made DT only so I suggest you to hold on for this patch
>> till that happens.
> 
> Wouldn't we need to at least prevent building the platform device using omap_device_build() when we are using DT?
> 
Yes. I assumed Andy will do that once he decides to keep the
non-dt support :)

Regards,
Santosh


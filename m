From: "Sagar Dharia" <sdharia@codeaurora.org>
Subject: Re: [PATCH] slimbus: Linux driver framework for SLIMbus.
Date: Mon, 4 Jun 2012 03:36:55 -0700 (PDT)
Message-ID: <69926c6ce4b1e004069662fb13287e9b.squirrel@www.codeaurora.org>
References: <1338340310-4473-1-git-send-email-sdharia@codeaurora.org>
    <20120601001617.GA16311@plastictigers.com>
    <74993ac9d11db0db7080c0864daef397.squirrel@www.codeaurora.org>
    <20120604102747.GC7538@opensource.wolfsonmicro.com>
Reply-To: sdharia@codeaurora.org
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20120604102747.GC7538@opensource.wolfsonmicro.com>
Sender: linux-doc-owner@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Sagar Dharia <sdharia@codeaurora.org>, davidb@codeaurora.org, bryanh@codeaurora.org, kheitke@codeaurora.org, gclemson@audience.com, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, rob@landley.net, grant.likely@secretlab.ca, rob.herring@calxeda.com, ohad@wizery.com, gregkh@linuxfoundation.org, linus.walleij@linaro.org, rusty@rustcorp.com.au, joerg.roedel@amd.com, trenn@suse.de, ak@linux.intel.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org


>> While taking care of the comments for RFC, I have introduced a
>> completion
>> that will be signalled when LA is given to the device. The driver can
>> wait
>> on that completion (wait_enum) instead of polling.
>
> This would mean that the thread the probe is happening in will be
> blocked until the LA is assigned.  That sounds like it might cause
> problems, either slowing things down or worst case causing a deadlock.
>
I would expect that the slim_device's driver will only power-on the device
during probe (and use wait_for_completion during 1st transfer to get LA).
Typically transfers are not done as part of probe. Even if transfers need
to be done as part of probe, I expect wait_for_completion (with timeout to
avoid potential HW problems causing linux probe to wait forever) will be
better than polling for get_logical_addr.


Sent by an employee of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum.


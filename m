From: "Sagar Dharia" <sdharia@codeaurora.org>
Subject: Re: [PATCH] slimbus: Linux driver framework for SLIMbus.
Date: Mon, 4 Jun 2012 03:25:32 -0700 (PDT)
Message-ID: <0b49042fd7b1b02788b29ccbe0b9b31a.squirrel@www.codeaurora.org>
References: <1338340310-4473-1-git-send-email-sdharia@codeaurora.org>
    <1338741260.1881.14.camel@joe2Laptop>
Reply-To: sdharia@codeaurora.org
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1338741260.1881.14.camel@joe2Laptop>
Sender: linux-doc-owner@vger.kernel.org
To: Joe Perches <joe@perches.com>
Cc: Sagar Dharia <sdharia@codeaurora.org>, davidb@codeaurora.org, bryanh@codeaurora.org, ohad@wizery.com, rusty@rustcorp.com.au, marc@plastictigers.com, rob@landley.net, joerg.roedel@amd.com, linux-doc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-arm-msm@vger.kernel.org, linus.walleij@linaro.org, broonie@opensource.wolfsonmicro.com, linux-kernel@vger.kernel.org, rob.herring@calxeda.com, trenn@suse.de, grant.likely@secretlab.ca, kheitke@codeaurora.org, ak@linux.intel.com, gclemson@audience.com, gregkh@linuxfoundation.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

> Reallocs should _always_ use a new temporary.
> Otherwise, there will be a memory leak of the
> original pointer memory on failure.
>
Thank you Joe for your comments. I will change the allocs, take care of
the styling based on your comments when I split the patch and resubmit.

Regards
Sagar

Sent by an employee of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum.


From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v2 0/3] clk: Broadcom BCM63138 support
Date: Tue, 27 Oct 2015 16:50:46 -0700
Message-ID: <56300DD6.8070809@gmail.com>
References: <1445917997-3629-1-git-send-email-f.fainelli@gmail.com> <20151027210838.GP19782@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20151027210838.GP19782@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>, Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-clk@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org, jonmason@broadcom.com, mturquette@baylibre.com, linux@arm.linux.org.uk, sbranden@broadcom.com, rjui@broadcom.com
List-Id: devicetree@vger.kernel.org

On 27/10/15 14:08, Stephen Boyd wrote:
> On 10/26, Florian Fainelli wrote:
>> Hi all,
>>
>> This patch series adds support for the Broadcom BCM63138 DSL SoCs
>> clocking framework.
>>
>> Since the HW is identical to the one found in Broadcom iProc SoCs, but the
>> integration is different (obviously), there is still a new compatible string
>> introduced just in case we happen to find issues in the future.
>>
>> This applies on top of clk/next as of
>> 679c51cffc3b316bd89ecc91ef92603dd6d4fc68 ("clk: Add stubs for of_clk_*() APIs when CONFIG_OF=n")
>>
>> Since there is an obvious dependency between patch 2 and 3, we can either
>> merge this through the Clock tree or via a future arm-soc pull requests
>> for Broadcom SoCs.
> 
> One way to avoid the dependency would be to stage the first two
> patches in clk tree under clk-bcm63xxx and then pull that into
> your local branch via git FETCH && git checkout FETCH_HEAD and
> then apply the 3rd patch on top, tag it and send it off to
> arm-soc. This way, when arm-soc merges into linus' tree the
> dependency is taken care of and we don't take anything for dtsi
> files through the clk tree. It looks like nothing bad will happen
> if patch 2 is merged before patch 3.

Works for me, thanks!
-- 
Florian

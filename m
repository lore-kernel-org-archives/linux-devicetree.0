From: Scott Wood <scottwood@freescale.com>
Subject: Re: [PATCH v10 2/3] DMA: Freescale: Add new 8-channel DMA engine
 device tree nodes
Date: Wed, 25 Sep 2013 20:46:32 -0500
Message-ID: <1380159992.24959.248.camel@snotra.buserror.net>
References: <1379499333-4745-1-git-send-email-hongbo.zhang@freescale.com>
	 <1379499333-4745-3-git-send-email-hongbo.zhang@freescale.com>
	 <524074A7.7000001@wwwdotorg.org> <524169E3.7030408@freescale.com>
	 <5241CC60.5070204@wwwdotorg.org> <52429252.10009@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <52429252.10009@freescale.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hongbo Zhang <hongbo.zhang@freescale.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, mark.rutland@arm.com, devicetree@vger.kernel.org, ian.campbell@citrix.com, pawel.moll@arm.com, vinod.koul@intel.com, linux-kernel@vger.kernel.org, rob.herring@calxeda.com, djbw@fb.com, linuxppc-dev@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Wed, 2013-09-25 at 15:35 +0800, Hongbo Zhang wrote:
> By the way, I know maybe it is difficult, but why not introduce a 
> document of maintaining rules for the dt binding docs? we have dedicated 
> maintainers for this part now. Description language from one submitter 
> cannot satisfy every reviewer/maintainer, for a reg property, is it 
> necessary to say "offset and length",

Don't say "offset and length".  It's both redundant with the base
definition of the reg property, and overly specific because it makes
assumptions about how the parent node's ranges are set up (sometimes we
want to be that specific, but usually not).

> to say "how many entries", to say "register functions and even names"?

If there's more than one
entry/resource/whatever-we-decide-to-call-it-but-let's-pick-something-canonical, then say how many there are and what each one means.

-Scott

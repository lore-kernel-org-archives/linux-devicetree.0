From: Nishanth Menon <nm@ti.com>
Subject: Re: [PATCH 2/2] arm64: dts: ti: k3-am654-base-board: Add MMC/SD
 support
Date: Mon, 10 Dec 2018 07:49:38 -0600
Message-ID: <20181210134938.hh4543yig6fngyrj@kahuna>
References: <20181207084233.13700-1-faiz_abbas@ti.com>
 <20181207084233.13700-3-faiz_abbas@ti.com>
 <20181208155427.jmidz4vsw4k4qj36@akan>
 <c1dd9783-84dc-9dad-ea94-9a14a4ad814d@ti.com>
 <20181210120647.i3ply3p7umvedb3u@akan>
 <66f9d53b-abec-0a28-8eae-ecb99b075db4@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <66f9d53b-abec-0a28-8eae-ecb99b075db4@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sekhar Nori <nsekhar@ti.com>
Cc: Faiz Abbas <faiz_abbas@ti.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, mark.rutland@arm.com, robh+dt@kernel.org, t-kristo@ti.com, kishon@ti.com, ulf.hansson@linaro.org, adrian.hunter@intel.com, michal.simek@xilinx.com, Tony Lindgren <tony@atomide.com>, Arnd Bergmann <arnd@arndb.de>
List-Id: devicetree@vger.kernel.org

On 18:10-20181210, Sekhar Nori wrote:
> 
> I think you can rely on the author to tell you when something is
> actually ready to be merged (and you can tell him/her to remind you).
> 
> For the review itself, doing it by having a look at the dependencies
> mentioned in the cover letter (like available for this series) should be
> good enough (I feel).

Dependencies can be for multiple things.. anyways, Sigh..

> I am not sure if there is a need to post an "RFC version", and then
> follow it up with an actual "PATCH version" once dependencies are
> cleared though.
Heads up for the maintainers will be useful. For example:

Will be good to state in cover-letter instead of just stating
https://patchwork.kernel.org/cover/10717641/

State:

Bindings are in discussion[2], will confirm if approved and will
check if rebase is necessary.

This will indicate to the maintainer that patches are preliminary and
subject to change depending on bindings discussion and developer has
taken ownership of maintaining patch sanity.

-- 
Regards,
Nishanth Menon

From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH 04/15] clk: Add Ingenic jz4770 CGU driver
Date: Mon, 26 Jun 2017 15:49:46 -0700
Message-ID: <20170626224946.GR4493@codeaurora.org>
References: <20170607200439.24450-1-paul@crapouillou.net>
 <20170607200439.24450-5-paul@crapouillou.net>
 <20170607205943.GO20170@codeaurora.org>
 <639b492cc57200bab14572ac591ef8af@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-mips-bounce@linux-mips.org>
Content-Disposition: inline
In-Reply-To: <639b492cc57200bab14572ac591ef8af@crapouillou.net>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Paul Cercueil <paul@crapouillou.net>
Cc: Ralf Baechle <ralf@linux-mips.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Paul Burton <paul.burton@imgtec.com>, Maarten ter Huurne <maarten@treewalker.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 06/26, Paul Cercueil wrote:
> Hi,
> 
> Le 2017-06-07 22:59, Stephen Boyd a écrit :
> >On 06/07, Paul Cercueil wrote:
> >>Add support for the clocks provided by the CGU in the Ingenic JZ4770
> >>SoC.
> >>
> >>Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> >>Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>
> 
> [...]
> 
> >>diff --git a/include/dt-bindings/clock/jz4770-cgu.h
> >>b/include/dt-bindings/clock/jz4770-cgu.h
> >>new file mode 100644
> >>index 000000000000..54b8b2ae4a73
> >>--- /dev/null
> >>+++ b/include/dt-bindings/clock/jz4770-cgu.h
> >
> >Can you split this file off into a different patch? That way clk
> >tree can apply clk patches on top of a stable branch where this
> >file lives by itself.
> 
> Oops, I forgot that in the v2.
> 
> The jz4770-cgu.c file includes and uses
> <dt-bindings/clock/jz4770-cgu.h>, so I don't think
> it would make sense to split it, since it wouldn't compile without it.

I was suggesting this header file be a patch before the driver C
file patch, so that it would still compile. Does that change
anything?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

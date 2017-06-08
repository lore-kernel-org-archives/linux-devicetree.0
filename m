From: Maarten ter Huurne <maarten@treewalker.org>
Subject: Re: [PATCH 04/15] clk: Add Ingenic jz4770 CGU driver
Date: Thu, 08 Jun 2017 10:40:05 +0200
Message-ID: <1614689.ggC5Fptfnb@hyperion>
References: <20170607200439.24450-1-paul@crapouillou.net> <20170607200439.24450-5-paul@crapouillou.net> <20170607205943.GO20170@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <20170607205943.GO20170@codeaurora.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Paul Cercueil <paul@crapouillou.net>, Ralf Baechle <ralf@linux-mips.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Paul Burton <paul.burton@imgtec.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wednesday 07 June 2017 13:59:43 Stephen Boyd wrote:
> On 06/07, Paul Cercueil wrote:
> > Add support for the clocks provided by the CGU in the Ingenic JZ4770
> > SoC.
> > 
> > Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> > Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>
> 
> Signed-off chain looks odd. Sender should be last in the chain
> and first is typically author.

Paul is the main author, but one or more commits I made were squashed 
into the patch during its development.

Bye,
		Maarten

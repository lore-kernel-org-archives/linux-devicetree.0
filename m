From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 01/17] clk: ingenic: Use const pointer to clk_ops in
 struct
Date: Mon, 26 Jun 2017 15:34:38 +0200
Message-ID: <580231557b0447d9019a20ac99292938@crapouillou.net>
References: <20170607200439.24450-2-paul@crapouillou.net>
 <20170620151855.19399-1-paul@crapouillou.net>
 <20170621215038.GG4493@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <20170621215038.GG4493@codeaurora.org>
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
Cc: Ralf Baechle <ralf@linux-mips.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Paul Burton <paul.burton@imgtec.com>, Maarten ter Huurne <maarten@treewalker.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

Le 2017-06-21 23:50, Stephen Boyd a écrit :
> On 06/20, Paul Cercueil wrote:
>> The CGU common code does not modify the pointed clk_ops structure, so 
>> it
>> should be marked as const.
>> 
>> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>> ---
> 
> How did you want to merge this series? I can ack clk patches if
> you like, or apply the clk patches to the clk tree.

The clk patches refer to CONFIG_MACH_JZ4770 in the Kconfig, so they 
indirectly depend on the other patches. I think it's better that you ack 
them then.

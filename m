From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: imx7: add USDHC NAND clock to SDHC instances
Date: Tue, 11 Apr 2017 20:23:19 -0300
Message-ID: <CAOMZO5DOib3PfCOQ-yqKAJnKRJZ2eBnMJnA84y=sv+vsYdbbBQ@mail.gmail.com>
References: <20170330005029.6472-1-stefan@agner.ch> <20170330005029.6472-2-stefan@agner.ch>
 <20170401030312.GB24882@b29396-OptiPlex-7040> <5c8339900fa1bd6215fb94d4386f7e06@agner.ch>
 <CAOMZO5CprxqnqRXMFJLBAgYAZGGnXNs3ZciyVz_mSLRnnSQQRQ@mail.gmail.com>
 <CAOMZO5A7QQEe5rgBbJBzo8GY41aYV9WA8e9teCUROyihg0kq_g@mail.gmail.com>
 <c95a7f535296623bdd4e4a640b3c27f5@agner.ch> <20170411025956.GA9067@b29396-OptiPlex-7040>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170411025956.GA9067@b29396-OptiPlex-7040>
Sender: linux-kernel-owner@vger.kernel.org
To: Dong Aisheng <dongas86@gmail.com>
Cc: Stefan Agner <stefan@agner.ch>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Stephen Boyd <sboyd@codeaurora.org>, Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <fabio.estevam@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-clk@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Apr 10, 2017 at 11:59 PM, Dong Aisheng <dongas86@gmail.com> wrote:

> This is caused by ahb_root_clk gets disabled accidently and system hangs.
>
> Because this patch defines ipg_root_clk earlier before its parent
> (ahb_root_clk) got registered, then it will be marked as a orphan clk
> temporarily. Until the parent ahb_root_clk got registered, the clk core
> will reparent it to the newly found parent. (see __clk_core_init() function).
>
> Due to CLK_SET_RATE_PARENT flag, the ahb clk will be enabled during
> set_parent operation and then disabled after that.
> Then system hang cause we still get no chance to run init_on clks.
>
> I just send out a proper fix patch with correct register sequence.

Excellent, thanks!

From: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v4 0/2] dmaengine: add UniPhier MIO DMAC driver
Date: Sat, 24 Nov 2018 19:46:16 +0530
Message-ID: <20181124141616.GH3175@vkoul-mobl.Dlink>
References: <1539276063-5103-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1539276063-5103-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: dmaengine@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>, Jassi Brar <jaswinder.singh@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 12-10-18, 01:41, Masahiro Yamada wrote:
> 1/2: DT-binding
> 2/2: driver

Applied this series, thanks

While building I noticed that we get few warns when compiling with
C=1, I would prefer you fix them. Please send fixes on top of the
applied patches.

Thanks
-- 
~Vinod

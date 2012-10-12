From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH V2 2/3] dmaengine: dw_dmac: Enhance device tree support
Date: Fri, 12 Oct 2012 20:25:27 +0530
Message-ID: <CAKohpomvCkzSuP1GLBXmDTRCHeKXDgGwwXQ+TzU=Jekmozzo=A@mail.gmail.com>
References: <142ef9170a2c69657d8a05ac127a9970d7b04965.1350051925.git.viresh.kumar@linaro.org>
	<9688d98010716880c1bbd966ead312c446282204.1350051925.git.viresh.kumar@linaro.org>
	<20121012145027.GF12801@game.jcrosoft.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20121012145027.GF12801@game.jcrosoft.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Cc: vinod.koul@intel.com, devicetree-discuss@lists.ozlabs.org, spear-devel@list.st.com, linux-kernel@vger.kernel.org, andriy.shevchenko@linux.intel.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 12 October 2012 20:20, Jean-Christophe PLAGNIOL-VILLARD
<plagnioj@jcrosoft.com> wrote:
> On 20:01 Fri 12 Oct     , Viresh Kumar wrote:
>> dw_dmac driver already supports device tree but it used to have its platform
>> data passed the non-DT way.
>>
>> This patch does following changes:
>> - pass platform data via DT, non-DT way still takes precedence if both are used.
> why keep it  all platform are DT

I would love to remove that, but not sure if somebody want's the non-DT
way too.

I didn't wanted to get into fixing user SoCs of this driver.

--
viresh

From: Leo Yan <leo.yan@linaro.org>
Subject: Re: [PATCH v11 7/9] coresight: add support for CPU debug module
Date: Wed, 24 May 2017 08:14:51 +0800
Message-ID: <20170524001451.GA20279@leoy-ThinkPad-T440>
References: <1495548980-30432-1-git-send-email-leo.yan@linaro.org>
 <1495548980-30432-8-git-send-email-leo.yan@linaro.org>
 <CANLsYkzosO8+uaphvNQFe80zOJoqkSWceaiWhKEH-xSuVH0uew@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CANLsYkzosO8+uaphvNQFe80zOJoqkSWceaiWhKEH-xSuVH0uew@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, Wei Xu <xuwei5@hisilicon.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Hi Mathieu,

On Tue, May 23, 2017 at 11:39:16AM -0600, Mathieu Poirier wrote:

[...]

> > +static bool debug_enable;
> > +module_param_named(enable, debug_enable, bool, 0600);
> > +MODULE_PARM_DESC(enable, "Knob to enable debug functionality "
> > +                "(default is 0, which means is disabled by default)");
> 
> Checkpatch complains about a quoted string split across multiple
> lines.  You can probably removes the second one since information
> about the default value is already detailed in patch 03/09.  In this
> case I suggest modifiying the description to:
> 
> "Control to enable coresight CPU debug functionality"

It's shame for checkpatch.pl warning. Although everytime I used script
before sending out patch set, should think a bit more to handle them
better. Have sent new patch set to dismiss them.

Thanks,
Leo Yan

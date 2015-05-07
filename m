From: Paul Bolle <pebolle@tiscali.nl>
Subject: Re: [PATCH 1/2] coresight: replicator: Add Qualcomm CoreSight
 Replicator driver
Date: Thu, 07 May 2015 18:39:21 +0200
Message-ID: <1431016761.8171.79.camel@x220>
References: <1430310000-10867-1-git-send-email-ivan.ivanov@linaro.org>
	 <1430310000-10867-2-git-send-email-ivan.ivanov@linaro.org>
	 <1430427225.2187.15.camel@x220> <1431010007.21307.10.camel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1431010007.21307.10.camel@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Ivan T. Ivanov" <ivan.ivanov@linaro.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, Kumar Gala <galak@codeaurora.org>, Pratik Patel <pratikp@codeaurora.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, 2015-05-07 at 17:46 +0300, Ivan T. Ivanov wrote:
> Thank you. I am going to fallow approach taken by Mathieu in [1].
> Is this OK with you?

I'm OK with anything that is coherent (ie, anything better than built-in
only code cross-dressing as modular code). I think Mathieu's approach
clears that bar. (Please note that macros like module_amba_driver() are
basically just a pet peeve.)

And, at the end of the day, what matters is what the maintainer of this
code accepts. I'm not the maintainer here.

Thanks,


Paul Bolle

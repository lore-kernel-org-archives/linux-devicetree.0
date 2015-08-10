From: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Subject: Re: [PATCH v1 7/7] ARM: dts: ifc6410: add inforce LVDS panel support
Date: Mon, 10 Aug 2015 16:25:52 -0700
Message-ID: <20150810232552.GB13472@usrtlx11787.corpusers.net>
References: <1438087956-17307-1-git-send-email-srinivas.kandagatla@linaro.org>
 <1438088076-17606-1-git-send-email-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1438088076-17606-1-git-send-email-srinivas.kandagatla@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: agross@codeaurora.org, linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>
List-Id: devicetree@vger.kernel.org

On Tue 28 Jul 05:54 PDT 2015, Srinivas Kandagatla wrote:

> This patch adds LVDS panel for IFC6410.
> 

My ifc6410 doesn't have a LVDS display, so I don't think these nodes
belong in this dts file.

I was thinking we could have a variant including this dts file adding
the panel, but I assume that you can mount other panels than the auo
panel defined below?


Either way, I think we should keep this file to define the stuff that's
on the IFC6410 itself and then figure out how to aid people in adding
the rest of their additions...

Regards,
Bjorn

From: Alex Elder <elder@linaro.org>
Subject: Re: [PATCH v2] devicetree: bindings: separate CPU enable method descriptions
Date: Thu, 08 May 2014 13:50:27 -0500
Message-ID: <536BD1F3.8010602@linaro.org>
References: <1399574905-6478-1-git-send-email-elder@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1399574905-6478-1-git-send-email-elder@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: mark.rutland@arm.com, sboyd@codeaurora.org, robh+dt@kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rdunlap@infradead.org, lorenzo.pieralisi@arm.com, jason@lakedaemon.net, gregory.clement@free-electrons.com, rvaswani@codeaurora.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 05/08/2014 01:48 PM, Alex Elder wrote:
> The bindings for CPU enable methods are defined in ".../arm/cpus.txt".  As
> additional 32-bit ARM CPUS are converted to use the "enable-method" CPU
> property to imply a particular set of SMP operations to use, the list of these
> methods is likely to become unwieldy.  The current documentation already
> contains several property descriptions that are meaningful only for certain
> enable methods.
...

I forgot to mention, this patch is available here:
	http://git.linaro.org/landing-teams/working/broadcom/kernel.git
        Branch review/enable-method-bindings-v2

					-Alex

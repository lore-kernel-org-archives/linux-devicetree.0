From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 5/5] mfd: arizona: Add device tree bindings for MICBIAS
 generators
Date: Mon, 23 Sep 2013 15:43:27 -0600
Message-ID: <5240B5FF.6060901@wwwdotorg.org>
References: <1379961043-23762-1-git-send-email-ckeepax@opensource.wolfsonmicro.com> <1379961043-23762-5-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1379961043-23762-5-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Cc: lee.jones@linaro.org, sameo@linux.intel.com, rob.herring@calxeda.com, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, rob@landley.net, broonie@kernel.org, patches@opensource.wolfsonmicro.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 09/23/2013 12:30 PM, Charles Keepax wrote:
> Add device tree bindings for the pdata needed to configure the MICBIAS
> generators.

> diff --git a/Documentation/devicetree/bindings/mfd/arizona.txt b/Documentation/devicetree/bindings/mfd/arizona.txt

> +  - wlf,micbias1 : Configuration for the micbias regulator, should include 5
> +    cells.
> +    The first cell is the output voltage in millivolts
> +    The second cell a non-zero value indicates an external capacitor is fitted

I think you need some kind of delimiter (e.g. a colon) after "cell"
there, to separate the line's label and description.

> +    The four cell a non-zero value indicates that the micbias should be

s/four/fourth/

There are lots of cells here with a single-bit flag in them. Can the
flags be combined into a single cell to reduce the DT size? cpp-based
named constants should keep the *.dts file readable.

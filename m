From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 1/5] mfd: arizona: Add device tree helper functions
Date: Mon, 23 Sep 2013 15:36:36 -0600
Message-ID: <5240B464.2010903@wwwdotorg.org>
References: <1379961043-23762-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1379961043-23762-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Cc: lee.jones@linaro.org, sameo@linux.intel.com, rob.herring@calxeda.com, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, rob@landley.net, broonie@kernel.org, patches@opensource.wolfsonmicro.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 09/23/2013 12:30 PM, Charles Keepax wrote:
> Factor out reading of specific device tree bindings into seperate
> functions in preperation for adding more of them. Whilst we are at is
> fixup a couple of small issues in the existing binding documentation.

> diff --git a/Documentation/devicetree/bindings/mfd/arizona.txt b/Documentation/devicetree/bindings/mfd/arizona.txt

> -  - AVDD1-supply, DBVDD1-supply, DBVDD2-supply, DBVDD3-supply, CPVDD-supply,
> +  - AVDD-supply, DBVDD1-supply, DBVDD2-supply, DBVDD3-supply, CPVDD-supply,

That looks like an incompatible change to the DT ABI.

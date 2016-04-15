From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: Re: [RESEND PATCH v4] clk/axs10x: Add I2S PLL clock driver
Date: Fri, 15 Apr 2016 12:08:37 +0000
Message-ID: <1460722116.3025.40.camel@synopsys.com>
References: <50c75be8ecab225a1dd49628a173d211a02755b2.1459791946.git.joabreu@synopsys.com>
	 <1460393270.5119.20.camel@synopsys.com>
	 <20160411220320.GB14441@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-7"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20160411220320.GB14441@codeaurora.org>
Content-Language: en-US
Content-ID: <115F197246EB1747B3250B2A13232C99@internal.synopsys.com>
Sender: linux-clk-owner@vger.kernel.org
To: "sboyd@codeaurora.org" <sboyd@codeaurora.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "Vineet.Gupta1@synopsys.com" <Vineet.Gupta1@synopsys.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>, "CARLOS.PALMINHA@synopsys.com" <CARLOS.PALMINHA@synopsys.com>, "Jose.Abreu@synopsys.com" <Jose.Abreu@synopsys.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi+AKA-Stephen,

On Mon, 2016-04-11 at 15:03 -0700, sboyd+AEA-codeaurora.org wrote:
+AD4- On 04/11, Alexey Brodkin wrote:
+AD4- +AD4- 
+AD4- +AD4- On Mon, 2016-04-11 at 11:41 +-0100, Jose Abreu wrote:
+AD4- +AD4- +AD4- 
+AD4- +AD4- +AD4- +- +ACo- warranty of any kind, whether express or implied.
+AD4- +AD4- +AD4- +- +ACo-/
+AD4- +AD4- +AD4- +-
+AD4- +AD4- +AD4- +-+ACM-include +ADw-linux/platform+AF8-device.h+AD4-
+AD4- +AD4- +AD4- +-+ACM-include +ADw-linux/module.h+AD4-
+AD4- +AD4- +AD4- +-+ACM-include +ADw-linux/clk-provider.h+AD4-
+AD4- +AD4- +AD4- +-+ACM-include +ADw-linux/err.h+AD4-
+AD4- +AD4- +AD4- +-+ACM-include +ADw-linux/device.h+AD4-
+AD4- +AD4- +ACI-linux/platform+AF8-device.h+ACI- includes +ACI-linux/device.h+ACI- so you may make this list of headers
+AD4- +AD4- a little bit shorter.
+AD4- +AD4- 
+AD4- +AD4- +AD4- 
+AD4- +AD4- +AD4- +-+ACM-include +ADw-linux/of+AF8-address.h+AD4-
+AD4- +AD4- +AD4- +-+ACM-include +ADw-linux/slab.h+AD4-
+AD4- +AD4- +AD4- +-+ACM-include +ADw-linux/of.h+AD4-
+AD4- +AD4- +ACI-linux/of+AF8-address.h+ACI- already includes +ACI-linux/of.h+ACI-.
+AD4- It's ok to include things twice. In fact, its better to avoid any
+AD4- implicit includes so that if we ever want to remove includes from
+AD4- other headers we can do so without disturbing this driver.

IMHO approach with minimal amount of headers is nice just because
it's easier to check if everything is in place. I mean attempt to compile
will immediately reveal a missing header.

So that's what I do - I remove as many inclusions as I may until stuff compiles.

But with approach of explicit inclusion it's much easier to include
much more headers than really needed. The only way to figure out if header is really
required is to manually check all used functions in the current source
which is way too unreliable and probably nobody will do it ever anyways.
And that's how we'll get more stale and pointless inclusions.

-Alexey

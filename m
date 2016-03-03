From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH 07/17] dt-bindings: Add PLX Technology Reset Controller
 bindings
Date: Thu, 03 Mar 2016 15:31:07 +0100
Message-ID: <1457015467.3425.58.camel@pengutronix.de>
References: <1457005210-18485-1-git-send-email-narmstrong@baylibre.com>
	 <1457005210-18485-8-git-send-email-narmstrong@baylibre.com>
	 <1457014907.3425.56.camel@pengutronix.de> <56D8492B.8060706@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <56D8492B.8060706@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Am Donnerstag, den 03.03.2016, 15:24 +0100 schrieb Neil Armstrong:
> On 03/03/2016 03:21 PM, Philipp Zabel wrote:
> > Am Donnerstag, den 03.03.2016, 12:40 +0100 schrieb Neil Armstrong:
> >> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> > 
> > Is there a list of the reset bits in this register?
> > 
> > regards
> > Philipp
> > 
> 
> Yes, should I add it to the bindings ?

Yes, please. Either that or add a header file with #defines to
include/dt-bindings/reset and use it in the dtsi.

regards
Philipp

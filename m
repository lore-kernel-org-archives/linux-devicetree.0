From: "Stefan Schaeckeler (sschaeck)" <sschaeck@cisco.com>
Subject: Re: [PATCH 01/17] ARM: dts: aspeed-g5: Move EDAC node to APB
Date: Mon, 29 Jul 2019 17:26:10 +0000
Message-ID: <8F0B09F9-A2EA-4A88-BE8A-A8869FCE178A@cisco.com>
References: <20190726053959.2003-1-andrew@aj.id.au>
 <20190726053959.2003-2-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190726053959.2003-2-andrew@aj.id.au>
Content-Language: en-US
Content-ID: <756A23CAC08DC448858086B25C1F218A@namprd11.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andrew Jeffery <andrew@aj.id.au>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "joel@jms.id.au" <joel@jms.id.au>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thursday, July 25, 2019 at 10:40 PM, Andrew Jeffery wrote:

> Previously the register interface was not attached to any internal bus,
> which is not correct - it lives on the APB.
>
> Cc: Stefan M Schaeckeler <sschaeck@cisco.com>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  arch/arm/boot/dts/aspeed-g5.dtsi | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Stefan Schaeckeler <sschaeck@cisco.com>

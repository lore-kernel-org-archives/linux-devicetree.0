From: Peter Rosin <peda@axentia.se>
Subject: Re: [PATCH] ARM: dts: at91: replace gpio-key,wakeup with
 wakeup-source property
Date: Fri, 21 Dec 2018 18:46:12 +0000
Message-ID: <c22dacbe-ddc9-04c7-cda8-100dcbe0e70b@axentia.se>
References: <20181221181149.6708-1-sudeep.holla@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181221181149.6708-1-sudeep.holla@arm.com>
Content-Language: en-US
Content-ID: <64532381741D0B44AF9CB5D446BC903E@eurprd02.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sudeep Holla <sudeep.holla@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>
List-Id: devicetree@vger.kernel.org

On 2018-12-21 19:11, Sudeep Holla wrote:
> Most of the legacy "gpio-key,wakeup" property are already replaced
> with "wakeup-source". However few occurrences of old property has
> popped up again, probably from the remnants in downstream trees.
> Almost all of those were remove couple of years back.
> 
> Replace the legacy properties with the unified "wakeup-source"
> property introduced in the commit 700a38b27eef ("Input: gpio_keys -
> switch to using generic device properties")
> 
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Peter Rosin <peda@axentia.se>
> Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>

Why is this not v3?
Why did you drop all the tags you already got?

Acked-by: Peter Rosin <peda@axentia.se>

Cheers,
Peter

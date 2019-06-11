From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH 5/7] ARM: dts: BCM63xx: Fix DTC W=1 warnings
Date: Tue, 11 Jun 2019 14:56:10 -0700
Message-ID: <7eb443ef-38d9-ceae-3eae-3e264fcd847b@gmail.com>
References: <20190528230134.27007-1-f.fainelli@gmail.com>
 <20190528230134.27007-6-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190528230134.27007-6-f.fainelli@gmail.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Florian Fainelli <f.fainelli@gmail.com>, linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Scott Branden <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "maintainer:BROADCOM IPROC ARM ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, Gregory Fong <gregory.0xf0@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>, Brian Norris <computersforpeace@gmail.com>
List-Id: devicetree@vger.kernel.org

On 5/28/19 4:01 PM, Florian Fainelli wrote:
> Fix the bulk of the unit_address_vs_reg warnings and unnecessary
> \#address-cells/#size-cells without "ranges" or child "reg" property
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---

Applied to devicetree/next, thanks!
-- 
Florian

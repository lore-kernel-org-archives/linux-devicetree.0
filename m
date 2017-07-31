From: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: Re: [PATCH] ARM: dts: BCM53573: Add Broadcom BCM947189ACDBMR board
 support
Date: Mon, 31 Jul 2017 15:46:14 +0200
Message-ID: <247dcd4e1becdaa5f947f59f525c9d90@milecki.pl>
References: <20170718193740.8610-1-f.fainelli@gmail.com>
 <bb5387cf-5d31-3a03-1bb9-1327768271ec@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <bb5387cf-5d31-3a03-1bb9-1327768271ec@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Russell King <linux@armlinux.org.uk>, open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 2017-07-24 19:39, Florian Fainelli wrote:
> On 07/18/2017 12:37 PM, Florian Fainelli wrote:
>> Adds support for the Broadcom reference board BCM947189ACDMBR which
>> features the following:
>> 
>> * 128MB of DRAM
>> * External MoCA support through a Broadcom BCM6802 chip
>> * 1x external Gigabit PHY through the external BCM6802
>> * 1x USB 2.0 port
>> * 1x PCIE slot
>> * Few configurable buttons and LEDs
>> 
>> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> 
> Rafal, any feedback on this?

Looks good :)

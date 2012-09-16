From: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [PATCH v3 2/5] Documentation: add description of DT binding for
 the gpio-mvebu driver
Date: Sun, 16 Sep 2012 11:11:44 +0200
Message-ID: <505597D0.6030200@gmail.com>
References: <1347551658-24449-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1347551658-24449-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <20120916075601.GN28177@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20120916075601.GN28177@lunn.ch>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Lior Amsalem <alior@marvell.com>, Russell King <linux@arm.linux.org.uk>, Jason Cooper <jason@lakedaemon.net>, devicetree-discuss@lists.ozlabs.org, Rob Herring <rob.herring@calxeda.com>, Maen Suleiman <maen@marvell.com>, Ben Dooks <ben.dooks@codethink.co.uk>, linux-arm-kernel@lists.infradead.org, Linus Walleij <linus.walleij@stericsson.com>
List-Id: devicetree@vger.kernel.org

On 09/16/2012 09:56 AM, Andrew Lunn wrote:
>> +++ b/Documentation/devicetree/bindings/gpio/gpio-mvebu.txt
>> @@ -0,0 +1,45 @@
>> +* Marvell EBU GPIO controller
>> ...
>> +- interrupt-controller: identifies the node as an interrupt controller
>> +
>> +- #interrupt-cells: specifies the number of celles needed to encode an
>> +   interrupt source
>
> Hi Thomas
>
> Should this be #gpio-cells? The example below does not have
> #interrupt-cells?

It should be both. #gpio-cells to encode pin-offset within the gpio controller
and polarity, #interrupt-cells to encode irq number.

Sebastian

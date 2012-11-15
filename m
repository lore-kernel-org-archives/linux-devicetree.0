From: Jamie Lentin <jm@lentin.co.uk>
Subject: Re: [PATCH 1/3] gpio: Add simple poweroff-gpio driver
Date: Thu, 15 Nov 2012 18:11:11 +0000 (GMT)
Message-ID: <alpine.DEB.2.00.1211151810050.25381@marmot.wormnet.eu>
References: <1352650891-18356-1-git-send-email-andrew@lunn.ch>
 <1352650891-18356-2-git-send-email-andrew@lunn.ch>
 <20121115180557.924713E197F@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20121115180557.924713E197F@localhost>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, devicetree-discuss@lists.ozlabs.org, linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org, gmbnomis@gmail.com
List-Id: devicetree@vger.kernel.org

On Thu, 15 Nov 2012, Grant Likely wrote:

> On Sun, 11 Nov 2012 17:21:29 +0100, Andrew Lunn <andrew@lunn.ch> wrote:
>> From: Jamie Lentin <jm@lentin.co.uk>
>>
>> Given appropriate devicetree bindings, this driver registers a
>> pm_power_off function to set a GPIO line high/low to power down
>> your board.
>>
>> Signed-off-by: Jamie Lentin <jm@lentin.co.uk>
>> Signed-off-by: Andrew Lunn <andrew@lunn.ch>
>> ---
>>  .../devicetree/bindings/gpio/gpio-poweroff.txt     |   22 ++++
>>  drivers/gpio/Kconfig                               |   10 ++
>>  drivers/gpio/Makefile                              |    2 +
>>  drivers/gpio/gpio-poweroff.c                       |  129 ++++++++++++++++++++
>
> This isn't a gpio controller driver. Don't put it into drivers/gpio

There's a v2 which puts it in drivers/power/reset/gpio-poweroff.c

>
> g.
>
>

-- 
Jamie Lentin

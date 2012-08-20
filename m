From: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [PATCH 11/11] arm: mvebu: add pinctrl support in defconfig
Date: Mon, 20 Aug 2012 16:54:27 +0200
Message-ID: <50324FA3.9030005@gmail.com>
References: <1344689809-6223-1-git-send-email-sebastian.hesselbarth@gmail.com>	<1344689809-6223-12-git-send-email-sebastian.hesselbarth@gmail.com> <CACRpkdaF3OuBLC7odWyH5C_EJT9uFq1rYQMh6=kr8PQjvA68sA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <CACRpkdaF3OuBLC7odWyH5C_EJT9uFq1rYQMh6=kr8PQjvA68sA@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Russell King <linux@arm.linux.org.uk>, Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Ben Dooks <ben.dooks@codethink.co.uk>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 08/20/2012 04:31 PM, Linus Walleij wrote:
> On Sat, Aug 11, 2012 at 2:56 PM, Sebastian Hesselbarth
> <sebastian.hesselbarth@gmail.com>  wrote:
>> +CONFIG_PINCTRL_ARMADA_370=y
>> +CONFIG_PINCTRL_ARMADA_XP=y
>
> If the system is not even booting without pinctrl you should
> (IMHO) select these from the machine's Kconfig entry insteaf.

I don't have a strong opinion on this but I think most systems
will boot just fine without pinctrl. The basic stuff is set up
by u-boot. Anyway, I think we should enable pinctrl for each soc
by default.

Sebastian

From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 07/11] ARM: mvebu: Add pinctrl support to Armada XP SoCs
Date: Mon, 20 Aug 2012 16:27:41 +0200
Message-ID: <CACRpkdbNpeBLy-JmUz-YjFYVZfAw3mavUAWigLKyXU=iQ_wMSQ@mail.gmail.com>
References: <1344689809-6223-1-git-send-email-sebastian.hesselbarth@gmail.com>
	<1344689809-6223-8-git-send-email-sebastian.hesselbarth@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1344689809-6223-8-git-send-email-sebastian.hesselbarth@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Russell King <linux@arm.linux.org.uk>, Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Ben Dooks <ben.dooks@codethink.co.uk>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Stephen Warren <swarren@wwwdotorg.org>
List-Id: devicetree@vger.kernel.org

On Sat, Aug 11, 2012 at 2:56 PM, Sebastian Hesselbarth
<sebastian.hesselbarth@gmail.com> wrote:

> From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>
> This commits adds the necessary device tree information to define the
> compatible property for the pinctrl driver instance of Armada XP SoCs.
>
> Until now, the device tree representation considered the Armada XP as
> a single SoC. But in fact, there are three different SoCs in the
> Armada XP families, with different number of CPU cores, different
> number of Ethernet interfaces... and different number of muxable pins
> or functions. We therefore introduce three armada-xp-mv78xx0.dtsi for
> the three SoCs of the Armada XP family. The current armada-xp-db.dts
> evaluation board uses the MV78460 variant of the SoC.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

FWIW:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

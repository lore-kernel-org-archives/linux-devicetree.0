From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Subject: Re: [v4, 3/3] ARM: dts: vf610-zii-dev-rev-b: Remove 'fixed-link' from DSA ports
Date: Wed, 21 Dec 2016 15:58:45 +0300
Message-ID: <1482325125-15725-1-git-send-email-nikita.yoush@cogentembedded.com>
References: <1482131877-6097-3-git-send-email-andrew.smirnov@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1482131877-6097-3-git-send-email-andrew.smirnov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrey Smirnov <andrew.smirnov@gmail.com>, linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, andrew@lunn.ch, Vivien Didelot <vivien.didelot@savoirfairelinux.com>, Russell King <linux@armlinux.org.uk>, Stefan Agner <stefan@agner.ch>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, cphealy@gmail.com
List-Id: devicetree@vger.kernel.org

> Remove 'fixed-link' nodes from DSA ports since they are not needed (they
> are not limiting link's speed and the ports will be configured to their
> maximux speed as a default)
>
> Suggested-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>

With this patch, ports connected to revB's second switch stop working.

Nikita

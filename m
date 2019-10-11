From: Stefan Wahren <wahrenst@gmx.net>
Subject: Re: [PATCH v1 3/3] ARM: dts: bcm2711: Enable GENET support for the
 RPi4
Date: Sat, 12 Oct 2019 01:09:19 +0200
Message-ID: <dfe9062b-1960-f67b-2a9e-864c0680f5d3@gmx.net>
References: <20191011184822.866-1-matthias.bgg@kernel.org>
 <20191011184822.866-4-matthias.bgg@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20191011184822.866-4-matthias.bgg@kernel.org>
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
To: matthias.bgg@kernel.org, Florian Fainelli <f.fainelli@gmail.com>, "David S . Miller" <davem@davemloft.net>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Matthias Brugger <mbrugger@suse.com>, Nicolas Saenz Julienne <nsaenzjulienne@suse.de>, linux-kernel@vger.kernel.org, Eric Anholt <eric@anholt.net>, Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Am 11.10.19 um 20:48 schrieb matthias.bgg@kernel.org:
> From: Matthias Brugger <mbrugger@suse.com>
>
> Enable Gigabit Ethernet support on the Raspberry Pi 4
> Model B.

I asked some questions about genet to the RPi guys [1] which are
relevant to this patch (missing clocks and interrupt, MAC address
assignment) but i didn't get an answer yet.

During my tests with a similiar patch series i noticed that the driver
won't probe without a MAC address.

How does it get into DT (via U-Boot)?

[1] -
https://github.com/raspberrypi/linux/issues/3101#issuecomment-534665860

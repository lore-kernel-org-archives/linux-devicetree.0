From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH v4 06/14] ARM: davinci: da850: model the SATA refclk
Date: Fri, 20 Jan 2017 16:22:53 +0530
Message-ID: <fcbafcd6-4ecc-0f76-0f8c-960814c39423@ti.com>
References: <1484832588-18413-1-git-send-email-bgolaszewski@baylibre.com>
 <1484832588-18413-7-git-send-email-bgolaszewski@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-ide-owner@vger.kernel.org>
In-Reply-To: <1484832588-18413-7-git-send-email-bgolaszewski@baylibre.com>
Sender: linux-ide-owner@vger.kernel.org
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Kevin Hilman <khilman@kernel.org>, Patrick Titiano <ptitiano@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, Tejun Heo <tj@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, David Lechner <david@lechnology.com>
Cc: linux-ide@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thursday 19 January 2017 06:59 PM, Bartosz Golaszewski wrote:
> Register a dummy clock modelling the external SATA oscillator for

I had asked about this earlier. I dont think calling it a dummy clock is
right. Can you fix it or respond to my earlier mail with any objections?

> da850 (both DT and board file mode).
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Thanks,
Sekhar

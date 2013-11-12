From: Santosh Shilimkar <santosh.shilimkar@ti.com>
Subject: Re: [PATCH 09/12] mtd: nand: davinci: reuse driver for Keystone arch
Date: Tue, 12 Nov 2013 11:09:39 -0500
Message-ID: <528252C3.5060800@ti.com>
References: <1384187188-5776-1-git-send-email-ivan.khoronzhuk@ti.com>,<1384187188-5776-10-git-send-email-ivan.khoronzhuk@ti.com> <4F5844B3A985794BA902E12C070812375F8D46@DNCE04.ent.ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4F5844B3A985794BA902E12C070812375F8D46@DNCE04.ent.ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Khoronzhuk, Ivan" <ivan.khoronzhuk@ti.com>
Cc: Rob Landley <rob@landley.net>, Russell King <linux@arm.linux.org.uk>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <rob.herring@calxeda.com>, Stephen Warren <swarren@wwwdotorg.org>, Kumar Gala <galak@kernel.crashing.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Strashko, Grygorii" <grygorii.strashko@ti.com>
List-Id: devicetree@vger.kernel.org

On Monday 11 November 2013 12:09 PM, Khoronzhuk, Ivan wrote:
> The Keystone arch has compatible nand device, so reuse it.
> In case with Keystone it depends on TI_DAVINCI_AEMIF because AEMIF
> driver is responsible to set timings.
> 
> See http://www.ti.com/lit/ug/sprugz3a/sprugz3a.pdf
> 
> Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
> ---
Acked-by: Santosh Shilimkar <santosh.shilimkar@ti.com>

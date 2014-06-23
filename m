From: Pawel Moll <pawel.moll@arm.com>
Subject: Re: [PATCH v7 1/2] video: ARM CLCD: Add DT support
Date: Mon, 23 Jun 2014 14:47:43 +0100
Message-ID: <1403531263.3804.6.camel@hornet>
References: <1403018494-10264-1-git-send-email-pawel.moll@arm.com>
	 <53A809D4.90800@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <53A809D4.90800@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Russell King <rmk+kernel@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, 2014-06-23 at 14:04 +0300, Tomi Valkeinen wrote:
> I can queue this to fbdev tree, but how do you want to handle the second
> patch? I think these two patches are independent, so the second patch
> could go via arm-soc tree (or whichever is the normal route for those
> .dts file changes). I'd prefer that option.

That's exactly what I had on mind. I'll handle the dts changes when the
time is right.

Thanks!

Pawel

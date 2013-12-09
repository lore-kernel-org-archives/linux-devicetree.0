From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 5/9] ARM: dts: provide DMA config to pxamci
Date: Mon, 9 Dec 2013 02:33:58 +0100
Message-ID: <201312090233.58592.arnd@arndb.de>
References: <1386348542-9584-1-git-send-email-ynvich@gmail.com> <1386543229-1542-1-git-send-email-ynvich@gmail.com> <1386543229-1542-6-git-send-email-ynvich@gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1386543229-1542-6-git-send-email-ynvich@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Sergei Ianovich <ynvich@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Daniel Mack <zonque@gmail.com>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Landley <rob@landley.net>, Russell King <linux@arm.linux.org.uk>, Chris Ball <cjb@laptop.org>, Ulf Hansson <ulf.hansson@linaro.org>, Jaehoon Chung <jh80.chung@samsung.com>, Seungwon Jeon <tgih.jun@samsung.com>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Sunday 08 December 2013, Sergei Ianovich wrote:
> Non-dts implementation supply required DMA channel numbers as
> IORESOURCE_DMA. However, there is was no way to get them from
> device tree.

I just wrote a lengthy reply to this email to explain in what ways
you got it wrong, but then I saw that Daniel has already done all
the work in the right way in August, so nevermind that.

It hasn't made it upstream yet, but see http://list-archives.org/2013/08/07/linux-mtd-lists-infradead-org/patch-00-20-arm-pxa-move-core-and-drivers-to-dmaengine/f/3444199144
for how it's done. Maybe Daniel can comment on the status of his
patches.

	Arnd

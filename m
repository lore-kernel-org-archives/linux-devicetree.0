From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH 3/4] soc: Mediatek: Add SCPSYS power domain driver
Date: Wed, 24 Jun 2015 22:13:38 +0200
Message-ID: <3811196.182kcVQh3D@ubix>
References: <1435126625-9634-1-git-send-email-s.hauer@pengutronix.de> <1435126625-9634-4-git-send-email-s.hauer@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1435126625-9634-4-git-send-email-s.hauer@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Kevin Hilman <khilman@kernel.org>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, kernel@pengutronix.de
List-Id: devicetree@vger.kernel.org

On Wednesday, June 24, 2015 08:17:04 AM Sascha Hauer wrote:
> This adds a power domain driver for the Mediatek SCPSYS unit.
> 
> The System Control Processor System (SCPSYS) has several power
> management related tasks in the system. The tasks include thermal
> measurement, dynamic voltage frequency scaling (DVFS), interrupt
> filter and lowlevel sleep control. The System Power Manager (SPM)
> inside the SCPSYS is for the MTCMOS power domain control.
> 
> For now this driver only adds power domain support, the more
> advanced features are not yet supported. The driver implements
> the generic PM domain device tree bindings, the first user will
> most likely be the Mediatek AFE audio driver.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---

Applied to v4.2-next/soc

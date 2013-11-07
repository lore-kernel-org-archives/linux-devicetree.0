From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 2/2] of: irq: Check for reg property presence only when
 parsing interrupt-map
Date: Thu, 07 Nov 2013 12:33:26 +0100
Message-ID: <1489788.4u43h9g5sZ@amdc1227>
References: <1381869563-16083-1-git-send-email-grant.likely@linaro.org>
 <2177804.l4VGDTRFDu@amdc1227> <11085147.qYFvaZYATK@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <11085147.qYFvaZYATK@amdc1227>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kevin Hilman <khilman@linaro.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Tuesday 05 of November 2013 16:21:36 Tomasz Figa wrote:
> This patch fixes the of_irq_parse_raw() function to check for reg
> property only when really parsing interrupt map property, as it is not
> required otherwise and breaks existing device trees.
> 
> Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> ---
>  drivers/of/irq.c | 21 +++++++++++----------
>  1 file changed, 11 insertions(+), 10 deletions(-)

Please disregard this patch. It seems like Grant's fix that has been
already merged also fixes the same problem.

Best regards,
Tomasz

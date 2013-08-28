From: Ludovic Desroches <ludovic.desroches@atmel.com>
Subject: Re: [PATCH v3 2/6] iio: at91: introduce the multiple compatible
 string for different IPs.
Date: Wed, 28 Aug 2013 15:25:59 +0200
Message-ID: <16152.1418056966$1377696390@news.gmane.org>
References: <1377602932-1899-1-git-send-email-josh.wu@atmel.com>
 <1377602932-1899-3-git-send-email-josh.wu@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1377602932-1899-3-git-send-email-josh.wu@atmel.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Josh Wu <josh.wu@atmel.com>
Cc: thomas.petazzoni@free-electrons.com, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-iio@vger.kernel.org, nicolas.ferre@atmel.com, b.brezillon@overkiz.com, jic23@cam.ac.uk, maxime.ripard@free-electrons.com, plagnioj@jcrosoft.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Aug 27, 2013 at 07:28:48PM +0800, Josh Wu wrote:
> As use the multiple compatible string, we can remove hardware register in dt.
> 
> CC: devicetree@vger.kernel.org
> Signed-off-by: Josh Wu <josh.wu@atmel.com>

Acked-by: Ludovic Desroches <ludovic.desroches@atmel.com>

> ---
>  .../devicetree/bindings/arm/atmel-adc.txt          |    7 +-
>  arch/arm/mach-at91/include/mach/at91_adc.h         |    9 +++
>  drivers/iio/adc/at91_adc.c                         |   79 ++++++++++----------
>  3 files changed, 52 insertions(+), 43 deletions(-)

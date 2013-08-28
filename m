From: Ludovic Desroches <ludovic.desroches@atmel.com>
Subject: Re: [PATCH v3 5/6] iio: at91: move the num_channels from DT to
 driver itself
Date: Wed, 28 Aug 2013 15:27:24 +0200
Message-ID: <2123.16295733235$1377696491@news.gmane.org>
References: <1377602932-1899-1-git-send-email-josh.wu@atmel.com>
 <1377602932-1899-6-git-send-email-josh.wu@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1377602932-1899-6-git-send-email-josh.wu@atmel.com>
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

On Tue, Aug 27, 2013 at 07:28:51PM +0800, Josh Wu wrote:
> CC: devicetree@vger.kernel.org
> Signed-off-by: Josh Wu <josh.wu@atmel.com>

Acked-by: Ludovic Desroches <ludovic.desroches@atmel.com>

> ---
>  Documentation/devicetree/bindings/arm/atmel-adc.txt |    1 -
>  drivers/iio/adc/at91_adc.c                          |   12 +++++-------
>  2 files changed, 5 insertions(+), 8 deletions(-)

From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 4/5] drm/vc4: Add DPI driver
Date: Fri, 25 Mar 2016 10:06:04 -0500
Message-ID: <20160325150604.GA7620@rob-hp-laptop>
References: <1458865431-30048-1-git-send-email-eric@anholt.net>
 <1458865431-30048-5-git-send-email-eric@anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1458865431-30048-5-git-send-email-eric@anholt.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Eric Anholt <eric@anholt.net>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Ian Campbell <ijc+devicetree@hellion.org.uk>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, David Airlie <airlied@linux.ie>, Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>, linux-rpi-kernel@lists.infradead.org, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, Mar 24, 2016 at 05:23:50PM -0700, Eric Anholt wrote:
> The DPI interface involves taking a ton of our GPIOs to be used as
> outputs, and routing display signals over them in parallel.
> 
> v2: Use display_info.bus_formats[] to replace our custom DT
>     properties.
> 
> Signed-off-by: Eric Anholt <eric@anholt.net>
> ---
>  .../devicetree/bindings/display/brcm,bcm-vc4.txt   |  36 ++

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/gpu/drm/vc4/Kconfig                        |   1 +
>  drivers/gpu/drm/vc4/Makefile                       |   1 +
>  drivers/gpu/drm/vc4/vc4_debugfs.c                  |   1 +
>  drivers/gpu/drm/vc4/vc4_dpi.c                      | 520 +++++++++++++++++++++
>  drivers/gpu/drm/vc4/vc4_drv.c                      |   1 +
>  drivers/gpu/drm/vc4/vc4_drv.h                      |   5 +
>  7 files changed, 565 insertions(+)
>  create mode 100644 drivers/gpu/drm/vc4/vc4_dpi.c

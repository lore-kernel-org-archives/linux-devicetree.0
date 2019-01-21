From: Peter Robinson <pbrobinson@gmail.com>
Subject: Re: [PATCH 4/6] ARM: dts: bcm2837-rpi-3-b: Use consistent label for
 HDMI hotplug
Date: Mon, 21 Jan 2019 05:02:31 +0000
Message-ID: <CALeDE9Me+dzsdwvmGNMO2SKQoLot_7HEshYaa15=5j04jZCbnA@mail.gmail.com>
References: <1547297008-2740-1-git-send-email-stefan.wahren@i2se.com>
 <1547297008-2740-5-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1547297008-2740-5-git-send-email-stefan.wahren@i2se.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stefan Wahren <stefan.wahren@i2se.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Gottfried Haider <gottfried.haider@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Scott Branden <sbranden@broadcom.com>, devicetree@vger.kernel.org, Ray Jui <rjui@broadcom.com>, Phil Elwell <phil@raspberrypi.org>, Eric Anholt <eric@anholt.net>, Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Sat, Jan 12, 2019 at 12:44 PM Stefan Wahren <stefan.wahren@i2se.com> wrote:
>
> This make the GPIO label for HDMI hotplug more consistent to the other
> boards.
>
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
Tested-by: Peter Robinson <pbrobinson@gmail.com>

Verified output on a RPi3.

> ---
>  arch/arm/boot/dts/bcm2837-rpi-3-b.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/bcm2837-rpi-3-b.dts b/arch/arm/boot/dts/bcm2837-rpi-3-b.dts
> index 9abb9c5..31b1c03 100644
> --- a/arch/arm/boot/dts/bcm2837-rpi-3-b.dts
> +++ b/arch/arm/boot/dts/bcm2837-rpi-3-b.dts
> @@ -39,7 +39,7 @@
>                                   "WL_ON",
>                                   "STATUS_LED",
>                                   "LAN_RUN",
> -                                 "HPD_N",
> +                                 "HDMI_HPD_N",
>                                   "CAM_GPIO0",
>                                   "CAM_GPIO1",
>                                   "PWR_LOW_N";
> --
> 2.7.4
>

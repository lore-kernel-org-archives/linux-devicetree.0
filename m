From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v2 1/4] staging/vc04_services: Use correct cache line size
Date: Fri, 14 Sep 2018 10:03:53 -0700
Message-ID: <c4807226-6738-d9da-6f08-4b0a782b9cae@gmail.com>
References: <1536931375-48769-1-git-send-email-phil@raspberrypi.org>
 <1536931375-48769-2-git-send-email-phil@raspberrypi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1536931375-48769-2-git-send-email-phil@raspberrypi.org>
Content-Language: en-US
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Phil Elwell <phil@raspberrypi.org>, Rob Herring <robh+dt@kernel.org>, Stefan Wahren <stefan.wahren@i2se.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, devel@driverdev.osuosl.org
List-Id: devicetree@vger.kernel.org

On 09/14/2018 06:22 AM, Phil Elwell wrote:
> Use the compatible string in the DTB to select the correct cache line
> size for the SoC - 32 for BCM2835, and 64 for BCM2836 and BCM2837.
> 
> Signed-off-by: Phil Elwell <phil@raspberrypi.org>
> ---

[snip]

> @@ -170,6 +170,14 @@ static struct device *vchiq_dev;
>  static DEFINE_SPINLOCK(msg_queue_spinlock);
>  static struct platform_device *bcm2835_camera;
>  
> +static struct vchiq_drvdata bcm2835_drvdata = {
> +	.cache_line_size = 32,
> +};
> +
> +static struct vchiq_drvdata bcm2836_drvdata = {
> +	.cache_line_size = 64,
> +};

Those two structures could probably be marked const. Other than that,
the approach definitively looks good to me.
-- 
Florian

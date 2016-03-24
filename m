From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH 3/3] drm: bridge: anx78xx: Add anx78xx bridge driver
 support.
Date: Thu, 24 Mar 2016 14:28:18 +0300
Message-ID: <20160324112818.GC5273@mwanda>
References: <1458816106-11596-1-git-send-email-enric.balletbo@collabora.com>
 <1458816106-11596-4-git-send-email-enric.balletbo@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1458816106-11596-4-git-send-email-enric.balletbo@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, devel@driverdev.osuosl.org, treding@nvidia.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, airlied@linux.ie, gregkh@linuxfoundation.org, sjoerd.simons@collabora.co.uk, javier@dowhile0.org, span@analogixsemi.com, nathan.chung@mediatek.com, djkurtz@chromium.org, drinkcat@chromium.org, laurent.pinchart@ideasonboard.com, jb.tsai@mediatek.com, cawa.cheng@mediatek.com, eddie.huang@mediatek.com, cjiao@analogixsemi.com, emil.l.velikov@gmail.com
List-Id: devicetree@vger.kernel.org

On Thu, Mar 24, 2016 at 11:41:46AM +0100, Enric Balletbo i Serra wrote:
> +	/* Map slave addresses of ANX7814 */
> +	for (i = 0; i < I2C_NUM_ADDRESSES; i++) {
> +		anx78xx->i2c_dummy[i] = i2c_new_dummy(client->adapter,
> +						anx78xx_i2c_addresses[i] >> 1);
> +		if (!anx78xx->i2c_dummy[i]) {
> +			DRM_ERROR("Failed to reserve i2c bus %02x.\n",
> +				  anx78xx_i2c_addresses[i]);

Missing error code here.

> +			goto err_i2c;
> +		}

I'm, of course, not a fan of the naming.  The name should be based on
what the goto location does...  In this case it turns it off.  Which is
slightly weird because we have not turned it on yet...  I always say
that you should have multiple error labels and you only undo things
which have been done.

Having a common exit path for the other functions where it was "goto out"
makes sense.  But again in those cases I would prefer a meaningful label
name like "goto unlock;".  In the kernel "goto out;" is meaningless, it
could do anything or everything or nothing.  A lot of people like it
of course, but out: label code tends to be buggier than using a
meaningful name.

regards,
dan carpenter

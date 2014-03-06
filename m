From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH v5 06/11] imx-drm: imx-tve: Fix DDC I2C bus property
Date: Thu, 6 Mar 2014 13:03:20 +0000
Message-ID: <20140306130320.GA21483@n2100.arm.linux.org.uk>
References: <1394011262-16849-1-git-send-email-p.zabel@pengutronix.de>
	<1394011262-16849-7-git-send-email-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <1394011262-16849-7-git-send-email-p.zabel@pengutronix.de>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, dri-devel@lists.freedesktop.org, kernel@pengutronix.de, Grant Likely <grant.likely@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Mar 05, 2014 at 10:20:57AM +0100, Philipp Zabel wrote:
> This patch fixes the TV Encoder DDC I2C bus property to use the common
> 'ddc-i2c-bus' property name instead of 'ddc'.

Looking at both hdmi and tve, the ddc part is very similar.  The difference
is how the probe is handled:

imx-hdmi:
        ddc_node = of_parse_phandle(np, "ddc", 0);
        if (ddc_node) {
                hdmi->ddc = of_find_i2c_adapter_by_node(ddc_node);
                if (!hdmi->ddc)
                        dev_dbg(hdmi->dev, "failed to read ddc node\n");

                of_node_put(ddc_node);
        } else {
                dev_dbg(hdmi->dev, "no ddc property found\n");
        }

imx-tve:
        ddc_node = of_parse_phandle(np, "ddc", 0);
        if (ddc_node) {
                tve->ddc = of_find_i2c_adapter_by_node(ddc_node);
                of_node_put(ddc_node);
        }

It appears to differ only by debug prints - is there any reason we
couldn't unify the DDC backend part?  I've tinkered with this idea,
and already have a patch, though it needs a little rework.

Any thoughts?

-- 
FTTC broadband for 0.8mile line: now at 9.7Mbps down 460kbps up... slowly
improving, and getting towards what was expected from it.

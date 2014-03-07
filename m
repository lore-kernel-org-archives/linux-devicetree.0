From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 2/2] imx-drm: imx-ldb: Use OF graph to find connected panel
Date: Fri, 7 Mar 2014 17:06:09 +0000
Message-ID: <20140307170609.GP21483@n2100.arm.linux.org.uk>
References: <1394114080-27223-1-git-send-email-p.zabel@pengutronix.de>
	<1394114080-27223-2-git-send-email-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <1394114080-27223-2-git-send-email-p.zabel@pengutronix.de>
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

On Thu, Mar 06, 2014 at 02:54:40PM +0100, Philipp Zabel wrote:
> @@ -566,9 +566,18 @@ static int imx_ldb_bind(struct device *dev, struct device *master, void *data)
>  			return -EINVAL;
>  		}
>  
> -		panel_node = of_parse_phandle(child, "fsl,panel", 0);
> -		if (panel_node)
> -			channel->panel = of_drm_find_panel(panel_node);
> +		/* The output port is port@4 with mux or port@1 without mux */
> +		port = of_graph_get_port_by_id(child, imx_ldb->lvds_mux ? 4 : 1);

I guess we're holding off on these two patches while the last bits of
the of-graph get sorted - the above function doesn't currently exist
so causes a build failure.

Thanks.

-- 
FTTC broadband for 0.8mile line: now at 9.7Mbps down 460kbps up... slowly
improving, and getting towards what was expected from it.

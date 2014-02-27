From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [RFC PATCH v4 3/8] staging: imx-drm: Document updated imx-drm
	device tree bindings
Date: Thu, 27 Feb 2014 11:56:52 +0000
Message-ID: <20140227115652.GI21483@n2100.arm.linux.org.uk>
References: <1393338203-25051-1-git-send-email-p.zabel@pengutronix.de>
	<1393338203-25051-4-git-send-email-p.zabel@pengutronix.de>
	<530F1C4C.2010504@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <530F1C4C.2010504@ti.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, kernel@pengutronix.de, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, dri-devel@lists.freedesktop.org, Grant Likely <grant.likely@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, Feb 27, 2014 at 01:06:52PM +0200, Tomi Valkeinen wrote:
> On 25/02/14 16:23, Philipp Zabel wrote:
> 
> > +Freescale i.MX DRM master device
> > +================================
> > +
> > +The freescale i.MX DRM master device is a virtual device needed to list all
> > +IPU or other display interface nodes that comprise the graphics subsystem.
> > +
> > +Required properties:
> > +- compatible: Should be "fsl,imx-drm"
> > +- ports: Should contain a list of phandles pointing to display interface ports
> > +  of IPU devices
> > +
> > +example:
> > +
> > +imx-drm {
> > +	compatible = "fsl,imx-drm";
> > +	ports = <&ipu_di0>;
> > +};
> 
> I'm not a fan of having non-hardware related things in the DT data.
> Especially if it makes direct references to our SW, in this case DRM.
> There's no DRM on the board. I wanted to avoid all that with OMAP
> display bindings.
> 
> Is there even need for such a master device? You can find all the
> connected display devices from any single display device, by just
> following the endpoint links.

Please read up on what has been discussed over previous years:

http://lists.freedesktop.org/archives/dri-devel/2013-July/041159.html

and please, let's not endlessly rehash old discussions because someone
wasn't involved and has a different opinion, otherwise we're never going
to get anywhere.

Thanks.

-- 
FTTC broadband for 0.8mile line: now at 9.7Mbps down 460kbps up... slowly
improving, and getting towards what was expected from it.

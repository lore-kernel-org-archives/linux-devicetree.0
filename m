From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFC PATCH dtc] C-based DT schema checker integrated into dtc
Date: Tue, 5 Nov 2013 19:48:11 +0100
Message-ID: <201311051948.11992.arnd@arndb.de>
References: <1382651488-9696-1-git-send-email-swarren@wwwdotorg.org>
 <201311050939.21071.arnd@arndb.de>
 <20131105180314.GB14706@obsidianresearch.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20131105180314.GB14706@obsidianresearch.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, Jon Loeliger <jdl@jdl.com>, khilman@linaro.org, Stephen Warren <swarren@nvidia.com>, Benoit Cousson <bcousson@baylibre.com>, pawel.moll@arm.com, Stephen Warren <swarren@wwwdotorg.org>, Tomasz Figa <t.figa@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, rob.herring@calxeda.com, Grant Likely <grant.likely@secretlab.ca>, fparent@baylibre.com, a.hajda@samsung.com, s.nawrocki@samsung.com, galak@codeaurora.org, olof@lixom.net, Alison_Chaiken@mentor.com, linux-arm-kernel@lists.infradead.org, David Gibson <david@gibson.dropbear.id.au>
List-Id: devicetree@vger.kernel.org

On Tuesday 05 November 2013, Jason Gunthorpe wrote:
> I've been brewing a patch set to fix TPM, but it is a large effort. I
> would think other legacy subsystems that are not fully class device
> enabled will have similar challenges?

I think a common pattern is to have the subsystem data be referenced from
the driver data using a pointer, and contain a back reference to the struct
device, which should not be a problem.

> How about an alternate entry point:
> 
>  net = alloc_etherdev(sizeof(foo_priv));
>  priv = netdev_priv(net);
>  devm_probe_priv(priv, probes);
> 
> Don't touch the drvdata for that flow.

Yes, that would work, but it would prevent another idea I had that I haven't
mentioned here: If we add a pointer to the 'struct devm_probe' array to
'struct device_driver', those can actually be called by the driver core
code before entering the probe() callback, or potentially replace the
probe() function entirely for simple drivers (provided we add a few more
bits that we haven't talked about here.

I was originally thinking of something like

int devm_probe_alloc_netdev(struct device *dev, struct devm_probe *probe)
{
	struct net_device *netdev, **netdevp;

	/* open-coded devm_alloc_ethernet */
	netdevp = devres_alloc(devm_free_netdev, sizeof (*netdevp), GFP_KERNEL);
	if (!netdevp)
		return -ENOMEM;

	netdev = alloc_etherdev(probe->size);
	if (!netdev) {
		devres_free(netdevp);
		return -ENOMEM;
	}

	*netdevp = netdev;
	devres_add(dev, netdevp);

	dev_set_drvdata(dev, netdev_priv(netdev));

        netdevp = dev_get_drvdata(dev) + probe->offset;
        *netdevp = netdev;
}
#define DEVM_ALLOC_NETDEV(_struct, _member) {				\
	.initfunc = devm_probe_alloc_netdev,				\
	.size = sizeof(struct _struct),					\
	.offset = offsetof_t(struct _struct, _member, struct netdev *), \
}

which would fit in nicely with the rest of the design, but now I'm no longer
sure if that would actually work with the lifetime rules of the netdev, which
would pin the refcount on the 'struct device', which in turn could prevent
the devres cleanup to be executed.

	Arnd

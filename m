Return-Path: <devicetree-owner@vger.kernel.org>
Received: from service87.mimecast.com ([91.220.42.44]:43363 "EHLO
	service87.mimecast.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752452Ab3HVJXc convert rfc822-to-8bit (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Thu, 22 Aug 2013 05:23:32 -0400
Message-ID: <1377163408.10707.29.camel@hornet>
Subject: Re: passing two interrupts two an I2C driver
From: Pawel Moll <pawel.moll@arm.com>
Date: Thu, 22 Aug 2013 10:23:28 +0100
In-Reply-To: <20130821175446.GI26118@sirena.org.uk>
References: <520E3B8F.9010800@samsung.com> <520E7417.3090606@wwwdotorg.org>
	 <20130819084227.GC3719@e106331-lin.cambridge.arm.com>
	 <5214AA52.2060209@samsung.com> <1377088624.10707.23.camel@hornet>
	 <20130821175446.GI26118@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: devicetree-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, Mark Rutland <Mark.Rutland@arm.com>, "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, Jonathan Cameron <jic23@kernel.org>, "maxime.ripard@free-electrons.com" <maxime.ripard@free-electrons.com>, "lars@metafoo.de" <lars@metafoo.de>, "l.czerwinski@samsung.com" <l.czerwinski@samsung.com>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "ian.campbell@citrix.com" <ian.campbell@citrix.com>, "s.nawrocki@samsung.com" <s.nawrocki@samsung.com>, Wolfram Sang <wsa@the-dreams.de>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Wed, 2013-08-21 at 18:54 +0100, Mark Brown wrote:
> On Wed, Aug 21, 2013 at 01:37:04PM +0100, Pawel Moll wrote:
> 
> > So let me ask such question... If Device Tree didn't exist, how would
> > you make drive such device? I guess it would require some custom code,
> 
> It's always done using platform data, same for SPI - if we update one we
> should probably update both.

If the platform data used to carry the (custom) irq data, the DT-powered
driver could interrogate the DT on is own, couldn't it? Of course there
should be some helper available, maybe something of that sort? (warning,
untested)

8<---------------------
diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index 1264923..d2a02dd 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -46,6 +46,15 @@ unsigned int irq_of_parse_and_map(struct device_node *dev, int index)
 }
 EXPORT_SYMBOL_GPL(irq_of_parse_and_map);
 
+unsigned int irq_of_parse_and_map_by_name(struct device_node *dev,
+		const char *name)
+{
+	int index = of_property_match_string(dev, "interrupt-names", name);
+
+	return index < 0 ? 0 : irq_of_parse_and_map(dev, index);
+}
+EXPORT_SYMBOL_GPL(irq_of_parse_and_map_by_name);
+
 /**
  * of_irq_find_parent - Given a device node, find its interrupt parent node
  * @child: pointer to device node
8<---------------------

Pawel



Return-Path: <devicetree-owner@kernel.org>
Received: from mout.kundenserver.de ([212.227.126.131]:60906 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932172AbbJNUKb (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Wed, 14 Oct 2015 16:10:31 -0400
Date: Wed, 14 Oct 2015 22:10:21 +0200
From: Karsten Merker <merker@debian.org>
Subject: Re: [PATCH RFC V2 1/3] Input: goodix - add dt axis swapping and axis
 inversion support
Message-ID: <20151014201021.GA1799@excalibur.cnev.de>
References: <1444413352-24529-1-git-send-email-merker@debian.org>
 <1444413352-24529-2-git-send-email-merker@debian.org>
 <1F3AC3675D538145B1661F571FE1805F2F0FE498@irsmsx105.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1F3AC3675D538145B1661F571FE1805F2F0FE498@irsmsx105.ger.corp.intel.com>
Sender: devicetree-owner@vger.kernel.org
To: "Tirdea, Irina" <irina.tirdea@intel.com>
Cc: Karsten Merker <merker@debian.org>, Bastien Nocera <hadess@hadess.net>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Aleksei Mamlin <mamlinav@gmail.com>, "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>
List-ID: <devicetree@vger.kernel.org>

On Tue, Oct 13, 2015 at 06:58:07AM +0000, Tirdea, Irina wrote:
> 
> > -----Original Message-----
> > From: linux-input-owner@vger.kernel.org [mailto:linux-input-owner@vger.kernel.org] On Behalf Of Karsten Merker
> > Sent: 09 October, 2015 20:56
> > To: Bastien Nocera; Dmitry Torokhov; Tirdea, Irina; Aleksei Mamlin; linux-input@vger.kernel.org; Ian Campbell
> > Cc: devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; Chen-Yu Tsai; Karsten Merker
> > Subject: [PATCH RFC V2 1/3] Input: goodix - add dt axis swapping and axis inversion support
> > 
> > Implement support for the following device-tree properties
> > in the goodix touchscreen driver:
> > 
> >  - touchscreen-inverted-x:  X axis is inverted (boolean)
> >  - touchscreen-inverted-y:  Y axis is inverted (boolean)
> >  - touchscreen-swapped-x-y: X and Y axis are swapped (boolean)
> > 
> > These are necessary on tablets which have a display in portrait
> > format while the touchscreen is in landscape format, such as e.g.
> > the MSI Primo 81.
[...]
> > @@ -950,6 +968,15 @@ static int goodix_ts_probe(struct i2c_client *client,
> >  		return 0;
> >  	}
> > 
> > +#ifdef CONFIG_OF
> > +	ts->swapped_x_y = of_property_read_bool(client->dev.of_node,
> > +						"touchscreen-swapped-x-y");
> > +	ts->inverted_x = of_property_read_bool(client->dev.of_node,
> > +					       "touchscreen-inverted-x");
> > +	ts->inverted_y = of_property_read_bool(client->dev.of_node,
> > +					       "touchscreen-inverted-y");
> > +#endif
> > +
> 
> If interrupt and reset gpio pins are declared in the DT configuration, this code will not
> be executed.  To make the properties available for all configurations (with/without
> gpio pins declared), you should read the properties inside goodix_configure_dev().
> 
> You could also use device_property_read_bool() instead, so that these properties can
> be used with ACPI 5.1. as well.

Hello,

many thanks for the review.

I'll address both points in a v3 of the patch.

Regards,
Karsten
-- 
Gem. Par. 28 Abs. 4 Bundesdatenschutzgesetz widerspreche ich der Nutzung
sowie der Weitergabe meiner personenbezogenen Daten für Zwecke der
Werbung sowie der Markt- oder Meinungsforschung.

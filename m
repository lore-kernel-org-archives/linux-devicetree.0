From: Greg KH <gregkh-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH v4] hwmon: Add support for Texas Instruments ADS1015
Date: Thu, 3 Mar 2011 11:47:47 -0800
Message-ID: <20110303194747.GB31661@suse.de>
References: <1299138343-12773-1-git-send-email-eibach@gdsys.de>
	<20110303175050.GC22940@angua.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110303175050.GC22940-MrY2KI0G/OVr83L8+7iqerDks+cytr/Z@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Dirk Eibach <eibach-dJ+jgKLZIg4@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Kay Sievers <kay.sievers-tD+1rO4QERM@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Mar 03, 2011 at 10:50:50AM -0700, Grant Likely wrote:
> > +	i2c_set_clientdata(client, data);
> > +	mutex_init(&data->update_lock);
> > +
> > +	/* build sysfs attribute group */
> > +	data->attr_group.attrs = data->attr_table;
> > +	exported_channels = ads1015_get_exported_channels(client);
> > +	for (k = 0; k < ADS1015_CONFIG_CHANNELS; ++k) {
> > +		if (!(exported_channels & (1<<k)))
> > +			continue;
> > +		data->attr_table[n++] =
> > +			all_attributes[k];
> > +	}
> > +	err = sysfs_create_group(&client->dev.kobj, &data->attr_group);
> > +	if (err)
> > +		goto exit_free;
> 
> I suspect there are lifecycle issues here.  Attributes should not be
> added to a device after the device is registered.  If adding
> attributes, then a new struct device should be allocated, added to the
> attribute group, and then registered as a child of the i2c_device.
> Otherwise the attributes are not available at uevent time, which means
> userspace (udev) may not be able to do the right things with the
> device when the device appears.
> 
> Kay/GregKH, do I have this right?

You have it right that the attributes need to be added earlier, yes.
But I don't recommend using a whole new struct device for this, each
subsystem should have a way to add groups of attributes for their
devices to properly show up before the uevent happens.

I don't recall what the hwmon subsystem does for this, I'm sure it is
somewhere in there...

thanks,

greg k-h

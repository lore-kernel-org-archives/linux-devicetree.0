From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] lm87: Allow channel data to be set from dts file.
Date: Fri, 23 Sep 2016 13:10:48 -0500
Message-ID: <20160923181048.GA10498@rob-hp-laptop>
References: <20160920052240.10242-1-mahoda.ratnayaka@alliedtelesis.co.nz>
 <d3258440-db4e-a4c2-cca1-9683d0da63a8@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <d3258440-db4e-a4c2-cca1-9683d0da63a8-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Mahoda Ratnayaka <mahoda.ratnayaka-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
Cc: Jean Delvare <jdelvare-IBi9RG/b67k@public.gmane.org>, linux-hwmon-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chris Packham <chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 20, 2016 at 02:55:42AM -0700, Guenter Roeck wrote:
> On 09/19/2016 10:22 PM, Mahoda Ratnayaka wrote:
> >Currently there is no method for setting the channel
> >value from the DTS file. When, the driver uses a dts
> >file to initialize the driver platform_data is not set.
> >As a the result channel variable may not be set correctly.
> >
> >Without the channel variable set correctly, some of the
> >sensors will not be initialized correctly. For example
> >temp3 sensor sysfs entries.
> >
> >This adds the required functionality to set the channel
> >variable from the DTS file. This is done via reading the
> >reading a property named "channel" from the lm87 driver.
> >
> >Signed-off-by: Mahoda Ratnayaka <mahoda.ratnayaka-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
> >---
> >
> >Notes:
> >     changes since v1:
> >     Removed unncessary variables channel and np.
> >     Update the code as per review comments.
> >
> > Documentation/devicetree/bindings/hwmon/lm87.txt | 9 +++++++++
> > drivers/hwmon/lm87.c                             | 7 ++++++-
> > 2 files changed, 15 insertions(+), 1 deletion(-)
> >
> >diff --git a/Documentation/devicetree/bindings/hwmon/lm87.txt b/Documentation/devicetree/bindings/hwmon/lm87.txt
> >index fefcb48..1906e08 100644
> >--- a/Documentation/devicetree/bindings/hwmon/lm87.txt
> >+++ b/Documentation/devicetree/bindings/hwmon/lm87.txt
> >@@ -6,9 +6,18 @@ Required properties:
> >
> > - reg: I2C address
> >
> >+optional properties:
> >+- channels: Value for the channel mode register.
> >+            This allows configuration of pins with
> >+            selectable uses on the LM87 device (e.g.
> >+            choosing between voltage and temperature
> >+            inputs).
> >+            See hwmon/lm87 for further information
> 
> Rob is the ultimate person to comment here, but I think the property description
> by itself should be complete and technically independent of the implementation.
> Documentation/hwmon/lm87 describes the implementation, so an (incomplete)
> reference to it seems inappropriate.

Yes, please make the binding stand on its own. And please put all of the 
binding in one patch. You're describing h/w, not adding s/w features.

As far as whether this is configuration or h/w description, it depends 
on what defines the configuration. If it is fixed by the h/w design then 
this is okay. If it is a user choice, then no it should not be in DT. 
Seems like this would be the former case as probably temperature 
measurement requires a thermistor or something.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

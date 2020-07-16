Return-Path: <SRS0=XaEl=A3=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D656EC433E0
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jul 2020 00:01:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A713620714
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jul 2020 00:01:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KkbJYvOP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726778AbgGPABW (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 15 Jul 2020 20:01:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726479AbgGPABV (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 15 Jul 2020 20:01:21 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4B9FC061755;
        Wed, 15 Jul 2020 17:01:21 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id md7so3785459pjb.1;
        Wed, 15 Jul 2020 17:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=oZVY05ZxTi4lfWrSgMFfWnzBUSrIUp64s4pdzlRlSiQ=;
        b=KkbJYvOP4X5qszOkPQoNp1PDZtCvAwNVH3628GUIDm6jw3mFr6KmqKO/jZ77lBKnhy
         8Btu/VIrCcbyfehr3iRJhU5CMUrhyXeWtHrMIpfO7oeCuaLYkbIYTC8tlkDmDvNgN/mr
         JpbE8cBkWuTiloLEus9a5ijPQ/G128XeZiLXzYoUCfzjRhWpfxfR5VU0k5xHrd1HKeNb
         XTwqA4k4D/VY4GBjfn+LAl1AQK9OixYlv9tunERSpx2iTnsOew/o/GUz2TyzOA5V6vww
         lkCWZuMQ6gMkZZ9jeGfCjKdiYvcTzTV/aMxpDpidh8fnKwkBUVA2yx9Y/+2owYTftAyB
         TG5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=oZVY05ZxTi4lfWrSgMFfWnzBUSrIUp64s4pdzlRlSiQ=;
        b=FFX2hSTZR7gxtuCdXsHCmvrOV09+fUTZUwtgR7Ogn4kjaXSCJ51f+dQ94SJJ/KUPmb
         s48XC1L4ou1WqWUnXkWtARahGADRMlRJQuoMMxLSWgiD1oftkVTuiniYsmZPPui/O2EN
         lihdXQY1BbNs74GYqR5Lp/ZzJWMFuuvSNPrYLfOJ5Pv1K36T7DYWGfe+Z0Z8sH7dzbCO
         6+yVKH9PkmosFT6EL6I2HPjuJWjtA/ZWnoSRGixAFys3pFbSJGbWQ6QPp5RFii6nLCjK
         DLTc/BLAdkNmfxCWAMn9ZHGSJlqv7SvdaBvd7ika8UtVBhBVHhxnZfa8sq7OOVMgXuwW
         GdMw==
X-Gm-Message-State: AOAM531TaRxkg3xfb1jQR6jhFzbUkmRLrWMUdakVKlB8j0tXWbFyTIcQ
        4M+4cSRjO3fzKi65cceExsQ=
X-Google-Smtp-Source: ABdhPJyslSh5XwZALeEY8uAB2c4IE1i0Krj41Wpry96LFCNGeQhpZT4eO7Bf3KAyx0BkjNF+9wYZnw==
X-Received: by 2002:a17:90a:764c:: with SMTP id s12mr2119645pjl.201.1594857681041;
        Wed, 15 Jul 2020 17:01:21 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id bg6sm2994167pjb.51.2020.07.15.17.01.18
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jul 2020 17:01:19 -0700 (PDT)
Date:   Wed, 15 Jul 2020 17:01:17 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Tobias Schramm <t.schramm@manjaro.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/4] usb: typec: Add
 typec_port_register_altmodes_from_fwnode()
Message-ID: <20200716000117.GA236686@roeck-us.net>
References: <20200714113617.10470-1-hdegoede@redhat.com>
 <20200714113617.10470-3-hdegoede@redhat.com>
 <38a0c13d-fd78-9e67-91c8-4b86c437593e@roeck-us.net>
 <9d1a2929-6fea-f035-6413-57cf55d1562a@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9d1a2929-6fea-f035-6413-57cf55d1562a@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Jul 15, 2020 at 11:14:03PM +0200, Hans de Goede wrote:
> Hi Guenter,
> 
> Thank you for all the reviews.
> 
> On 7/15/20 6:39 PM, Guenter Roeck wrote:
> > On 7/14/20 4:36 AM, Hans de Goede wrote:
> > > This can be used by Type-C controller drivers which use a standard
> > > usb-connector fwnode, with altmodes sub-node, to describe the available
> > > altmodes.
> > > 
> > > Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> > > ---
> > >   drivers/usb/typec/class.c | 56 +++++++++++++++++++++++++++++++++++++++
> > >   include/linux/usb/typec.h |  7 +++++
> > >   2 files changed, 63 insertions(+)
> > > 
> > > diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> > > index c9234748537a..47de2b2e3d54 100644
> > > --- a/drivers/usb/typec/class.c
> > > +++ b/drivers/usb/typec/class.c
> > > @@ -1607,6 +1607,62 @@ typec_port_register_altmode(struct typec_port *port,
> > >   }
> > >   EXPORT_SYMBOL_GPL(typec_port_register_altmode);
> > > +void typec_port_register_altmodes_from_fwnode(struct typec_port *port,
> > > +	const struct typec_altmode_ops *ops, void *drvdata,
> > > +	struct typec_altmode **altmodes, size_t n,
> > > +	struct fwnode_handle *fwnode)
> > > +{
> > > +	struct fwnode_handle *altmodes_node, *child;
> > > +	struct typec_altmode_desc desc;
> > > +	struct typec_altmode *alt;
> > > +	size_t index = 0;
> > > +	u32 svid, vdo;
> > > +	int ret;
> > > +
> > > +	altmodes_node = fwnode_get_named_child_node(fwnode, "altmodes");
> > > +	if (!altmodes_node)
> > > +		return;
> > > +
> > > +	child = NULL;
> > > +	while ((child = fwnode_get_next_child_node(altmodes_node, child))) {
> > > +		ret = fwnode_property_read_u32(child, "svid", &svid);
> > > +		if (ret) {
> > > +			dev_err(&port->dev, "Error reading svid for altmode %s\n",
> > > +				fwnode_get_name(child));
> > > +			continue;
> > 
> > The properties are mandatory. I think the errors should not be ignored.
> 
> I have done this this way deliberately, let me try to explain:
> 
> We basically have 2 choices here:
> 
> 1) Log an error and continue, skipping/ignoring the faulty altmode fw-child-node
> 2) Make the error fatal, rollback all changes made so far and return an error
> to our caller
> 
> First of all, these errors should never happen and if they do happen then the
> person adding the new alt-mode to the dt, will presumably test that this alt-mode
> works, sees that it does not, check the logs and know why. So for stable shipping
> kernels I would expect to never hit this path.
> 
> Secondly even if we somehow do hit this path in a stable shipping kernel, then
> what should our caller do if we return an error? Our caller basically has 2 choices:
> 
> 1. Log and otherwise ignore the error
> 2. Completely abort the registration of the Type-C controller, possibly breaking
> things like USB over the port, charging, etc.
> 
> 2. Seems rather drastic and is not necessary, except for the alt-modes all the
> other functionality of the port will work fine if the call fails. So our caller
> should probably choose 1. as error handling strategy. If it does that, then for
> the error logging it can rely on typec_port_register_altmodes_from_fwnode() having
> already logged an error, so it can just treat it as returning void.
> 
> But if our caller does not care, would it then not be better to just ignore
> any bad alt-mode child nodes and still try to register an alt-mode for the
> good ones?
> 
> Thirdly adding code to unwind the registration of the alt-modes done so far
> + adding code to our caller to abort the port registration would be adding a
> bunch of extra, fragile code for something which should (and likely will)
> never happen. So we ware adding a bunch of code here which in essence is
> pretty much never tested and thus is almost assured to either be broken
> from day 1, or to become broken over time.
> 
> The kernel is likely full of error handling paths with bugs because it is
> trying to handle errors which never happen. Sometimes this is necessary
> because e.g. a driver's probe function cannot continue without acquiring
> a certain resource. But in this case we can easily avoid the broken error
> handling code syndrome; and keep the code nice and simple, by just skipping
> over broken nodes.
> 

IMO all errors should be handled. I don't really trust implementers to do
the right thing. I have seen too many patches which don't even compile.
Correct, this should not happen, and it won't happen if the DT is correct.
Only a complete abort will really force the implementer to fix the problem.

Yes, error handling is not always properly implemented. In such cases, error
handling should be fixed, not abandoned.

I understand that we are well into philosophy. I'll let others decide if
they want to accept your patch as-is.

Thanks,
Guenter

> > 
> > > +		}
> > > +
> > > +		ret = fwnode_property_read_u32(child, "vdo", &vdo);
> > > +		if (ret) {
> > > +			dev_err(&port->dev, "Error reading vdo for altmode %s\n",
> > > +				fwnode_get_name(child));
> > > +			continue;
> > > +		}
> > > +
> > > +		if (index >= n) {
> > > +			dev_err(&port->dev, "Error not enough space for altmode %s\n",
> > > +				fwnode_get_name(child));
> > > +			continue;
> > 
> > Seems to be pointless to continue here.
> 
> Continuing here makes sure that if the dts contains 10 alt-modes and n = 8 that we print
> an error for both alt-modes which we are not registering because there is not enough space
> in the passed in array for storing alt-mode pointers.
> 
> It also ensures that we error check any further nodes for missing svid/vdo properties.
> 
> 
> > 
> > > +		}
> > > +
> > > +		desc.svid = svid;
> > > +		desc.vdo = vdo;
> > > +		desc.mode = index + 1;
> > > +		alt = typec_port_register_altmode(port, &desc);
> > > +		if (IS_ERR(alt)) {
> > > +			dev_err(&port->dev, "Error registering altmode %s\n",
> > > +				fwnode_get_name(child));
> > > +			continue;
> > 
> > Maybe there is a reason to ignore all those errors. If so,
> > that should be explained.
> 
> See above, note this is another error which should never happen, I think
> this can only happen in case of -ENOMEM, which itself can only happen
> for allocations of an order greater then n=2 AFAIK, and I don't think
> typec_port_register_altmode() does any such allocations.
> 
> I guess some comment here is warranted, but my full explanation above
> is way too long. So maybe a simple comment like this?  :
> 
> 			/* Should never happen, keep the error handling as simple as possible */
> 
> Regards,
> 
> Hans
> 
> 
> > 
> > > +		}
> > > +
> > > +		alt->ops = ops;
> > > +		typec_altmode_set_drvdata(alt, drvdata);
> > > +		altmodes[index] = alt;
> > > +		index++;
> > > +	}
> > > +}
> > > +EXPORT_SYMBOL_GPL(typec_port_register_altmodes_from_fwnode);
> > > +
> > >   /**
> > >    * typec_register_port - Register a USB Type-C Port
> > >    * @parent: Parent device
> > > diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
> > > index 5daa1c49761c..fbe4bccb3a98 100644
> > > --- a/include/linux/usb/typec.h
> > > +++ b/include/linux/usb/typec.h
> > > @@ -17,6 +17,7 @@ struct typec_partner;
> > >   struct typec_cable;
> > >   struct typec_plug;
> > >   struct typec_port;
> > > +struct typec_altmode_ops;
> > >   struct fwnode_handle;
> > >   struct device;
> > > @@ -121,6 +122,12 @@ struct typec_altmode
> > >   struct typec_altmode
> > >   *typec_port_register_altmode(struct typec_port *port,
> > >   			     const struct typec_altmode_desc *desc);
> > > +
> > > +void typec_port_register_altmodes_from_fwnode(struct typec_port *port,
> > > +	const struct typec_altmode_ops *ops, void *drvdata,
> > > +	struct typec_altmode **altmodes, size_t n,
> > > +	struct fwnode_handle *fwnode);
> > > +
> > >   void typec_unregister_altmode(struct typec_altmode *altmode);
> > >   struct typec_port *typec_altmode2port(struct typec_altmode *alt);
> > > 
> > 
> 

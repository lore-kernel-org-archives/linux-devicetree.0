Return-Path: <SRS0=t/t8=JE=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mga05.intel.com ([192.55.52.43]:55437 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S933575AbeFRMAx (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 18 Jun 2018 08:00:53 -0400
Date: Mon, 18 Jun 2018 15:00:49 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: USB role switches, usb-connector, typec and device trees
Message-ID: <20180618120049.GD2847@kuha.fi.intel.com>
References: <6c379a23-5c63-9b49-9444-e16d6a8082a6@gmail.com>
 <84f5cbcf-41c5-de01-9191-deae0a53bc96@redhat.com>
 <20180607120150.GC17155@kuha.fi.intel.com>
 <dc7949d9-af0a-aab8-6011-33df32c05dd3@gmail.com>
 <20180613135126.GC2847@kuha.fi.intel.com>
 <fbf681c1-da6b-943c-ddee-48f95861a363@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fbf681c1-da6b-943c-ddee-48f95861a363@gmail.com>
Sender: devicetree-owner@vger.kernel.org
To: Mats Karrman <mats.dev.list@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Andrzej Hajda <a.hajda@samsung.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi Mats,

On Fri, Jun 15, 2018 at 11:51:17PM +0200, Mats Karrman wrote:
> I hacked away to see if I could make some sense of this but I didn't get far.
> Do you mean that the device_connection_find_match() function should be
> extended with code for finding matches in devicetrees as well?

Yes.

> I tried and ended up creating temporary device_connection instances just
> to try to satisfy the match function you supply from usb_role_switch_get(),

That's how I planned to use it.

> only the OF graph connection does not have a name to compare with.

I think this is about the problem I explained below. So let's just add the
fwnode member to the struct device_connection.

> > > (Ugh, just realized that the "reg" numeric value of the endpoint node is
> > > put in the "id" field of the endpoint struct, bad luck...).
> > Isn't the "compatible" property the one that should be used in this
> > case? The remote endpoint just has to have compatible property
> > matching the con_id, no?
> 
> By endpoint you mean the OF node named "endpoint" as described by graph
> documentation or something else?
> I have not seen or heard of any "endpoint" nodes having "compatible" properties,
> only the nodes containing the "port(s)" nodes. The USB controller node
> won't have compatible set to "usb-role-switch" so which node do you mean?

"compatible" was just a suggestion, but why couldn't for example USB
controller have the "compatible" set also to "usb-role-switch" if it
really acts as the role switch on your system?

        compatible = "<your_platform>-dwc3", "usb-role-switch"

> > My worry is that currently there is no function to convert a fwnode
> > to device. With ACPI it is possible already, but only to the first
> > device bind to the node (ACPI device node can be bind to multiple
> > devices). I don't think there is a function to convert OF node to
> > device.
> > 
> > We could of course workaround this problem and add fwnode member(s) to
> > the device_lookup structure. The callers would then have to check is
> > fwnode or the endpoint (device) name being used, which is not ideal
> > IMO.
> 
> "device_connection" structure?

Yes, sorry about that.

You know, I'm not completely sure what is the benefit in using device
graph with USB connectors? I don't think we need to describe a real
device graph where we could have multiple levels, or do we?

In any case, I guess we are stuck with it since it's used in
Documentation/devicetree/bindings/connector/usb-connector.txt, but I
think in device_connection_find_match() we should still first simply
try to find a named reference (so in case of device tree call
of_parse_phandle(node, con_id, 0)), if that fails try to parse the
graph, and finally if that also fails, check if we have a build-in
description of the connection. Something like this:

void *device_connection_find_match(struct device *dev, const char *con_id,
...
        struct fwnode_handle *fwnode = dev_fwnode(dev);
        struct device_connection connection = { };
        struct fwnode_handle *endpoint = NULL;
        struct fwnode_referece_args args;
        ...
        /* First let's check if there is a named reference. */
        if (!fwnode_property_get_reference_args(fwnode, con_id, NULL, 0, 0,
                                                &args) {
                connection.fwnode = args.fwnode;
                ret = match(&connection, 0, data);
                ...
        }

        /* Let's try device graph */
        while ((endpoint = fwnode_graph_get_next_endpoint(fwnode, endpoint))) {
                struct fwnode_handle *remote;

                remote = fwnode_graph_get_remote_port_parent(endpoint);
                if (!remote)
                        break;

                /* In this example I'm using "compatible" */
                if (!fwnode_property_match_string(remote, "compatible",
                                                  con_id)) {
                        connection.fwnode = remote;
                        ret = match(&connection, 0, data);
                        ...
                }
        }

        /* Finally check if there is a build-in connection description */
        ...


Thanks,

-- 
heikki

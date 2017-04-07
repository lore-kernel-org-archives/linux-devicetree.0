From: Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH v2 2/8] v4l: fwnode: Support generic fwnode for parsing
 standardised properties
Date: Sat, 8 Apr 2017 00:30:10 +0300
Message-ID: <20170407213010.GJ4192@valkosipuli.retiisi.org.uk>
References: <1491484330-12040-1-git-send-email-sakari.ailus@linux.intel.com>
 <1491484330-12040-3-git-send-email-sakari.ailus@linux.intel.com>
 <2366571.B7YdK6QUO2@avalon>
 <20170407103633.GD4192@valkosipuli.retiisi.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-acpi-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170407103633.GD4192@valkosipuli.retiisi.org.uk>
Sender: linux-acpi-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, linux-acpi@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Apr 07, 2017 at 01:36:34PM +0300, Sakari Ailus wrote:
...
> > > +	if (is_of_node(fwn)) {
> > > +		if (of_node_cmp(to_of_node(fwn)->name, "ports") == 0)
> > > +			fwn = fwnode_get_next_parent(fwn);
> > > +	} else {
> > > +		/* The "ports" node is always there in ACPI. */

This comment is actually wrong and does not reflect the current
implementation anymore. I'll fix that as well.

> > > +		fwn = fwnode_get_next_parent(fwn);
> > > +	}

-- 
Sakari Ailus
e-mail: sakari.ailus@iki.fi	XMPP: sailus@retiisi.org.uk

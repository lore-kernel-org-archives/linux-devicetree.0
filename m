Return-Path: <SRS0=wb2U=SU=gmail.com=rjwysocki@kernel.org>
MIME-Version: 1.0
References: <20190402103037.8517-1-sakari.ailus@linux.intel.com> <20190418121848.qdaoi6ibn5opjg6z@valkosipuli.retiisi.org.uk>
In-Reply-To: <20190418121848.qdaoi6ibn5opjg6z@valkosipuli.retiisi.org.uk>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 18 Apr 2019 14:43:07 +0200
Message-ID: <CAJZ5v0gr+iSmwdOBpZF1k9Xs0CE3pfJg_NZDRd326PN7_g3Ncg@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] device property: Add fwnode_graph_get_endpoint_by_id
Content-Type: text/plain; charset="UTF-8"
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Thu, Apr 18, 2019 at 2:20 PM Sakari Ailus <sakari.ailus@iki.fi> wrote:
>
> On Tue, Apr 02, 2019 at 01:30:37PM +0300, Sakari Ailus wrote:
> > fwnode_graph_get_endpoint_by_id() is intended for obtaining local
> > endpoints by a given local port. fwnode_graph_get_endpoint_by_id() is
> > slightly different from its OF counterpart is
> > of_graph_get_endpoint_by_regs(): instead of using -1 as a value to signify
> > that a port or an endpoint number does not matter, it uses flags to look
> > for equal or greater endpoint. The port number is always fixed. It also
> > returns only remote endpoints that belong to an available device, a
> > behaviour that can be turned off with a flag.
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>
> Ping?

I've been waiting for Rob to say something, but it looks like he has
nothing to say here, so I think I'll go ahead and take the patch as
is.

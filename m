From: Brian Norris <briannorris@chromium.org>
Subject: Re: [RFC PATCH v1 0/3] device property: Support MAC address in VPD
Date: Thu, 30 Aug 2018 18:26:57 -0700
Message-ID: <20180831012656.GB67271@ban.mtv.corp.google.com>
References: <20180814223758.117433-1-briannorris@chromium.org>
 <a240b3f9-d41b-30d7-ef11-5dcd1a981c0f@gmail.com>
 <20180815002204.GA258561@ban.mtv.corp.google.com>
 <bb1b2b7d-2c47-a6b3-7618-063351f379b2@gmail.com>
 <20180815014436.GA17200@ban.mtv.corp.google.com>
 <20180815221601.GB24830@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180815221601.GB24830@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Brian Norris <computersforpeace@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Andrew Lunn <andrew@lunn.ch>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Guenter Roeck <linux@roeck-us.net>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Julius Werner <jwerner@chromium.org>, Stephen Boyd <swboyd@chromium.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: devicetree@vger.kernel.org

Hi, sorry for the delay, and thanks for the response.

I'm still not sure whether I'll pursue this series further, but I'd like
to at least narrow down what it'd look like.

On Wed, Aug 15, 2018 at 04:16:01PM -0600, Rob Herring wrote:
> On Tue, Aug 14, 2018 at 06:44:36PM -0700, Brian Norris wrote:
> > On Tue, Aug 14, 2018 at 05:52:49PM -0700, Florian Fainelli wrote:
> > > On 08/14/2018 05:22 PM, Brian Norris wrote:
> > > >> Also, aliases in DT are meant to provide some stability.
> > > > 
> > > > How, specifically? I don't see any relevant binding description for
> > > > aliases under Documentation/devicetree/bindings/net/.
> > > 
> > > Indeed they are not, likewise, we should probably update devicetree-spec
> > > to come up with standard names that of_alias_get_id() already consumes.
> > 
> > A quick grep shows we already have divergence: both "eth" and "ethernet"
> > are in use.
> 
> Uggg, it would be nice to clean that up. 

Is it fair to just change them, since they were never documented? Of
course, only after documenting the "right" way.

> There's several aliases I'd like to get rid of (some platforms went a 
> little crazy with them) and I'd like to start requiring alias names to 
> be documented. I created an issue for the spec. Patches welcomeTM. :)

So e.g., new text in Documentation/devicetree/bindings/net/ethernet.txt
and Documentation/devicetree/bindings/net/wireless/ieee80211.txt about
'aliases' entries? I can do that, especially if I give up on a new
binding like in this series.

> > But anyway, would the idea be that you just put 'ethernet{0,1,...}' and
> > 'wifi{0,1,...}' aliases in the /chosen node, then require boot firmware
> > to insert any {ethernet,wifi}_mac{0,1,...} into the paths represented by
> > the corresponding aliases?
> 
> In the /aliases node, but yes.

Oops, yes.

> Seems to me that nvmem needs to be extended to allow providers to 
> retrieve and interpret data. Not everything is at some fixed offset and 
> size. Something like this is valid dts:
> 
> nvmem = <&phandle> "a-string";
> 
> But that's pretty uncommon (I can't think of a binding that actually 
> uses that). Perhaps the provider has an array of keys defined and the 
> consumer just provides the index.

In the case of VPD, all keys are 0-terminated strings (there's also a
length field, but the key is still 0-terminated), so that scheme could
work. (I'm not sure an indexed provider is extremely relevant right now,
although it probably could be supported if I expand the of_nvmem
retrieval to support a generic of_xlate() override anyway.) The
information represented is almost the same as in my proposal, except that:
(a) now I have to give the VPD a phandle -- so far, I've avoided that,
    as it's just an auto-enumerated device underneath the
    /firmware/coreboot device (see drivers/firmware/google/vpd.c)
(b) this is no longer directly useful to ACPI systems -- I'm not
    actually sure how (if at all) nvmem provider/consumer is supposed to
    work there

But maybe this isn't really that useful to ACPI, and it's sufficient to
just have fwnode_get_mac_address() call of_get_nvmem_mac_address() when
we're using DT.

> Or we could do '<key>-nvmem = <&phandle>', but parsing that is a bit 
> more complicated.

That doesn't seem to have much advantage to me.

Brian

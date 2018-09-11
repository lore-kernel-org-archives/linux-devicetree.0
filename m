From: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Subject: RE: [PATCH v2 1/3] dt-bindings: connector: Add support for USB-PD
 PPS APDOs to bindings
Date: Tue, 11 Sep 2018 14:44:38 +0000
Message-ID: <2E89032DDAA8B9408CB92943514A03370198316AA7@SW-EX-MBX01.diasemi.com>
References: <cover.1536580772.git.Adam.Thomson.Opensource@diasemi.com>
 <b98c58ca3681d18f44359431a1ccec2fa34023d1.1536580772.git.Adam.Thomson.Opensource@diasemi.com>
 <20180911143446.GC22723@kuha.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180911143446.GC22723@kuha.fi.intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Hans de Goede <hdegoede@redhat.com>, Li Jun <jun.li@nxp.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Support Opensource <Support.Opensource@diasemi.com>
List-Id: devicetree@vger.kernel.org

On 11 September 2018 15:35, Heikki Krogerus wrote:

> Hi Adam,
> 
> On Mon, Sep 10, 2018 at 01:24:26PM +0100, Adam Thomson wrote:
> > Add support for PPS APDOs to connector bindings so a port controller
> > can specify support for PPS, as per existing FIXED/BATT/VAR PDOs.
> >
> > Signed-off-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> 
> I've applied this patch to my tree:
> https://github.com/krohei/linux/commit/adae44a671f47e94d6aa0fba8fb51b78d40c
> 505d
> 
> I will resend it to Greg together with all the other Type-C patches
> that are ready next week after v4.19-rc4 unless Greg has picked it
> himself before that.

Ok, thanks for the update. Saw your patch to tidy up file locations so was
anticipating the need for a rebase, but this will save me job. :)

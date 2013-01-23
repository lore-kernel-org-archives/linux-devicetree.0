From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2] hwmon: Driver for Texas Instruments INA209
Date: Wed, 23 Jan 2013 15:14:57 -0800
Message-ID: <20130123231457.GA20993@roeck-us.net>
References: <1358915321-30200-1-git-send-email-linux@roeck-us.net>
 <20130123180222.GA25880@ovro.caltech.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20130123180222.GA25880@ovro.caltech.edu>
Sender: linux-doc-owner@vger.kernel.org
To: "Ira W. Snyder" <iws@ovro.caltech.edu>
Cc: lm-sensors@lm-sensors.org, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Jean Delvare <khali@linux-fr.org>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, Paul Hays <haysp@magma.net>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 23, 2013 at 10:02:22AM -0800, Ira W. Snyder wrote:
> On Tue, Jan 22, 2013 at 08:28:41PM -0800, Guenter Roeck wrote:
> > Add support for the TI / Burr-Brown INA209 voltage / current / power
> > monitor.
> > 
> > Cc: Paul Hays <haysp@magma.net>
> > Cc: Ira W. Snyder <iws@ovro.caltech.edu>
> > Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> > ---
> > v2:
> > - Updated Paul Hays' e-mail address and added as driver author
> > - ina290_init_client -> ina209_init_client
> > - Added devicetree support
> > - Simplified chip initialization code
> > 
> 
> Hi Guenter,
> 
> I tested this on a PowerPC using the new devicetree support. It sets the
> calibration registers correctly based on the devicetree values.
> 
> Tested-by: Ira W. Snyder <iws@ovro.caltech.edu>
> 
> Thanks for the work on this!

Thanks for testing!

Guenter

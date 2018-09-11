From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH v2 3/3] usb: typec: fusb302: Populate tcpc fwnode for
 TCPM property handling
Date: Tue, 11 Sep 2018 17:37:24 +0300
Message-ID: <20180911143724.GE22723@kuha.fi.intel.com>
References: <cover.1536580772.git.Adam.Thomson.Opensource@diasemi.com>
 <3005ce7723546a48dfad529ce396033a973664b3.1536580772.git.Adam.Thomson.Opensource@diasemi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3005ce7723546a48dfad529ce396033a973664b3.1536580772.git.Adam.Thomson.Opensource@diasemi.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Hans de Goede <hdegoede@redhat.com>, Li Jun <jun.li@nxp.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, support.opensource@diasemi.com
List-Id: devicetree@vger.kernel.org

Hi Adam,

On Mon, Sep 10, 2018 at 01:24:28PM +0100, Adam Thomson wrote:
> This update populates the tcpc handle's fwnode pointer with the
> child usb-connector node, if it exists, so that TCPM can perform
> generic property handling to define the ports capabilities.
> 
> Signed-off-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>

I've applied this patch to my tree:
https://github.com/krohei/linux/commit/bc5614cfe29eb48494eaf88845f57a49ae5c1967

I will resend it to Greg together with all the other Type-C patches
that are ready next week after v4.19-rc4 unless Greg has picked it
himself before that.


Thanks,

-- 
heikki

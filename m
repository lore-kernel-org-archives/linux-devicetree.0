From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: connector: Add support for USB-PD
 PPS APDOs to bindings
Date: Tue, 11 Sep 2018 17:34:46 +0300
Message-ID: <20180911143446.GC22723@kuha.fi.intel.com>
References: <cover.1536580772.git.Adam.Thomson.Opensource@diasemi.com>
 <b98c58ca3681d18f44359431a1ccec2fa34023d1.1536580772.git.Adam.Thomson.Opensource@diasemi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <b98c58ca3681d18f44359431a1ccec2fa34023d1.1536580772.git.Adam.Thomson.Opensource@diasemi.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Hans de Goede <hdegoede@redhat.com>, Li Jun <jun.li@nxp.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, support.opensource@diasemi.com
List-Id: devicetree@vger.kernel.org

Hi Adam,

On Mon, Sep 10, 2018 at 01:24:26PM +0100, Adam Thomson wrote:
> Add support for PPS APDOs to connector bindings so a port controller
> can specify support for PPS, as per existing FIXED/BATT/VAR PDOs.
> 
> Signed-off-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

I've applied this patch to my tree:
https://github.com/krohei/linux/commit/adae44a671f47e94d6aa0fba8fb51b78d40c505d

I will resend it to Greg together with all the other Type-C patches
that are ready next week after v4.19-rc4 unless Greg has picked it
himself before that.


Thanks,

-- 
heikki

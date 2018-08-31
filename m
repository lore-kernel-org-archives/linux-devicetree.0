From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: connector: Add support for USB-PD PPS
 APDOs  to bindings
Date: Fri, 31 Aug 2018 08:16:41 -0400
Message-ID: <20180831121641.GA20591@bogus>
References: <cover.1534853047.git.Adam.Thomson.Opensource@diasemi.com>
 <0d3a589560b519ab07ed6aaaf012959098c5a2ea.1534853047.git.Adam.Thomson.Opensource@diasemi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <0d3a589560b519ab07ed6aaaf012959098c5a2ea.1534853047.git.Adam.Thomson.Opensource@diasemi.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, Hans de Goede <hdegoede@redhat.com>, Li Jun <jun.li@nxp.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, support.opensource@diasemi.com
List-Id: devicetree@vger.kernel.org

On Tue, 21 Aug 2018 13:28:21 +0100, Adam Thomson wrote:
> Add support for PPS APDOs to connector bindings so a port controller
> can specify support for PPS, as per existing FIXED/BATT/VAR PDOs.
> 
> Signed-off-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
> ---
>  .../bindings/connector/usb-connector.txt           |  8 +++----
>  include/dt-bindings/usb/pd.h                       | 26 ++++++++++++++++++++++
>  2 files changed, 30 insertions(+), 4 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

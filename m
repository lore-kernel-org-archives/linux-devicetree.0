Return-Path: <SRS0=vUhH=HW=suse.com=oneukum@kernel.org>
Message-ID: <1525332431.12348.1.camel@suse.com>
Subject: Re: [PATCH v5 01/14] dt-bindings: connector: add properties for
 typec
From: Oliver Neukum <oneukum@suse.com>
Date: Thu, 03 May 2018 09:27:11 +0200
In-Reply-To: <1525307094-27402-2-git-send-email-jun.li@nxp.com>
References: <1525307094-27402-1-git-send-email-jun.li@nxp.com>
	 <1525307094-27402-2-git-send-email-jun.li@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Li Jun <jun.li@nxp.com>, robh+dt@kernel.org, heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org, linux@roeck-us.net
Cc: gsomlo@gmail.com, linux-imx@nxp.com, peter.chen@nxp.com, shufan_lee@richtek.com, a.hajda@samsung.com, cw00.choi@samsung.com, devicetree@vger.kernel.org, linux-usb@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Am Donnerstag, den 03.05.2018, 08:24 +0800 schrieb Li Jun:
> +Optional properties for usb-c-connector:
> +- power-role: should be one of "source", "sink" or "dual"(DRP) if typec
> +  connector has power support.
> +- try-power-role: preferred power role if "dual"(DRP) can support Try.SNK
> +  or Try.SRC, should be "sink" for Try.SNK or "source" for Try.SRC.
> +- data-role: should be one of "host", "device", "dual"(DRD) if typec
> +  connector supports USB data.

Hi,

is this really correct?

Can one implement a device that can operate as either DFP or UFP,
but not implements the dynamic role switch that a DRP must support?

	Regards
		Oliver

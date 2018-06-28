Return-Path: <SRS0=MKI6=JO=linuxfoundation.org=gregkh@kernel.org>
Date: Thu, 28 Jun 2018 19:50:38 +0900
From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v8 00/14] staging: typec: tcpci: move out of staging
Message-ID: <20180628105038.GA5191@kroah.com>
References: <1530056732-9640-1-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1530056732-9640-1-git-send-email-jun.li@nxp.com>
To: Li Jun <jun.li@nxp.com>
Cc: robh+dt@kernel.org, heikki.krogerus@linux.intel.com, linux@roeck-us.net, a.hajda@samsung.com, cw00.choi@samsung.com, shufan_lee@richtek.com, peter.chen@nxp.com, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-imx@nxp.com
List-ID: <devicetree@vger.kernel.org>

On Wed, Jun 27, 2018 at 07:45:18AM +0800, Li Jun wrote:
> This patch set attempts to move the tcpci drivers out of staging by fix
> some tcpci driver issues and define typec and power delivery device
> properties, the changes are verified on NXP PTN5110, which is a standard
> tcpci typec port controller device with power delivery support, tested
> power source and sink with drp config.

Nice work, thanks for sticking with this.  All now merged.

greg k-h

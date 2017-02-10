From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v3 04/18] drivers/fsi: Add fsi master definition
Date: Fri, 10 Feb 2017 15:21:19 +0100
Message-ID: <20170210142119.GA13386@kroah.com>
References: <20170201165358.45415-1-cbostic@linux.vnet.ibm.com>
 <20170201165358.45415-5-cbostic@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170201165358.45415-5-cbostic@linux.vnet.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, mturquette@baylibre.com, geert+renesas@glider.be, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joel@jms.id.au, linux-kernel@vger.kernel.org, andrew@aj.id.au, alistair@popple.id.au, benh@kernel.crashing.org, Jeremy Kerr <jk@ozlabs.org>, Chris Bostic <cbostic@us.ibm.com>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 01, 2017 at 10:53:44AM -0600, Christopher Bostic wrote:
> From: Jeremy Kerr <jk@ozlabs.org>
> 
> Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
> Signed-off-by: Chris Bostic <cbostic@us.ibm.com>
> ---
>  drivers/fsi/fsi-core.c   | 28 ++++++++++++++++++++++++++++
>  drivers/fsi/fsi-master.h | 37 +++++++++++++++++++++++++++++++++++++
>  2 files changed, 65 insertions(+)
>  create mode 100644 drivers/fsi/fsi-master.h

I can't take patches without any changelog text, so please fix up and
resend the remaining patches in the series.

thanks,

greg k-h

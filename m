From: Niklas Cassel <niklas.cassel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 0/6] *** Add support for wifi QMI client handshakes ***
Date: Tue, 24 Jul 2018 22:23:53 +0200
Message-ID: <20180724202353.GA14174@centauri.lan>
References: <20180723123428.12993-1-govinds@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180723123428.12993-1-govinds-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Govind Singh <govinds-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ath10k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jul 23, 2018 at 06:04:22PM +0530, Govind Singh wrote:
> Add QMI client handshakes for Q6 integrated WLAN connectivity subsystem.
> This module is responsible for communicating WLAN control messages to FW
> over QMI interface. This patch series enables the qmi handshakes required for
> WCN3990 chipset.
> 
> QUALCOMM MSM Interface(QMI) provides the control interface between
> components running b/w remote processors with underlying transport layer
> based on integrated chipset(shared memory) or discrete chipset(PCI/USB/SDIO/UART).
> 
> QMI client driver implementation is based on qmi framework https://lwn.net/Articles/729924/.

For whole series:

Acked-by: Niklas Cassel <niklas.cassel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

From: Alan Cox <alan@linux.intel.com>
Subject: Re: [PATCH 2/2] tty: of_serial: support for 32 bit accesses
Date: Wed, 15 Jun 2011 13:54:19 +0100
Message-ID: <20110615135419.52c5ee06@bob.linux.org.uk>
References: <1308142199-17972-1-git-send-email-jamie@jamieiles.com>
	<1308142199-17972-2-git-send-email-jamie@jamieiles.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-serial-owner@vger.kernel.org>
In-Reply-To: <1308142199-17972-2-git-send-email-jamie@jamieiles.com>
Sender: linux-serial-owner@vger.kernel.org
To: Jamie Iles <jamie@jamieiles.com>
Cc: linux-serial@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, Grant Likely <grant.likely@secretlab.ca>
List-Id: devicetree@vger.kernel.org

On Wed, 15 Jun 2011 13:49:59 +0100
Jamie Iles <jamie@jamieiles.com> wrote:

> Some platforms e.g. TI Davinci require 32-bit accesses to the UARTs.
> The of_serial driver currently registers all UARTs as UPIO_MEM.  Add a
> new attribute "io-width" to allow the port to be registered with
> different IO width requirements.
> 
> Cc: Alan Cox <alan@linux.intel.com>

Acked-by: Alan Cox <alan@linux.intel.com>

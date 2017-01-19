From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 2/2] of: Add function for generating a DT modalias with a
 newline
Date: Thu, 19 Jan 2017 11:35:33 +0100
Message-ID: <20170119103533.GA19476@kroah.com>
References: <20170116204122.5858-1-robh@kernel.org>
 <20170116204122.5858-2-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170116204122.5858-2-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Mon, Jan 16, 2017 at 02:41:22PM -0600, Rob Herring wrote:
> The modalias sysfs attr is lacking a newline for DT aliases on platform
> devices. The macio and ibmebus correctly add the newline, but open code it.
> Introduce a new function, of_device_modalias(), that fills the buffer with
> the modalias including the newline and update users of the old
> of_device_get_modalias function.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Frank Rowand <frowand.list@gmail.com>
> Cc: linuxppc-dev@lists.ozlabs.org


Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

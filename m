From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH V3 07/12] misc: xilinx_sdfec: Add ability to configure
 LDPC
Date: Thu, 2 May 2019 19:27:13 +0200
Message-ID: <20190502172713.GD1874@kroah.com>
References: <1556402706-176271-1-git-send-email-dragan.cvetic@xilinx.com>
 <1556402706-176271-8-git-send-email-dragan.cvetic@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1556402706-176271-8-git-send-email-dragan.cvetic@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dragan Cvetic <dragan.cvetic@xilinx.com>
Cc: arnd@arndb.de, michal.simek@xilinx.com, linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Derek Kiernan <derek.kiernan@xilinx.com>
List-Id: devicetree@vger.kernel.org

On Sat, Apr 27, 2019 at 11:05:01PM +0100, Dragan Cvetic wrote:
> --- a/include/uapi/misc/xilinx_sdfec.h
> +++ b/include/uapi/misc/xilinx_sdfec.h

<snip>

> +/**
> + * xsdfec_calculate_shared_ldpc_table_entry_size - Calculates shared code
> + * table sizes.
> + * @ldpc: Pointer to the LPDC Code Parameters
> + * @table_sizes: Pointer to structure containing the calculated table sizes
> + *
> + * Calculates the size of shared LDPC code tables used for a specified LPDC code
> + * parameters.
> + */
> +inline void
> +xsdfec_calculate_shared_ldpc_table_entry_size(struct xsdfec_ldpc_params *ldpc,
> +	struct xsdfec_ldpc_param_table_sizes *table_sizes)
> +{
> +	/* Calculate the sc_size in 32 bit words */
> +	table_sizes->sc_size = (ldpc->nlayers + 3) >> 2;
> +	/* Calculate the la_size in 256 bit words */
> +	table_sizes->la_size = ((ldpc->nlayers << 2) + 15) >> 4;
> +	/* Calculate the qc_size in 256 bit words */
> +	table_sizes->qc_size = ((ldpc->nqc << 2) + 15) >> 4;
> +}

Why do you have an inline function in a user api .h file?  That's really
not a good idea.

thanks,

greg k-h

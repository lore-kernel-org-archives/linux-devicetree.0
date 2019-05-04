From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH V3 07/12] misc: xilinx_sdfec: Add ability to configure LDPC
Date: Sat, 4 May 2019 11:00:25 +0200
Message-ID: <20190504090025.GB13840@kroah.com>
References: <1556402706-176271-1-git-send-email-dragan.cvetic@xilinx.com>
 <1556402706-176271-8-git-send-email-dragan.cvetic@xilinx.com>
 <20190502172713.GD1874@kroah.com>
 <BL0PR02MB5681D386363988CB2CA4D040CB350@BL0PR02MB5681.namprd02.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <BL0PR02MB5681D386363988CB2CA4D040CB350@BL0PR02MB5681.namprd02.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Dragan Cvetic <draganc@xilinx.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "arnd@arndb.de" <arnd@arndb.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Michal Simek <michals@xilinx.com>, Derek Kiernan <dkiernan@xilinx.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Fri, May 03, 2019 at 04:49:19PM +0000, Dragan Cvetic wrote:
> Hi Greg,
> 
> Please find inline comments below.

As they should be, no need to mention it :)

> > -----Original Message-----
> > From: Greg KH [mailto:gregkh@linuxfoundation.org]
> > Sent: Thursday 2 May 2019 18:27
> > To: Dragan Cvetic <draganc@xilinx.com>
> > Cc: arnd@arndb.de; Michal Simek <michals@xilinx.com>; linux-arm-kernel@lists.infradead.org; robh+dt@kernel.org;
> > mark.rutland@arm.com; devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; Derek Kiernan <dkiernan@xilinx.com>
> > Subject: Re: [PATCH V3 07/12] misc: xilinx_sdfec: Add ability to configure LDPC
> > 
> > On Sat, Apr 27, 2019 at 11:05:01PM +0100, Dragan Cvetic wrote:
> > > --- a/include/uapi/misc/xilinx_sdfec.h
> > > +++ b/include/uapi/misc/xilinx_sdfec.h
> > 
> > <snip>
> > 
> > > +/**
> > > + * xsdfec_calculate_shared_ldpc_table_entry_size - Calculates shared code
> > > + * table sizes.
> > > + * @ldpc: Pointer to the LPDC Code Parameters
> > > + * @table_sizes: Pointer to structure containing the calculated table sizes
> > > + *
> > > + * Calculates the size of shared LDPC code tables used for a specified LPDC code
> > > + * parameters.
> > > + */
> > > +inline void
> > > +xsdfec_calculate_shared_ldpc_table_entry_size(struct xsdfec_ldpc_params *ldpc,
> > > +	struct xsdfec_ldpc_param_table_sizes *table_sizes)
> > > +{
> > > +	/* Calculate the sc_size in 32 bit words */
> > > +	table_sizes->sc_size = (ldpc->nlayers + 3) >> 2;
> > > +	/* Calculate the la_size in 256 bit words */
> > > +	table_sizes->la_size = ((ldpc->nlayers << 2) + 15) >> 4;
> > > +	/* Calculate the qc_size in 256 bit words */
> > > +	table_sizes->qc_size = ((ldpc->nqc << 2) + 15) >> 4;
> > > +}
> > 
> > Why do you have an inline function in a user api .h file?  That's really
> > not a good idea.
> 
> This is just a Helper function for users aligning the calculations.
> Please advise, is this acceptable?

Not really, just have actual api functions in a uapi .h file, why would
userspace care about this type of thing?

thanks,

greg k-h

From: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
Subject: Re: [PATCH v2] TPM: Provide a tpm_tis OF driver
Date: Fri, 12 Oct 2012 14:20:05 -0600
Message-ID: <20121012202005.GL4124@obsidianresearch.com>
References: <20121002210453.GA12231@obsidianresearch.com>
 <20121010162428.GA5013@ennui.austin.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20121010162428.GA5013@ennui.austin.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kent Yoder <key@linux.vnet.ibm.com>
Cc: linux-kernel@vger.kernel.org, tpmdd-devel@lists.sourceforge.net, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Wed, Oct 10, 2012 at 11:24:28AM -0500, Kent Yoder wrote:

>   Why change the structs to const here? This generates warnings for me:

I should have dropped this, I was added when I added the __devinitdata
annotations..

> > +
> > +static struct platform_driver tis_driver = {
> >  	.driver = {
> >  		.name = "tpm_tis",
> >  		.owner		= THIS_MODULE,
> >  		.pm		= &tpm_tis_pm,
> > +		.of_match_table = of_match_ptr(tis_of_platform_match),
> >  	},
> 
>   Patch v2 removes the ifdef around of_match_table, which now generates
> an error:

Yes, this update was following the style of other drivers. Obviously I
never thought to try this on x86 (only PPC), so I will try to setup a
compile for that as well and send v3.

I suspect this is simply a missing #include.

Regards,
Jason

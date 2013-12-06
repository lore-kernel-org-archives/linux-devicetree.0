From: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v3] checkpatch: add DT compatible string documentation
 checks
Date: Fri, 06 Dec 2013 08:48:30 -0800
Message-ID: <1386348510.31845.30.camel@joe-AO722>
References: <1386173031-17867-1-git-send-email-robherring2@gmail.com>
	 <1386173563.30493.72.camel@joe-AO722> <20131206095626.GD3248@bark>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131206095626.GD3248@bark>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Whitcroft <apw-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 2013-12-06 at 09:56 +0000, Andy Whitcroft wrote:
> On Wed, Dec 04, 2013 at 08:12:43AM -0800, Joe Perches wrote:
> > On Wed, 2013-12-04 at 10:03 -0600, Rob Herring wrote:
> > > From: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> > > 
> > > This adds a simple check that any compatible strings in DeviceTree dts
> > > files are present in Documentation/devicetree/bindings. Vendor prefixes
> > > are also checked for existing in vendor-prefixes.txt These should be
> > > temporary checks until we have more sophisticated binding schema checking.
[]
> > > +# check for DT compatible documentation
> > > +		if ($realfile =~ /\.dts/ && $rawline =~ /^\+\s*compatible\s*=/) {
> > > +			my @compats = $rawline =~ /\"([a-zA-Z0-9\-\,\.\+_]+)\"/g;
> > > +
> > > +			foreach my $compat (@compats) {
> > > +				my $compat2 = $compat;
> > > +				my $dt_path = "Documentation/devicetree/bindings/";
> > > +				$compat2 =~ s/\,[a-z]*\-/\,<\.\*>\-/;
> > > +				`grep -Erq "$compat|$compat2" $dt_path`;
> > > +				if ( $? >> 8 ) {
> > > +					WARN("UNDOCUMENTED_DT_STRING",
> > > +					     "DT compatible string \"$compat\" appears un-documented -- check $dt_path\n" . $herecurr);
> > > +				}
> > > +
> > > +				my $vendor = $compat;
> > > +				my $vendor_path = $dt_path . "vendor-prefixes.txt";
> > > +				$vendor =~ s/^([a-zA-Z0-9]+)\,.*/$1/;
> > > +				`grep -Eq "$vendor" $vendor_path`;
> > > +				if ( $? >> 8 ) {
> > > +					WARN("UNDOCUMENTED_DT_STRING",
> > > +					     "DT compatible string vendor \"$vendor\" appears un-documented -- check $vendor_path\n" . $herecurr);
> > > +				}
> > > +			}
> > > +		}
> 
> So this only works if you are in the top of the tree at the time when
> you run it (unless I've missed something).  So it might be appropraite
> to suppress this when the vendor-prefixes.txt file is not found.

I suppose it's useful to use the $root variable
on the file open too.

	my $vendor_path = $root . '/' . $dt_path . "vendor-prefixes.txt";


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

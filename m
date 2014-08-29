From: Geoff Levand <geoff-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Subject: Re: [PATCH] of: Fix constantness of of_n_size_cells
Date: Fri, 29 Aug 2014 12:26:50 -0700
Message-ID: <1409340410.21254.63.camel@smoke>
References: <cover.1408729200.git.geoff@infradead.org>
	 <20140827102827.50E15C409CB@trevor.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140827102827.50E15C409CB-WNowdnHR2B42iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Grant,

On Wed, 2014-08-27 at 11:28 +0100, Grant Likely wrote:
> On Fri, 22 Aug 2014 17:43:36 +0000, Geoff Levand <geoff-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org> wrote:
> > The of_n_size_cells() routine only does a read-only operation on the device tree
> > passed in, so add the const keyword to that argument so that of_n_size_cells()
> > can be called with read-only data without casting.
> > 
> > Signed-off-by: Geoff Levand <geoff-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
> 
> What is the code that exposed this problem?

For the arm64 kexec support and the arm64 spin-table hot-plug support I
am working on I need to read the cpu hardware id from a device tree.  I
don't need to modify the device tree, just get property values, so in
that code I have it in a pointer to a const.  I can cast off that const
when I do the call to of_n_size_cells() if you don't think it worthwhile
to make this change.  Here's the code:

+	p->hwid = of_read_number(cell, of_n_addr_cells(dn))
+		& MPIDR_HWID_BITMASK;

-Geoff

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: devicetree repository separation/migration
Date: Tue, 18 Feb 2014 14:14:51 -0800
Message-ID: <5303DB5B.2090505@gmail.com>
References: <20140217180544.GU7862@titan.lakedaemon.net> <20140218155750.GS17250@pengutronix.de> <20140218181854.GB7862@titan.lakedaemon.net>
Reply-To: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140218181854.GB7862-u4khhh1J0LxI1Ri9qeTfzeTW4wlIGRCZ@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2/18/2014 10:18 AM, Jason Cooper wrote:
> On Tue, Feb 18, 2014 at 04:57:50PM +0100, Sascha Hauer wrote:
>> On Mon, Feb 17, 2014 at 01:05:44PM -0500, Jason Cooper wrote:
> ...
>>>   - Is the Linux development workflow ready for devicetree to move out
>>>     of the Linux Kernel?
>>
>> I hope so since keeping the devicetrees in sync with the kernel is a
>> pain for all external users.
> 
> Well, I haven't heard any screams yet.  I suspect people are waiting for
> details on the exact form it would take before complaining...

< snip >

Let me join the chorus of screams.

I would venture that the number of linux kernel developers actively
touching device tree source files (and impacted by changes to them)
is vastly larger than any other set of developers.

My experience in the kernel is already that finding working device
tree fragments that match current under development code is difficult.
(I am not trying to generalize for all systems, just the ones I use.)

Moving the device tree source files out of the kernel git tree will
only make things worse.

-Frank

--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

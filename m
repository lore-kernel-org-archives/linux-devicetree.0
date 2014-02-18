From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: devicetree repository separation/migration
Date: Tue, 18 Feb 2014 12:09:16 -0700
Message-ID: <5303AFDC.9010908@wwwdotorg.org>
References: <20140217180544.GU7862@titan.lakedaemon.net> <20140218155750.GS17250@pengutronix.de> <20140218181854.GB7862@titan.lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140218181854.GB7862-u4khhh1J0LxI1Ri9qeTfzeTW4wlIGRCZ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 02/18/2014 11:18 AM, Jason Cooper wrote:
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
> 
>>>   - How do we envision projects will use it?  git submodule?  reference
>>>     a version tag?  (this is primarily targeted at bootloaders that need
>>>     to compile in a dtb or subset of a dtb into the bootloader)
>>
>> I would prefer to use it as a submodule.
> 
> ok.  I've often thought that was the right solution for several things
> (dtc.git inside the kernel tree), but no one ever seemed to speak of it
> or bring it up.  Kinda like leprosy.
> 
> It does add an extra step to build process for new users.  Although that
> could be handled in the Makefile.

My limited experience of git submodules implies that comparing them to
Leprosy isn't a bad comparison:-)

If they are separated out, I'd vastly prefer they simply be a standalone
project completed divorced from the kernel. Playing games with git
submodules to try and make it easier seems more likely to actually make
this more complicated.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

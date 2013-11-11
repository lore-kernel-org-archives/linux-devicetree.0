From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: common location for devicetree files
Date: Mon, 11 Nov 2013 09:24:13 -0700
Message-ID: <528104AD.9030102@wwwdotorg.org>
References: <1438803E-C904-428B-B042-891978BC15DF@codeaurora.org> <20131108165255.GA32668@titan.lakedaemon.net> <5957C301-9698-45B0-BFED-749DE79D0A74@codeaurora.org> <20131108181351.GF10335@titan.lakedaemon.net> <2274FB81-099B-4206-8332-70E9824FFF2F@codeaurora.org> <20131108183240.GH10335@titan.lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131108183240.GH10335-u4khhh1J0LxI1Ri9qeTfzeTW4wlIGRCZ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org list" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 11/08/2013 11:32 AM, Jason Cooper wrote:
> On Fri, Nov 08, 2013 at 12:17:30PM -0600, Kumar Gala wrote:
> ...
>> I get the point, just not sure how else to sort the 800+ .dts{i} files
>> that we have in the kernel tree right now.
> 
> Well, to start with, all #include'd files could go into a
> arch/dts/include directory.  That would clean things up a bit.
> 
> We could also consider separating the dts files by ISA.  All armv7 in
> one directory, armv8, armv5te, powerpc, mips, etc.

It's quite likely people will want to share some significant *.dtsi
across multiple architectures.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

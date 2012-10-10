From: Warner Losh <imp@bsdimp.com>
Subject: Re: dtc: import latest upstream dtc
Date: Tue, 9 Oct 2012 22:43:50 -0600
Message-ID: <ADE80D65-5170-4A8E-8D90-29161F8DB3BB@bsdimp.com>
References: <1349827466.26044.16@snotra>
Mime-Version: 1.0 (Apple Message framework v1084)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1349827466.26044.16@snotra>
Sender: linux-kernel-owner@vger.kernel.org
To: Scott Wood <scottwood@freescale.com>
Cc: Mitch Bradley <wmb@firmworks.com>, Michal Marek <mmarek@suse.cz>, devicetree-discuss@lists.ozlabs.org, Stephen Warren <swarren@nvidia.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


On Oct 9, 2012, at 6:04 PM, Scott Wood wrote:

> On 10/09/2012 06:20:53 PM, Mitch Bradley wrote:
>> On 10/9/2012 11:16 AM, Stephen Warren wrote:
>> > On 10/01/2012 12:39 PM, Jon Loeliger wrote:
>> >>>
>> >>> What more do you think needs discussion re: dtc+cpp?
>> >>
>> >> How not to abuse the ever-loving shit out of it? :-)
>> >
>> > Perhaps we can just handle this through the regular patch review
>> > process; I think it may be difficult to define and agree upon exactly
>> > what "abuse" means ahead of time, but it's probably going to be easy
>> > enough to recognize it when one sees it?
>> One of the ways it could get out of hand would be via "include
>> dependency hell".  People will be tempted to reuse existing .h files
>> containing pin definitions, which, if history is a guide, will end up
>> depending on all sorts of other .h files.
>> Another problem I often face with symbolic names is the difficulty of
>> figuring out what the numerical values really are (for debugging),
>> especially when .h files are in different subtrees from the files that
>> use the definitions, and when they use multiple macro levels and fancy
>> features like concatenation.  Sometimes I think it's clearer just to
>> write the number and use a comment to say what it is.
> 
> Both comments apply just as well to ordinary C code, and I don't think anyone would seriously suggest just using comments instead for C code.

.h files include both structs and defines, which are fine for ordinary C code, but problematic in this context.

> Is there a way to ask CPP to evaluate a macro in the context of the input file, rather than produce normal output?  If not, I guess you could make a tool that creates a wrapper file that includes the main file and then evaluates the symbol you want.

Not in the standard CPP, but perhaps you could scan the .dts file for all the values you need, and have it output the right values to use.

Warner
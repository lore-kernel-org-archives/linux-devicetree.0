From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH] dtc: Ensure #line directives don't consume data from
 the next line
Date: Fri, 31 May 2013 11:42:06 -0600
Message-ID: <51A8E0EE.1040305@wwwdotorg.org>
References: <1370020450-18136-1-git-send-email-swarren@wwwdotorg.org> <87sj13dp72.fsf@hase.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kbuild-owner@vger.kernel.org>
In-Reply-To: <87sj13dp72.fsf@hase.home>
Sender: linux-kbuild-owner@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: David Gibson <david@gibson.dropbear.id.au>, jdl@jdl.com, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, mmarek@suse.cz, rob.herring@calxeda.com, grant.likely@secretlab.ca, linux-kbuild@vger.kernel.org, Stephen Warren <swarren@nvidia.com>
List-Id: devicetree@vger.kernel.org

On 05/31/2013 11:38 AM, Andreas Schwab wrote:
> Stephen Warren <swarren@wwwdotorg.org> writes:
> 
>> Fix this by replacing {WS} with [ \t] so that it can't match line-breaks.
> 
> I think the other uses of {WS} shouldn't span lines either.

That is true, but only the optional occurrence /should/ matter. Any
changes to the other occurrences would only affect malformed #line
directives, whereas changing this one occurrence would also affect
well-formed #line directives, due to the optional nature of the trailing
flags field.

Still, it may be reasonable just to change all the occurrences anyway.
Does anyone have a strong opinion either way?

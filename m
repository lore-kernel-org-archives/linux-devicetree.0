From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 0/8] Implement a new DTS Source Language
Date: Thu, 25 Sep 2008 13:50:36 +1000
Message-ID: <20080925035036.GI15169@yookeroo.seuss>
References: <1222196652-13811-1-git-send-email-jdl@jdl.com>
	<097BFF8D-317F-4E85-AC2A-4C0A8D6C608B@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <097BFF8D-317F-4E85-AC2A-4C0A8D6C608B-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Sep 23, 2008 at 09:34:38PM -0500, Kumar Gala wrote:
>
> On Sep 23, 2008, at 2:04 PM, Jon Loeliger wrote:
>
>> This series of patches enhances the DTS source language to
>> support a fullly interpreted language for generating nodes
>> and properties.  It is backward compatible with V1 sources.
>>
>> The main features implemented by this patch set support
>> function definitions, 'if', 'for', 'return' and assignment
>> statements.  Local variables, global constants and
>> almost complete C-like expressions are also supported.
>>
>> Enhancements to the source position and error/warning
>> reporting now support source column positions too.
>>
>> Jon Loeliger (8):
>>  Remove support for the legacy DTS source file format.
>>  Add conditionalized debug() print macro.
>>  Enhance source position implementation.
>>  Add header files for new Internal Representation form.
>>  Add most of the new IR implementation files.
>>  Add the main IR evaluation implementation
>>  Introduce new DTS language.
>>  Add documentation for the new DTS language.
>
> Any examples/tests of all the cool new features?

Um.. yeah.  I'd really like to discuss the syntax, before diving into
the implementation.  You've certainly taken a different approach to
this than the one I was thinking of.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

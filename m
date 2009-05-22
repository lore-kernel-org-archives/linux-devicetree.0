From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: dtc build failures on OS X
Date: Fri, 22 May 2009 11:29:59 +1000
Message-ID: <20090522012959.GD23015@yookeroo.seuss>
References: <ed82fe3e0905191908v8c5fcdft953c4e1ba7969f2a@mail.gmail.com>
	<C44AFDDE-9BB1-4914-8B26-5816D83B909A@kernel.crashing.org>
	<20090520230823.GB10487@yookeroo.seuss>
	<82CF1AB0-22C1-4C33-B6E1-B8816AF2E094@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <82CF1AB0-22C1-4C33-B6E1-B8816AF2E094-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Segher Boessenkool <segher-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, Timur Tabi <timur-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, May 21, 2009 at 07:46:04PM +0200, Segher Boessenkool wrote:
>>>> I'm trying to build dtc on Mac OS X.  The compilation seems to go
>>>> okay, but the linker dies.
>>>
>>> It doesn't die, it just complains ;-)
>>>
>>> You're trying to build a Linux shared library on OSX.  This won't
>>> work.  Not only are the command line options not the same, the
>>> semantics are totally different as well; importantly, the versioning
>>> mechanism is very different.  Given that, you do not want to use
>>> a shared library at all -- just use a normal (static) library.
>>> IMNSHO that should be the default, on Linux as well...
>>
>> It was, originally, but someone wanted a shared lib.
>
> And you decided to take on all that maintenance pain?  You're
> too good for this world.  Or gullible, heh.

Something like that.

>> Actually, the current Makefile builds both, by default.
>
> It shouldn't try to build Linux shared objects unless you are
> building a Linux target; easiest would be to just never build
> the shared library by default.  Your choice :-)

Well, to be fair, the current rule should be right, or close to it,
for most ELF systems, not just Linux.

Actually, another issue with this is that currently we build all the
libfdt objects with -fPIC, which significantly increases their size.
That tends to frighten people who are looking at building libfdt into
their firmware.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

From: Segher Boessenkool <segher-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: dtc build failures on OS X
Date: Thu, 21 May 2009 19:46:04 +0200
Message-ID: <82CF1AB0-22C1-4C33-B6E1-B8816AF2E094@kernel.crashing.org>
References: <ed82fe3e0905191908v8c5fcdft953c4e1ba7969f2a@mail.gmail.com>
	<C44AFDDE-9BB1-4914-8B26-5816D83B909A@kernel.crashing.org>
	<20090520230823.GB10487@yookeroo.seuss>
Mime-Version: 1.0 (Apple Message framework v753.1)
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <20090520230823.GB10487-787xzQ0H9iRg7VrjXcPTGA@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, Timur Tabi <timur-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

>>> I'm trying to build dtc on Mac OS X.  The compilation seems to go
>>> okay, but the linker dies.
>>
>> It doesn't die, it just complains ;-)
>>
>> You're trying to build a Linux shared library on OSX.  This won't
>> work.  Not only are the command line options not the same, the
>> semantics are totally different as well; importantly, the versioning
>> mechanism is very different.  Given that, you do not want to use
>> a shared library at all -- just use a normal (static) library.
>> IMNSHO that should be the default, on Linux as well...
>
> It was, originally, but someone wanted a shared lib.

And you decided to take on all that maintenance pain?  You're
too good for this world.  Or gullible, heh.

> Actually, the current Makefile builds both, by default.

It shouldn't try to build Linux shared objects unless you are
building a Linux target; easiest would be to just never build
the shared library by default.  Your choice :-)


Segher

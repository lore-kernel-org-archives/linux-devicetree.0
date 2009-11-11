From: Rafal Jaworowski <raj-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org>
Subject: Re: PCI bus node location
Date: Wed, 11 Nov 2009 15:16:56 +0100
Message-ID: <8239D9E6-E390-4DED-81C1-77FACF05C1D4@semihalf.com>
References: <B7D31A24-3361-4B80-81C4-5A815F09D42F@semihalf.com>
	<fa686aa40911091836s2a6b763aq14ece296cd7368db@mail.gmail.com>
	<A3A4CAD4-BE74-4CD4-BFFA-FE616DF38811@semihalf.com>
	<20091111000540.GB3235@yookeroo.seuss>
Mime-Version: 1.0 (Apple Message framework v1076)
Content-Type: text/plain; charset="us-ascii"; Format="flowed"; DelSp="yes"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20091111000540.GB3235-787xzQ0H9iRg7VrjXcPTGA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


On 2009-11-11, at 01:05, David Gibson wrote:

>> The current approach seems a bit of a maintenance problem: the PCI
>> bridges control reg need to specify the whole address instead of
>> just an offset, which is more error prone in case of changes (when a
>
> Well, yes.  And worse, it means there's two places that need to be
> adjusted rather than one, if the the IMMR is relocated (which it can
> be).  But it's a trade-off of this versus the inconvenience of dealing
> with separate "control" and "bridge" nodes for the PCI and following
> phandles between them.

Would the technique with additional control node and a phandle  
complicate bindings handling much? The clear benefit is the ability to  
truly reflect hierarchy of devices available within IMMR/CCSR block.

>> number of places need to be adjusted etc.). What would need to be
>> done/extended for the ranges prop you mention to allow for better
>> handling cases like this?
>
> I don't really understand the question.  As Grant has said the
> "correct" approach is to have one node representing the control
> registers - located under the IMMR ("soc") node - and another
> representing the PCI host bridge itself (which would be in its present
> location).  There would need to be phandles linking the two.  It
> doesn't really need any extension to the device tree semantics itself
> - just a more complex binding for this device.

Maybe I misunderstood Grant, my impression was that there was possible  
some 'fixing' of ranges properties (which would be alternative to the  
control node approach).

> Bear in mind with all this that we've been working out conventions for
> representing various devices as we go along - and in the early days
> nearly everyone was pretty inexperienced with device tree design.  A
> number of the bindings that have been established have made less than
> ideal choices.  We're getting better, but we're going to have to live
> with some of those mistakes.
>
> Dealing with badly designed device tree bindings is pretty icky, but
> usually the code to handle it can be reasonably well isolated, so it
> doesn't infect too much of the codebase.  Just dealing with ugly
> representations when parsing, or having some code which applies fixups
> to the initially supplied device tree are both feasible approaches.
> But we're never going to reach a place where we always get perfect
> device trees, so one way or another, you're going to have to deal with
> some uglies.  Our view - borne out by experience so far - is that the
> device tree representation is still worth it, despite the problems.

Don't get me wrong -- I'm just trying to understand what is not clear  
to me in the first place. The other aspect though is that if there are  
areas, which could be improved in the design and implementation why  
not do so, especially long term? I realize the already established  
representations cannot be immediately ditched, but switching  
conventions could be applied over time (e.g. using compatible prop in  
a smart way to have code support legacy approach or some time  after  
which there is a complete switchover etc.).

Please note we are targetting ARM (and other arches in the future)  
besides PowerPC, so if there can be any lessons learnt from previous  
encounters I'd rather embrace them.

Rafal

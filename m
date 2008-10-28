From: Matt Sealey <matt-sEEEE4iEDtaXzmuOJsdVMQ@public.gmane.org>
Subject: Re: Device tree binding documentation
Date: Tue, 28 Oct 2008 14:39:56 -0500
Message-ID: <49076A8C.3010105@genesi-usa.com>
References: <fa686aa40810272323s4a5c2f50u8aa999952aaa6b2@mail.gmail.com>	
	<9696D7A991D0824DBA8DFAC74A9C5FA3047E572F@az33exm25.fsl.freescale.net>	
	<490744B1.2000602@genesi-usa.com>
	<fa686aa40810281027r64d4f78enfcb1c92c9ac6401e@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <fa686aa40810281027r64d4f78enfcb1c92c9ac6401e-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss list <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Hugh Blemings <hab-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org>, Anton Vorontsov <avorontsov-hkdhdckH98+B+jHODAdFcQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org



Grant Likely wrote:
> On Tue, Oct 28, 2008 at 10:58 AM, Matt Sealey <matt-sEEEE4iEDtaXzmuOJsdVMQ@public.gmane.org> wrote:
>>
>> Yoder Stuart wrote:
>>>  So my vote is to maintain bindings as plain text files.
>> Just like the real elections I don't actually have a vote here,
> 
> If that were true you wouldn't have been in the 'to:' list.

I got an Obama campaign leaflet through the door the other day, too :)

>> but can I put my oar in that after a certain review process and
>> time has passed and the binding stabilizes, these get published
>> as PDF
> 
> I think that is reasonable if it is something people find useful or
> more accessible.

I guess we would need to decide how those documents are published
without using proprietary software, then, and easily committed to
another git repository (or the same one just in a published form).
I don't suppose office xml is a good choice? It should be flexible
enough and similar enough that sections and layout do not change a
great deal, and git can easily produce diffs?

For another time maybe. Continue on the discussion. I really like
the git repo/wiki idea. But I do not agree that a web browser is
inefficient; a wiki for editing changes (for registered users
assigned to a "project") in a collaborative way is probably far
better in some respects than using Kate and xdiff (certainly
less difficult in some other respects), if you want to quickly
look at changes or so, or make an update to a section.

If we didn't like web browsers that much then we wouldn't have
patchwork, for example, which is an insanely useful tool..
although the same care must be taken not to do what patchwork
just did and go through a lovely rewrite or software update
and suddenly lose years of patch reference URLs :D

I understand not wanting to have to keep a browser open to read
a forum instead of a mailing list, but this is something a
little different. Wouldn't collaboratively editing a wiki allow
multiple users to submit changes to a page (in "private"), yet
ultimately have a Responsible Person collect those changes into
a bundle and submit that as a patch to devicetree-discuss when
development is complete? Branching and checkouts in git would
work the same way but you wouldn't have to be sitting at your
desk (with git) to make a tiny update or collaborate with your
colleagues while out in the field or at a customer site.

-- 
Matt Sealey <matt-sEEEE4iEDtaXzmuOJsdVMQ@public.gmane.org>
Genesi, Manager, Developer Relations

From: Matt Sealey <matt-sEEEE4iEDtaXzmuOJsdVMQ@public.gmane.org>
Subject: Re: Device tree binding documentation
Date: Wed, 29 Oct 2008 09:53:09 -0500
Message-ID: <490878D5.2010607@genesi-usa.com>
References: <fa686aa40810272323s4a5c2f50u8aa999952aaa6b2@mail.gmail.com>	
	<9696D7A991D0824DBA8DFAC74A9C5FA3047E572F@az33exm25.fsl.freescale.net>	
	<490744B1.2000602@genesi-usa.com>	
	<fa686aa40810281027r64d4f78enfcb1c92c9ac6401e@mail.gmail.com>	
	<49076A8C.3010105@genesi-usa.com>
	<1225227250.30047.151.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <1225227250.30047.151.camel-bi+AKbBUZKY6gyzm1THtWbp2dZbC/Bob@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Nate Case <ncase-AQeFf1F/bRxBDgjK7y7TUQ@public.gmane.org>
Cc: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Anton Vorontsov <avorontsov-hkdhdckH98+B+jHODAdFcQ@public.gmane.org>, devicetree-discuss list <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, Hugh Blemings <hab-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org



Nate Case wrote:
> On Tue, 2008-10-28 at 14:39 -0500, Matt Sealey wrote:
>> I guess we would need to decide how those documents are published
>> without using proprietary software, then, and easily committed to
>> another git repository (or the same one just in a published form).
>> I don't suppose office xml is a good choice? It should be flexible
>> enough and similar enough that sections and layout do not change a
>> great deal, and git can easily produce diffs?
> 
> I would suggest using DocBook if publishing PDFs is a goal.  It would
> also let you output text and HTML as an added bonus.

The problem then is you can't edit the document outside of a special
DocBook editor (not that there is one, which means you're stuck
throwing XML around).

The goal isn't to abstract the documentation and bindings so we can
extract them as different types for different means, but to take what
is in a wiki or a text document in git and purposefully organize it
for later publishing. I wouldn't want to have the official ratified
binding just generated from the DocBook source of some version, DocBook
doesn't have the pizazz and features required.. or a GUI editor worth
a shit.

I've vote for anything OpenOffice can throw out. I guess if we're
talking about taking the .txt binding and making a PDF out of it,
the software used need only be usable by everyone involved, and it
(any output such as PDF or Word or ODT) may as well be treated as
a binary blob in the git tree (and would not be updated, as an
official errata would be published, and then a new version, and
let's not rely on git to make sure people can get the old version!).

-- 
Matt Sealey <matt-sEEEE4iEDtaXzmuOJsdVMQ@public.gmane.org>
Genesi, Manager, Developer Relations

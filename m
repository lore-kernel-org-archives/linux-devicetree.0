From: Matt Sealey <matt-sEEEE4iEDtaXzmuOJsdVMQ@public.gmane.org>
Subject: Re: Device tree binding documentation
Date: Tue, 28 Oct 2008 12:25:19 -0500
Message-ID: <49074AFF.3080106@genesi-usa.com>
References: <fa686aa40810272323s4a5c2f50u8aa999952aaa6b2@mail.gmail.com>	<9696D7A991D0824DBA8DFAC74A9C5FA3047E572F@az33exm25.fsl.freescale.net>
	<490744B1.2000602@genesi-usa.com> <49074593.1040008@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <49074593.1040008-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Hugh Blemings <hab-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Anton Vorontsov <avorontsov-hkdhdckH98+B+jHODAdFcQ@public.gmane.org>, devicetree-discuss list <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org



Scott Wood wrote:
> Matt Sealey wrote:
>> Maintaining them as text for the development process is good but
>> they need to be *published* as the ePAPR binding is *published*,
>> so that you can say.. "hey, this is a canonical reference on a
>> dead tree, my platform confirms to the ePAPR MPC5200B device
>> tree binding V1.0 that I ordered from the Freescale website",
>> instead of "my platform conforms to git commit fab927fe363ac2a872bb872"
> 
> The latter is actually much less subject to change... :-)

Right until the git repo is down and you don't have a copy as
reference :D

Basically it would solve all the nitpicking about how a device tree
wasn't right on a certain board (as long as it fit a certain spec,
drivers would be required to maintain compatibility with that spec)
and wouldn't get these weird effects when they change USB and decide
that they need to pare down the matchlists and break a working
board.

At least if you can refer to ePAPR right now, it's there for download
as a book-type spec for the basic elements, the same way you could with
OF, and the OF bindings were traditionally published in Postscript (and
written in tex? lord knows.. that's complicating documentation writing
but the symbol support and math support is far, far better than ASCII
art)

-- 
Matt Sealey <matt-sEEEE4iEDtaXzmuOJsdVMQ@public.gmane.org>
Genesi, Manager, Developer Relations

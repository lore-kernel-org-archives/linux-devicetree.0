From: Josh Boyer <jwboyer@gmail.com>
Subject: Re: dtc/u-boot tool naming, "ftdump", "mkimage"
Date: Wed, 14 Jan 2009 14:19:05 -0500
Message-ID: <20090114191905.GA18581@yoda.jdub.homelinux.org>
References: <496E2796.3090405@genesi-usa.com>
	<20090114181028.GB7768@yoda.jdub.homelinux.org>
	<496E3604.8030007@genesi-usa.com> <496E38DA.8080408@ge.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
Content-Disposition: inline
In-Reply-To: <496E38DA.8080408@ge.com>
List-Unsubscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: Jerry Van Baren <gerald.vanbaren@ge.com>
Cc: devicetree-discuss@ozlabs.org, u-boot@lists.denx.de
List-Id: devicetree@vger.kernel.org

On Wed, Jan 14, 2009 at 02:11:22PM -0500, Jerry Van Baren wrote:
> Hi Matt,
>
> Matt Sealey wrote:
>> Josh Boyer wrote:
>>> On Wed, Jan 14, 2009 at 11:57:42AM -0600, Matt Sealey wrote:
>>>> I just noticed (was told by an affiliate) that the DTC compiler 
>>>> tools  shares a tool name "ftdump" with the Freetype project. I was 
>>>> doing a  lazy packaging effort to get a few tools around so we can 
>>>> all be running  the same version and build some custom kernel RPMs, 
>>>> and this came up.
>>>>
>>>> Wouldn't a better name be "fdtdump", do you think? It's usually not 
>>>> a  fun idea to conflict with tools already on the system. A user 
>>>> may run  "ftdump" and get the Freetype tool because of a simple 
>>>> mistake in paths  or so.
>>>>
>>>> With regards to U-Boot proper, I would say the same is true of 
>>>> "mkimage"  which conflicts with jigdo. In essence, while U-Boot is 
>>>> usually  installed into a user's home directory (~/bin etc.) simple 
>>>> path mixups,  going to root shell, using another box etc. means you 
>>>> may have multiple  same-named tools on a system for various work, 
>>>> which do different things.
>
> Mkimage and ftdump are different audiences (OK, the same people but the  
> chairs are arranged differently ;-).
>
> [snip]
>
> IMHO, the ftdump issue needs to be addressed at the DTC level (Jon  
> Loeliger and David Gibson).  U-Boot (and the linux kernel) is being  
> driven by DTC.

David has said before that ftdump is sort of a pointless debugging tool.
Or at least that is what the Debian bug report referrenced as the reason
from removing it from the Debian dtc package.

Maybe we should just remove it entirely if it's not really going to be
maintained long-term.

josh

http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=434890

From: Josh Boyer <jwboyer@gmail.com>
Subject: Re: dtc/u-boot tool naming, "ftdump", "mkimage"
Date: Wed, 14 Jan 2009 13:10:28 -0500
Message-ID: <20090114181028.GB7768@yoda.jdub.homelinux.org>
References: <496E2796.3090405@genesi-usa.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
Content-Disposition: inline
In-Reply-To: <496E2796.3090405@genesi-usa.com>
List-Unsubscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: Matt Sealey <matt@genesi-usa.com>
Cc: u-boot@lists.denx.de, devicetree-discuss@ozlabs.org
List-Id: devicetree@vger.kernel.org

On Wed, Jan 14, 2009 at 11:57:42AM -0600, Matt Sealey wrote:
> I just noticed (was told by an affiliate) that the DTC compiler tools  
> shares a tool name "ftdump" with the Freetype project. I was doing a  
> lazy packaging effort to get a few tools around so we can all be running  
> the same version and build some custom kernel RPMs, and this came up.
>
> Wouldn't a better name be "fdtdump", do you think? It's usually not a  
> fun idea to conflict with tools already on the system. A user may run  
> "ftdump" and get the Freetype tool because of a simple mistake in paths  
> or so.
>
> With regards to U-Boot proper, I would say the same is true of "mkimage"  
> which conflicts with jigdo. In essence, while U-Boot is usually  
> installed into a user's home directory (~/bin etc.) simple path mixups,  
> going to root shell, using another box etc. means you may have multiple  
> same-named tools on a system for various work, which do different things.
>
> Is it possible that we could standardize on some tool naming here?
>
> I'm going to rename in the package these tools to "mkuimage" (since this  
> goes well with suse mkzimage) and "fdtdump" for my package anyway so no  
> worries if nothing ever gets done.. but since the Fedora guys were  
> packaging dtc up right now I thought I would mention this as the RPM I  
> downloaded from FC10 the other day did not take note of this (and RPM  
> warns that there is a conflict but happily overwrites the file anyway,  
> thus trashing Freetype :)

The Fedora package doesn't install ftdump.  Where did you get the package
from?

F9 machine:
[jwboyer@yoda ~]$ sudo repoquery -ql dtc
/usr/bin/dtc
/usr/share/doc/dtc-1.1.0
/usr/share/doc/dtc-1.1.0/GPL
[jwboyer@yoda ~]$

F10 machine:
[jwboyer@zod ~]$ sudo repoquery -ql dtc
/usr/bin/dtc
/usr/share/doc/dtc-1.2.0
/usr/share/doc/dtc-1.2.0/GPL
[jwboyer@zod ~]$

> (why am I packaging U-Boot tools like mkimage? We need them for  
> post-install script on a kernel RPM..)

I tried to get it included in the kernel tarball.  It didn't get
very far because Sam was too busy to really reply.

josh

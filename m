From: Matt Sealey <matt-sEEEE4iEDtaXzmuOJsdVMQ@public.gmane.org>
Subject: dtc/u-boot tool naming, "ftdump", "mkimage"
Date: Wed, 14 Jan 2009 11:57:42 -0600
Message-ID: <496E2796.3090405@genesi-usa.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org, devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

I just noticed (was told by an affiliate) that the DTC compiler tools 
shares a tool name "ftdump" with the Freetype project. I was doing a 
lazy packaging effort to get a few tools around so we can all be running 
the same version and build some custom kernel RPMs, and this came up.

Wouldn't a better name be "fdtdump", do you think? It's usually not a 
fun idea to conflict with tools already on the system. A user may run 
"ftdump" and get the Freetype tool because of a simple mistake in paths 
or so.

With regards to U-Boot proper, I would say the same is true of "mkimage" 
which conflicts with jigdo. In essence, while U-Boot is usually 
installed into a user's home directory (~/bin etc.) simple path mixups, 
going to root shell, using another box etc. means you may have multiple 
same-named tools on a system for various work, which do different things.

Is it possible that we could standardize on some tool naming here?

I'm going to rename in the package these tools to "mkuimage" (since this 
goes well with suse mkzimage) and "fdtdump" for my package anyway so no 
worries if nothing ever gets done.. but since the Fedora guys were 
packaging dtc up right now I thought I would mention this as the RPM I 
downloaded from FC10 the other day did not take note of this (and RPM 
warns that there is a conflict but happily overwrites the file anyway, 
thus trashing Freetype :)

(why am I packaging U-Boot tools like mkimage? We need them for 
post-install script on a kernel RPM..)

--
Matt Sealey
Genesi, Manager, Developer Relations

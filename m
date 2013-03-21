From: Rob Landley <rob@landley.net>
Subject: Re: [PATCH 2/2] of: remove /proc/device-tree
Date: Wed, 20 Mar 2013 23:03:39 -0500
Message-ID: <1363838619.15703.52@driftwood>
References: <1363791074-16415-1-git-send-email-grant.likely@secretlab.ca>
	<1363791074-16415-3-git-send-email-grant.likely@secretlab.ca>
	<5149D38E.9030202@gmail.com>
	<CACTFLAMXHA58bu_c0hRQuZ=nru63hLaixNXaiU-Xa60WD5d=ew@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; DelSp=Yes; Format=Flowed
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACTFLAMXHA58bu_c0hRQuZ=nru63hLaixNXaiU-Xa60WD5d=ew@mail.gmail.com>
	(from daniel@zonque.org on Wed Mar 20 11:24:54 2013)
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Mack <daniel@zonque.org>
Cc: Rob Herring <robherring2@gmail.com>, Grant Likely <grant.likely@secretlab.ca>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, "David S. Miller" <davem@davemloft.net>
List-Id: devicetree@vger.kernel.org

On 03/20/2013 11:24:54 AM, Daniel Mack wrote:
> On Wed, Mar 20, 2013 at 4:19 PM, Rob Herring <robherring2@gmail.com>  
> wrote:
> > On 03/20/2013 09:51 AM, Grant Likely wrote:
> >> The same data is now available in sysfs, so we can remove the code
> >> that exports it in /proc and replace it with a symlink to the sysfs
> >> version.
> >>
> >> Tested on versatile qemu model and mpc5200 eval board. More testing
> >> would be appreciated.
> >
> > I would suggest testing with lshw in particular. That's the only
> > /proc/device-tree user I've come across.
> 
> kexec is another one. Not to mention various vendor scripts that  
> aren't
> necessarily public.
> 
> Don't such things also fall under the "we do not break userspace
> compatibility - ever" rule?

We used to have feature-removal-schedule. Linus removed it. (He did not  
add it to feature-removal-schedule first.)

Rob
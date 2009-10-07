From: Chris Newport <crn-Tjka5CH3XzFBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [RFC PATCH 00/12] Merge common OpenFirmware device tree code
Date: Wed, 7 Oct 2009 21:54:34 +0100 (BST)
Message-ID: <Pine.LNX.4.60.0910072148040.11795@mailgate.netunix.com>
References: <20091007041007.16890.62194.stgit@angua>
 <fa686aa40910062149p5d7141e4x3ff849fd4d191f38@mail.gmail.com>
 <646765f40910062218s19d540f9q14c9086bedd1d9da@mail.gmail.com>
 <20091007135243.GC21646@anhedonia> <4ACCEC67.9070106@firmworks.com>
Reply-To: microblaze-uclinux-rVRm/Wmeqae7NGdpmJTKYQ@public.gmane.org
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Return-path: <owner-microblaze-uclinux-FR6EJeJVuqfA6Z3fQjNZrN9u6TNh0Fb7@public.gmane.org>
In-Reply-To: <4ACCEC67.9070106-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
Sender: owner-microblaze-uclinux-FR6EJeJVuqfA6Z3fQjNZrN9u6TNh0Fb7@public.gmane.org
To: Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
Cc: Sam Creasey <sammy-4OGMY2YDKIVeoWH0uzbU5w@public.gmane.org>, Julian Calaby <julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, microblaze-uclinux-rVRm/Wmeqae7NGdpmJTKYQ@public.gmane.org, sparclinux-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 7 Oct 2009, Mitch Bradley wrote:

> Taking this one step further, I don't see any real good reason to continue 
> supporting Sun4 going forward.  I got rid of my Sun4 systems long ago because 
> it was just too hard to keep them working - after having used them long after 
> most people had moved on.  Dropping Sun3 and Sun4 eliminates all vestiges of 
> the sunmon interface and also allows dropping support for OBP version 1, 
> which only shipped on SS1-class machines - the first machines in the Sun4c 
> subclass.

Sun4c has also been broken for a long time and sun4d has never worked
properly. Is it time to also prune these ?.
That would leave only Sun4m in the 32bit kernel, which still works and
has plenty of ongoing user interest.

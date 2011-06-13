From: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/3] patches to allow DTB to be appended to the ARM zImage
Date: Mon, 13 Jun 2011 16:44:16 -0400 (EDT)
Message-ID: <alpine.LFD.2.00.1106131640370.2142@xanadu.home>
References: <1307858800-16712-1-git-send-email-nicolas.pitre@linaro.org>
	<BANLkTik_hH9tZ5MMbOYzhZwLFTFQyJyfRg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <BANLkTik_hH9tZ5MMbOYzhZwLFTFQyJyfRg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, 12 Jun 2011, Grant Likely wrote:

> On Sun, Jun 12, 2011 at 12:06 AM, Nicolas Pitre
> <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> > This is a resend of those patches with fixups after the latest changes
> > in mainline.
> >
> > [PATCH 1/3] ARM: zImage: ensure it is always a multiple of 64 bits in size
> > This one is new and trivial.
> >
> > [PATCH 2/3] ARM: zImage: Allow the appending of a device tree binary
> > Mostly John Bonesio's version with some adjustments and cleanups.
> >
> > [PATCH 3/3] ARM: zImage: make sure appended DTB doesn't get overwritten by kernel .bss
> > New, simpler alternative to Tony Lindgren's version.
> 
> I've gone ahead and added the series to devicetree/test for anyone who
> want to play with it.

I've published those patches with all the latest fixes and ACKs here:

	git://git.linaro.org/people/nico/linux.git zImage_DTB_append


Nicolas

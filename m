From: David Brown <davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH 0/4] allow DTB to be appended to the ARM zImage with ATAG
	conversion
Date: Tue, 21 Jun 2011 14:59:38 -0700
Message-ID: <8yatybieth1.fsf@huya.qualcomm.com>
References: <1308632955-11070-1-git-send-email-nico@fluxnic.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1308632955-11070-1-git-send-email-nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org> (Nicolas
	Pitre's message of "Tue, 21 Jun 2011 01:09:11 -0400")
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>
Cc: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jun 20 2011, Nicolas Pitre wrote:

> Yet another resend, this time with a patch to convert some ATAGs and
> fold them into the appended DTB.  Additional ATAgs and their corresponding
> DTB representation is still up for discussion.  In particular,
> ATAG_REVISION and ATAG_SERIAL were mentioned as missing but there is
> no direct DT equivalent for them.  One suggestion was to fold them into
> the kernel cmdline string.  Anything else?
>
> Testing would also be appreciated.
>
> [PATCH 1/4] ARM: zImage: ensure it is always a multiple of 64 bits in size
> [PATCH 2/4] ARM: zImage: Allow the appending of a device tree binary
> [PATCH 3/4] ARM: zImage: make sure appended DTB doesn't get overwritten by kernel .bss
> [PATCH 4/4] ARM: zImage: allow supplementing appended DTB with traditional ATAG data

The first three appear to be in Grant's devicetree/arm branch (as far as
I can tell), so I've tested the last one.

I get the same behavior on MSM8660, this works as long as the DTB has
the attributes with enough padding in them to hold the values written.
If the fdt code tries expanding the tree (I create the DTB sith -p
1024), then my device goes off in the weeds somewhere.  I'm trying to
track this down, it seems to be failing in a memmove, even though that
memmove appears valid to me.  I'm still investigating that.

Otherwise, it looks good.

David

-- 
Sent by an employee of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum.

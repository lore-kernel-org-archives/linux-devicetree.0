From: Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>
Subject: [PATCH 0/4] allow DTB to be appended to the ARM zImage with ATAG
	conversion
Date: Tue, 21 Jun 2011 01:09:11 -0400
Message-ID: <1308632955-11070-1-git-send-email-nico@fluxnic.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Yet another resend, this time with a patch to convert some ATAGs and
fold them into the appended DTB.  Additional ATAgs and their corresponding
DTB representation is still up for discussion.  In particular,
ATAG_REVISION and ATAG_SERIAL were mentioned as missing but there is
no direct DT equivalent for them.  One suggestion was to fold them into
the kernel cmdline string.  Anything else?

Testing would also be appreciated.

[PATCH 1/4] ARM: zImage: ensure it is always a multiple of 64 bits in size
[PATCH 2/4] ARM: zImage: Allow the appending of a device tree binary
[PATCH 3/4] ARM: zImage: make sure appended DTB doesn't get overwritten by kernel .bss
[PATCH 4/4] ARM: zImage: allow supplementing appended DTB with traditional ATAG data

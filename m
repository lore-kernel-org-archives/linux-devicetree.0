From: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH 18/30] nfc: st-nci: Add support for proprietary commands
 for factory tests
Date: Sun, 25 Oct 2015 18:17:48 +0100
Message-ID: <20151025171748.GH23609@zurbaran.home>
References: <1445377701-8353-1-git-send-email-christophe-h.ricard@st.com>
 <1445377701-8353-19-git-send-email-christophe-h.ricard@st.com>
 <20151024064835.GD23609@zurbaran.home>
 <562B7737.6000106@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <562B7737.6000106-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Christophe,

On Sat, Oct 24, 2015 at 02:19:03PM +0200, Christophe Ricard wrote:
> Hi Samuel,
> 
> On 24/10/2015 08:48, Samuel Ortiz wrote:
> >Hi Christophe,
> >
> >Just a couple of nitpicks:
> >
> >On Tue, Oct 20, 2015 at 11:48:09PM +0200, Christophe Ricard wrote:
> >>diff --git a/drivers/nfc/st-nci/Makefile b/drivers/nfc/st-nci/Makefile
> >>index 348ce76..60e569b 100644
> >>--- a/drivers/nfc/st-nci/Makefile
> >>+++ b/drivers/nfc/st-nci/Makefile
> >>@@ -2,7 +2,7 @@
> >>  # Makefile for ST21NFCB NCI based NFC driver
> >>  #
> >>-st-nci-objs = ndlc.o core.o st-nci_se.o
> >>+st-nci-objs = ndlc.o core.o st-nci_se.o st-nci_vendor_cmds.o
> >Please rename that file to vendor_cmds.c.
> >I pushed a change to rename st-nci_se.c to se.c already, to keep the
> >file names consistent there.
> I think your latest change introduced a build break :(. The log
> message mention also MFC instead of NFC ;).
> 
> "In file included from drivers/nfc/st-nci/ndlc.c:23:0:
> drivers/nfc/st-nci/st-nci.h:22:23: fatal error: st-nci_se.h: No such
> file or directory
> #include "st-nci_se.h""
> I will send a fix in the v2 ;).
Sorry about that. I'll fix it up.

Cheers,
Samuel.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

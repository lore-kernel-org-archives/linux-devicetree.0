From: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [linux-nfc] [PATCH 18/30] nfc: st-nci: Add support for
 proprietary commands for factory tests
Date: Sun, 25 Oct 2015 20:31:51 +0100
Message-ID: <20151025193151.GA5987@zurbaran.home>
References: <1445377701-8353-1-git-send-email-christophe-h.ricard@st.com>
 <1445377701-8353-19-git-send-email-christophe-h.ricard@st.com>
 <20151024064835.GD23609@zurbaran.home>
 <562B7737.6000106@gmail.com>
 <20151025171748.GH23609@zurbaran.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20151025171748.GH23609-nKCvNrh56OoJmsy6czSMtA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, Oct 25, 2015 at 06:17:48PM +0100, Samuel Ortiz wrote:
> > >Please rename that file to vendor_cmds.c.
> > >I pushed a change to rename st-nci_se.c to se.c already, to keep the
> > >file names consistent there.
> > I think your latest change introduced a build break :(. The log
> > message mention also MFC instead of NFC ;).
> > 
> > "In file included from drivers/nfc/st-nci/ndlc.c:23:0:
> > drivers/nfc/st-nci/st-nci.h:22:23: fatal error: st-nci_se.h: No such
> > file or directory
> > #include "st-nci_se.h""
> > I will send a fix in the v2 ;).
> Sorry about that. I'll fix it up.
Should be fixed now.

Cheers,
Samuel.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

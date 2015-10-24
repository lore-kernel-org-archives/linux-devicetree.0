From: Willy Tarreau <w@1wt.eu>
Subject: Re: [PATCH 19/30] nfc: netlink: Add missing NFC_ATTR comments
Date: Sat, 24 Oct 2015 09:01:30 +0200
Message-ID: <20151024070130.GA5827@1wt.eu>
References: <1445377701-8353-1-git-send-email-christophe-h.ricard@st.com> <1445377701-8353-20-git-send-email-christophe-h.ricard@st.com> <20151024064841.GE23609@zurbaran.home> <20151024065852.GA5823@1wt.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20151024065852.GA5823@1wt.eu>
Sender: stable-owner@vger.kernel.org
To: Samuel Ortiz <sameo@linux.intel.com>
Cc: Christophe Ricard <christophe.ricard@gmail.com>, linux-nfc@ml01.01.org, christophe-h.ricard@st.com, devicetree@vger.kernel.org, stable@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sat, Oct 24, 2015 at 08:58:52AM +0200, Willy Tarreau wrote:
> Hi Samuel,
> 
> On Sat, Oct 24, 2015 at 08:48:41AM +0200, Samuel Ortiz wrote:
> > Hi Christophe,
> > 
> > On Tue, Oct 20, 2015 at 11:48:10PM +0200, Christophe Ricard wrote:
> > > NFC_CMD_ACTIVATE_TARGET and NFC_ATTR_SE_PARAMS comments are missing.
> > > 
> > > Cc: stable@vger.kernel.org
> > That's not a stable material.
> 
> Well, if it can help backport fixes later, at least it cannot harm.

Ah sorry I thought you were objecting against a patch being part of
a stable series under review. Then indeed that's not needed.

Willy

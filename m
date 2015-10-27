From: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [linux-nfc] [PATCH v2 00/35] Few fixes and st21nfca/st-nci
 vendor_cmds support
Date: Tue, 27 Oct 2015 04:51:15 +0100
Message-ID: <20151027035115.GB16135@zurbaran.home>
References: <1445810090-18403-1-git-send-email-christophe-h.ricard@st.com>
 <20151026060133.GA24619@zurbaran.home>
 <562DCB2D.3090503@gmail.com>
 <20151027034831.GA16135@zurbaran.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20151027034831.GA16135-nKCvNrh56OoJmsy6czSMtA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Oct 27, 2015 at 04:48:31AM +0100, Samuel Ortiz wrote:
> Hi Christophe,
> 
> On Mon, Oct 26, 2015 at 07:41:49AM +0100, Christophe Ricard wrote:
> > Hi Samuel,
> > 
> > I believe there was an issue when you applied my last series.
> > drivers/nfc/st-nci/vendor_cmds.c is not present and this introduce a
> > build fix already reported by kbuild robot.
> I add to manually install the st-nci vendor commands patch and forgot to
> git add vendor_cmds.c...
s/install/patch/

Cheers,
Samuel.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

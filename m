From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH] hwmon: (ads1015) Add devicetree documentation
Date: Thu, 17 Mar 2011 10:46:49 -0600
Message-ID: <20110317164649.GE9597@angua.secretlab.ca>
References: <1299143805-13133-1-git-send-email-eibach@gdsys.de>
 <20110303115151.GF3649@pengutronix.de>
 <20110303132025.51e0d92e@endymion.delvare>
 <20110303132549.GG3649@pengutronix.de>
 <20110303172653.GB22940@angua.secretlab.ca>
 <20110303230253.0e8455c2@endymion.delvare>
 <AANLkTikXzJEAYg7+5ekMzTj_V-Hs63Psgru4Vc_QGhRy@mail.gmail.com>
 <20110317112530.50dc4915@endymion.delvare>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20110317112530.50dc4915@endymion.delvare>
Sender: linux-doc-owner@vger.kernel.org
To: Jean Delvare <khali@linux-fr.org>
Cc: Wolfram Sang <w.sang@pengutronix.de>, Dirk Eibach <eibach@gdsys.de>, devicetree-discuss@lists.ozlabs.org, rdunlap@xenotime.net, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Mar 17, 2011 at 11:25:30AM +0100, Jean Delvare wrote:
> On Thu, 3 Mar 2011 15:09:28 -0700, Grant Likely wrote:
> > On Thu, Mar 3, 2011 at 3:02 PM, Jean Delvare <khali@linux-fr.org> wrote:
> > > I will leave it up to Dirk to decide how much time he wants to spend on
> > > this. He has already been very patient with the driver review process
> > > and I do not want to abuse his patience.
> > 
> > BTW Dirk, I'm happy to help show how to write the parser code for the
> > sub-node approach if you need it.
> 
> Grant, Wolfram, how are such patches committed? Documentation/devicetree/
> isn't listed in MAINTAINERS. Is it OK for me to commit it once Dirk gets
> your approval? Or do you prefer to commit it yourself?

Yup.  It makes sense for the documentation to be committed along side
the driver changes.  I have no problem with you taking this patch.

g.


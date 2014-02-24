From: Theodore Ts'o <tytso-3s7WtUTddSA@public.gmane.org>
Subject: Re: SPDX-License-Identifier
Date: Mon, 24 Feb 2014 08:41:50 -0500
Message-ID: <20140224134150.GB25357@thunk.org>
References: <20140221160442.GA17506@kroah.com>
 <5307790A.4050806@monstr.eu>
 <20140221161246.GM31902@saruman.home>
 <53077C5F.9000407@monstr.eu>
 <20140221162045.GN31902@saruman.home>
 <20140221165633.GA5465@kroah.com>
 <53078C30.7060703@monstr.eu>
 <20140221175720.GA21660@kroah.com>
 <20140221190125.GL31047@thunk.org>
 <530B1B25.5090601@monstr.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <530B1B25.5090601-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Subbaraya Sundeep Bhatta <subbaraya.sundeep.bhatta-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Subbaraya Sundeep Bhatta <sbhatta-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wolfgang Denk <wd-ynQEQJNshbs@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 24, 2014 at 11:12:53AM +0100, Michal Simek wrote:
> > But of course, I'm not a lawyer, and if your company has is paying for
> > the development of the driver, the Golden Rule applies (he who has the
> > Gold, makes the Rules), and each of our respective corporate lawyers
> > may have different opinions about what might happen if the question
> > was ever to be adjudicated in court.
> 
> Aren't all these points already answered by SPDX project?
> I believe that they should know how this should be handled properly.

The SPDX can not give legal advice; not to you, and not to your
company.  One lawyer might believe that 

/*
 * SPDX-License-Identifier: GPL-2.0
 */

Might be sufficient.  Others might believe you need to do:

/*
 * Copyright Ty Coon, 2012.
 * 
 * SPDX-License-Identifier: GPL-2.0
 */

Still others might believe you need at the very least:

/*
 * Copyright Ty Coon, 2012.
 * 
 * All Rights Reserved.
 *
 * SPDX-License-Identifier: GPL-2.0
 */

As far as I know, there is no case law on point about whether or not
SPDX-License-Identifier has legal significance, or whether the court
would consider that to be a valid copyright permission statement.  So
any "answers" made by any lawyer would be guesses.  Of course, an
guess by a lawyer which is retained by *you* or your company and fully
informed with the unique parameters of your situation would constitute
legal advice.  Anything else, including anything any of us could say
on this mailing list, would be biovating.  :-)

Cheers,

					- Ted
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

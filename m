From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCHv3] MIPS: JZ4780: DTS: Add I2C nodes
Date: Thu, 18 Jul 2019 09:46:32 -0700
Message-ID: <CAADWXX8VMDJao2mH2hk2omhLGzpTMRJCAtRRavFbykMaLRfLhA@mail.gmail.com>
References: <20190717191926.GA4571@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190717191926.GA4571@localhost.localdomain>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre GRIVEAUX <agriveaux@deutnet.info>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, linux-mips <linux-mips@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Your patches lack a sign-off, but the reason I am emailing is that
they get marked as spam when going through the mailing list because
the DKIM is bad.

The email does have what appears to be a find DKIM signature, but it
adds _way_ too many headers to the list to be checked, including the
"Sender" line, but also things like "List-Id" etc.

Which is completely wrong usage of DKIM when you go through a mailing
list (which is _supposed_ to change the Sender field!).

It looks like somebody mis-understood what DKIM is about, and added
all the lines they could find to the list of DKIM-protected headers.

You should generally protect the minimal core required set of headers:
From/To/Date/Subject/Message-ID etc. Not the headers that are
intentionally going to be rewritten by any list you might want to post
to.

               Linus "hate spam, try to fix dkim" Torvalds

On Wed, Jul 17, 2019 at 12:20 PM Alexandre GRIVEAUX
<agriveaux@deutnet.info> wrote:
>
> Add the devicetree nodes for the I2C core of the JZ4780 SoC, disabled
> by default.
..

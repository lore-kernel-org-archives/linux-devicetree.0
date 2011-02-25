From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH] dt: add a match table pointer to struct device
Date: Fri, 25 Feb 2011 10:34:05 -0700
Message-ID: <AANLkTik1fzJw11mKSVu4B2yrGZAju59uNmHjjGSgVcGY@mail.gmail.com>
References: <20110223025233.25131.47193.stgit@localhost6.localdomain6>
 <AANLkTikauP8+PgFyicdSQzJ19ZvqpV=3ZnRTjSvY78qc@mail.gmail.com> <20110225163547.GC8523@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110225163547.GC8523@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <gregkh@suse.de>
Cc: devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Feb 25, 2011 at 9:35 AM, Greg KH <gregkh@suse.de> wrote:
> On Fri, Feb 25, 2011 at 08:46:52AM -0700, Grant Likely wrote:
>> Greg, any thoughts on this change? =A0I'd like to take it via my tre=
e so
>> I can finally dump the last vestiges of of_platform_bus_type.
>
> Sorry, I didn't realize you just wanted my review, and not me to take=
 it
> directly.

Heh, I wasn't very clear about that.  Oops,

> If you want to take it, that's great, no objection from me, feel free=
 to
> add:
> =A0 =A0 =A0 =A0Acked-by: Greg Kroah-Hartman <gregkh@suse.de>
> to it.

Thanks.  Yes I definitely want to take it because I've got a pile of
patches that depend on it.

> What about the other patch you sent me, do you want me to take that, =
or
> will you?

Which one is that?  The relaxation of .name checking on of_serial?
Yes, you can take that one, but hold off for the moment.  Looking at
it now I realize that I forgot to cc some folks that should ack it, so
I'm going to repost.

g.

From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH] dt: add a match table pointer to struct device
Date: Fri, 25 Feb 2011 12:20:05 -0700
Message-ID: <AANLkTikThHs_htQU8wxeAQm_FRVV=1R25OTsjyboFDNt@mail.gmail.com>
References: <20110223025233.25131.47193.stgit@localhost6.localdomain6>
 <AANLkTikauP8+PgFyicdSQzJ19ZvqpV=3ZnRTjSvY78qc@mail.gmail.com>
 <20110225163547.GC8523@suse.de> <AANLkTik1fzJw11mKSVu4B2yrGZAju59uNmHjjGSgVcGY@mail.gmail.com>
 <20110225184428.GA2280@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110225184428.GA2280@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <gregkh@suse.de>
Cc: devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Feb 25, 2011 at 11:44 AM, Greg KH <gregkh@suse.de> wrote:
> On Fri, Feb 25, 2011 at 10:34:05AM -0700, Grant Likely wrote:
>> On Fri, Feb 25, 2011 at 9:35 AM, Greg KH <gregkh@suse.de> wrote:
>> > On Fri, Feb 25, 2011 at 08:46:52AM -0700, Grant Likely wrote:
>> >> Greg, any thoughts on this change? =A0I'd like to take it via my =
tree so
>> >> I can finally dump the last vestiges of of_platform_bus_type.
>> >
>> > Sorry, I didn't realize you just wanted my review, and not me to t=
ake it
>> > directly.
>>
>> Heh, I wasn't very clear about that. =A0Oops,
>>
>> > If you want to take it, that's great, no objection from me, feel f=
ree to
>> > add:
>> > =A0 =A0 =A0 =A0Acked-by: Greg Kroah-Hartman <gregkh@suse.de>
>> > to it.
>>
>> Thanks. =A0Yes I definitely want to take it because I've got a pile =
of
>> patches that depend on it.
>>
>> > What about the other patch you sent me, do you want me to take tha=
t, or
>> > will you?
>>
>> Which one is that? =A0The relaxation of .name checking on of_serial?
>> Yes, you can take that one, but hold off for the moment. =A0Looking =
at
>> it now I realize that I forgot to cc some folks that should ack it, =
so
>> I'm going to repost.
>
> Oops, I just took it :(


Hahaha!  No worries, just hold onto it.  I'll ping the appropriate
folks and if anyone objects then I'll ask you to drop it.

g.

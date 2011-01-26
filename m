From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH] driver-core: remove conditionals around devicetree pointers
Date: Tue, 25 Jan 2011 21:19:36 -0700
Message-ID: <AANLkTinf6+FN90tyLd6f1guvppt5s5PQL3ZkcecCCX+E@mail.gmail.com>
References: <20110126015414.31133.56437.stgit@localhost6.localdomain6> <20110126031734.GA1636@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110126031734.GA1636@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <gregkh@suse.de>
Cc: devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Jan 25, 2011 at 8:17 PM, Greg KH <gregkh@suse.de> wrote:
> On Tue, Jan 25, 2011 at 07:02:02PM -0700, Grant Likely wrote:
>> Having conditional around the of_match_table and the of_node pointer=
s
>> turns out to make driver code use ugly #ifdef blocks. =A0Drop the
>> conditionals and remove the #ifdef blocks from the affected drivers.
>>
>> Also tidy up minor whitespace issues within the same hunks.
>>
>> Signed-off-by: Grant Likely <grant.likely@secretlab.ca>
>> ---
>>
>> I've held off doing this since I didn't want to needlessly increase
>> the size of struct device and struct device_driver for users who don=
't
>> use CONFIG_OF. =A0However, its quibbling about a tiny amount of memo=
ry,
>> and #ifdef'ing it out this way is ugly for driver code.
>>
>> Alternately, if I should be concerned about the extra memory, I coul=
d
>> define some macros/inlines similar to how CONFIG_NUMA is handled.
>
> No objection from me, I was wondering when you would get around to do=
ing
> this :)
>
> If you want me to take this in my tree, I'd be glad to, otherwise fee=
l
> free to send it through yours, and add a:
> =A0 =A0 =A0 =A0Acked-by: Greg Kroah-Hartman <gregkh@suse.de>
> to it.

Thanks.  I'll take it via my tree.

g.

>
> Nice job,
>
> greg k-h
>



--=20
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.

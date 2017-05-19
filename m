From: Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
Subject: Re: [PATCH] powerpc/sequoia: fix NAND partitions not to overlap
Date: Fri, 19 May 2017 15:50:55 +1000
Message-ID: <87efvl75ts.fsf@concordia.ellerman.id.au>
References: <20170402100535.GA18340@amd> <20170517120613.GA583@amd> <20170517143717.ad818a2282378fc7a38af1ff@linux-foundation.org> <20170518094813.GA12038@amd>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170518094813.GA12038@amd>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pavel Machek <pavel-ynQEQJNshbs@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: sr-ynQEQJNshbs@public.gmane.org, jwboyer-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, trivial-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Andrew Morton <akpm-3NddpPZAyC0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Pavel Machek <pavel-ynQEQJNshbs@public.gmane.org> writes:

> On Wed 2017-05-17 14:37:17, Andrew Morton wrote:
>> On Wed, 17 May 2017 14:06:13 +0200 Pavel Machek <pavel-ynQEQJNshbs@public.gmane.org> wrote:
>> 
>> > On Sun 2017-04-02 12:05:36, Pavel Machek wrote:
>> > > Fix overlapping NAND partitions.
>> > > 
>> > > Signed-off-by: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
>> > 
>> > Ping? Two partitions at same place are bad news...
>> 
>> Please expand on "bad news"?  What are the runtime effects of this
>> change?  Decisions about which kernel(s) to patch depend on this info.
>
> Well... two partitions at same place. If you use one, you will corrupt
> information on the other one.
>
> OTOH this moves partition around (so that they don't overlap) so it is
> probably not stable candidate.
>
> I guess this is not huge issue; people using these boards probably
> have custom dts changes, anyway...

Or no one's even using it anymore.

I can take this via powerpc, I won't mark it for stable etc.

cheers
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
